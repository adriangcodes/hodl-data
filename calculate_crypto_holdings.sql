-- Calculates the total BTC in all Wallets

SELECT
    c.symbol AS crypto_symbol,
    SUM(w.balance) AS total_held
FROM Wallets w
JOIN Cryptocurrencies c ON w.crypto_id = c.id
WHERE c.symbol = 'BTC'
GROUP BY c.symbol;