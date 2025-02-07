-- Insert a new coin into the Cryptocurrencies table

INSERT INTO Cryptocurrencies (symbol, name) VALUES ('ETH', 'Ethereum');

-- Insert a new user into the Users table

INSERT INTO Users (name, email_address, country) VALUES ('Satoshi Nakamoto', 'satoshi@example.com', 'Japan');

-- Insert a new wallet into the Wallets table with Foreign Keys from Users and Cryptocurrencies

INSERT INTO Wallets (user_id, crypto_id, balance) VALUES
    (5, 1, 100,000),
    (5, 5, 1);