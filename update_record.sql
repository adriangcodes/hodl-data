-- Update email address for user ID 1

UPDATE Users SET email_address = 'tony@example.com' WHERE id = 1;  


-- Update transaction status for new transaction added in insert_data.sql

UPDATE Transactions SET status = 'completed' WHERE id = 21;