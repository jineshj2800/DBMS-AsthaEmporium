-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: Astha
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bank_Details`
--

DROP TABLE IF EXISTS `Bank_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bank_Details` (
  `BankID` int(11) NOT NULL AUTO_INCREMENT,
  `Bank_Name` varchar(50) DEFAULT NULL,
  `Account_Number` varchar(20) DEFAULT NULL,
  `IFSC_Code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BankID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bank_Details`
--

LOCK TABLES `Bank_Details` WRITE;
/*!40000 ALTER TABLE `Bank_Details` DISABLE KEYS */;
INSERT INTO `Bank_Details` VALUES (5,'SBI','12345678900000','sbiofbanswara'),(7,'SBI','12345678900000','sbiofbanswara'),(9,'sdd','1234','sssssssssssssss'),(23,'SBI','890762334324','Barbluhari'),(27,'SBI','4347394910829','sbiofudaipur'),(28,'SBI','12345678900000','sbiofbanswara');
/*!40000 ALTER TABLE `Bank_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buying_Details`
--

DROP TABLE IF EXISTS `Buying_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Buying_Details` (
  `PurchaseID` int(11) NOT NULL AUTO_INCREMENT,
  `Total_Bill` int(11) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `PaymentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `Buying_Details_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`) ON DELETE CASCADE,
  CONSTRAINT `Buying_Details_ibfk_2` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buying_Details`
--

LOCK TABLES `Buying_Details` WRITE;
/*!40000 ALTER TABLE `Buying_Details` DISABLE KEYS */;
INSERT INTO `Buying_Details` VALUES (8,45670,'was godd','2020-11-22',9,90),(9,20000,'for kurtas and shirt','2020-12-02',12,107);
/*!40000 ALTER TABLE `Buying_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cart` (
  `CustomerID` varchar(50) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`,`CustomerID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `Cart_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Category_Name` varchar(50) DEFAULT NULL,
  `Variety` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (3,'Men Wear','T-Shirts, Shirts, Jeans, Shorts, Trousers and other items'),(5,'Women Wear','Top, Shirt, T-shirts, Jeans, Kurtas etc.'),(8,'Kids Wear','T-Shirts, Shirts, Jeans, Shorts, Trousers  etc.');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courier`
--

