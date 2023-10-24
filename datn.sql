-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: datn
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL,
  `custome_id` bigint DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `district` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ward` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address_detail` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_FK` (`custome_id`),
  CONSTRAINT `addresses_FK` FOREIGN KEY (`custome_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` bigint NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `transport_fee` decimal(10,0) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_FK` (`customer_id`),
  KEY `bill_FK_1` (`employee_id`),
  CONSTRAINT `bill_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `bill_FK_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_detail` (
  `id` bigint NOT NULL,
  `bill_id` bigint DEFAULT NULL,
  `product_detail_id` bigint DEFAULT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `color` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `size` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `default_price` decimal(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_detail_FK` (`bill_id`),
  KEY `bill_detail_FK_1` (`product_detail_id`),
  CONSTRAINT `bill_detail_FK` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `bill_detail_FK_1` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint NOT NULL,
  `brand_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL,
  `cart_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` bigint NOT NULL,
  `product_detail_id` bigint DEFAULT NULL,
  `bill_id` bigint DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_detail_FK` (`cart_id`),
  KEY `cart_detail_FK_1` (`bill_id`),
  KEY `cart_detail_FK_2` (`product_detail_id`),
  CONSTRAINT `cart_detail_FK` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `cart_detail_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `cart_detail_FK_2` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL,
  `category_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collar`
--

DROP TABLE IF EXISTS `collar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collar` (
  `id` bigint NOT NULL,
  `collar_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `collar_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collar`
--

LOCK TABLES `collar` WRITE;
/*!40000 ALTER TABLE `collar` DISABLE KEYS */;
/*!40000 ALTER TABLE `collar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` bigint NOT NULL,
  `color_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `color_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint NOT NULL,
  `email_verification_status` bit(1) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verification_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `gender` int NOT NULL,
  `dateof_birth` date NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `customer_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designs`
--

DROP TABLE IF EXISTS `designs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designs` (
  `id` bigint NOT NULL,
  `design_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `design_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designs`
--

LOCK TABLES `designs` WRITE;
/*!40000 ALTER TABLE `designs` DISABLE KEYS */;
/*!40000 ALTER TABLE `designs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `gender` int NOT NULL,
  `dateof_birth` date NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `encrypted_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `image` longblob,
  `employee_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_FK` (`product_id`),
  CONSTRAINT `images_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
  `id` bigint NOT NULL,
  `material_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `material_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `password_reset_tokens_FK` (`customer_id`),
  CONSTRAINT `password_reset_tokens_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patterns`
--

DROP TABLE IF EXISTS `patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patterns` (
  `id` bigint NOT NULL,
  `pattern_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pattern_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patterns`
--

LOCK TABLES `patterns` WRITE;
/*!40000 ALTER TABLE `patterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `patterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `id` bigint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `color_id` bigint DEFAULT NULL,
  `size_id` bigint DEFAULT NULL,
  `design_id` bigint DEFAULT NULL,
  `material_id` bigint DEFAULT NULL,
  `pattern_id` bigint DEFAULT NULL,
  `collar_id` bigint DEFAULT NULL,
  `sleeve_id` bigint DEFAULT NULL,
  `waistband_id` bigint DEFAULT NULL,
  `default price` decimal(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_detail_FK` (`color_id`),
  KEY `product_detail_FK_1` (`material_id`),
  KEY `product_detail_FK_2` (`product_id`),
  KEY `product_detail_FK_3` (`size_id`),
  KEY `product_detail_FK_4` (`design_id`),
  KEY `product_detail_FK_5` (`pattern_id`),
  KEY `product_detail_FK_6` (`collar_id`),
  KEY `product_detail_FK_7` (`sleeve_id`),
  KEY `product_detail_FK_8` (`waistband_id`),
  CONSTRAINT `product_detail_FK` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `product_detail_FK_1` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  CONSTRAINT `product_detail_FK_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_detail_FK_3` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `product_detail_FK_4` FOREIGN KEY (`design_id`) REFERENCES `designs` (`id`),
  CONSTRAINT `product_detail_FK_5` FOREIGN KEY (`pattern_id`) REFERENCES `patterns` (`id`),
  CONSTRAINT `product_detail_FK_6` FOREIGN KEY (`collar_id`) REFERENCES `collar` (`id`),
  CONSTRAINT `product_detail_FK_7` FOREIGN KEY (`sleeve_id`) REFERENCES `sleeves` (`id`),
  CONSTRAINT `product_detail_FK_8` FOREIGN KEY (`waistband_id`) REFERENCES `waistbands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `describe` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_FK` (`brand_id`),
  KEY `product_FK_1` (`category_id`),
  CONSTRAINT `product_FK` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `product_FK_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_detail`
--

DROP TABLE IF EXISTS `promotion_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_detail` (
  `id` bigint NOT NULL,
  `promotion_id` bigint DEFAULT NULL,
  `product_detail_id` bigint DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_detail_FK` (`promotion_id`),
  KEY `promotion_detail_FK_1` (`product_detail_id`),
  CONSTRAINT `promotion_detail_FK` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
  CONSTRAINT `promotion_detail_FK_1` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_detail`
--

LOCK TABLES `promotion_detail` WRITE;
/*!40000 ALTER TABLE `promotion_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` bigint NOT NULL,
  `promotion_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `amount` int DEFAULT NULL,
  `discount_level` decimal(10,0) DEFAULT NULL,
  `describe` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` bigint NOT NULL,
  `size_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `size_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleeves`
--

DROP TABLE IF EXISTS `sleeves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleeves` (
  `id` bigint NOT NULL,
  `sleeve_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sleeve_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleeves`
--

LOCK TABLES `sleeves` WRITE;
/*!40000 ALTER TABLE `sleeves` DISABLE KEYS */;
/*!40000 ALTER TABLE `sleeves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waistbands`
--

DROP TABLE IF EXISTS `waistbands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waistbands` (
  `id` bigint NOT NULL,
  `waistband_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `waistband_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waistbands`
--

LOCK TABLES `waistbands` WRITE;
/*!40000 ALTER TABLE `waistbands` DISABLE KEYS */;
/*!40000 ALTER TABLE `waistbands` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-20 10:44:11
