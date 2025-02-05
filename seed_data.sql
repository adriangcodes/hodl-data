INSERT INTO Users (name, email_address, country) VALUES
    ('Anthony Easy', 'anthony@example.com', 'Australia'),
    ('Bob Smith', 'bob@example.com', 'USA'),
    ('Justin True', 'justin@example.com', 'Canada'),
    ('Diana Prince', 'diana@example.com', 'UK');

INSERT INTO Cryptocurrencies (symbol, name) VALUES
    ('BTC', 'Bitcoin'),
    ('SOL', 'Solana'),
    ('USDT', 'Tether'),
    ('USDC', 'USD Coin');

INSERT INTO Wallets (user_id, crypto_id, balance) VALUES
    (1, 1, 1.5),  -- Anthony has 1.5 BTC
    (1, 3, 500),  -- Anthony has 500 USDT
    (2, 2, 20),  -- Bob has 20 SOL
    (2, 4, 300),  -- Bob has 300 USDC
    (3, 1, 0.8),  -- Justin has 0.8 BTC
    (3, 3, 700),  -- Justin has 700 USDT
    (4, 2, 15),  -- Diana has 15 SOL
    (4, 4, 400);  -- Diana has 400 USDC

INSERT INTO Transactions (buyer_id, seller_id, crypto_id, amount, status, transaction_fee) VALUES
    (1, 2, 1, 0.3, 'completed', 0.0005),
    (2, 3, 2, 5, 'completed', 0.001),
    (3, 4, 3, 250, 'pending', 1.00),
    (4, 1, 4, 200, 'failed', 0.50),
    (1, 3, 1, 0.5, 'completed', 0.0007),
    (2, 4, 2, 10, 'completed', 0.002),
    (3, 1, 3, 100, 'pending', 0.75),
    (4, 2, 4, 150, 'completed', 0.80),
    (1, 2, 1, 0.2, 'completed', 0.0003),
    (2, 3, 2, 6, 'failed', 0.001),
    (3, 4, 3, 300, 'completed', 1.20),
    (4, 1, 4, 50, 'pending', 0.25),
    (1, 3, 1, 0.7, 'completed', 0.0009),
    (2, 4, 2, 8, 'completed', 0.0015),
    (3, 1, 3, 120, 'failed', 0.90),
    (4, 2, 4, 100, 'completed', 0.60),
    (1, 2, 1, 0.4, 'pending', 0.0006),
    (2, 3, 2, 12, 'completed', 0.0025),
    (3, 4, 3, 250, 'failed', 1.10),
    (4, 1, 4, 80, 'completed', 0.45);

INSERT INTO TransactionStatusChanges (transaction_id, previous_status, current_status, changed_at)
VALUES
    (1, 'pending', 'completed', CURRENT_TIMESTAMP),
    (2, 'pending', 'completed', CURRENT_TIMESTAMP),
    (3, 'pending', 'pending', CURRENT_TIMESTAMP),
    (4, 'pending', 'failed', CURRENT_TIMESTAMP),
    (5, 'pending', 'completed', CURRENT_TIMESTAMP),
    (6, 'pending', 'completed', CURRENT_TIMESTAMP),
    (7, 'pending', 'pending', CURRENT_TIMESTAMP),
    (8, 'pending', 'completed', CURRENT_TIMESTAMP),
    (9, 'pending', 'completed', CURRENT_TIMESTAMP),
    (10, 'pending', 'failed', CURRENT_TIMESTAMP),
    (11, 'pending', 'completed', CURRENT_TIMESTAMP),
    (12, 'pending', 'pending', CURRENT_TIMESTAMP),
    (13, 'pending', 'completed', CURRENT_TIMESTAMP),
    (14, 'pending', 'completed', CURRENT_TIMESTAMP),
    (15, 'pending', 'failed', CURRENT_TIMESTAMP),
    (16, 'pending', 'completed', CURRENT_TIMESTAMP),
    (17, 'pending', 'pending', CURRENT_TIMESTAMP),
    (18, 'pending', 'completed', CURRENT_TIMESTAMP),
    (19, 'pending', 'failed', CURRENT_TIMESTAMP),
    (20, 'pending', 'completed', CURRENT_TIMESTAMP);