DROP TABLE IF EXISTS `Courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courier` (
  `CourierID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Shop_No` varchar(30) DEFAULT NULL,
  `Locality` varchar(50) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CourierID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courier`
--

LOCK TABLES `Courier` WRITE;
/*!40000 ALTER TABLE `Courier` DISABLE KEYS */;
INSERT INTO `Courier` VALUES (3,'Blue Dart','1','Mohon Colony','Banswara'),(4,'Sprinklr','24','Bharat nagar','Banswara');
/*!40000 ALTER TABLE `Courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courier_Contact`
--

DROP TABLE IF EXISTS `Courier_Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courier_Contact` (
  `CourierID` int(11) NOT NULL,
  `Contact_No` varchar(20) NOT NULL,
  PRIMARY KEY (`Contact_No`,`CourierID`),
  KEY `CourierID` (`CourierID`),
  CONSTRAINT `Courier_Contact_ibfk_1` FOREIGN KEY (`CourierID`) REFERENCES `Courier` (`CourierID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courier_Contact`
--

LOCK TABLES `Courier_Contact` WRITE;
/*!40000 ALTER TABLE `Courier_Contact` DISABLE KEYS */;
INSERT INTO `Courier_Contact` VALUES (3,'6356745553'),(3,'9824563120'),(4,'8905783986');
/*!40000 ALTER TABLE `Courier_Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courier_Email`
--

DROP TABLE IF EXISTS `Courier_Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courier_Email` (
  `CourierID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`,`CourierID`),
  KEY `CourierID` (`CourierID`),
  CONSTRAINT `Courier_Email_ibfk_1` FOREIGN KEY (`CourierID`) REFERENCES `Courier` (`CourierID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courier_Email`
--

LOCK TABLES `Courier_Email` WRITE;
/*!40000 ALTER TABLE `Courier_Email` DISABLE KEYS */;
INSERT INTO `Courier_Email` VALUES (3,'abcd@1234.yahoo.com'),(4,'xyp@10846.yahoo.com');
/*!40000 ALTER TABLE `Courier_Email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustomerID` varchar(50) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `House_No` varchar(30) DEFAULT NULL,
  `Street_Name` varchar(50) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('jj2800','Jinesh','Kumar','Jain','male','jineshj2800@gmail.com','jinesh@1228','13','Jain Mohalla , Lohariya ','Banswara'),('sahil109','Sahil','','Jain','male','abcd@gmail.com','22222222','13','Hiranmagri','Udaipur');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Contact`
--

DROP TABLE IF EXISTS `Customer_Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_Contact` (
  `CustomerID` varchar(50) NOT NULL,
  `Contact_No` varchar(20) NOT NULL,
  PRIMARY KEY (`Contact_No`,`CustomerID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Customer_Contact_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Contact`
--

LOCK TABLES `Customer_Contact` WRITE;
/*!40000 ALTER TABLE `Customer_Contact` DISABLE KEYS */;
INSERT INTO `Customer_Contact` VALUES ('jj2800','0987654389'),('jj2800','6789553563'),('sahil109','987654321');
/*!40000 ALTER TABLE `Customer_Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeID` varchar(50) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Joining_Date` date DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Designation` varchar(30) DEFAULT NULL,
  `House_No` varchar(20) DEFAULT NULL,
  `Street_Name` varchar(50) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `BankID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `BankID` (`BankID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `Bank_Details` (`BankID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('manav2020','Manav','Mukesh','Jain','male','1999-02-20','manav2020','2020-10-02',10500,'sales man','67','Hiranmagri','Udaipur',23),('parv9812','Parv','Kumar','Jain','male','1999-02-03','22222222','2020-12-01',10000,'sales man','','Jain Mohalla , Lohariya , Banswara','Banswara',28);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Attendance`
--

DROP TABLE IF EXISTS `Employee_Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Attendance` (
  `EmployeeID` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Attendance` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Date`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `Employee_Attendance_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Attendance`
--

LOCK TABLES `Employee_Attendance` WRITE;
/*!40000 ALTER TABLE `Employee_Attendance` DISABLE KEYS */;
INSERT INTO `Employee_Attendance` VALUES ('manav2020','2020-10-25','present'),('manav2020','2020-10-28','present'),('manav2020','2020-10-29','absent'),('manav2020','2020-11-01','present'),('manav2020','2020-11-02','absent'),('manav2020','2020-11-03','present'),('manav2020','2020-11-06','absent'),('manav2020','2020-11-07','present'),('manav2020','2020-11-16','present'),('manav2020','2020-11-25','present'),('manav2020','2020-11-26','absent'),('manav2020','2020-11-27','absent'),('manav2020','2020-11-28','present'),('manav2020','2020-12-02','present'),('parv9812','2020-12-02','present');
/*!40000 ALTER TABLE `Employee_Attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Contact`
--

DROP TABLE IF EXISTS `Employee_Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Contact` (
  `EmployeeID` varchar(50) NOT NULL,
  `Contact_No` varchar(15) NOT NULL,
  PRIMARY KEY (`Contact_No`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `Employee_Contact_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Contact`
--

LOCK TABLES `Employee_Contact` WRITE;
/*!40000 ALTER TABLE `Employee_Contact` DISABLE KEYS */;
INSERT INTO `Employee_Contact` VALUES ('manav2020','1234554544'),('parv9812','0123453455');
/*!40000 ALTER TABLE `Employee_Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Email`
--

DROP TABLE IF EXISTS `Employee_Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Email` (
  `EmployeeID` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `Employee_Email_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Email`
--

LOCK TABLES `Employee_Email` WRITE;
/*!40000 ALTER TABLE `Employee_Email` DISABLE KEYS */;
INSERT INTO `Employee_Email` VALUES ('manav2020','abcd@pqr'),('parv9812','jineshj2800@gmail.com');
/*!40000 ALTER TABLE `Employee_Email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedback` (
  `FeedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(500) DEFAULT NULL,
  `Feedback_Date` date DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `Feedback_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES (6,'good product','2020-11-27',4,'jj2800',24),(7,'very good product','2020-11-27',4,'jj2800',25),(10,'good product','2020-12-02',5,'sahil109',31);
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Getting_Offer`
--

DROP TABLE IF EXISTS `Getting_Offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Getting_Offer` (
  `OfferID` varchar(10) NOT NULL,
  `CustomerID` varchar(50) NOT NULL,
  PRIMARY KEY (`OfferID`,`CustomerID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Getting_Offer_ibfk_1` FOREIGN KEY (`OfferID`) REFERENCES `Offer` (`OfferID`) ON DELETE CASCADE,
  CONSTRAINT `Getting_Offer_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Getting_Offer`
--

LOCK TABLES `Getting_Offer` WRITE;
/*!40000 ALTER TABLE `Getting_Offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Getting_Offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `InvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `Net_Amount` int(11) DEFAULT NULL,
  `Taxes_Applied` float DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Issue_Time` time DEFAULT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES (1,4116,372,412,'2020-10-27','23:45:02',NULL),(2,4116,372,412,'2020-10-27','23:45:42',NULL),(3,4116,372,412,'2020-10-27','23:46:46',NULL),(4,4116,372,412,'2020-10-27','23:51:06','jj2800'),(5,4116,372,412,'2020-10-27','23:55:27','jj2800'),(6,5655,617,566,'2020-11-01','15:42:48','jj2800'),(7,2398,287,240,'2020-11-02','23:00:02','jj2800'),(8,12800,1536,1920,'2020-11-02','23:02:45','jj2800'),(16,5399,647,1052,'2020-11-06','17:03:10','jj2800'),(21,11096,1330,3111,'2020-11-21','15:21:14','jj2800'),(23,3500,420,1390,'2020-11-25','17:33:44','jj2800'),(24,4000,480,720,'2020-11-27','10:20:15','jj2800'),(25,3798,455,1330,'2020-11-27','14:32:39','jj2800'),(26,1900,228,380,'2020-11-27','14:52:26','jj2800'),(27,5600,672,1536,'2020-11-28','18:04:19','jj2800'),(31,1600,192,192,'2020-12-02','17:56:29','sahil109'),(32,1600,192,400,'2020-12-02','20:21:44','sahil109');
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offer`
--

DROP TABLE IF EXISTS `Offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offer` (
  `OfferID` varchar(10) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Discount` varchar(50) DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  PRIMARY KEY (`OfferID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offer`
--

LOCK TABLES `Offer` WRITE;
/*!40000 ALTER TABLE `Offer` DISABLE KEYS */;
INSERT INTO `Offer` VALUES ('DIWALI100','one time offer','15% Off on purchase upto Rs.1000','2020-12-05');
/*!40000 ALTER TABLE `Offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offline_Sale`
--

DROP TABLE IF EXISTS `Offline_Sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offline_Sale` (
  `SaleID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(100) DEFAULT NULL,
  `Total_Bill` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `PaymentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `Offline_Sale_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offline_Sale`
--

LOCK TABLES `Offline_Sale` WRITE;
/*!40000 ALTER TABLE `Offline_Sale` DISABLE KEYS */;
INSERT INTO `Offline_Sale` VALUES (18,'Jinesh Jain',4880,'2020-12-02',101);
/*!40000 ALTER TABLE `Offline_Sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `Total_Cost` int(11) DEFAULT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `Delivery_Address` varchar(250) DEFAULT NULL,
  `Delivery_Status` varchar(50) DEFAULT NULL,
  `InvoiceID` int(11) DEFAULT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  `CourierID` int(11) DEFAULT NULL,
  `PaymentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CourierID` (`CourierID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `Invoice` (`InvoiceID`) ON DELETE CASCADE,
  CONSTRAINT `Order_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `Order_ibfk_3` FOREIGN KEY (`CourierID`) REFERENCES `Courier` (`CourierID`) ON DELETE CASCADE,
  CONSTRAINT `Order_ibfk_4` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (24,3760,'2020-11-21','13, Jain Mohalla , Lohariya , Banswara - 327605','Delivered',24,'jj2800',4,81),(25,2923,'2020-11-14','13, Hiranmagri, Udaipur - 000000','Delivered',25,'jj2800',3,87),(26,1748,'2020-11-22','13, Hiranmagri, Udaipur - 000002','Delivered',26,'jj2800',4,91),(27,4736,NULL,'13, Jain Mohalla , Lohariya , Banswara, Banswara - 327605','Order Placed',27,'jj2800',NULL,92),(31,1600,'2020-12-04','123, Hiranmagri, Udaipur - 334238','Delivered',31,'sahil109',3,99),(32,1392,NULL,'13, Hiranmagri, Udaipur - 234357','Order Placed',32,'sahil109',NULL,108);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Item`
--

DROP TABLE IF EXISTS `Order_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Item` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `Quantity` int(11) DEFAULT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ItemID`,`OrderID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `Order_Item_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`) ON DELETE CASCADE,
  CONSTRAINT `Order_Item_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Item`
--

LOCK TABLES `Order_Item` WRITE;
/*!40000 ALTER TABLE `Order_Item` DISABLE KEYS */;
INSERT INTO `Order_Item` VALUES (27,2,24,8),(28,2,25,9),(29,1,26,12),(30,2,27,9),(31,2,27,11),(35,1,31,11),(36,1,32,19);
/*!40000 ALTER TABLE `Order_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` int(11) DEFAULT NULL,
  `Mode_of_Payment` varchar(30) DEFAULT NULL,
  `Date_of_Payment` date DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (81,4480,'gpay','2020-11-27'),(86,-10000,'check','2020-11-15'),(87,4253,'gpay','2020-11-27'),(90,-45670,'net banking','2020-11-22'),(91,2128,'gpay','2020-11-27'),(92,6272,'card','2020-11-28'),(94,2688,'card','2020-12-02'),(96,-8000,'cash','2020-12-27'),(97,2800,'gpay','2020-12-02'),(99,1792,'card','2020-12-02'),(101,4880,'card','2020-12-02'),(105,-3000,'net banking','2020-12-01'),(106,-8000,'net banking','2020-12-02'),(107,-20000,'net banking','2020-12-02'),(108,1792,'card','2020-12-02');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Name` varchar(50) DEFAULT NULL,
  `Product_Type` varchar(50) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Size` varchar(10) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `Cost_Price` int(11) DEFAULT NULL,
  `Discount` int(11) DEFAULT NULL,
  `Selling_Price` int(11) DEFAULT NULL,
  `Available_Quantity` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`) ON DELETE CASCADE,
  CONSTRAINT `Product_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (8,'Men Blue Shirt','Shirt','Fine quality shirt, especially for fashion loving people. Excellent finishing and available at a very reasonable rate. Provides very good comfort and smooth, made of very good raw material.','img-2.jpg','Navy Blue','M','Peter England',1300,18,2000,9,3,8),(9,'Men Linen Shirt','Shirt','Fine quality shirt, especially for fashion loving people. Excellent finishing and available at a very reasonable rate. Provides very good comfort and smooth, made of very good raw material','img-3.jpg','White','XL','Peter England',1199,20,1200,10,3,8),(11,'Women Black Top','Top','Fine quality top, especially for fashion loving people. Excellent finishing and available at a very reasonable rate. Provides very good comfort and smooth, made of very good raw material','img-1.jpg','Black','S','Peter England',1300,12,1500,7,5,9),(12,'Women White Top','Top','Fine quality top, especially for fashion loving people. Excellent finishing and available at a very reasonable rate. Provides very good comfort and smooth, made of very good raw material','img-4.jpg','White','M','Peter England',1500,10,1900,9,5,9),(13,'Men White Blazer','Blazer','Fine quality blazer, especially for fashion loving people. Excellent finishing and available at a very reasonable rate. Provides very good comfort and smooth, made of very good raw material','img-5.jpg','White','L','Levi\'s',2000,16,2500,9,3,8),(15,'Women white shirt','Shirt','Fine quality shirt, especially for fashion loving people. Excellent finishing and available at a very reasonable rate. Provides very good comfort and smooth, made of very good raw material','img-6.jpg','White','S','Nike',1700,10,2300,10,5,9),(19,'Men Blue T-shirt','T-shirt','good item','img-7.jpg','Blue','M','Nike',1300,10,1600,9,3,9);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salary_Paid`
--

DROP TABLE IF EXISTS `Salary_Paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Salary_Paid` (
  `EmployeeID` varchar(50) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`PaymentID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `Salary_Paid_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE,
  CONSTRAINT `Salary_Paid_ibfk_2` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salary_Paid`
--

LOCK TABLES `Salary_Paid` WRITE;
/*!40000 ALTER TABLE `Salary_Paid` DISABLE KEYS */;
INSERT INTO `Salary_Paid` VALUES ('parv9812',105),('manav2020',106);
/*!40000 ALTER TABLE `Salary_Paid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sold_Offline`
--

DROP TABLE IF EXISTS `Sold_Offline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sold_Offline` (
  `ProductID` int(11) NOT NULL,
  `SaleID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`SaleID`),
  KEY `SaleID` (`SaleID`),
  CONSTRAINT `Sold_Offline_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE,
  CONSTRAINT `Sold_Offline_ibfk_2` FOREIGN KEY (`SaleID`) REFERENCES `Offline_Sale` (`SaleID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sold_Offline`
--

LOCK TABLES `Sold_Offline` WRITE;
/*!40000 ALTER TABLE `Sold_Offline` DISABLE KEYS */;
INSERT INTO `Sold_Offline` VALUES (8,18,1),(11,18,2);
/*!40000 ALTER TABLE `Sold_Offline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `Shop_No` varchar(30) DEFAULT NULL,
  `Locality` varchar(50) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `BankID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `BankID` (`BankID`),
  CONSTRAINT `Supplier_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `Bank_Details` (`BankID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (8,'Mayur Suitings','last but not the least, good variety items ','','','Udaipur',7),(9,'Reliance Trends','good variety and all things are available','','','Jodhpur',NULL),(12,'Shaym sundar garments','good variety','24','','Udaipur',27);
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier_Contact`
--

DROP TABLE IF EXISTS `Supplier_Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier_Contact` (
  `SupplierID` int(11) NOT NULL,
  `Contact_No` varchar(15) NOT NULL,
  PRIMARY KEY (`Contact_No`,`SupplierID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `Supplier_Contact_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier_Contact`
--

LOCK TABLES `Supplier_Contact` WRITE;
/*!40000 ALTER TABLE `Supplier_Contact` DISABLE KEYS */;
INSERT INTO `Supplier_Contact` VALUES (8,'4845458588'),(9,'7884544714'),(12,'1323343556');
/*!40000 ALTER TABLE `Supplier_Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier_Email`
--

DROP TABLE IF EXISTS `Supplier_Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier_Email` (
  `SupplierID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`,`SupplierID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `Supplier_Email_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier_Email`
--

LOCK TABLES `Supplier_Email` WRITE;
/*!40000 ALTER TABLE `Supplier_Email` DISABLE KEYS */;
INSERT INTO `Supplier_Email` VALUES (8,'xyx@2920.yahoo'),(9,'mkdfkfd@kjsdd'),(12,'jinesh@gmail.com');
/*!40000 ALTER TABLE `Supplier_Email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('JJ','$2a$10$aJ1qMcQ6x5MYwdgodJvY/.glk5rR/zm.NzCG3qdISsLut9vrlzlDa','admin'),('jj2800','$2a$10$g.u7Y6Se4e84DO/dJiw.A.AJhlWcdJ/h0bg0OKNm9Ue2Y12KmO4A.','customer'),('manav2020','$2a$10$SVSISF.nRotBART4sJS4W.G21/uVh3j6wxO1b958trcMNWkbzXWmm','employee'),('parv9812','$2a$10$JBIE21EeMFttfzP3FnoLbOezhNqhM6I5Q7mRbEZTV03etEVZlANNC','employee'),('sahil109','$2a$10$RMvuoo0skDw4UpqBTOwBBOM1P7TnNifaUYD7d/b0THoFthXFKiUQG','customer');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-02 23:02:05
