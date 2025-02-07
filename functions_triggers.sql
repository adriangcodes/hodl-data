-- Function to check if a seller has enough balance before allowing a transaction
CREATE OR REPLACE FUNCTION check_wallet_balance_before_transaction()
RETURNS TRIGGER AS $$
DECLARE
    seller_balance DECIMAL(65, 8);
BEGIN
    SELECT balance INTO seller_balance
    FROM Wallets
    WHERE user_id = NEW.seller_id AND crypto_id = NEW.crypto_id
    LIMIT 1;

    IF seller_balance IS NULL OR seller_balance < NEW.amount THEN
        NEW.status := 'failed';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_wallet_balance
BEFORE INSERT ON Transactions
FOR EACH ROW
EXECUTE FUNCTION check_wallet_balance_before_transaction();


-- Function to update wallet balances when a transaction is completed
CREATE OR REPLACE FUNCTION update_wallet_balance()
RETURNS TRIGGER AS $$
DECLARE
    seller_wallet_id INT;
    buyer_wallet_id INT;
    seller_balance DECIMAL(65,8);
BEGIN
    IF NEW.status = 'completed' THEN
        SELECT id, balance INTO seller_wallet_id, seller_balance
        FROM Wallets 
        WHERE user_id = NEW.seller_id AND crypto_id = NEW.crypto_id 
        LIMIT 1;

        IF seller_wallet_id IS NULL OR seller_balance < NEW.amount THEN
            RAISE EXCEPTION 'Insufficient balance in seller wallet. Transaction failed.';
        END IF;

        SELECT id INTO buyer_wallet_id 
        FROM Wallets 
        WHERE user_id = NEW.buyer_id AND crypto_id = NEW.crypto_id 
        LIMIT 1;

        UPDATE Wallets
        SET balance = balance - NEW.amount
        WHERE id = seller_wallet_id;

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


-- Function to automatically log status changes in TransactionStatusChanges on INSERT or UPDATE of Transactions
CREATE OR REPLACE FUNCTION log_transaction_status_change()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO TransactionStatusChanges (transaction_id, previous_status, current_status, changed_at)
        VALUES (NEW.id, 'pending', NEW.status, CURRENT_TIMESTAMP);
    
    ELSIF TG_OP = 'UPDATE' AND OLD.status IS DISTINCT FROM NEW.status THEN
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