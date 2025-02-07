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
    (1, 1, 0.90),
    (1, 3, 500.00),
    (2, 2, 12.00),
    (2, 4, 300.00),
    (3, 1, 1.00),
    (3, 3, 700.00),
    (4, 2, 7.50),
    (4, 4, 400.00);


INSERT INTO Transactions (buyer_id, seller_id, crypto_id, amount, status, transaction_fee) VALUES
    (1, 3, 1, 0.36, 'completed', 0.001),
    (2, 4, 2, 3.00, 'completed', 0.001),
    (3, 1, 3, 200.00, 'completed', 0.001),
    (4, 2, 4, 120.00, 'completed', 0.001),
    (1, 2, 2, 4.80, 'completed', 0.001),
    (2, 3, 3, 160.00, 'completed', 0.001),
    (3, 4, 4, 50.00, 'completed', 0.001),
    (4, 1, 1, 0.25, 'completed', 0.001),
    (1, 3, 1, 0.18, 'completed', 0.001),
    (2, 4, 2, 2.50, 'completed', 0.001),
    (3, 1, 3, 100.00, 'completed', 0.001),
    (4, 2, 4, 60.00, 'completed', 0.001),
    (1, 2, 2, 2.40, 'completed', 0.001),
    (2, 3, 3, 80.00, 'completed', 0.001),
    (3, 4, 4, 25.00, 'completed', 0.001),
    (4, 1, 1, 0.12, 'completed', 0.001),
    (1, 3, 1, 0.09, 'completed', 0.001),
    (2, 4, 2, 1.20, 'completed', 0.001),
    (3, 1, 3, 50.00, 'completed', 0.001),
    (4, 2, 4, 30.00, 'completed', 0.001);