-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: ecom
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  `Description` text,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Electronics','Electronic gadgets and accessories'),(2,'Books','A wide range of reading material'),(3,'Clothing','Apparel for men, women, and children'),(4,'Home Goods','Items for your household'),(5,'Sports','Equipment and gear for various sports'),(6,'Toys','Playthings for all ages'),(7,'Beauty','Cosmetics and personal care products'),(8,'Jewelry','Fine and fashion jewelry'),(9,'Automotive','Parts and accessories for vehicles'),(10,'Health','Wellness and medical supplies'),(11,'Food & Beverage','Groceries and drinks'),(12,'Furniture','Items to furnish your home'),(13,'Tools','Equipment for DIY and professional use'),(14,'Garden','Supplies for outdoor and gardening'),(15,'Pet Supplies','Items for your furry friends'),(16,'Music','Instruments and accessories'),(17,'Art Supplies','Materials for creative endeavors'),(18,'Travel','Luggage and travel accessories'),(19,'Office Supplies','Items for work and study'),(20,'Software','Computer programs and applications');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Alice','Smith','alice.smith@example.com','9876543210','123 Main St, Anytown','2025-05-20 15:08:55'),(2,'Bob','Johnson','bob.johnson@example.com','8765432109','456 Oak Ave, Anytown','2025-05-20 15:08:55'),(3,'Charlie','Brown','charlie.brown@example.com','7654321098','789 Pine Ln, Anytown','2025-05-20 15:08:55'),(4,'Diana','Miller','diana.miller@example.com','6543210987','101 Elm Rd, Anytown','2025-05-20 15:08:55'),(5,'Eve','Wilson','eve.wilson@example.com','5432109876','222 Maple Dr, Anytown','2025-05-20 15:08:55'),(6,'Frank','Taylor','frank.taylor@example.com','4321098765','333 Birch Ct, Anytown','2025-05-20 15:08:55'),(7,'Grace','Moore','grace.moore@example.com','3210987654','444 Willow Way, Anytown','2025-05-20 15:08:55'),(8,'Henry','Jackson','henry.jackson@example.com','2109876543','555 Cedar Blvd, Anytown','2025-05-20 15:08:55'),(9,'Ivy','White','ivy.white@example.com','1098765432','666 Spruce Pl, Anytown','2025-05-20 15:08:55'),(10,'Jack','Harris','jack.harris@example.com','9012345678','777 Oak St, Anytown','2025-05-20 15:08:55'),(11,'Karen','Martin','karen.martin@example.com','8023456789','888 Pine Ave, Anytown','2025-05-20 15:08:55'),(12,'Liam','Young','liam.young@example.com','7034567890','999 Elm Ln, Anytown','2025-05-20 15:08:55'),(13,'Mia','Allen','mia.allen@example.com','6045678901','111 Maple Rd, Anytown','2025-05-20 15:08:55'),(14,'Noah','King','noah.king@example.com','5056789012','222 Birch Dr, Anytown','2025-05-20 15:08:55'),(15,'Olivia','Wright','olivia.wright@example.com','4067890123','333 Willow Ct, Anytown','2025-05-20 15:08:55'),(16,'Peter','Scott','peter.scott@example.com','3078901234','444 Cedar Way, Anytown','2025-05-20 15:08:55'),(17,'Quinn','Green','quinn.green@example.com','2089012345','555 Spruce Blvd, Anytown','2025-05-20 15:08:55'),(18,'Ryan','Adams','ryan.adams@example.com','1090123456','666 Oak Pl, Anytown','2025-05-20 15:08:55'),(19,'Sophia','Baker','sophia.baker@example.com','9123456780','777 Pine St, Anytown','2025-05-20 15:08:55'),(20,'Thomas','Clark','thomas.clark@example.com','8123456790','888 Elm Ave, Anytown','2025-05-20 15:08:55');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItems`
--

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItems` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `OrderItems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
INSERT INTO `OrderItems` VALUES (49,1,1,1,1200.00),(50,1,3,1,25.00),(51,2,4,1,45.99),(52,2,14,3,8.00),(53,3,3,1,25.00),(54,4,7,1,18.20),(55,5,9,1,110.50),(56,6,10,2,11.50),(57,7,11,1,12.75),(58,8,12,1,550.00),(59,9,13,1,89.99),(60,10,14,2,4.75),(61,11,15,1,40.25),(62,12,16,1,150.00),(63,13,17,1,28.50),(64,14,18,1,125.00),(65,15,19,2,5.00),(66,16,20,1,35.00),(67,17,21,1,199.00),(68,18,22,1,14.00),(69,19,23,1,40.00),(70,20,24,1,65.50),(71,1,5,1,30.50),(72,3,2,2,7.75);
/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `OrderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderStatus` varchar(20) DEFAULT 'Pending',
  `ShippingAddress` varchar(255) DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'2025-05-20 15:09:27','Shipped','123 Main St, Anytown',1225.50),(2,2,'2025-05-20 15:09:27','Delivered','456 Oak Ave, Anytown',70.99),(3,3,'2025-05-20 15:09:27','Pending','789 Pine Ln, Anytown',25.00),(4,4,'2025-05-20 15:09:27','Shipped','101 Elm Rd, Anytown',18.20),(5,5,'2025-05-20 15:09:27','Delivered','222 Maple Dr, Anytown',110.50),(6,6,'2025-05-20 15:09:27','Pending','333 Birch Ct, Anytown',22.99),(7,7,'2025-05-20 15:09:27','Shipped','444 Willow Way, Anytown',12.75),(8,8,'2025-05-20 15:09:27','Delivered','555 Cedar Blvd, Anytown',550.00),(9,9,'2025-05-20 15:09:27','Pending','666 Spruce Pl, Anytown',89.99),(10,10,'2025-05-20 15:09:27','Shipped','777 Oak St, Anytown',9.50),(11,11,'2025-05-20 15:09:27','Delivered','888 Pine Ave, Anytown',40.25),(12,12,'2025-05-20 15:09:27','Pending','999 Elm Ln, Anytown',150.00),(13,13,'2025-05-20 15:09:27','Shipped','111 Maple Rd, Anytown',28.50),(14,14,'2025-05-20 15:09:27','Delivered','222 Birch Dr, Anytown',125.00),(15,15,'2025-05-20 15:09:27','Pending','333 Willow Ct, Anytown',10.99),(16,16,'2025-05-20 15:09:27','Shipped','444 Cedar Way, Anytown',35.00),(17,17,'2025-05-20 15:09:27','Delivered','555 Spruce Blvd, Anytown',199.00),(18,18,'2025-05-20 15:09:27','Pending','666 Oak Pl, Anytown',14.00),(19,19,'2025-05-20 15:09:27','Shipped','777 Pine St, Anytown',40.00),(20,20,'2025-05-20 15:09:27','Delivered','888 Elm Ave, Anytown',65.50),(21,1,'2025-05-20 15:09:27','Processing','123 Main St, Anytown',58.75),(22,3,'2025-05-20 15:09:27','Cancelled','789 Pine Ln, Anytown',110.00);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  `CategoryID` int DEFAULT NULL,
  `StockQuantity` int NOT NULL DEFAULT '0',
  `LastUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-20 20:45:27
