DROP TABLE IF EXISTS TransactionStatusChanges;
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Wallets;
DROP TABLE IF EXISTS Cryptocurrencies;
DROP TABLE IF EXISTS Users;


CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    email_address VARCHAR(250) UNIQUE NOT NULL,
    country VARCHAR(250) NOT NULL
);


CREATE TABLE Cryptocurrencies (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE Wallets (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    crypto_id INT NOT NULL,
    balance DECIMAL(65, 8) DEFAULT 0.00000000,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(id)
);


-- Updates last_updated time in Wallets when a change is made:
CREATE OR REPLACE FUNCTION update_last_updated_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_wallets_last_updated
BEFORE UPDATE ON Wallets
FOR EACH ROW
EXECUTE FUNCTION update_last_updated_column();


-- Function to update wallet balances when a transaction is completed
CREATE OR REPLACE FUNCTION update_wallet_balance()
RETURNS TRIGGER AS $$
DECLARE
    seller_wallet_id INT;
    buyer_wallet_id INT;
BEGIN
    -- Only update wallets if the transaction is completed
    IF NEW.status = 'completed' THEN
        -- Find the seller's wallet holding the transaction cryptocurrency
        SELECT id INTO seller_wallet_id 
        FROM Wallets 
        WHERE user_id = NEW.seller_id AND crypto_id = NEW.crypto_id 
        LIMIT 1;

        -- Find the buyer's wallet holding the transaction cryptocurrency
        SELECT id INTO buyer_wallet_id 
        FROM Wallets 
        WHERE user_id = NEW.buyer_id AND crypto_id = NEW.crypto_id 
        LIMIT 1;

        -- Deduct from the seller's wallet
        UPDATE Wallets
        SET balance = balance - NEW.amount
        WHERE id = seller_wallet_id;

        -- Add to the buyer's wallet
        UPDATE Wallets
        SET balance = balance + NEW.amount
        WHERE id = buyer_wallet_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_wallets
AFTER INSERT OR UPDATE ON Transactions
FOR EACH ROW
EXECUTE FUNCTION update_wallet_balance();


CREATE TABLE Transactions (
    id SERIAL PRIMARY KEY,
    buyer_id INT NOT NULL,
    seller_id INT NOT NULL,
    crypto_id INT NOT NULL,
    amount DECIMAL(65, 8) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) CHECK (status IN ('pending', 'completed', 'failed')) DEFAULT 'pending',
    transaction_fee DECIMAL(10, 8) DEFAULT 0.00000000,
    FOREIGN KEY (buyer_id) REFERENCES Users(id),
    FOREIGN KEY (seller_id) REFERENCES Users(id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(id)
);


CREATE TABLE TransactionStatusChanges (
    id SERIAL PRIMARY KEY,
    transaction_id INT NOT NULL,
    previous_status VARCHAR(20) CHECK (previous_status IN ('pending', 'completed', 'failed')) NOT NULL,
    current_status VARCHAR(20) CHECK (current_status IN ('pending', 'completed', 'failed')) NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES Transactions(id)
);


-- Function to automatically log status changes in TransactionStatusChanges on INSERT or UPDATE of Transactions
CREATE OR REPLACE FUNCTION log_transaction_status_change()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN -- If a new transaction is inserted, log its initial status
        INSERT INTO TransactionStatusChanges (transaction_id, previous_status, current_status, changed_at)
        VALUES (NEW.id, 'pending', NEW.status, CURRENT_TIMESTAMP);
    
    ELSIF TG_OP = 'UPDATE' AND OLD.status IS DISTINCT FROM NEW.status THEN -- If a transaction is updated, log the status change
        INSERT INTO TransactionStatusChanges (transaction_id, previous_status, current_status, changed_at)
        VALUES (NEW.id, OLD.status, NEW.status, CURRENT_TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_log_transaction_status_change
AFTER INSERT OR UPDATE ON Transactions
FOR EACH ROW
EXECUTE FUNCTION log_transaction_status_change();