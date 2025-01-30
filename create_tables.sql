
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
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(id)
);

CREATE TABLE Transactions (
    id SERIAL PRIMARY KEY,
    buyer_id INT NOT NULL,
    seller_id INT NOT NULL,
    crypto_id INT NOT NULL,
    amount DECIMAL(65, 8) NOT NULL,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    transaction_fee DECIMAL(65, 8) DEFAULT 0.00000000,
    FOREIGN KEY (buyer_id) REFERENCES Users(id),
    FOREIGN KEY (seller_id) REFERENCES Users(id),
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(id)
);

CREATE TABLE TransactionStatusChanges (
    id SERIAL PRIMARY KEY,
    transaction_id INT NOT NULL,
    previous_status ENUM('pending', 'completed', 'failed') NOT NULL,
    current_status ENUM('pending', 'completed', 'failed') NOT NULL,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES Transactions(id)
);