-- Calculates the total of each Cryptocurrency in all Wallets

SELECT
    c.symbol AS crypto_symbol,
    SUM(w.balance) AS total_held
FROM Wallets w
JOIN Cryptocurrencies c ON w.crypto_id = c.id
GROUP BY c.symbol
ORDER BY total_held DESC;


-- Calculates the average Wallet size of each Cryptocurrency

SELECT
    c.symbol AS crypto_symbol,
    AVG(w.balance) AS average_wallet_size
FROM Wallets w
JOIN Cryptocurrencies c ON w.crypto_id = c.id
GROUP BY c.symbol
ORDER BY average_wallet_size DESC;