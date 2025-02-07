-- Query the Users Wallets join table for entries from a single user for a specific cryptocurrency

SELECT 
    u.name AS user_name,
    w.id AS wallet_id,
    c.symbol AS crypto_symbol,
    w.balance
FROM Wallets w
JOIN Users u ON w.user_id = u.id
JOIN Cryptocurrencies c ON w.crypto_id = c.id
WHERE u.name = 'Anthony Easy' AND c.symbol = 'BTC';


-- Filter the Users Wallets join table for all BTC wallets

SELECT 
    u.name AS user_name,
    w.id AS wallet_id,
    c.symbol AS crypto_symbol,
    w.balance
FROM Wallets w
JOIN Users u ON w.user_id = u.id
JOIN Cryptocurrencies c ON w.crypto_id = c.id
WHERE c.symbol = 'BTC'
ORDER BY balance DESC;