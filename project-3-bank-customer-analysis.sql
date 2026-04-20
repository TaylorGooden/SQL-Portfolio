-- Project 3: Bank Customer Analysis

-- Author: Taylor Gooden

-- Dataset: Customer Churn Dataset

-- Tool: SQLite / DB Browser

-- Query 1: Total number of customers by country 

SELECT country, COUNT(*) AS total_customers 
FROM Bank_Customer 
GROUP BY country
ORDER BY total_customers DESC;

-- Query 2: Average balance and salary by country 

SELECT country, AVG(balance) AS average_balance , AVG(estimated_salary) AS average_salary
FROM Bank_Customer
GROUP BY country
ORDER BY average_balance DESC;

-- Query 3: Number of churned customers by country 

SELECT country, COUNT(*) AS total_customers , SUM(churn) AS churned_customers
FROM Bank_Customer
GROUP BY country 
ORDER BY churned_customers DESC;

--Query 4: High value customers who have churned (balance above average)

SELECT customer_id, country, balance, age
FROM Bank_Customer
WHERE balance > (SELECT AVG(balance) FROM Bank_Customer)
AND churn = 1
ORDER BY balance DESC;

-- Query 5: Total customers and churned customers by active membership status 

SELECT COUNT(*) AS total_customer, SUM(churn), active_member
FROM Bank_Customer
GROUP BY active_member
ORDER BY active_member;

-- Query 6: Customers with zero balance

SELECT country, age, gender, churn
FROM Bank_Customer
WHERE balance = 0
ORDER BY age

-- Query 7: High risk customers still with the bank - low credit score but high balance

SELECT customer_id, credit_score, balance, age, country
FROM Bank_Customer
WHERE balance >  (SELECT AVG(balance) FROM Bank_Customer)
AND churn = 0
AND credit_score < 500
ORDER BY credit_score
