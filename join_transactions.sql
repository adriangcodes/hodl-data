-- Joins Transactions, Users and Cryptocurrencies to make reading Transaction data more user friendly

SELECT 
    t.id AS transaction_id,
    buyer.name AS buyer_name,
    seller.name AS seller_name,
    c.symbol AS crypto_symbol,
    t.amount,
    t.status,
    t.date
FROM Transactions t
JOIN Users buyer ON t.buyer_id = buyer.id
JOIN Users seller ON t.seller_id = seller.id
JOIN Cryptocurrencies c ON t.crypto_id = c.id
ORDER BY t.date DESC;