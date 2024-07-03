-- Week 2

-- Create the database (adjust the name if needed)
/* CREATE DATABASE IF NOT EXISTS expense_tracker;

-- Use the expense_tracker database
USE expense_tracker;

-- Create the Expenses table
CREATE TABLE IF NOT EXISTS Expenses (
  expense_id INT PRIMARY KEY AUTO_INCREMENT,
  amount DECIMAL(15,2) NOT NULL,
  date DATE NOT NULL,
  category VARCHAR(30) NOT NULL
);

-- Function to generate random date within a specific range (modify as needed)
DELIMITER //

-- CREATE FUNCTION GetRandomDate(startDate DATE, endDate DATE)
-- RETURNS DATE
-- READS SQL DATA
-- DETERMINISTIC
-- BEGIN
--   DECLARE randomDays INT;
--   SET randomDays = FLOOR(RAND() * (DATEDIFF(endDate, startDate) + 1));
--   RETURN DATE_ADD(startDate, INTERVAL randomDays DAY);
-- END; //

DELIMITER ;

-- Stored Procedure to insert sample data with random dates and categories (categories can be modified)
-- Commented out after 200 rows
-- DELIMITER //

-- CREATE PROCEDURE InsertSampleData()
-- BEGIN
--   DECLARE counter INT DEFAULT 1;

--  WHILE counter <= 20 DO
--     INSERT INTO Expenses (amount, date, category)
--     VALUES (FLOOR(10 + RAND() * 100),
--             GetRandomDate(DATE_SUB(CURDATE(), INTERVAL 4 YEAR), CURDATE()),  -- Random date within the last 4 years
--             CASE WHEN counter % 4 = 0 THEN 'Groceries'
--                  WHEN counter % 4 = 1 THEN 'Entertainment'
--                  WHEN counter % 4 = 2 THEN 'Transportation'
--                  ELSE 'Other'
--             END);
--     SET counter = counter + 1;
--   END WHILE;
-- END; //

-- DELIMITER ;

-- Call the procedure to insert sample data
-- CALL InsertSampleData();

-- Drop the functions and procedures if they are no longer needed
-- DROP PROCEDURE IF EXISTS InsertSampleData;
-- DROP FUNCTION IF EXISTS GetRandomDate;

-- Answers begin here
-- 1.1: Displaying all tables
SELECT * FROM Expenses;

-- 1.2: Displaying the amount and category columns
SELECT amount, category FROM Expenses;

-- 1.3: Displaying the expenses from January to October 2022
SELECT * FROM Expenses
WHERE date > '2022-01-01' AND date < '2022-10-31';

-- 2.1: Filtering by category
SELECT * FROM Expenses
WHERE category LIKE '%Entertainment%';

-- 2.2: Filtering by comparison operators
SELECT * FROM Expenses
WHERE amount > 57.00;

-- 2.3: Combining filters using AND
SELECT * FROM Expenses
WHERE category LIKE '%Entertainment%' AND amount > 57.00;

-- 2.4: Combining filters using OR
SELECT * FROM Expenses
WHERE category LIKE '%Transportation%' OR category LIKE '%Groceries%';

-- 2.5: Filtering with NOT
SELECT * FROM Expenses
WHERE category NOT LIKE '%Other%';

-- 3.1: Sorting by amount
SELECT * FROM Expenses
ORDER BY amount DESC;

-- 3.2: Sorting by date and category
SELECT * FROM Expenses
ORDER BY date ASC, category DESC;

SELECT * FROM Expenses
ORDER BY category DESC, date ASC;

-- 4.1: Creating a table for income
CREATE TABLE IF NOT EXISTS Income (
	income_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10,2) NOT NULL,
    date DATE NOT NULL,
    source VARCHAR(50) NOT NULL
);

-- 4.2: Creating a column for category
-- ALTER TABLE Income
-- ADD (category VARCHAR(50));

-- 4.3: Removing the source column from the income table
-- ALTER TABLE Income
-- DROP source;

-- Dropping the income table
DROP TABLE Income; */

-- Week 3

CREATE DATABASE  IF NOT EXISTS `expense_tracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `expense_tracker`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: expense_tracker
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'Groceries','Milk, Eggs, Bread',20.00,'2023-06-15'),(2,'Entertainment','Movie ticket',12.50,'2022-06-18'),(3,'Groceries','Fruits, Vegetables',35.75,'2021-06-20'),(4,'Transportation','Bus ticket',5.00,'2020-06-17'),(5,'Entertainment','Concert ticket',45.00,'2024-06-21'),(6,'Dining Out','Restaurant dinner',30.00,'2025-06-19'),(7,'Clothing','New shirt',15.99,'2026-04-12'),(8,'Bills','Electricity bill',75.40,'2027-02-01'),(9,'Other','Gift for friend',22.00,'2028-12-25'),(10,'Travel','Flight ticket',350.00,'2029-08-10');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 20:44:49

-- Entire expenses table for reference
SELECT category, amount from expenses;

-- 1.1: Total spent per category
SELECT category, SUM(amount) AS sum FROM expenses GROUP BY category;

-- 1.2: Average expense per category
SELECT category, AVG(amount) AS average FROM expenses GROUP BY category;

-- Bonus question: Top 3 categories by spending
SELECT category, amount AS top_three
FROM expenses 
ORDER BY amount DESC
LIMIT 3;