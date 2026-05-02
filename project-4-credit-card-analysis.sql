-- Project 4: Credit Card Analysis

-- Author: Taylor Gooden

-- Dataset: Credit Card Transactions

-- Tool: SQLite / DB Browser

-- Query 1: Total transactions and spend per category ordered by highest spend

SELECT category, count(*) AS total_transactions, SUM(amt) AS total_spent
FROM credit_card_transactions
GROUP BY category
ORDER BY total_spent DESC;

-- Query 2: Fraud count by spending category ordered by highest fraud

SELECT category, COUNT(*) AS total_transactions, SUM(is_fraud) AS fraud_count
FROM credit_card_transactions
GROUP BY category
ORDER BY fraud_count DESC;

-- Query 3: Top 10 merchants by total transaction value

SELECT merchant, SUM(amt) AS total_spent
FROM credit_card_transactions
GROUP BY merchant
ORDER BY total_spent DESC
LIMIT 10;

-- Query 4: Average transaction amount by gender

SELECT gender, AVG(amt) AS avg_transaction
FROM credit_card_transactions
GROUP BY gender 
ORDER BY avg_transaction DESC;

-- Query 5: Top 10 US states by total credit card spend

SELECT state, SUM(amt) AS total_spent
FROM credit_card_transactions
GROUP BY state
ORDER BY total_spent DESC 
LIMIT 10;

-- Query 6: High value fraudulent transactions above the average transaction amount

SELECT merchant, category, amt, is_fraud
FROM credit_card_transactions
WHERE is_fraud = 1 AND amt >
(SELECT AVG(amt) FROM credit_card_transactions)
ORDER BY amt DESC;

-- Query 7: Categories where more than 0.5% of transactions are fraudulent

SELECT category, COUNT(*) AS total_transactions, SUM(is_fraud) AS fraud_count
FROM credit_card_transactions
GROUP BY category 
HAVING SUM(is_fraud) > COUNT(*) * 0.005 
ORDER BY category 
