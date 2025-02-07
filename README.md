# hodl-data

This project is my response to Coder Academy DEV1002 Assignment 1 - Relational Database Scripts.

I have envisaged this as a continuation of hodl-app, a Python-based CLI app submitted for my previous assessment.

hodl-data is a PostgreSQL-based relational database designed to manage cryptocurrency transactions, user wallets, and portfolio holdings with accuracy and efficiency. It ensures data integrity through normalized tables, tracks trade activity with detailed transaction records, and provides analytical insights via structured queries. The schema supports essential financial operations, including balance calculations, transaction history tracking, and automated status updates, making it a reliable foundation for cryptocurrency exchange management.

# GitHub

This project is uploaded to GitHub: https://github.com/adriangcodes/hodl-data

My previous hodl-app project can also be found here: https://github.com/adriangcodes/hodl-app 

# ERD

The entity relationship diagram can be found as a JPEG within the ERD folder.

One important callout: I have made a conscious decision to avoid any cascade deletes with foreign keys. Given this database serves a financial purpose, it is not in the interest of any parties for transaction data to be deleted and unable to be audited.

# User Guide

The below operations assume the user is on a Mac utilising Terminal within VS Code.

Step 1: create the database:
    psql postgres \i create_database.sql

    Confirm the database hodl_db exists:
    \l

Step 2: connect to the database:
    \c hodl_db

Step 3: create tables:
    \i create_tables.sql

Step 4: add seed data:
    \i seed_data.sql

From here, any of the other SQL scripts can be run. To run a particular SQL file:
    \i file_name.sql

# References

GeeksforGeeks, 2023. Enumerator (ENUM) in MySQL. Available at: https://www.geeksforgeeks.org/enumerator-enum-in-mysql/ [Accessed 7 Feb. 2025].

GeeksforGeeks, 2023. SQL CHECK Constraint. Available at: https://www.geeksforgeeks.org/sql-check-constraint/ [Accessed 7 Feb. 2025].

GeeksforGeeks, 2023. SQL Join (Set 1) - Inner, Left, Right, and Full Joins. Available at: https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/ [Accessed 7 Feb. 2025].

IBM, 2023. Deleting data from tables. Available at: https://www.ibm.com/docs/en/db2-for-zos/12?topic=programs-deleting-data-from-tables [Accessed 7 Feb. 2025].

LearnSQL, 2023. How to Join Two Tables in SQL. Available at: https://learnsql.com/blog/how-to-join-two-tables-in-sql/ [Accessed 7 Feb. 2025].

Microsoft, 2023. DATETIME (Transact-SQL). Available at: https://learn.microsoft.com/en-us/sql/t-sql/data-types/datetime-transact-sql?view=sql-server-ver16 [Accessed 7 Feb. 2025].

PostgreSQL Documentation, 2023. CREATE TRIGGER. Available at: https://www.postgresql.org/docs/current/sql-createtrigger.html [Accessed 7 Feb. 2025].

PostgreSQL Documentation, 2024. PL/pgSQL Trigger Functions. Available at: https://www.postgresql.org/docs/current/plpgsql-trigger.html [Accessed 7 Feb. 2025].

Reddit, 2023. How to update a timestamp automatically? Available at: https://www.reddit.com/r/PostgreSQL/comments/10shxej/how_to_update_a_timestamp_automatically/ [Accessed 7 Feb. 2025].

Scaler, 2023. Timestamp in SQL. Available at: https://www.scaler.com/topics/timestamp-in-sql/ [Accessed 7 Feb. 2025].

W3Schools, 2023. SQL Tutorial. Available at: https://www.w3schools.com/sql/default.asp [Accessed 7 Feb. 2025].