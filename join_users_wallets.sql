-- Shows which wallets belong to which users by joining Users, Wallets and Cryptocurrencies

SELECT 
    u.name AS user_name,
    w.id AS wallet_id,
    c.symbol AS crypto_symbol,
    w.balance
FROM Wallets w
JOIN Users u ON w.user_id = u.id
JOIN Cryptocurrencies c ON w.crypto_id = c.id
ORDER BY u.id, c.symbol;