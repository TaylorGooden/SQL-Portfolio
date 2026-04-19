-- Project 1: Financial Transaction Analysis

-- Author: Taylor Gooden

-- Dataset: PaySim Financial Transactions

-- Tool: SQLite / DB Browser

-- Query 1: Total number of transactions in the dataset 

SELECT COUNT(*) AS total_transactions
FROM TransactionsSmall;

-- Query 2: Total transaction volume and count broken down by type

SELECT type,
    COUNT(*) AS number_of_transactions,
    SUM(amount) AS total_amount
FROM TransactionsSmall
GROUP BY type
ORDER BY total_amount DESC;

-- Query 3: Top 10 largest single transactions

SELECT  nameOrig, nameDest, type, amount
FROM TransactionsSmall
ORDER BY amount DESC
LIMIT 10;

-- Query 4: Transactions above the average amount (uses subquery)

SELECT nameOrig, nameDest, type, amount
FROM TransactionsSmall
WHERE amount >  (SELECT AVG(amount) FROM TransactionsSmall)
ORDER BY amount DESC;

-- Query 5: Transaction types where total volume exceeds 1,000,000

SELECT type, COUNT(*) AS number_of_transactions, SUM(amount) AS total_volume
FROM TransactionsSmall
GROUP BY type
HAVING total_volume > 1000000
ORDER BY total_volume DESC;

-- Query 6: Duplicate transaction detection 

SELECT nameOrig, nameDest, amount, type, COUNT(*) AS occurances
FROM TransactionsSmall
GROUP BY nameOrig, nameDest, amount, type
HAVING COUNT(*) > 1
ORDER BY occurances DESC;

-- Query 7: Suspicious transactions where balance didn’t change despite money moving 

SELECT nameOrig, nameDest, type, amount, oldbalanceOrg, newbalanceOrig
FROM TransactionsSmall
WHERE amount > 0 
AND oldbalanceOrg = newbalanceOrig
AND type IN ('TRANSFER', 'CASH_OUT')
ORDER BY amount DESC;