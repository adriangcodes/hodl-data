# hodl-data

This project is my response to Coder Academy DEV1002 Assignment 1 - Relational Database Scripts.

I have envisaged this as a continuation of hodl-app, a Python-based CLI app submitted for my previous assessment.

(Need description of project)

# GitHub

This project is uploaded to GitHub: https://github.com/adriangcodes/hodl-data

My previous hodl-app project can also be found here: https://github.com/adriangcodes/hodl-app 

# ERD

The entity relationship diagram can be found as a (file type) within the ERD folder.

One important callout: with the exception of the Portfolio join table, I have made a conscious decision to avoid any cascade deletes with foreign keys. Given this database serves a financial purpose, it is not in the interest of any parties for transaction data to be deleted and unable to be audited.

# User Guide

The below operations assume the user is on a Mac utilising Terminal within VS Code.

Step 1: create the database:
    psql postgres \i create_database.sql

Step 2: To connect to the database:
    \c hodl_db

Step 3: create tables:
    \i create_tables.sql

Step 4: add seed data:
    \i seed_data.sql

To run a particular SQL file:
    \i file_name.sql

# References

https://www.w3schools.com/sql/default.asp

https://learn.microsoft.com/en-us/sql/t-sql/data-types/datetime-transact-sql?view=sql-server-ver16 

https://www.scaler.com/topics/timestamp-in-sql/ 

https://www.geeksforgeeks.org/enumerator-enum-in-mysql/ 

https://www.reddit.com/r/PostgreSQL/comments/10shxej/how_to_update_a_timestamp_automatically/

https://www.postgresql.org/docs/current/sql-createtrigger.html 

https://www.geeksforgeeks.org/sql-check-constraint/

https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/

https://learnsql.com/blog/how-to-join-two-tables-in-sql/ 