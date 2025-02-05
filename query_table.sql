-- Query a single user by email address:
SELECT * FROM Users WHERE email_address = 'anthony@example.com';

-- Query a single wallet by wallet id:
SELECT * FROM Wallets WHERE id = 1;

-- Query wallets from a single user:
SELECT * FROM Wallets WHERE user_id = 1;

-- Query a single transaction:
SELECT * FROM Transactions WHERE id = 1;

-- Query a transaction from a single user:
SELECT * FROM Transactions WHERE buyer_id = 1;
SELECT * FROM Transactions WHERE seller_id = 1;
