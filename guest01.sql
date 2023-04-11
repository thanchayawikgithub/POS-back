-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 11, 2023 at 01:54 PM
-- Server version: 5.7.41-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guest01`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`guest01`@`%` PROCEDURE `getCustomer` ()   BEGIN
SELECT * FROM customer;
END$$

CREATE DEFINER=`guest01`@`%` PROCEDURE `getMatirial` ()   BEGIN
SELECT *  FROM material 
WHERE mat_min_quantity > mat_quantity;
END$$

CREATE DEFINER=`guest01`@`%` PROCEDURE `getProduct` ()   BEGIN
SELECT * FROM product;
END$$

CREATE DEFINER=`guest01`@`%` PROCEDURE `getProductByCatID` (IN `pCatID` INTEGER(1))   BEGIN
    SELECT * FROM product WHERE categoryId = pCatID;
END$$

CREATE DEFINER=`guest01`@`%` PROCEDURE `getStore` ()   BEGIN
SELECT * FROM store;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `bill_shop_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bill_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `bill_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `bill_total` int(11) NOT NULL,
  `bill_buy` int(11) NOT NULL,
  `bill_change` int(11) NOT NULL,
  `bill_createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `bill_updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `bill_deletedAt` timestamp(6) NULL DEFAULT NULL,
  `employeeEmployeeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `bill_shop_name`, `bill_date`, `bill_time`, `bill_total`, `bill_buy`, `bill_change`, `bill_createdAt`, `bill_updatedAt`, `bill_deletedAt`, `employeeEmployeeId`) VALUES
(2, 'Makro', '2023-04-08 06:07:04.642547', '2023-04-08 06:07:04.642547', 1118, 2000, 882, '2023-04-08 06:07:04.642547', '2023-04-08 06:07:04.642547', NULL, 1),
(3, 'Makro', '2023-04-08 06:16:02.510557', '2023-04-08 06:16:02.510557', 1497, 2000, 503, '2023-04-08 06:16:02.510557', '2023-04-08 06:16:02.510557', NULL, 1),
(4, 'Big C', '2023-04-08 15:50:26.147224', '2023-04-08 15:50:26.147224', 1516, 2000, 484, '2023-04-08 15:50:26.147224', '2023-04-08 15:50:26.147224', NULL, 1),
(5, 'Lotus', '2023-04-08 15:50:37.995835', '2023-04-08 15:50:37.995835', 808, 900, 92, '2023-04-08 15:50:37.995835', '2023-04-08 15:50:37.995835', NULL, 1),
(6, 'Makro', '2023-04-08 15:50:45.747719', '2023-04-08 15:50:45.747719', 1170, 2000, 830, '2023-04-08 15:50:45.747719', '2023-04-08 15:50:45.747719', NULL, 1),
(7, 'Makro', '2023-04-09 13:19:26.600955', '2023-04-09 13:19:26.600955', 1422, 2000, 578, '2023-04-09 13:19:26.600955', '2023-04-09 13:19:26.600955', NULL, 7),
(8, 'Makro', '2023-04-09 14:57:45.485566', '2023-04-09 14:57:45.485566', 569, 600, 31, '2023-04-09 14:57:45.485566', '2023-04-09 14:57:45.485566', NULL, 7),
(9, 'Makro', '2023-04-09 14:59:51.177838', '2023-04-09 14:59:51.177838', 0, 0, 724, '2023-04-09 14:59:51.177838', '2023-04-09 14:59:51.177838', NULL, 7),
(10, 'Makro', '2023-04-09 14:59:51.180678', '2023-04-09 14:59:51.180678', 2276, 3000, 724, '2023-04-09 14:59:51.180678', '2023-04-09 14:59:51.180678', NULL, 7),
(11, 'Makro', '2023-04-09 15:07:01.893172', '2023-04-09 15:07:01.893172', 569, 600, 31, '2023-04-09 15:07:01.893172', '2023-04-09 15:07:01.893172', NULL, 7),
(12, 'Makro', '2023-04-09 15:07:01.894046', '2023-04-09 15:07:01.894046', 0, 0, 31, '2023-04-09 15:07:01.894046', '2023-04-09 15:07:01.894046', NULL, 7),
(13, 'Makro', '2023-04-09 15:08:06.063841', '2023-04-09 15:08:06.063841', 569, 0, 0, '2023-04-09 15:08:06.063841', '2023-04-09 15:08:06.063841', NULL, 7),
(14, 'Makro', '2023-04-09 15:08:21.879945', '2023-04-09 15:08:21.879945', 1376, 0, 0, '2023-04-09 15:08:21.879945', '2023-04-09 15:08:21.879945', NULL, 7),
(15, 'Makro', '2023-04-09 15:11:32.611883', '2023-04-09 15:11:32.611883', 569, 5000, 4431, '2023-04-09 15:11:32.611883', '2023-04-09 15:11:32.611883', NULL, 7),
(16, 'Makro', '2023-04-09 15:11:32.636648', '2023-04-09 15:11:32.636648', 0, 0, 4431, '2023-04-09 15:11:32.636648', '2023-04-09 15:11:32.636648', NULL, 7),
(17, 'Makro', '2023-04-09 15:11:38.528587', '2023-04-09 15:11:38.528587', 569, 0, 4431, '2023-04-09 15:11:38.528587', '2023-04-09 15:11:38.528587', NULL, 7),
(18, 'Lotus', '2023-04-09 15:16:02.437677', '2023-04-09 15:16:02.437677', 300, 300, 0, '2023-04-09 15:16:02.437677', '2023-04-09 15:16:02.437677', NULL, 7),
(19, 'Lotus', '2023-04-09 15:16:18.284364', '2023-04-09 15:16:18.284364', 60, 100, 40, '2023-04-09 15:16:18.284364', '2023-04-09 15:16:18.284364', NULL, 7),
(20, 'Makro', '2023-04-09 22:26:40.455796', '2023-04-09 22:26:40.455796', 893, 900, 7, '2023-04-09 22:26:40.455796', '2023-04-09 22:26:40.455796', NULL, 7),
(21, 'Lotus', '2023-04-09 22:43:31.881017', '2023-04-09 22:43:31.881017', 245, 250, 5, '2023-04-09 22:43:31.881017', '2023-04-09 22:43:31.881017', NULL, 1),
(22, 'Makro', '2023-04-09 22:48:44.854988', '2023-04-09 22:48:44.854988', 838, 1000, 162, '2023-04-09 22:48:44.854988', '2023-04-09 22:48:44.854988', NULL, 1),
(23, 'Makro', '2023-04-09 22:52:16.397041', '2023-04-09 22:52:16.397041', 569, 1000, 431, '2023-04-09 22:52:16.397041', '2023-04-09 22:52:16.397041', NULL, 1),
(24, 'Makro', '2023-04-09 23:04:57.843439', '2023-04-09 23:04:57.843439', 2162, 2200, 38, '2023-04-09 23:04:57.843439', '2023-04-09 23:04:57.843439', NULL, 1),
(25, 'Makro', '2023-04-09 23:33:56.538036', '2023-04-09 23:33:56.538036', 838, 1000, 162, '2023-04-09 23:33:56.538036', '2023-04-09 23:33:56.538036', NULL, 1),
(26, 'Makro', '2023-04-09 23:39:20.597741', '2023-04-09 23:39:20.597741', 569, 600, 31, '2023-04-09 23:39:20.597741', '2023-04-09 23:39:20.597741', NULL, 1),
(27, 'Makro', '2023-04-09 23:39:34.354130', '2023-04-09 23:39:34.354130', 344, 400, 56, '2023-04-09 23:39:34.354130', '2023-04-09 23:39:34.354130', NULL, 1),
(28, 'Makro', '2023-04-10 00:02:27.703932', '2023-04-10 00:02:27.703932', 584, 600, 16, '2023-04-10 00:02:27.703932', '2023-04-10 00:02:27.703932', NULL, 1),
(29, 'Makro', '2023-04-10 03:24:32.100928', '2023-04-10 03:24:32.100928', 615, 700, 85, '2023-04-10 03:24:32.100928', '2023-04-10 03:24:32.100928', NULL, 7),
(30, 'Big C', '2023-04-10 03:44:22.687601', '2023-04-10 03:44:22.687601', 275, 300, 25, '2023-04-10 03:44:22.687601', '2023-04-10 03:44:22.687601', NULL, 7),
(31, 'Makro', '2023-04-10 05:34:18.244948', '2023-04-10 05:34:18.244948', 1435, 2000, 565, '2023-04-10 05:34:18.244948', '2023-04-10 05:34:18.244948', NULL, 7),
(32, 'Makro', '2023-04-10 05:35:17.261913', '2023-04-10 05:35:17.261913', 2845, 3000, 155, '2023-04-10 05:35:17.261913', '2023-04-10 05:35:17.261913', NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_detail_id` int(11) NOT NULL,
  `bill_detail_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bill_detail_amount` int(11) NOT NULL,
  `bill_detail_price` int(11) NOT NULL,
  `bill_detail_total` int(11) NOT NULL,
  `materialsMatId` int(11) DEFAULT NULL,
  `billBillId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_detail_id`, `bill_detail_name`, `bill_detail_amount`, `bill_detail_price`, `bill_detail_total`, `materialsMatId`, `billBillId`) VALUES
(2, 'Fresh Pork', 1, 205, 205, 6, 2),
(3, 'Bacon', 1, 569, 569, 7, 2),
(4, 'Sausage', 1, 225, 225, 8, 2),
(5, 'Fresh Chicken', 1, 119, 119, 5, 2),
(6, 'Fresh Chicken', 1, 119, 119, 5, 3),
(7, 'Fresh Pork', 1, 205, 205, 6, 3),
(8, 'Bacon', 1, 569, 569, 7, 3),
(9, 'Shrimp', 1, 379, 379, 9, 3),
(10, 'Sausage', 1, 225, 225, 8, 3),
(11, 'Choco Tea Powder', 1, 55, 55, 39, 4),
(12, 'Thai Tea Powder', 4, 55, 220, 38, 4),
(13, 'Blueberry syrup', 3, 52, 156, 42, 4),
(14, 'Lychees syrup', 1, 52, 52, 43, 4),
(15, 'Green Tea Powder', 1, 55, 55, 37, 4),
(16, 'Soda', 2, 180, 360, 41, 4),
(17, 'Chocolate Sauce', 2, 30, 60, 48, 4),
(18, 'Cola', 2, 180, 360, 52, 4),
(19, 'Ham', 2, 38, 76, 54, 4),
(20, 'Tomata Soup', 2, 35, 70, 53, 4),
(21, 'Sala syrup', 1, 52, 52, 45, 4),
(22, 'Egg', 1, 123, 123, 25, 5),
(23, 'Tomato', 3, 60, 180, 27, 5),
(24, 'Cabbage', 2, 62, 124, 31, 5),
(25, 'Cucumber', 2, 38, 76, 30, 5),
(26, 'Mushroom', 2, 70, 140, 33, 5),
(27, 'Spaghetti', 3, 55, 165, 56, 5),
(28, 'Half-Shell Mussel', 6, 125, 750, 15, 6),
(29, 'Rice(5Kg.)', 3, 140, 420, 19, 6),
(30, 'Bacon', 1, 569, 569, 7, 7),
(31, 'Fresh Pork', 1, 205, 205, 6, 7),
(32, 'Shrimp', 1, 379, 379, 9, 7),
(33, 'Squid', 1, 269, 269, 11, 7),
(34, 'Bacon', 1, 569, 569, 7, 8),
(35, 'Bacon', 4, 569, 2276, 7, 10),
(36, 'Bacon', 1, 569, 569, 7, 11),
(37, 'Bacon', 1, 569, 569, 7, 13),
(38, 'Bacon', 1, 569, 569, 7, 14),
(39, 'Squid', 3, 269, 807, 11, 14),
(40, 'Bacon', 1, 569, 569, 7, 15),
(41, 'Bacon', 1, 569, 569, 7, 17),
(42, 'Tomato', 5, 60, 300, 27, 18),
(43, 'Tomato', 1, 60, 60, 27, 19),
(44, 'Fresh Chicken', 1, 119, 119, 5, 20),
(45, 'Fresh Pork', 1, 205, 205, 6, 20),
(46, 'Bacon', 1, 569, 569, 7, 20),
(47, 'Egg', 1, 123, 123, 25, 21),
(48, 'Tomato', 1, 60, 60, 27, 21),
(49, 'Cabbage', 1, 62, 62, 31, 21),
(50, 'Squid', 1, 269, 269, 11, 22),
(51, 'Bacon', 1, 569, 569, 7, 22),
(52, 'Bacon', 1, 569, 569, 7, 23),
(53, 'Bacon', 1, 569, 569, 7, 24),
(54, 'Plastic Glass', 1, 1420, 1420, 16, 24),
(55, 'Vegetable Oil ', 1, 48, 48, 21, 24),
(56, 'Half-Shell Mussel', 1, 125, 125, 15, 24),
(57, 'Bacon', 1, 569, 569, 7, 25),
(58, 'Squid', 1, 269, 269, 11, 25),
(59, 'Bacon', 1, 569, 569, 7, 26),
(60, 'Fresh Chicken', 1, 119, 119, 5, 27),
(61, 'Sausage', 1, 225, 225, 8, 27),
(62, 'Fresh Pork', 1, 205, 205, 6, 28),
(63, 'Shrimp', 1, 379, 379, 9, 28),
(64, 'Fresh Pork', 3, 205, 615, 6, 29),
(65, 'Green Tea Powder', 3, 55, 165, 37, 30),
(66, 'Thai Tea Powder', 2, 55, 110, 38, 30),
(67, 'Fresh Pork', 7, 205, 1435, 6, 31),
(68, 'Bacon', 5, 569, 2845, 7, 32);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Drink'),
(2, 'Bakery'),
(3, 'Food');

-- --------------------------------------------------------

--
-- Table structure for table `check_in_out`
--

CREATE TABLE `check_in_out` (
  `cio_id` int(11) NOT NULL,
  `cio_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `cio_total_hour` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'checked in',
  `updatedDate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedDate` timestamp(6) NULL DEFAULT NULL,
  `employeeEmployeeId` int(11) DEFAULT NULL,
  `salarySsId` int(11) DEFAULT NULL,
  `cio_time_in` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `cio_time_out` timestamp NULL DEFAULT NULL,
  `EmployeeId` int(11) NOT NULL,
  `SalaryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `check_in_out`
--

INSERT INTO `check_in_out` (`cio_id`, `cio_date`, `cio_total_hour`, `status`, `updatedDate`, `deletedDate`, `employeeEmployeeId`, `salarySsId`, `cio_time_in`, `cio_time_out`, `EmployeeId`, `SalaryId`) VALUES
(18, '2023-04-08 05:16:37.482013', 6, 'checked out', '2023-04-08 05:16:54.000000', NULL, 1, 11, '2023-04-08 05:16:37.482013', '2023-04-08 11:41:10', 1, 11),
(19, '2023-04-08 05:16:59.170166', 6, 'checked out', '2023-04-08 05:17:03.000000', NULL, 1, 11, '2023-04-08 05:16:59.170166', '2023-04-08 11:41:10', 1, 11),
(20, '2023-04-08 05:17:05.525763', 6, 'checked out', '2023-04-08 05:18:12.000000', NULL, 1, 12, '2023-04-08 05:17:05.525763', '2023-04-08 11:41:10', 1, 12),
(21, '2023-04-08 05:36:24.963713', 0, 'checked out', '2023-04-08 05:36:36.000000', NULL, 1, 13, '2023-04-08 05:36:24.963713', '2023-04-08 05:36:36', 1, 13),
(22, '2023-04-08 06:03:47.593126', 5, 'checked out', '2023-04-08 06:12:59.000000', NULL, 1, 13, '2023-04-08 06:03:47.593126', '2023-04-08 11:41:10', 1, 13),
(23, '2023-04-08 06:13:09.165319', 5, 'checked out', '2023-04-08 08:44:39.000000', NULL, 1, 13, '2023-04-08 06:13:09.165319', '2023-04-08 11:41:10', 1, 13),
(24, '2023-04-08 06:35:00.170831', 5, 'checked out', '2023-04-08 08:44:50.000000', NULL, 1, 13, '2023-04-08 06:35:00.170831', '2023-04-08 11:41:10', 1, 13),
(25, '2023-04-08 06:41:15.997372', 4, 'checked out', '2023-04-08 08:45:06.000000', NULL, 1, 13, '2023-04-08 06:41:15.997372', '2023-04-08 11:41:10', 1, 13),
(26, '2023-04-08 06:41:57.044974', 4, 'checked out', '2023-04-08 08:45:13.000000', NULL, 1, 13, '2023-04-08 06:41:57.044974', '2023-04-08 11:41:10', 1, 13),
(27, '2023-04-08 08:22:06.721470', 3, 'checked out', '2023-04-08 08:22:21.000000', NULL, 1, 13, '2023-04-08 08:22:06.721470', '2023-04-08 11:41:10', 1, 13),
(28, '2023-04-08 09:00:57.433283', 2, 'checked out', '2023-04-08 09:01:01.000000', NULL, 1, 13, '2023-04-08 09:00:57.433283', '2023-04-08 11:41:10', 1, 13),
(29, '2023-04-08 12:40:39.868201', 0, 'checked out', '2023-04-08 12:40:52.000000', NULL, 1, 13, '2023-04-08 12:40:39.868201', '2023-04-08 11:41:10', 1, 13),
(30, '2023-04-08 14:01:19.502357', 2, 'checked out', '2023-04-08 15:59:26.000000', NULL, 1, 13, '2023-04-08 14:01:19.502357', '2023-04-08 11:41:10', 1, 13),
(31, '2023-04-08 15:37:12.189096', 3, 'checked out', '2023-04-08 15:59:17.000000', NULL, 1, 13, '2023-04-08 15:37:12.189096', '2023-04-08 11:41:10', 1, 13),
(32, '2023-04-08 16:01:17.141821', 0, 'checked in', '2023-04-08 16:01:17.141821', NULL, 1, NULL, '2023-04-08 16:01:17.141821', NULL, 1, NULL),
(33, '2023-04-08 16:01:40.278121', 0, 'checked in', '2023-04-08 16:01:40.278121', NULL, 1, NULL, '2023-04-08 16:01:40.278121', NULL, 1, NULL),
(34, '2023-04-08 17:37:51.426009', 0, 'checked in', '2023-04-08 17:37:51.426009', NULL, 5, NULL, '2023-04-08 17:37:51.426009', NULL, 5, NULL),
(35, '2023-04-08 21:33:58.944859', 9, 'checked out', '2023-04-08 21:42:52.000000', NULL, 7, 15, '2023-04-08 21:33:58.944859', '2023-04-08 11:41:10', 7, 15),
(36, '2023-04-08 21:44:23.310769', 10, 'checked out', '2023-04-08 21:46:54.000000', NULL, 7, 15, '2023-04-08 21:44:23.310769', '2023-04-08 11:41:10', 7, 15),
(37, '2023-04-08 21:48:30.549483', 0, 'checked in', '2023-04-08 21:48:30.549483', NULL, 7, NULL, '2023-04-08 21:48:30.549483', NULL, 7, NULL),
(38, '2023-04-08 22:14:33.925775', 0, 'checked in', '2023-04-08 22:14:33.925775', NULL, 7, NULL, '2023-04-08 22:14:33.925775', NULL, 7, NULL),
(39, '2023-04-08 22:43:58.038104', 11, 'checked out', '2023-04-08 22:44:11.000000', NULL, 7, 15, '2023-04-08 22:43:58.038104', '2023-04-08 11:41:10', 7, 15),
(40, '2023-04-08 22:45:22.650351', 0, 'checked in', '2023-04-08 22:45:22.650351', NULL, 7, NULL, '2023-04-08 22:45:22.650351', NULL, 7, NULL),
(41, '2023-04-08 23:45:54.266108', 0, 'checked in', '2023-04-08 23:45:54.266108', NULL, 7, NULL, '2023-04-08 23:45:54.266108', NULL, 7, NULL),
(42, '2023-04-09 00:30:59.526893', 12, 'checked out', '2023-04-09 00:31:07.000000', NULL, 1, 14, '2023-04-09 00:30:59.526893', '2023-04-09 12:41:10', 1, 14),
(43, '2023-04-09 00:31:21.585257', 12, 'checked out', '2023-04-09 00:31:27.000000', NULL, 1, 14, '2023-04-09 00:31:21.585257', '2023-04-09 12:41:10', 1, 14),
(44, '2023-04-09 00:31:42.215257', 11, 'checked out', '2023-04-09 00:31:48.000000', NULL, 1, 14, '2023-04-09 00:31:42.215257', '2023-04-09 11:41:10', 1, 14),
(45, '2023-04-09 00:36:58.446489', 11, 'checked out', '2023-04-09 00:37:05.000000', NULL, 1, 16, '2023-04-09 00:36:58.446489', '2023-04-09 11:41:10', 1, 16),
(46, '2023-04-09 00:47:23.243504', 10, 'checked out', '2023-04-09 00:47:28.000000', NULL, 1, 17, '2023-04-09 00:47:23.243504', '2023-04-09 11:41:10', 1, 17),
(47, '2023-04-09 00:48:08.205484', 10, 'checked out', '2023-04-09 00:48:39.000000', NULL, 1, 18, '2023-04-09 00:48:08.205484', '2023-04-09 11:41:10', 1, 18),
(48, '2023-04-09 00:49:46.574767', 10, 'checked out', '2023-04-09 00:49:52.000000', NULL, 1, 19, '2023-04-09 00:49:46.574767', '2023-04-09 11:41:10', 1, 19),
(49, '2023-04-09 00:56:06.984385', 10, 'checked out', '2023-04-09 00:56:13.000000', NULL, 1, 20, '2023-04-09 00:56:06.984385', '2023-04-09 11:41:10', 1, 20),
(50, '2023-04-09 04:13:37.299267', 7, 'checked out', '2023-04-09 04:13:45.000000', NULL, 1, 21, '2023-04-09 04:13:37.299267', '2023-04-09 11:41:10', 1, 21),
(51, '2023-04-09 04:15:46.162602', 7, 'checked out', '2023-04-09 04:15:52.000000', NULL, 1, 22, '2023-04-09 04:15:46.162602', '2023-04-09 11:41:10', 1, 22),
(52, '2023-04-09 04:16:47.062169', 7, 'checked out', '2023-04-09 04:16:53.000000', NULL, 1, 22, '2023-04-09 04:16:47.062169', '2023-04-09 11:41:10', 1, 22),
(53, '2023-04-09 04:21:23.312060', 7, 'checked out', '2023-04-09 04:21:31.000000', NULL, 1, 23, '2023-04-09 04:21:23.312060', '2023-04-09 11:41:10', 1, 23),
(54, '2023-04-09 07:36:06.655283', 4, 'checked out', '2023-04-09 07:36:37.000000', NULL, 7, 25, '2023-04-09 07:36:06.655283', '2023-04-09 11:41:10', 7, 25),
(55, '2023-04-09 08:05:09.050978', 3, 'checked out', '2023-04-09 08:10:15.000000', NULL, 11, 26, '2023-04-09 08:05:09.050978', '2023-04-09 11:41:10', 11, 26),
(56, '2023-04-09 08:23:34.497831', 3, 'checked out', '2023-04-09 08:23:48.000000', NULL, 1, 24, '2023-04-09 08:23:34.497831', '2023-04-09 11:41:10', 1, 24),
(57, '2023-04-09 08:23:58.153189', 3, 'checked out', '2023-04-09 08:25:00.000000', NULL, 1, 24, '2023-04-09 08:23:58.153189', '2023-04-09 11:41:10', 1, 24),
(58, '2023-04-09 08:35:56.582074', 0, 'checked in', '2023-04-09 08:35:56.582074', NULL, 7, NULL, '2023-04-09 08:35:56.582074', NULL, 7, NULL),
(59, '2023-04-09 08:36:21.875233', 0, 'checked in', '2023-04-09 08:36:21.875233', NULL, 7, NULL, '2023-04-09 08:36:21.875233', NULL, 7, NULL),
(60, '2023-04-09 08:37:50.373684', 0, 'checked in', '2023-04-09 08:37:50.373684', NULL, 7, NULL, '2023-04-09 08:37:50.373684', NULL, 7, NULL),
(61, '2023-04-09 08:38:36.199497', 0, 'checked in', '2023-04-09 08:38:36.199497', NULL, 7, NULL, '2023-04-09 08:38:36.199497', NULL, 7, NULL),
(62, '2023-04-09 08:40:20.867037', 0, 'checked in', '2023-04-09 08:40:20.867037', NULL, 7, NULL, '2023-04-09 08:40:20.867037', NULL, 7, NULL),
(63, '2023-04-09 08:42:11.437040', 0, 'checked in', '2023-04-09 08:42:11.437040', NULL, 7, NULL, '2023-04-09 08:42:11.437040', NULL, 7, NULL),
(64, '2023-04-09 08:42:47.978389', 2, 'checked out', '2023-04-09 08:42:54.000000', NULL, 7, 25, '2023-04-09 08:42:47.978389', '2023-04-09 11:41:10', 7, 25),
(65, '2023-04-09 08:43:39.364533', 2, 'checked out', '2023-04-09 08:44:52.000000', NULL, 7, 25, '2023-04-09 08:43:39.364533', '2023-04-09 11:41:10', 7, 25),
(66, '2023-04-09 10:42:40.649505', 0, 'checked out', '2023-04-09 10:42:45.000000', NULL, 7, 27, '2023-04-09 10:42:40.649505', '2023-04-09 11:41:10', 7, 27),
(67, '2023-04-09 10:44:19.157267', 0, 'checked out', '2023-04-09 10:44:23.000000', NULL, 7, 28, '2023-04-09 10:44:19.157267', '2023-04-09 11:41:10', 7, 28),
(68, '2023-04-09 10:44:33.316732', 0, 'checked out', '2023-04-09 10:44:39.000000', NULL, 7, 28, '2023-04-09 10:44:33.316732', '2023-04-09 11:41:10', 7, 28),
(69, '2023-04-09 12:18:27.046161', 0, 'checked out', '2023-04-09 12:18:44.000000', NULL, 7, 29, '2023-04-09 12:18:27.046161', '2023-04-09 11:41:10', 7, 29),
(70, '2023-04-09 12:18:33.119374', 0, 'checked out', '2023-04-09 12:18:49.000000', NULL, 7, 29, '2023-04-09 12:18:33.119374', '2023-04-09 11:41:10', 7, 29),
(71, '2023-04-09 15:41:08.113790', 3, 'checked out', '2023-04-09 15:41:16.000000', NULL, 7, 29, '2023-04-09 15:41:08.113790', '2023-04-09 11:41:10', 7, 29),
(72, '2023-04-09 18:12:49.624801', 0, 'checked in', '2023-04-09 18:12:49.624801', NULL, 7, NULL, '2023-04-09 18:12:49.624801', NULL, 7, NULL),
(73, '2023-04-09 22:01:15.015576', 10, 'checked out', '2023-04-09 22:01:21.000000', NULL, 1, 30, '2023-04-09 22:01:15.015576', '2023-04-09 11:41:10', 1, 30),
(74, '2023-04-09 23:01:04.683396', 11, 'checked out', '2023-04-09 23:01:43.000000', NULL, 7, 29, '2023-04-09 23:01:04.683396', '2023-04-09 11:41:10', 7, 29),
(75, '2023-04-09 23:07:40.777859', 13, 'checked out', '2023-04-09 23:07:48.000000', NULL, 1, 30, '2023-04-09 23:07:40.777859', '2023-04-10 12:30:00', 1, 30),
(76, '2023-04-09 23:09:09.128090', 13, 'checked out', '2023-04-09 23:10:35.000000', NULL, 1, 31, '2023-04-09 23:09:09.128090', '2023-04-10 12:30:00', 1, 31),
(77, '2023-04-10 00:01:02.248383', 12, 'checked out', '2023-04-10 00:01:22.000000', NULL, 1, 32, '2023-04-10 00:01:02.248383', '2023-04-10 12:30:00', 1, 32),
(78, '2023-04-10 00:01:04.602423', 0, 'checked in', '2023-04-10 00:01:04.602423', NULL, 7, NULL, '2023-04-10 00:01:04.602423', NULL, 7, NULL),
(79, '2023-04-10 00:02:41.038142', 12, 'checked out', '2023-04-10 00:02:57.000000', NULL, 7, 33, '2023-04-10 00:02:41.038142', '2023-04-10 12:30:00', 7, 33),
(80, '2023-04-10 00:35:23.470778', 11, 'checked out', '2023-04-10 00:35:30.000000', NULL, 1, NULL, '2023-04-10 00:35:23.470778', '2023-04-10 12:30:00', 1, NULL),
(81, '2023-04-10 00:37:22.729407', 11, 'checked out', '2023-04-10 00:37:27.000000', NULL, 1, NULL, '2023-04-10 00:37:22.729407', '2023-04-10 12:30:00', 1, NULL),
(82, '2023-04-10 00:37:31.049714', 11, 'checked out', '2023-04-10 00:37:39.000000', NULL, 7, 33, '2023-04-10 00:37:31.049714', '2023-04-10 12:30:00', 7, 33),
(83, '2023-04-10 00:37:58.764009', 11, 'checked out', '2023-04-10 00:40:36.000000', NULL, 7, 33, '2023-04-10 00:37:58.764009', '2023-04-10 12:30:00', 7, 33),
(84, '2023-04-10 00:54:47.376945', 0, 'checked in', '2023-04-10 00:54:47.376945', NULL, 7, NULL, '2023-04-10 00:54:47.376945', NULL, 7, NULL),
(85, '2023-04-10 03:21:24.206679', 9, 'checked out', '2023-04-10 03:21:31.000000', NULL, 7, 33, '2023-04-10 03:21:24.206679', '2023-04-10 12:30:00', 7, 33);

-- --------------------------------------------------------

--
-- Table structure for table `check_material`
--

CREATE TABLE `check_material` (
  `check_mat_id` int(11) NOT NULL,
  `check_mat_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `check_mat_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `deleteAt` datetime(6) DEFAULT NULL,
  `employeeEmployeeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `check_material`
--

INSERT INTO `check_material` (`check_mat_id`, `check_mat_date`, `check_mat_time`, `deleteAt`, `employeeEmployeeId`) VALUES
(1, '2023-04-08 06:07:21.793268', '2023-04-08 06:07:21.793268', NULL, 1),
(2, '2023-04-08 06:08:03.427836', '2023-04-08 06:08:03.427836', NULL, 1),
(3, '2023-04-08 06:15:51.174978', '2023-04-08 06:15:51.174978', NULL, 1),
(4, '2023-04-08 06:28:30.281862', '2023-04-08 06:28:30.281862', NULL, 1),
(5, '2023-04-08 06:28:46.402812', '2023-04-08 06:28:46.402812', NULL, 1),
(6, '2023-04-08 17:29:52.625317', '2023-04-08 17:29:52.625317', NULL, 3),
(7, '2023-04-08 23:06:26.746495', '2023-04-08 23:06:26.746495', NULL, 7),
(8, '2023-04-09 11:28:13.196509', '2023-04-09 11:28:13.196509', NULL, 9),
(9, '2023-04-09 22:44:09.419916', '2023-04-09 22:44:09.419916', NULL, 7),
(10, '2023-04-09 22:44:36.770606', '2023-04-09 22:44:36.770606', NULL, 7),
(11, '2023-04-09 22:45:07.439873', '2023-04-09 22:45:07.439873', NULL, 1),
(12, '2023-04-09 22:45:38.849319', '2023-04-09 22:45:38.849319', NULL, 7),
(13, '2023-04-09 23:24:03.670315', '2023-04-09 23:24:03.670315', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `check_material_detial`
--

CREATE TABLE `check_material_detial` (
  `cmd_id` int(11) NOT NULL,
  `cmd_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cmd_qty_last` int(11) NOT NULL,
  `cmd_qty_remain` int(11) NOT NULL,
  `checkMaterialCheckMatId` int(11) DEFAULT NULL,
  `materialMatId` int(11) DEFAULT NULL,
  `cmd_qty_expire` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `check_material_detial`
--

INSERT INTO `check_material_detial` (`cmd_id`, `cmd_name`, `cmd_qty_last`, `cmd_qty_remain`, `checkMaterialCheckMatId`, `materialMatId`, `cmd_qty_expire`) VALUES
(1, 'Fresh Chicken', 2, 1, 1, 5, 0),
(2, 'Fresh Pork', 6, 1, 1, 6, 0),
(3, 'Bacon', 6, 1, 1, 7, 0),
(4, 'Sausage', 6, 1, 1, 8, 0),
(5, 'Fresh Chicken', 1, 5, 2, 5, 0),
(6, 'Fresh Pork', 1, 5, 2, 6, 0),
(7, 'Bacon', 1, 5, 2, 7, 0),
(8, 'Sausage', 1, 5, 2, 8, 0),
(9, 'Fresh Chicken', 1, 2, 3, 5, 0),
(10, 'Fresh Pork', 0, 2, 3, 6, 0),
(11, 'Bacon', 5, 2, 3, 7, 0),
(12, 'Sausage', 5, 2, 3, 8, 0),
(13, 'Shrimp', 5, 2, 3, 9, 0),
(14, 'Fresh Chicken', 3, 5, 4, 5, 0),
(15, 'Fresh Pork', 3, 5, 4, 6, 0),
(16, 'Bacon', 3, 5, 4, 7, 0),
(17, 'Sausage', 3, 5, 4, 8, 0),
(18, 'Shrimp', 3, 5, 4, 9, 0),
(19, 'Fresh Chicken', 5, 3, 5, 5, 0),
(20, 'Fresh Pork', 5, 3, 5, 6, 0),
(21, 'Bacon', 5, 3, 5, 7, 0),
(22, 'Sausage', 5, 3, 5, 8, 0),
(23, 'Shrimp', 5, 3, 5, 9, 0),
(24, 'Fresh Chicken', 1, 2, 6, 5, 0),
(25, 'Fresh Chicken', 2, 1, 7, 5, 0),
(26, 'Bacon', 3, 1, 8, 7, 2),
(27, 'Bacon', 13, 1, 9, 7, 0),
(28, 'Bacon', 1, 5, 10, 7, 0),
(29, 'Blueberry syrup', 0, 7, 10, 42, 0),
(30, 'Cabbage', 4, 8, 10, 31, 0),
(31, 'Caramel Syrup', 4, 9, 10, 49, 0),
(32, 'Carrot', 1, 2, 10, 34, 0),
(33, 'Cheese', 2, 3, 10, 57, 0),
(34, 'Choco Tea Powder', 21, 4, 10, 39, 0),
(35, 'Chocolate Sauce', 0, 5, 10, 48, 0),
(36, 'Coffee', 20, 6, 10, 51, 0),
(37, 'Cola', 22, 7, 10, 52, 0),
(38, 'Bacon', 5, 6, 11, 7, 2),
(39, 'Blueberry syrup', 7, 6, 11, 42, 3),
(40, 'Cabbage', 8, 2, 11, 31, 4),
(41, 'Caramel Syrup', 9, 5, 11, 49, 8),
(42, 'Carrot', 2, 8, 11, 34, 2),
(43, 'Cheese', 3, 4, 11, 57, 0),
(44, 'Choco Tea Powder', 4, 8, 11, 39, 0),
(45, 'Chocolate Sauce', 5, 10, 11, 48, 0),
(46, 'Coffee', 6, 5, 11, 51, 0),
(47, 'Cola', 7, 5, 11, 52, 0),
(48, 'Bacon', 6, 1, 12, 7, 0),
(49, 'Blueberry syrup', 6, 0, 12, 42, 0),
(50, 'Cabbage', 2, 0, 12, 31, 0),
(51, 'Caramel Syrup', 5, 2, 12, 49, 0),
(52, 'Carrot', 8, 5, 12, 34, 0),
(53, 'Cheese', 4, 6, 12, 57, 0),
(54, 'Choco Tea Powder', 8, 7, 12, 39, 0),
(55, 'Chocolate Sauce', 10, 2, 12, 48, 0),
(56, 'Coffee', 5, 3, 12, 51, 0),
(57, 'Cola', 5, 0, 12, 52, 0),
(58, 'Honey', 3, 10, 13, 50, 0),
(59, 'Japanese Rice(1Kg.)', 6, 5, 13, 26, 0),
(60, 'Lemon', 7, 8, 13, 63, 0),
(61, 'Lime syrup', 4, 6, 13, 44, 0),
(62, 'Lychees syrup', 5, 3, 13, 43, 0),
(63, 'Macaroni', 7, 4, 13, 55, 0),
(64, 'Milk(2Litre)', 7, 8, 13, 23, 0),
(65, 'Mushroom', 4, 8, 13, 33, 0),
(66, 'Onion', 1, 4, 13, 29, 0),
(67, 'Paper Glass', 3, 5, 13, 18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_point` int(11) NOT NULL DEFAULT '10',
  `createdDate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedDate` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_tel`, `customer_point`, `createdDate`, `updatedDate`, `deletedDate`) VALUES
(2, 'Benz', '0818627064', 12, '2023-01-28 02:22:19.631305', '2023-01-28 02:22:19.631305', NULL),
(3, 'than', '0959389589', 56, '2023-01-29 02:22:24.507672', '2023-04-10 00:29:30.000000', NULL),
(5, 'Teee', '0981353460', 33, '2023-01-29 04:56:32.972976', '2023-04-10 05:37:11.000000', NULL),
(17, 'tong', '0111111111', 10, '2023-01-29 07:19:07.368616', '2023-01-29 07:19:07.368616', NULL),
(26, 'anawin', '0970785562', 10, '2023-01-30 03:08:56.785009', '2023-01-30 03:08:56.785009', NULL),
(27, 'judy', '0853698596', 10, '2023-01-30 05:32:56.617306', '2023-01-30 05:32:56.617306', NULL),
(28, 'mumu', '0836948527', 10, '2023-01-29 19:33:12.725014', '2023-01-29 19:33:12.725014', NULL),
(29, 'manow', '0836942578', 10, '2023-01-31 02:33:29.795117', '2023-01-31 02:33:29.795117', NULL),
(30, 'whan', '0836935574', 10, '2023-03-31 04:34:14.366500', '2023-03-31 04:34:14.366500', NULL),
(31, 'luna', '0834155729', 10, '2023-02-01 03:34:26.440461', '2023-02-01 03:34:26.440461', NULL),
(32, 'bubu', '0814472365', 10, '2023-02-03 05:34:46.678865', '2023-02-03 05:34:46.678865', NULL),
(33, 'kiwi', '0852693854', 10, '2023-02-14 07:35:02.917077', '2023-02-14 07:35:02.917077', NULL),
(34, 'earn', '2365593845', 10, '2023-02-18 03:35:50.898047', '2023-02-18 03:35:50.898047', NULL),
(35, 'beam', '0834692855', 10, '2023-02-27 08:35:59.536602', '2023-02-27 08:35:59.536602', NULL),
(36, 'som', '0852372596', 10, '2023-02-28 09:36:07.134373', '2023-02-28 09:36:07.134373', NULL),
(37, 'jay', '0836958427', 10, '2023-03-02 03:36:38.664362', '2023-03-02 03:36:38.664362', NULL),
(38, 'vivi', '0868543956', 10, '2023-03-04 03:36:51.220796', '2023-03-04 03:36:51.220796', NULL),
(39, 'Tarapong', '0851234567', 10, '2023-03-07 05:37:11.725226', '2023-03-07 05:37:11.725226', NULL),
(40, 'lulu', '0863412700', 10, '2023-03-08 09:37:14.903623', '2023-03-08 09:37:14.903623', NULL),
(41, 'popo', '0863572011', 10, '2023-03-13 05:37:29.224809', '2023-03-13 05:37:29.224809', NULL),
(42, 'Jitboy', '0871234567', 10, '2023-03-17 02:37:29.750683', '2023-03-17 02:37:29.750683', NULL),
(43, 'SushiBoy', '0859875897', 10, '2023-03-20 08:37:50.509081', '2023-03-20 08:37:50.509081', NULL),
(44, 'qiqi', '0858396412', 10, '2023-03-23 01:37:52.935715', '2023-03-23 01:37:52.935715', NULL),
(45, 'mimi', '0868349667', 10, '2023-03-25 05:38:06.639043', '2023-03-25 05:38:06.639043', NULL),
(46, 'Foxz', '0854759874', 10, '2023-03-29 03:38:13.027105', '2023-03-29 03:38:13.027105', NULL),
(47, 'Patt', '0875412569', 10, '2023-03-29 05:38:43.865208', '2023-03-29 05:38:43.865208', NULL),
(48, 'jaja', '0236592568', 10, '2023-03-31 04:53:50.225355', '2023-03-31 04:53:50.225355', NULL),
(49, 'coco', '0236598536', 10, '2023-04-01 03:54:19.881588', '2023-04-01 03:54:19.881588', NULL),
(50, 'tutu', '0236598647', 10, '2023-04-03 05:54:34.513917', '2023-04-03 05:54:34.513917', NULL),
(51, 'tum', '0236942537', 10, '2023-04-04 07:54:45.269806', '2023-04-04 07:54:45.269806', NULL),
(52, 'tiger', '0236458739', 10, '2023-04-06 05:55:01.822741', '2023-04-06 05:55:01.822741', NULL),
(53, 'yoyo', '0582697563', 10, '2023-04-07 04:55:11.767158', '2023-04-07 04:55:11.767158', NULL),
(54, 'piwpiw', '0425837698', 10, '2023-04-08 08:55:27.891231', '2023-04-09 22:13:03.000000', '2023-04-09 22:13:03.000000'),
(55, 'KK', '0874548213', 10, '2023-04-10 03:04:09.840902', '2023-04-10 03:04:09.840902', NULL),
(56, 'Customer', '0123456789', 100, '2023-04-10 02:01:15.062701', '2023-04-10 03:17:33.000000', NULL);

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `after_customer_update` AFTER UPDATE ON `customer` FOR EACH ROW BEGIN
    UPDATE CustomerDw
    SET
        customer_firstname = SUBSTRING_INDEX(NEW.customer_name, ' ', 1),
        customer_lastname = SUBSTRING_INDEX(NEW.customer_name, ' ', -1),
        customer_start_date = CAST(NEW.createdDate AS DATE)
    WHERE
        customer_id = NEW.customer_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insCustomerDw` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
    INSERT INTO CustomerDw (
        customer_id,
        customer_firstname,
        customer_lastname,
        customer_start_date
    )
    SELECT
        customer.customer_id AS Customer_id,
        SUBSTRING_INDEX(customer.customer_name, ' ', 1) AS Customer_firstname,
        SUBSTRING_INDEX(customer.customer_name, ' ', -1) AS Customer_lastname,
        CAST(customer.createdDate AS DATE) AS Customer_start_date
    FROM
        customer
    WHERE
        customer.customer_id = NEW.customer_id
        AND NOT EXISTS (
            SELECT * FROM CustomerDw WHERE Customer_id = NEW.customer_id
        );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerDw`
--

CREATE TABLE `CustomerDw` (
  `Customer_id` int(11) NOT NULL,
  `Customer_firstname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Customer_lastname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Customer_start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CustomerDw`
--

INSERT INTO `CustomerDw` (`Customer_id`, `Customer_firstname`, `Customer_lastname`, `Customer_start_date`) VALUES
(2, 'Benz', 'Benz', '2023-01-28'),
(3, 'than', 'than', '2023-01-29'),
(5, 'Teee', 'Teee', '2023-01-29'),
(17, 'tong', 'tong', '2023-01-29'),
(26, 'anawin', 'anawin', '2023-01-30'),
(27, 'judy', 'judy', '2023-01-30'),
(28, 'mumu', 'mumu', '2023-01-30'),
(29, 'manow', 'manow', '2023-01-31'),
(30, 'whan', 'whan', '2023-03-31'),
(31, 'luna', 'luna', '2023-02-01'),
(32, 'bubu', 'bubu', '2023-02-03'),
(33, 'kiwi', 'kiwi', '2023-02-14'),
(34, 'earn', 'earn', '2023-02-18'),
(35, 'beam', 'beam', '2023-02-27'),
(36, 'som', 'som', '2023-02-28'),
(37, 'jay', 'jay', '2023-03-02'),
(38, 'vivi', 'vivi', '2023-03-04'),
(39, 'Tarapong', 'Tarapong', '2023-03-07'),
(40, 'lulu', 'lulu', '2023-03-08'),
(41, 'popo', 'popo', '2023-03-13'),
(42, 'Jitboy', 'Jitboy', '2023-03-17'),
(43, 'SushiBoy', 'SushiBoy', '2023-03-20'),
(44, 'qiqi', 'qiqi', '2023-03-23'),
(45, 'mimi', 'mimi', '2023-03-25'),
(46, 'Foxz', 'Foxz', '2023-03-29'),
(47, 'Patt', 'Patt', '2023-03-29'),
(48, 'jaja', 'jaja', '2023-03-31'),
(49, 'coco', 'coco', '2023-04-01'),
(50, 'tutu', 'tutu', '2023-04-03'),
(51, 'tum', 'tum', '2023-04-04'),
(52, 'tiger', 'tiger', '2023-04-06'),
(53, 'yoyo', 'yoyo', '2023-04-07'),
(54, 'piwpiw', 'piwpiw', '2023-04-08'),
(55, 'KK', 'KK', '2023-04-10'),
(56, 'Customer', 'Customer', '2023-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_province` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_district` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_subdistrict` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_hourly_wage` int(11) NOT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`, `employee_login`, `employee_password`, `employee_province`, `employee_district`, `employee_subdistrict`, `employee_tel`, `employee_email`, `employee_position`, `employee_hourly_wage`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'than', 'than', '$2b$10$cFWRmpxosp4df/J9gFIj/OmuOuKEnDcnA8Bi2j8HWOnZZMiYEhyVy', 'chonburi', 'mueng', 'sansuk', '0982131311', '1234@gmail.com', 'Owner', 40, '2023-04-07 02:13:16.967987', '2023-04-08 20:36:01.000000', NULL),
(3, 'admin', 'admin', '$2b$10$lS6uWIbtFB0f80n7PRO1w.VZrDEDWCLny2.qqJ3M9BBFDQMpB1tVO', 'chonburi', 'mueng', 'sansuk', '0982131311', '1234@gmail.com', 'Owner', 60, '2023-04-07 02:20:43.050559', '2023-04-09 22:19:12.000000', NULL),
(5, 'Teee', 'pungtee', '$2b$10$bb5DsjZX30YZVB6q7RvnpuZateixCG8TmK55gscFuwWjZEwA0LQve', 'Bangkok', 'Bangna', 'Bangna', '0998988547', 'pung1234pp@hotmail.com', 'Employee', 40, '2023-04-07 11:01:00.385536', '2023-04-09 22:26:32.000000', NULL),
(7, 'Pattarapol', 'tee', '$2b$10$6Ajl//wwNiDsVp6kO2Do9.rgkvOPlY1egyZVP81cSNCFKYA9iJ8QO', 'chonburi', 'mueng', 'sansuk', '0982131311', '1234@gmail.com', 'Owner', 40, '2023-04-08 18:02:20.949059', '2023-04-08 18:02:20.949059', NULL),
(8, 'Anawin', 'win', '$2b$10$.xKMOXp5NIoRGkAtHR3W3.JCa0Lnak/WkweD50lNeVPRmXLPFt7p.', 'chonburi', 'mueng', 'sansuk', '0985986589', '5555@gmail.com', 'Employee', 35, '2023-04-08 18:09:20.107594', '2023-04-08 18:10:39.000000', NULL),
(9, 'tong ', 'tong', '$2b$10$6PIEp3YkIRP1W86U0qNH7eDdHqaeenLt71R9fdUZ2Sh1TbGsCnaU6', 'chonburi', 'mueng', 'sansuk', '0982131311', '1234@gmail.com', 'admin', 60, '2023-04-08 18:25:29.043576', '2023-04-08 18:25:29.043576', NULL),
(11, 'Benz', 'benz', '$2b$10$c.oGy5YQAaTTFP.aWA2EDe8J.23YEzuZAeug2r7c4Y8B6Sura.Df2', 'chonburi', 'mueng', 'sansuk', '0982131311', '1234@gmail.com', 'Owner', 70, '2023-04-09 07:07:19.472649', '2023-04-09 07:07:19.472649', NULL);

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `delEmployeeDw` AFTER DELETE ON `employee` FOR EACH ROW BEGIN
    DELETE FROM EmployeeDw WHERE Employee_id = OLD.employee_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insEmployeeDw` AFTER INSERT ON `employee` FOR EACH ROW BEGIN
    INSERT INTO EmployeeDw (
        Employee_id,
        Employee_firstname,
        Employee_lastname,
        Employee_start_date
    )
    SELECT
        employee.employee_id AS Employee_id,
        SUBSTRING_INDEX(employee.employee_name, ' ', 1) AS Employee_firstname,
        SUBSTRING_INDEX(employee.employee_name, ' ', -1) AS Employee_lastname,
        CAST(employee.createdAt AS DATE) AS Employee_start_date
    FROM
        employee
    WHERE
        employee.employee_id = NEW.employee_id
        AND NOT EXISTS (
            SELECT * FROM EmployeeDw WHERE Employee_id = NEW.employee_id
        );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updEmployeeDw` AFTER UPDATE ON `employee` FOR EACH ROW BEGIN
    UPDATE EmployeeDw SET
        Employee_firstname = SUBSTRING_INDEX(NEW.employee_name, ' ', 1),
        Employee_lastname = SUBSTRING_INDEX(NEW.employee_name, ' ', -1),
        Employee_start_date = CAST(NEW.createdAt AS DATE)
    WHERE Employee_id = NEW.employee_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeDw`
--

CREATE TABLE `EmployeeDw` (
  `Employee_id` int(11) NOT NULL,
  `Employee_firstname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Employee_lastname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Employee_start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `EmployeeDw`
--

INSERT INTO `EmployeeDw` (`Employee_id`, `Employee_firstname`, `Employee_lastname`, `Employee_start_date`) VALUES
(1, 'than', 'than', '2023-04-07'),
(3, 'admin', 'admin', '2023-04-07'),
(5, 'Teee', 'Teee', '2023-04-07'),
(7, 'Pattarapol', 'Pattarapol', '2023-04-09'),
(8, 'Anawin', 'Anawin', '2023-04-09'),
(9, 'tong', '', '2023-04-09'),
(11, 'Benz', 'Benz', '2023-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `FactAgg`
--

CREATE TABLE `FactAgg` (
  `Fact_agg_id` int(11) NOT NULL,
  `Fact_agg_quantity_sold` smallint(6) NOT NULL,
  `Fact_agg_total_sales` decimal(9,2) NOT NULL,
  `Fact_agg_discount` decimal(9,2) NOT NULL,
  `Month_id` int(11) DEFAULT NULL,
  `Employee_id` int(11) DEFAULT NULL,
  `Store_id` int(11) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FactAgg`
--

INSERT INTO `FactAgg` (`Fact_agg_id`, `Fact_agg_quantity_sold`, `Fact_agg_total_sales`, `Fact_agg_discount`, `Month_id`, `Employee_id`, `Store_id`, `Customer_id`, `Product_id`) VALUES
(127, 2, '90.00', '0.00', 1, 1, 1, NULL, 24),
(128, 9, '360.00', '0.00', 1, 1, 1, NULL, 26),
(129, 2, '80.00', '0.00', 1, 1, 1, NULL, 28),
(130, 1, '16.00', '0.00', 1, 1, 1, NULL, 29),
(131, 2, '100.00', '0.00', 1, 1, 1, NULL, 30),
(132, 10, '375.00', '0.00', 1, 1, 1, NULL, 31),
(133, 1, '40.00', '0.00', 1, 1, 1, NULL, 45),
(134, 1, '50.00', '0.00', 1, 1, 1, NULL, 46),
(135, 1, '40.00', '0.00', 1, 1, 1, NULL, 52),
(136, 3, '120.00', '0.00', 1, 1, 1, NULL, 53),
(137, 3, '120.00', '0.00', 1, 1, 1, NULL, 95),
(138, 4, '120.00', '0.00', 1, 1, 1, NULL, 96),
(139, 1, '50.00', '0.00', 1, 1, 1, 2, 24),
(140, 1, '40.00', '10.00', 1, 1, 1, 3, 25),
(141, 15, '540.00', '270.00', 1, 1, 1, 3, 26),
(142, 6, '240.00', '150.00', 1, 1, 1, 3, 29),
(143, 2, '95.00', '0.00', 1, 1, 1, 5, 24),
(144, 1, '40.00', '30.00', 1, 1, 1, 5, 25),
(145, 1, '35.00', '0.00', 1, 1, 1, 5, 26),
(146, 1, '55.00', '0.00', 1, 1, 1, 5, 32),
(147, 1, '50.00', '0.00', 1, 1, 1, 5, 37),
(148, 7, '350.00', '0.00', 1, 1, 1, 5, 44),
(149, 2, '85.00', '30.00', 1, 1, 1, 5, 52),
(150, 2, '100.00', '0.00', 1, 3, 1, NULL, 26),
(151, 3, '130.00', '0.00', 1, 7, 1, NULL, 24),
(152, 2, '80.00', '0.00', 1, 7, 1, NULL, 25),
(153, 9, '360.00', '0.00', 1, 7, 1, NULL, 26),
(154, 1, '45.00', '0.00', 1, 7, 1, NULL, 28),
(155, 1, '50.00', '0.00', 1, 7, 1, NULL, 33),
(156, 1, '50.00', '0.00', 1, 7, 1, NULL, 36),
(157, 1, '55.00', '0.00', 1, 7, 1, NULL, 63),
(158, 1, '45.00', '0.00', 1, 7, 1, NULL, 91),
(159, 1, '40.00', '0.00', 1, 7, 1, NULL, 93),
(160, 1, '50.00', '0.00', 1, 7, 1, NULL, 100),
(161, 1, '40.00', '0.00', 1, 7, 1, 5, 24),
(162, 1, '50.00', '0.00', 1, 7, 1, 5, 25),
(163, 1, '40.00', '0.00', 1, 7, 1, 5, 26),
(164, 2, '100.00', '0.00', 1, 7, 1, 5, 33),
(165, 4, '200.00', '0.00', 1, 7, 1, 5, 36),
(166, 3, '150.00', '0.00', 1, 7, 1, 5, 38),
(167, 1, '40.00', '0.00', 1, 7, 1, 5, 39),
(168, 1, '50.00', '0.00', 1, 7, 1, 5, 44),
(169, 1, '50.00', '0.00', 1, 7, 1, 5, 100),
(170, 1, '60.00', '0.00', 1, 7, 1, 5, 102),
(171, 10, '400.00', '30.00', 1, 8, 1, 56, 24),
(172, 2, '95.00', '0.00', 1, 11, 1, 2, 24),
(173, 3, '135.00', '0.00', 1, 11, 1, 2, 25),
(174, 2, '90.00', '0.00', 1, 11, 1, 2, 26),
(175, 1, '50.00', '0.00', 1, 11, 1, 2, 37),
(176, 1, '75.00', '0.00', 1, 11, 1, 2, 43),
(177, 2, '80.00', '0.00', 1, 11, 1, 2, 94);

-- --------------------------------------------------------

--
-- Table structure for table `FactDw`
--

CREATE TABLE `FactDw` (
  `Fact_id` int(11) NOT NULL,
  `Fact_quantity_sold` smallint(6) NOT NULL,
  `Fact_total_sales` decimal(9,2) NOT NULL,
  `Fact_discount` decimal(9,2) NOT NULL,
  `Time_id` int(11) DEFAULT NULL,
  `Employee_id` int(11) DEFAULT NULL,
  `Store_id` int(11) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FactDw`
--

INSERT INTO `FactDw` (`Fact_id`, `Fact_quantity_sold`, `Fact_total_sales`, `Fact_discount`, `Time_id`, `Employee_id`, `Store_id`, `Customer_id`, `Product_id`) VALUES
(255, 1, '35.00', '0.00', 1, 1, 1, 5, 26),
(256, 5, '225.00', '0.00', 2, 1, 1, 5, 44),
(257, 1, '16.00', '0.00', 5, 1, 1, NULL, 29),
(258, 1, '50.00', '0.00', 6, 1, 1, 5, 24),
(259, 1, '60.00', '0.00', 6, 1, 1, 5, 44),
(260, 1, '45.00', '0.00', 7, 1, 1, 5, 24),
(261, 1, '55.00', '0.00', 7, 1, 1, 5, 32),
(262, 1, '50.00', '0.00', 7, 1, 1, 5, 37),
(263, 1, '65.00', '0.00', 7, 1, 1, 5, 44),
(264, 1, '40.00', '10.00', 8, 1, 1, 3, 25),
(265, 2, '60.00', '30.00', 9, 1, 1, 3, 26),
(266, 2, '80.00', '60.00', 10, 1, 1, 3, 29),
(267, 4, '120.00', '60.00', 11, 1, 1, 3, 26),
(268, 2, '100.00', '0.00', 12, 1, 1, NULL, 30),
(269, 2, '90.00', '0.00', 12, 1, 1, NULL, 31),
(270, 1, '30.00', '60.00', 13, 1, 1, 3, 26),
(271, 3, '120.00', '60.00', 13, 1, 1, 3, 29),
(272, 1, '50.00', '0.00', 14, 1, 1, NULL, 24),
(273, 1, '30.00', '0.00', 15, 1, 1, NULL, 26),
(274, 3, '120.00', '30.00', 16, 1, 1, 3, 26),
(275, 1, '50.00', '0.00', 17, 1, 1, 2, 24),
(276, 1, '40.00', '30.00', 18, 1, 1, 3, 26),
(277, 1, '40.00', '30.00', 18, 1, 1, 3, 29),
(278, 3, '120.00', '30.00', 19, 1, 1, 3, 26),
(279, 1, '45.00', '0.00', 20, 1, 1, 5, 52),
(280, 1, '40.00', '30.00', 21, 1, 1, 5, 52),
(281, 1, '40.00', '0.00', 22, 1, 1, NULL, 26),
(282, 1, '40.00', '0.00', 23, 1, 1, NULL, 26),
(283, 1, '40.00', '30.00', 32, 1, 1, 5, 25),
(284, 1, '40.00', '0.00', 33, 1, 1, NULL, 26),
(285, 2, '100.00', '0.00', 34, 3, 1, NULL, 26),
(286, 1, '40.00', '0.00', 35, 1, 1, NULL, 24),
(287, 1, '40.00', '0.00', 36, 1, 1, NULL, 45),
(288, 1, '50.00', '0.00', 36, 1, 1, NULL, 46),
(289, 1, '45.00', '0.00', 37, 11, 1, 2, 24),
(290, 1, '45.00', '0.00', 38, 11, 1, 2, 25),
(291, 1, '45.00', '0.00', 38, 11, 1, 2, 26),
(292, 1, '45.00', '0.00', 39, 11, 1, 2, 25),
(293, 1, '45.00', '0.00', 39, 11, 1, 2, 26),
(294, 1, '40.00', '0.00', 40, 7, 1, NULL, 26),
(295, 1, '45.00', '0.00', 41, 11, 1, 2, 25),
(296, 7, '245.00', '0.00', 42, 1, 1, NULL, 31),
(297, 1, '40.00', '0.00', 43, 1, 1, NULL, 26),
(298, 1, '40.00', '0.00', 44, 7, 1, 5, 24),
(299, 1, '40.00', '0.00', 45, 7, 1, NULL, 24),
(300, 1, '40.00', '0.00', 46, 7, 1, NULL, 24),
(301, 1, '45.00', '0.00', 47, 7, 1, NULL, 28),
(302, 1, '40.00', '0.00', 48, 7, 1, NULL, 26),
(303, 1, '40.00', '0.00', 49, 7, 1, NULL, 26),
(304, 2, '80.00', '0.00', 50, 7, 1, NULL, 26),
(305, 1, '40.00', '0.00', 51, 7, 1, NULL, 26),
(306, 1, '40.00', '0.00', 52, 7, 1, NULL, 26),
(307, 1, '40.00', '0.00', 53, 7, 1, 5, 26),
(308, 1, '40.00', '0.00', 54, 7, 1, NULL, 25),
(309, 1, '40.00', '0.00', 55, 7, 1, NULL, 26),
(310, 1, '40.00', '0.00', 56, 7, 1, NULL, 26),
(311, 1, '50.00', '0.00', 57, 7, 1, 5, 25),
(312, 1, '50.00', '0.00', 58, 11, 1, 2, 24),
(313, 1, '50.00', '0.00', 58, 11, 1, 2, 37),
(314, 1, '75.00', '0.00', 58, 11, 1, 2, 43),
(315, 2, '80.00', '0.00', 58, 11, 1, 2, 94),
(316, 2, '90.00', '0.00', 59, 1, 1, NULL, 26),
(317, 1, '40.00', '0.00', 59, 1, 1, NULL, 28),
(318, 2, '80.00', '0.00', 60, 1, 1, NULL, 26),
(319, 1, '40.00', '0.00', 60, 1, 1, NULL, 28),
(320, 3, '120.00', '0.00', 61, 1, 1, NULL, 53),
(321, 3, '120.00', '0.00', 61, 1, 1, NULL, 95),
(322, 4, '120.00', '0.00', 61, 1, 1, NULL, 96),
(323, 2, '100.00', '0.00', 62, 7, 1, 5, 33),
(324, 4, '200.00', '0.00', 62, 7, 1, 5, 36),
(325, 3, '150.00', '0.00', 62, 7, 1, 5, 38),
(326, 1, '40.00', '0.00', 62, 7, 1, 5, 39),
(327, 1, '50.00', '0.00', 62, 7, 1, 5, 44),
(328, 1, '50.00', '0.00', 62, 7, 1, 5, 100),
(329, 1, '60.00', '0.00', 62, 7, 1, 5, 102),
(330, 1, '45.00', '0.00', 63, 7, 1, NULL, 91),
(331, 1, '55.00', '0.00', 64, 7, 1, NULL, 63),
(332, 1, '40.00', '0.00', 65, 7, 1, NULL, 93),
(333, 1, '50.00', '0.00', 66, 7, 1, NULL, 33),
(334, 1, '50.00', '0.00', 66, 7, 1, NULL, 36),
(335, 1, '50.00', '0.00', 67, 7, 1, NULL, 100),
(336, 1, '50.00', '0.00', 68, 7, 1, NULL, 24),
(337, 1, '40.00', '0.00', 69, 1, 1, NULL, 31),
(338, 1, '40.00', '0.00', 69, 1, 1, NULL, 52),
(339, 1, '50.00', '30.00', 70, 1, 1, 3, 26),
(340, 1, '40.00', '0.00', 71, 7, 1, NULL, 25),
(341, 10, '400.00', '30.00', 72, 8, 1, 56, 24);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `mat_id` int(11) NOT NULL,
  `mat_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mat_min_quantity` int(11) NOT NULL,
  `mat_quantity` int(11) NOT NULL,
  `mat_unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mat_price_per_unit` int(11) NOT NULL,
  `mat_shop_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mat_image` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no_img_avaliable.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`mat_id`, `mat_name`, `mat_min_quantity`, `mat_quantity`, `mat_unit`, `mat_price_per_unit`, `mat_shop_name`, `mat_image`) VALUES
(5, 'Fresh Chicken', 2, 2, 'Kg.', 119, 'Makro', '52cbf5c9-5849-4193-a165-ac7bd8d1d621.png'),
(6, 'Fresh Pork', 2, 16, 'Kg.', 205, 'Makro', '09ac728f-fa04-4833-bf83-05b571c13b6e.png'),
(7, 'Bacon', 2, 11, 'Kg.', 569, 'Makro', '591c4b1a-04b8-498c-a2a7-cb9a464236ef.png'),
(8, 'Sausage', 2, 4, 'Pack.', 225, 'Makro', 'a269a1cc-9f00-44f6-8991-0829411457ae.png'),
(9, 'Shrimp', 2, 5, 'Kg.', 379, 'Makro', 'acc1d18e-d596-41f7-858c-92596a5df3a9.png'),
(11, 'Squid', 2, 9, 'Kg.', 269, 'Makro', 'e9f92753-694c-4b80-9947-2b3dc9f0fa9b.png'),
(13, 'Frozen Pangasius', 0, 3, 'Pack.', 110, 'Makro', '2a626097-d56c-456a-b79c-2dfd98421f53.png'),
(15, 'Half-Shell Mussel', 2, 10, 'Kg.', 125, 'Makro', '1ea22fb9-d748-4525-9537-1d52d7d21a70.png'),
(16, 'Plastic Glass', 2, 5, 'Crate.', 1420, 'Makro', '89f200d8-0f90-4cc5-94b4-c157350542f8.png'),
(18, 'Paper Glass', 2, 5, 'Crate.', 1296, 'Makro', 'bb5c5951-a66f-448b-84ed-29e4870768ce.png'),
(19, 'Rice(5Kg.)', 10, 18, 'Kg.', 140, 'Makro', '5e7eea70-4b4f-4671-8a51-596821ce8d88.png'),
(21, 'Vegetable Oil ', 3, 6, 'Bottle.', 48, 'Makro', '76877550-db9f-497d-9cd9-4f36b659c37f.png'),
(23, 'Milk(2Litre)', 5, 8, 'Bottle.', 95, 'Lotus', '6078412a-d155-4485-955c-a46606a1c2b1.png'),
(25, 'Egg', 4, 38, 'Panel.', 123, 'Lotus', '7e67ea35-368b-43b5-b0d5-76f180239e71.png'),
(26, 'Japanese Rice(1Kg.)', 5, 5, 'Kg.', 75, 'Makro', '454c12d5-4fe9-44ca-9274-89a2c617995f.png'),
(27, 'Tomato', 1, 12, 'Kg.', 60, 'Lotus', '6b8f25fe-b0dc-4c30-8be5-a58c801289e3.png'),
(29, 'Onion', 1, 4, 'Kg.', 50, 'Lotus', '34ad3602-7f44-4447-b7dc-c589366bc153.png'),
(30, 'Cucumber', 1, 3, 'Kg.', 38, 'Lotus', '9a330d3c-b724-457c-a851-affe7cf1840a.png'),
(31, 'Cabbage', 1, 0, 'Kg.', 62, 'Lotus', '458f7b02-bca6-4cda-826d-eb0b342ce390.png'),
(32, 'Garlic', 1, 1, 'Kg.', 74, 'Lotus', '3763e826-3eea-4096-b40e-2a2abd7ea51c.png'),
(33, 'Mushroom', 1, 8, 'Kg.', 70, 'Lotus', '56136caf-d342-415d-9ea8-6f7864f124bf.png'),
(34, 'Carrot', 1, 5, 'Kg.', 32, 'Lotus', 'a9860ef2-6cf6-49fb-aab9-9c5d48b9ed1b.png'),
(36, 'ฺฺBitter', 1, 1, 'Kg.', 55, 'Lotus', '5e9e5594-f474-4a1c-a6e9-be7d7df337cb.png'),
(37, 'Green Tea Powder', 10, 24, 'ฺBag.', 55, 'Big C', '8337d88a-f96d-4c0e-818c-ad7046edecd8.png'),
(38, 'Thai Tea Powder', 10, 26, 'ฺBag.', 55, 'Big C', 'f916f981-1003-43d1-95af-4fe463b3ec55.png'),
(39, 'Choco Tea Powder', 10, 7, 'ฺBag.', 55, 'Big C', '4d2d7f72-62e2-4c3b-87da-40c10f12e920.png'),
(41, 'Soda', 5, 10, 'Pack.', 180, 'Big C', '9eb25a05-491f-42a5-a9eb-001ead4d4d3a.png'),
(42, 'Blueberry syrup', 5, 0, 'Pack.', 52, 'Big C', 'c9ce1a82-31a6-45cf-b0f3-7f8da062551f.png'),
(43, 'Lychees syrup', 5, 3, 'Pack.', 52, 'Big C', '283d84c4-8b23-4c40-a584-2493e8d72c15.png'),
(44, 'Lime syrup', 5, 6, 'Bottle.', 52, 'Big C', '0f637b14-517f-4e28-9582-ff6f23a185cc.png'),
(45, 'Sala syrup', 5, 5, 'Bottle.', 52, 'Big C', '0f03e282-7cea-4a5f-b6cd-8e1bf6f2b3a4.png'),
(46, 'Strawberry syrup', 5, 4, 'Bottle.', 52, 'Big C', 'd8a4a274-9eea-4001-b341-6c9abde6210f.png'),
(47, 'Yam', 5, 4, 'Bottle.', 30, 'Big C', 'bc30bae1-3c31-4059-8399-d1d526dbd535.png'),
(48, 'Chocolate Sauce', 3, 2, 'Bottle.', 30, 'Big C', 'b9db4c9d-11ef-426e-93d4-67cfeedbc454.png'),
(49, 'Caramel Syrup', 5, 2, 'Bottle.', 30, 'Big C', '8e7a357e-b945-4bfc-99e2-796819febe0c.png'),
(50, 'Honey', 3, 10, 'Bottle.', 105, 'Big C', '49864279-eab2-4b13-ae1c-562c32f6e56e.png'),
(51, 'Coffee', 10, 3, 'Kg.', 250, 'Big C', 'a2983d0e-b03a-4c79-8eeb-80319ffb139a.png'),
(52, 'Cola', 10, 0, 'Pack.', 180, 'Big C', 'de6c36e2-68f5-4021-8a1c-bb60a2cc7c5f.png'),
(53, 'Tomata Soup', 6, 7, 'Can.', 35, 'Big C', '8e9c29f8-4477-4423-a489-93b02d52a446.png'),
(54, 'Ham', 6, 7, 'Can.', 38, 'Big C', '91e6d80a-1d57-4b15-987e-53ebf51fb68e.png'),
(55, 'Macaroni', 5, 4, 'Pack.', 51, 'Lotus', 'a33d75f6-45f2-4981-9b01-67c1e10678cc.png'),
(56, 'Spaghetti', 5, 9, 'Pack.', 55, 'Lotus', 'b34425a2-b4c1-4a38-a411-334c860e20fc.png'),
(57, 'Cheese', 3, 6, 'Pack.', 219, 'Lotus', 'baf5efae-4963-4ba2-aad2-f09f83df3e22.png'),
(59, 'ฺฺButter', 5, 8, 'Pack.', 74, 'Lotus', '5e4a8325-62eb-4d53-9ce4-c4d0ee0c5887.png'),
(60, 'ฺฺChoco', 5, 10, 'Pack.', 85, 'Lotus', 'a911e374-14f2-40b9-b5bc-a9e90d0f5a3f.png'),
(61, 'ฺฺSalt', 5, 10, 'ฺBottle.', 13, 'Lotus', '280daa31-7698-46f8-8ff6-7e9424dbf1b3.png'),
(62, 'Flour', 10, 20, 'ฺBottle.', 169, 'Makro', '90f628ef-d7a0-4acd-be71-a683cc85e1f1.png'),
(63, 'Lemon', 5, 8, 'Kg.', 89, 'Lotus', 'ff08764c-8bc2-4521-bd76-99ae8a4b11f1.png');

-- --------------------------------------------------------

--
-- Table structure for table `MonthDw`
--

CREATE TABLE `MonthDw` (
  `Month_id` int(11) NOT NULL,
  `Time_original` datetime NOT NULL,
  `Month` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `Quarter` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `Season` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `Year` char(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `MonthDw`
--

INSERT INTO `MonthDw` (`Month_id`, `Time_original`, `Month`, `Quarter`, `Season`, `Year`) VALUES
(1, '2023-04-07 16:11:03', '4', '2', 'Summer', '2023'),
(2, '2023-04-07 16:47:26', '4', '2', 'Summer', '2023'),
(3, '2023-04-07 17:21:41', '4', '2', 'Summer', '2023'),
(4, '2023-04-07 17:22:00', '4', '2', 'Summer', '2023'),
(5, '2023-04-08 11:38:31', '4', '2', 'Summer', '2023'),
(6, '2023-04-08 13:06:10', '4', '2', 'Summer', '2023'),
(7, '2023-04-08 13:15:18', '4', '2', 'Summer', '2023'),
(8, '2023-04-08 14:21:40', '4', '2', 'Summer', '2023'),
(9, '2023-04-08 14:59:19', '4', '2', 'Summer', '2023'),
(10, '2023-04-08 15:01:20', '4', '2', 'Summer', '2023'),
(11, '2023-04-08 15:02:55', '4', '2', 'Summer', '2023'),
(12, '2023-04-08 15:03:39', '4', '2', 'Summer', '2023'),
(13, '2023-04-08 15:05:01', '4', '2', 'Summer', '2023'),
(14, '2023-04-08 15:14:19', '4', '2', 'Summer', '2023'),
(15, '2023-04-08 15:15:29', '4', '2', 'Summer', '2023'),
(16, '2023-04-08 15:16:03', '4', '2', 'Summer', '2023'),
(17, '2023-04-08 15:18:19', '4', '2', 'Summer', '2023'),
(18, '2023-04-08 15:34:37', '4', '2', 'Summer', '2023'),
(19, '2023-04-08 15:35:35', '4', '2', 'Summer', '2023'),
(20, '2023-04-08 15:50:19', '4', '2', 'Summer', '2023'),
(21, '2023-04-08 15:53:37', '4', '2', 'Summer', '2023'),
(22, '2023-04-08 15:55:29', '4', '2', 'Summer', '2023'),
(23, '2023-04-08 16:13:49', '4', '2', 'Summer', '2023'),
(32, '2023-04-08 19:38:34', '4', '2', 'Summer', '2023'),
(33, '2023-04-08 19:38:59', '4', '2', 'Summer', '2023'),
(34, '2023-04-08 22:32:10', '4', '2', 'Summer', '2023'),
(35, '2023-04-08 22:48:46', '4', '2', 'Summer', '2023'),
(36, '2023-04-09 14:25:45', '4', '2', 'Summer', '2023'),
(37, '2023-04-09 15:40:53', '4', '2', 'Summer', '2023'),
(38, '2023-04-09 15:41:32', '4', '2', 'Summer', '2023'),
(39, '2023-04-09 15:42:01', '4', '2', 'Summer', '2023'),
(40, '2023-04-09 15:58:26', '4', '2', 'Summer', '2023'),
(41, '2023-04-09 18:39:30', '4', '2', 'Summer', '2023'),
(42, '2023-04-09 18:57:23', '4', '2', 'Summer', '2023'),
(43, '2023-04-09 19:35:56', '4', '2', 'Summer', '2023'),
(44, '2023-04-09 20:10:44', '4', '2', 'Summer', '2023'),
(45, '2023-04-09 20:14:29', '4', '2', 'Summer', '2023'),
(46, '2023-04-09 20:15:59', '4', '2', 'Summer', '2023'),
(47, '2023-04-09 20:19:48', '4', '2', 'Summer', '2023'),
(48, '2023-04-09 21:45:22', '4', '2', 'Summer', '2023'),
(49, '2023-04-09 21:45:49', '4', '2', 'Summer', '2023'),
(50, '2023-04-09 21:47:32', '4', '2', 'Summer', '2023'),
(51, '2023-04-09 21:47:45', '4', '2', 'Summer', '2023'),
(52, '2023-04-09 21:48:37', '4', '2', 'Summer', '2023'),
(53, '2023-04-09 21:49:10', '4', '2', 'Summer', '2023'),
(54, '2023-04-09 21:49:27', '4', '2', 'Summer', '2023'),
(55, '2023-04-09 21:50:54', '4', '2', 'Summer', '2023'),
(56, '2023-04-09 21:52:22', '4', '2', 'Summer', '2023'),
(57, '2023-04-09 23:21:00', '4', '2', 'Summer', '2023'),
(58, '2023-04-09 23:29:16', '4', '2', 'Summer', '2023'),
(59, '2023-04-10 00:52:36', '4', '2', 'Summer', '2023'),
(60, '2023-04-10 01:58:51', '4', '2', 'Summer', '2023'),
(61, '2023-04-10 04:12:33', '4', '2', 'Summer', '2023'),
(62, '2023-04-10 04:13:31', '4', '2', 'Summer', '2023'),
(63, '2023-04-10 04:16:12', '4', '2', 'Summer', '2023'),
(64, '2023-04-10 04:16:25', '4', '2', 'Summer', '2023'),
(65, '2023-04-10 04:16:42', '4', '2', 'Summer', '2023'),
(66, '2023-04-10 04:16:50', '4', '2', 'Summer', '2023'),
(67, '2023-04-10 04:17:03', '4', '2', 'Summer', '2023'),
(68, '2023-04-10 04:42:18', '4', '2', 'Summer', '2023'),
(69, '2023-04-10 07:14:31', '4', '2', 'Summer', '2023'),
(70, '2023-04-10 07:29:30', '4', '2', 'Summer', '2023'),
(71, '2023-04-10 09:10:49', '4', '2', 'Summer', '2023'),
(72, '2023-04-10 10:17:33', '4', '2', 'Summer', '2023'),
(73, '2023-04-10 11:51:47', '4', '2', 'Summer', '2023'),
(74, '2023-04-10 12:36:11', '4', '2', 'Summer', '2023'),
(75, '2023-04-10 12:37:12', '4', '2', 'Summer', '2023'),
(76, '2023-04-11 00:02:02', '4', '2', 'Summer', '2023');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_size_unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_image` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no_img_avaliable.jpg',
  `product_createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `product_updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `product_deletedAt` timestamp(6) NULL DEFAULT NULL,
  `categoryId` int(11) NOT NULL,
  `categoryCategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_type`, `product_size`, `product_size_unit`, `product_price`, `product_image`, `product_createdAt`, `product_updatedAt`, `product_deletedAt`, `categoryId`, `categoryCategoryId`) VALUES
(24, 'Latte', 'Coffee', '8', 'Oz.', 40, '1e5c9675-acef-4a1f-b346-549278c618ce.png', '2023-03-23 05:36:37.701641', '2023-04-05 21:43:42.000000', NULL, 1, 1),
(25, 'Cappuccino', 'Coffee', '8', 'Oz.', 40, '2ae9b2df-109e-4eaa-81df-6db6f98e7a80.png', '2023-03-23 05:36:37.701641', '2023-04-05 21:08:59.000000', NULL, 1, 1),
(26, 'Espresso', 'Coffee', '8', 'Oz.', 40, '611c2276-c47e-4fda-bcbb-28eaafc9e13f.png', '2023-03-23 05:36:37.701641', '2023-04-08 08:28:43.000000', NULL, 1, 1),
(27, 'Mocha', 'Coffee', '8', 'Oz.', 40, '6687a8a8-1cb8-4a11-a426-4e42839ebab3.png', '2023-03-23 05:36:37.701641', '2023-04-08 07:42:43.000000', NULL, 1, 1),
(28, 'Americano', 'Coffee', '8', 'Oz.', 40, '5a65b120-aad3-4ac7-9a1f-3aee01c13baa.png', '2023-04-08 08:29:22.551524', '2023-04-08 08:33:32.430689', NULL, 1, 1),
(29, 'Caramel Latta', 'Coffee', '8', 'Oz.', 40, 'a58575ba-23e2-4fd6-b393-fd6b9120b77d.png', '2023-03-23 05:36:37.701641', '2023-04-08 08:47:44.269319', NULL, 1, 1),
(30, 'Matcha latte', 'Coffee', '8', 'Oz.', 40, 'e90af5d4-93cd-49ea-9c84-0950e25b2d59.png', '2023-04-05 19:40:29.360699', '2023-04-08 08:45:28.106175', NULL, 1, 1),
(31, 'Milk', 'Milk', '8', 'Oz.', 35, 'da9e02cd-aa4d-4556-bf63-4afb1cfe05f5.png', '2023-04-08 07:59:34.340481', '2023-04-08 08:45:11.368354', NULL, 1, 1),
(32, 'Strawberry soda', 'Soda Drink', '8', 'Oz.', 40, '3726b865-b012-45cf-8eff-024b34931411.png', '2023-03-23 05:36:37.701641', '2023-04-08 08:37:42.000000', '2023-04-08 08:37:42.000000', 1, 1),
(33, 'Strawberry Cake', 'Cake', '1', 'Piece', 50, 'dfa6b718-6e56-4ea0-8be9-e07312e0606e.png', '2023-03-23 05:36:37.701641', '2023-04-08 13:38:09.000000', NULL, 2, 1),
(34, 'Chocolate Cake', 'Cake', '1', 'Piece', 50, '46bad87c-97c4-4e57-a227-ef600674ca0a.png', '2023-03-23 05:36:37.701641', '2023-04-08 13:37:54.000000', NULL, 2, 2),
(36, 'Cheese Cake', 'Cake', '1', 'Piece', 50, '18baab92-8248-418b-8fb3-bae11a404ded.png', '2023-03-23 05:36:37.701641', '2023-04-08 13:37:18.000000', NULL, 2, 2),
(37, 'Strawberry Cheese Cake', 'Cake', '1', 'Piece', 50, '9cdbe0b1-8aea-49a1-9c71-c73170d2956a.png', '2023-03-23 05:36:37.701641', '2023-04-09 11:17:32.314445', NULL, 2, 2),
(38, 'Lamon Cake', 'Cookie', '1', 'Piece', 50, '26a885ed-8679-464b-bd8f-b2d53a174cd8.png', '2023-03-23 05:36:37.701641', '2023-04-08 13:38:01.000000', NULL, 2, 1),
(39, 'Castella Cake', 'ฺBread', '1', 'Piece', 40, '52ba4d49-ede5-480f-b2a7-12692e01ffa3.png', '2023-03-23 05:36:37.701641', '2023-04-08 13:37:15.000000', NULL, 2, 1),
(43, 'Pad Krapow', 'Thai Food', '1', 'Plate', 50, '6de662b7-381a-4dc3-8b96-864347fef1a7.png', '2023-03-23 05:36:37.701641', '2023-04-08 14:10:43.000000', NULL, 3, 3),
(44, 'Fried Rice', 'Thai Food', '1', 'Plate', 50, '15994c1a-043b-4627-814e-64497dfc6087.png', '2023-03-23 05:36:37.701641', '2023-04-08 14:11:57.000000', NULL, 3, 3),
(45, 'American Fried Rice', 'Thai Food', '1', 'Plate', 40, 'ab5527fe-6aea-4546-9618-a5c75cbc3367.png', '2023-03-23 05:36:37.701641', '2023-04-08 14:43:53.000000', NULL, 3, 3),
(46, 'Pad Thai', 'Thai Food', '1', 'Plate', 50, 'd75dd519-de8d-4a1f-b80f-9a3b9d182a24.png', '2023-03-23 05:36:37.701641', '2023-04-08 14:40:11.000000', NULL, 3, 3),
(50, 'Cola', 'Soda Drink', '8', 'Oz.', 30, 'bc0c2bc1-c182-45d6-b58a-32fb7ad7456c.png', '2023-03-23 05:36:37.701641', '2023-04-08 08:37:36.000000', '2023-04-08 08:37:36.000000', 1, 1),
(52, 'Choco', 'Milk', '8', 'Oz.', 40, '1f11bf11-488b-4b3a-9811-e34145c05cfb.png', '2023-03-23 05:36:37.701641', '2023-04-08 08:47:24.000000', NULL, 1, 1),
(53, 'Blueberry Cupcake', 'Cake', '1', 'Piece', 40, '301f67fb-8749-44e9-abb2-0602f01c4784.png', '2023-03-23 05:36:37.701641', '2023-04-08 13:37:11.000000', NULL, 2, 2),
(54, 'Caramel Cocoa', 'Milk', '8', 'Oz.', 40, '7bb08ccd-3274-4d8c-8c08-e41bef481b18.png', '2023-04-08 08:05:35.087162', '2023-04-08 08:06:20.000000', NULL, 1, 1),
(55, 'Caramel Milk', 'Milk', '8', 'Oz.', 40, 'bcd4419e-4b80-4994-aba4-5ee209243a49.png', '2023-04-08 08:20:06.434883', '2023-04-08 08:26:34.893189', NULL, 1, 1),
(56, 'Plink Milk', 'Milk', '8', 'Oz.', 40, '14a196fa-941d-4d46-b84b-9aac84f77ea7.png', '2023-04-08 08:23:35.137392', '2023-04-08 08:23:35.137392', NULL, 1, 1),
(57, 'Black Tea', 'Tea', '8', 'Oz.', 40, 'd94a6e76-71f5-484d-b468-3eb6430030d6.png', '2023-04-08 08:26:12.392826', '2023-04-08 08:27:14.396658', NULL, 1, 1),
(63, 'Green Tea', 'Tea', '8', 'Oz.', 40, '402db01d-aa5a-4940-ba2d-35f1c77cd571.png', '2023-04-08 08:57:48.703546', '2023-04-08 08:57:48.703546', NULL, 1, 1),
(64, 'Taiwanese tea', 'Tea', '8', 'Oz.', 40, '9445ff63-8075-4872-86cd-6b428ac129f7.png', '2023-04-08 08:59:45.175682', '2023-04-08 08:59:45.175682', NULL, 1, 1),
(65, 'Thai Tea', 'Tea', '8', 'Oz.', 40, '8c3ad22e-05e1-499e-8e53-ffd1372cda74.png', '2023-04-08 09:40:31.310647', '2023-04-08 09:40:31.310647', NULL, 1, 1),
(66, 'Lime Tea', 'Tea', '8', 'Oz.', 40, 'eb654fc2-077d-4699-9f28-36cde2038239.png', '2023-04-08 09:41:25.420316', '2023-04-08 09:41:25.420316', NULL, 1, 1),
(67, 'Strawberrty tea', 'Tea', '8', 'Oz.', 40, 'f21438b1-59f7-4b75-bea9-935517cc314b.png', '2023-04-08 09:41:56.795128', '2023-04-08 09:41:56.795128', NULL, 1, 1),
(68, 'Lychee tea', 'Tea', '8', 'Oz.', 40, 'ec5a38f4-6e9f-4c2d-b0cd-5473710c0378.png', '2023-04-08 09:48:01.484806', '2023-04-08 09:48:01.484806', NULL, 1, 1),
(88, 'Cola', 'Soda Drink', '8', 'Oz.', 30, 'dc8d5d41-9d56-4014-a5d0-6741fca80ad2.png', '2023-04-08 10:15:20.176036', '2023-04-08 10:15:20.176036', NULL, 1, 1),
(89, 'Limenade soda', 'Soda Drink', '1', 'Oz.', 30, '26ca36fa-b460-4827-867b-5a65be596e26.png', '2023-04-08 10:16:02.577813', '2023-04-08 16:06:08.000000', NULL, 1, 1),
(90, 'Lychee soda', 'Soda Drink', '8', 'Oz.', 30, '4ade907b-2450-4888-8df4-210a89f72a57.png', '2023-04-08 10:16:42.006158', '2023-04-08 10:16:42.006158', NULL, 1, 1),
(91, 'Strawberry soda', 'Soda Drink', '8', 'Oz.', 30, '4c920405-621d-4e04-8e77-058611140768.png', '2023-04-08 10:17:20.401544', '2023-04-08 10:17:20.401544', NULL, 1, 1),
(92, 'Sala soda', 'Soda Drink', '8', 'Oz.', 30, '258de2a3-e61f-4b28-a97d-65c34816f4a1.png', '2023-04-08 10:17:50.466026', '2023-04-08 10:19:08.640126', NULL, 1, 1),
(93, 'Strawberry Cupcake', 'Cake', '1', 'Piece', 40, '898c0317-a3bf-4292-b904-e7c677e9e4d5.png', '2023-04-08 13:34:49.578908', '2023-04-08 13:38:16.000000', NULL, 2, 2),
(94, 'Croissant', 'Bread', '1', 'Piece', 40, '5af660a5-e14c-40ea-8e44-9c52b4591bf5.png', '2023-04-08 13:36:24.333043', '2023-04-08 13:36:24.333043', NULL, 2, 2),
(95, 'Pretzel', 'Bread', '1', 'Piece', 40, '3be6f62c-caa8-4b18-b301-d19409405c0f.png', '2023-04-08 13:39:19.285837', '2023-04-08 13:41:24.000000', NULL, 2, 2),
(96, ' Chocolate Chip Cookie', 'Cookie', '1', 'Piece', 30, '55c1079c-4548-4e2f-83f7-0608ada7f216.png', '2023-04-08 13:40:53.741965', '2023-04-08 13:41:39.000000', NULL, 2, 2),
(97, 'Shrimp Pasta', 'Italian Food', '1', 'Plate', 60, '97bbfe20-4ede-4e9b-bf64-dcf2e358b4bc.png', '2023-04-08 14:41:16.302085', '2023-04-08 14:41:58.000000', NULL, 3, 1),
(98, 'Spaghetti Red Sauce', 'Italian Food', '1', 'Plate', 60, 'c0369ef0-7829-46d3-aa4f-0a1eee5bfcfb.png', '2023-04-08 14:44:26.550332', '2023-04-08 14:48:23.000000', NULL, 3, 1),
(99, 'Macaroni', 'Italian Food', '1', 'Plate', 60, 'e843afdb-5468-45f5-9128-06ba0821c681.png', '2023-04-08 14:45:35.821012', '2023-04-08 14:45:35.821012', NULL, 3, 3),
(100, 'Breakfast', 'Italian Food', '1', 'Plate', 50, '65b2bd24-c719-4e47-9b4a-35d385c13a89.png', '2023-04-08 14:47:03.034875', '2023-04-08 14:47:03.034875', NULL, 3, 3),
(101, 'Spaghetti carbonara', 'Italian Food', '1', 'Plate', 60, '515492bb-f79b-4863-89a3-56e3a49c840f.png', '2023-04-08 14:49:57.524382', '2023-04-08 14:54:27.000000', NULL, 3, 1),
(102, 'Tonkatsu', 'Japanese Food', '1', 'Plate', 60, '4ba27a88-63f3-45e5-84a9-fde05e915d70.png', '2023-04-08 14:50:58.527564', '2023-04-08 14:51:49.000000', NULL, 3, 1),
(103, 'Onikiri', 'Japanese', '1', 'Piece', 30, '72a2536b-a593-4558-bb6a-faa5bdc90a70.png', '2023-04-08 14:52:42.457495', '2023-04-08 14:52:42.457495', NULL, 3, 3),
(104, 'Japanese Curry Rice', 'Japanese Food', '1', 'Plate', 60, '124e13c2-906b-4a02-9802-09e4f8f880ba.png', '2023-04-08 14:53:55.913258', '2023-04-08 14:53:55.913258', NULL, 3, 3);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `delProductDw` AFTER DELETE ON `product` FOR EACH ROW BEGIN
    DELETE FROM ProductDw WHERE product_id = OLD.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delProductdw` AFTER DELETE ON `product` FOR EACH ROW BEGIN
    DELETE FROM ProductDw WHERE Product_id = OLD.Product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insProductdw` AFTER INSERT ON `product` FOR EACH ROW BEGIN
    INSERT INTO ProductDw (
        Product_id,
        Product_name,
        Product_category,
        Product_type,
        Product_size,
        Product_size_unit,
        Product_price
    )
    SELECT
        product.product_id AS product_id,
        product.product_name AS product_name,
        category.category_name AS product_category,
        product.product_type AS product_type,
        product.product_size AS product_size,
        product.product_size_unit AS product_size_unit,
        product.product_price AS product_price
    FROM
        product
    INNER JOIN category ON product.categoryCategoryId = category.category_id
    WHERE
        product.product_id = NEW.product_id
        AND NOT EXISTS (
            SELECT *
            FROM ProductDw
            WHERE product_id = NEW.product_id
        );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updProductdw` AFTER UPDATE ON `product` FOR EACH ROW BEGIN
    UPDATE ProductDw 
    SET 
        Product_name = NEW.product_name,
        Product_category = (SELECT category_name FROM category WHERE category_id = NEW.categoryCategoryId),
        Product_type = NEW.product_type,
        Product_size = NEW.product_size,
        Product_size_unit = NEW.product_size_unit,
        Product_price = NEW.product_price
    WHERE 
        Product_id = NEW.product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ProductDw`
--

CREATE TABLE `ProductDw` (
  `Product_id` int(11) NOT NULL,
  `Product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Product_category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Product_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Product_size` smallint(6) NOT NULL,
  `Product_size_unit` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Product_price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ProductDw`
--

INSERT INTO `ProductDw` (`Product_id`, `Product_name`, `Product_category`, `Product_type`, `Product_size`, `Product_size_unit`, `Product_price`) VALUES
(24, 'Latte', 'Drink', 'Coffee', 8, 'Oz.', '40.00'),
(25, 'Cappuccino', 'Drink', 'Coffee', 8, 'Oz.', '40.00'),
(26, 'Espresso', 'Drink', 'Coffee', 8, 'Oz.', '40.00'),
(27, 'Mocha', 'Drink', 'Coffee', 8, 'Oz.', '40.00'),
(28, 'Americano', 'Drink', 'Coffee', 8, 'Oz.', '40.00'),
(29, 'Caramel Latta', 'Drink', 'Coffee', 8, 'Oz.', '40.00'),
(30, 'Matcha latte', 'Drink', 'Coffee', 8, 'Oz.', '40.00'),
(31, 'Milk', 'Drink', 'Milk', 8, 'Oz.', '35.00'),
(32, 'Strawberry soda', 'Drink', 'Soda Drink', 8, 'Oz.', '40.00'),
(33, 'Strawberry Cake', 'Bakery', 'Cake', 1, 'Piece', '50.00'),
(34, 'Chocolate Cake', 'Bakery', 'Cake', 1, 'Piece', '50.00'),
(36, 'Cheese Cake', 'Bakery', 'Cake', 1, 'Piece', '50.00'),
(37, 'Strawberry Cheese Cake', 'Bakery', 'Cake', 1, 'Piece', '50.00'),
(38, 'Lamon Cake', 'Bakery', 'Cookie', 1, 'Piece', '50.00'),
(39, 'Castella Cake', 'Bakery', 'ฺBread', 1, 'Piece', '40.00'),
(43, 'Pad Krapow', 'Food', 'Thai Food', 1, 'Plate', '50.00'),
(44, 'Fried Rice', 'Food', 'Thai Food', 1, 'Plate', '50.00'),
(45, 'American Fried Rice', 'Food', 'Thai Food', 1, 'Plate', '40.00'),
(46, 'Pad Thai', 'Food', 'Thai Food', 1, 'Plate', '50.00'),
(50, 'Cola', 'Drink', 'Soda Drink', 8, 'Oz.', '30.00'),
(52, 'Choco', 'Drink', 'Milk', 8, 'Oz.', '40.00'),
(53, 'Blueberry Cupcake', 'Bakery', 'Cake', 1, 'Piece', '40.00'),
(54, 'Caramel Cocoa', 'Drink', 'Milk', 8, 'Oz.', '40.00'),
(55, 'Caramel Milk', 'Drink', 'Milk', 8, 'Oz.', '40.00'),
(56, 'Plink Milk', 'Drink', 'Milk', 8, 'Oz.', '40.00'),
(57, 'Black Tea', 'Drink', 'Tea', 8, 'Oz.', '40.00'),
(63, 'Green Tea', 'Drink', 'Tea', 8, 'Oz.', '40.00'),
(64, 'Taiwanese tea', 'Drink', 'Tea', 8, 'Oz.', '40.00'),
(88, 'Cola', 'Drink', 'Soda Drink', 8, 'Oz.', '30.00'),
(89, 'Limenade soda', 'Drink', 'Soda Drink', 1, 'Oz.', '30.00'),
(90, 'Lychee soda', 'Drink', 'Soda Drink', 8, 'Oz.', '30.00'),
(91, 'Strawberry soda', 'Drink', 'Soda Drink', 8, 'Oz.', '30.00'),
(92, 'Sala soda', 'Drink', 'Soda Drink', 8, 'Oz.', '30.00'),
(93, 'Strawberry Cupcake', 'Bakery', 'Cake', 1, 'Piece', '40.00'),
(94, 'Croissant', 'Bakery', 'Bread', 1, 'Piece', '40.00'),
(95, 'Pretzel', 'Bakery', 'Bread', 1, 'Piece', '40.00'),
(96, ' Chocolate Chip Cookie', 'Bakery', 'Cookie', 1, 'Piece', '30.00'),
(97, 'Shrimp Pasta', 'Drink', 'Italian Food', 1, 'Plate', '60.00'),
(98, 'Spaghetti Red Sauce', 'Drink', 'Italian Food', 1, 'Plate', '60.00'),
(99, 'Macaroni', 'Food', 'Italian Food', 1, 'Plate', '60.00'),
(100, 'Breakfast', 'Food', 'Italian Food', 1, 'Plate', '50.00'),
(101, 'Spaghetti carbonara', 'Drink', 'Italian Food', 1, 'Plate', '60.00'),
(102, 'Tonkatsu', 'Food', 'Japanese Food', 1, 'Plate', '60.00'),
(103, 'Onikiri', 'Food', 'Japanese', 1, 'Piece', '30.00'),
(104, 'Japanese Curry Rice', 'Food', 'Japanese Food', 1, 'Plate', '60.00');

-- --------------------------------------------------------

--
-- Table structure for table `reciept`
--

CREATE TABLE `reciept` (
  `rec_id` int(11) NOT NULL,
  `rec_queue` int(11) NOT NULL,
  `rec_time` int(11) NOT NULL,
  `rec_discount` int(11) NOT NULL DEFAULT '0',
  `rec_total` int(11) NOT NULL,
  `rec_received` int(11) NOT NULL,
  `rec_changed` int(11) NOT NULL,
  `rec_payment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rec_createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `rec_updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `rec_deletedAt` timestamp(6) NULL DEFAULT NULL,
  `storeStoreId` int(11) DEFAULT NULL,
  `customerCustomerId` int(11) DEFAULT NULL,
  `employeeEmployeeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reciept`
--

INSERT INTO `reciept` (`rec_id`, `rec_queue`, `rec_time`, `rec_discount`, `rec_total`, `rec_received`, `rec_changed`, `rec_payment`, `rec_createdAt`, `rec_updatedAt`, `rec_deletedAt`, `storeStoreId`, `customerCustomerId`, `employeeEmployeeId`) VALUES
(14, 1, 15, 0, 35, 50, 15, 'Cash', '2023-04-03 09:11:03.160897', '2023-04-03 09:11:47.257002', NULL, 1, 5, 1),
(15, 1, 15, 0, 225, 500, 275, 'Cash', '2023-04-03 09:47:26.092389', '2023-04-03 10:11:45.413605', NULL, 1, 5, 1),
(18, 1, 15, 0, 16, 20, 4, 'Cash', '2023-04-04 04:38:30.726679', '2023-04-04 04:38:30.000000', NULL, 1, NULL, 1),
(19, 1, 15, 0, 110, 200, 90, 'Cash', '2023-04-04 06:06:09.883478', '2023-04-04 06:06:09.883478', NULL, 1, 5, 1),
(20, 1, 15, 0, 215, 250, 35, 'Cash', '2023-04-05 06:15:18.086834', '2023-04-05 06:15:18.086834', NULL, 1, 5, 1),
(21, 1, 15, 10, 30, 40, 10, 'Cash', '2023-04-05 07:21:39.562522', '2023-04-05 07:21:39.562522', NULL, 1, 3, 1),
(22, 1, 15, 30, 30, 40, 10, 'Cash', '2023-04-06 07:59:18.989651', '2023-04-06 07:59:18.989651', NULL, 1, 3, 1),
(23, 1, 15, 60, 20, 50, 30, 'Cash', '2023-04-06 08:01:20.229712', '2023-04-06 08:01:20.229712', NULL, 1, 3, 1),
(24, 1, 15, 60, 60, 100, 40, 'Cash', '2023-04-07 08:02:54.983849', '2023-04-07 08:02:54.983849', NULL, 1, 3, 1),
(25, 1, 15, 0, 190, 200, 10, 'Cash', '2023-04-07 08:03:38.723508', '2023-04-07 08:03:38.000000', NULL, 1, NULL, 1),
(26, 1, 15, 60, 90, 100, 10, 'Cash', '2023-04-07 08:05:00.532408', '2023-04-07 08:05:00.532408', NULL, 1, 3, 1),
(27, 1, 15, 0, 50, 100, 50, 'Cash', '2023-04-08 08:14:18.664857', '2023-04-08 08:14:18.000000', NULL, 1, NULL, 1),
(28, 1, 15, 0, 30, 40, 10, 'Cash', '2023-04-08 08:15:28.727078', '2023-04-08 08:15:28.000000', NULL, 1, NULL, 1),
(29, 1, 15, 30, 90, 100, 10, 'Cash', '2023-04-08 08:16:02.526717', '2023-04-08 08:16:02.526717', NULL, 1, 3, 1),
(30, 1, 15, 0, 50, 50, 0, 'Cash', '2023-04-08 08:18:18.883361', '2023-04-08 08:18:18.883361', NULL, 1, 2, 1),
(31, 1, 15, 30, 50, 100, 50, 'Cash', '2023-04-08 08:34:36.922018', '2023-04-08 08:34:36.922018', NULL, 1, 3, 1),
(32, 1, 15, 30, 90, 100, 10, 'Cash', '2023-04-08 08:35:35.420793', '2023-04-08 08:35:35.420793', NULL, 1, 3, 1),
(33, 1, 15, 0, 45, 50, 5, 'Cash', '2023-04-08 08:50:18.789184', '2023-04-08 08:50:18.789184', NULL, 1, 5, 1),
(34, 1, 15, 30, 10, 1000, 990, 'Cash', '2023-04-08 08:53:37.355718', '2023-04-08 08:53:37.355718', NULL, 1, 5, 1),
(35, 1, 15, 0, 40, 40, 0, 'Cash', '2023-04-08 08:55:29.381811', '2023-04-08 08:55:29.000000', NULL, 1, NULL, 1),
(36, 1, 15, 0, 40, 100, 60, 'Cash', '2023-04-08 09:13:48.504925', '2023-04-08 09:13:48.000000', NULL, 1, NULL, 1),
(37, 1, 15, 30, 10, 20, 10, 'Cash', '2023-04-08 12:38:34.138162', '2023-04-08 12:38:34.138162', NULL, 1, 5, 1),
(38, 1, 15, 0, 40, 981353460, 981353420, 'Cash', '2023-04-08 12:38:59.049205', '2023-04-08 12:38:59.000000', NULL, 1, NULL, 1),
(39, 1, 15, 0, 100, 100, 0, 'Cash', '2023-04-08 15:32:10.037108', '2023-04-08 15:32:10.000000', NULL, 1, NULL, 3),
(40, 1, 15, 0, 40, 40, 0, 'Cash', '2023-04-08 15:48:45.805227', '2023-04-08 15:48:45.000000', NULL, 1, NULL, 1),
(41, 1, 15, 0, 90, 100, 10, 'Cash', '2023-04-09 07:25:45.293432', '2023-04-09 07:25:46.000000', NULL, 1, NULL, 1),
(42, 1, 15, 0, 45, 45, 0, 'Cash', '2023-04-09 08:40:52.549359', '2023-04-09 08:40:52.549359', NULL, 1, 2, 11),
(43, 1, 15, 0, 90, 100, 10, 'Cash', '2023-04-09 08:41:32.019546', '2023-04-09 08:41:32.019546', NULL, 1, 2, 11),
(44, 1, 15, 0, 90, 200, 110, 'Cash', '2023-04-09 08:42:01.468984', '2023-04-09 08:42:01.468984', NULL, 1, 2, 11),
(45, 1, 15, 0, 40, 100, 60, 'Cash', '2023-04-09 08:58:25.746580', '2023-04-09 08:58:26.000000', NULL, 1, NULL, 7),
(46, 1, 15, 0, 45, 100, 55, 'Cash', '2023-04-09 11:39:30.348747', '2023-04-09 11:39:30.348747', NULL, 1, 2, 11),
(47, 1, 15, 0, 245, 300, 55, 'Cash', '2023-04-09 11:57:23.327263', '2023-04-09 11:57:23.000000', NULL, 1, NULL, 1),
(48, 1, 15, 0, 40, 50, 10, 'Cash', '2023-04-09 12:35:56.257865', '2023-04-09 12:35:56.000000', NULL, 1, NULL, 1),
(49, 1, 15, 0, 40, 50, 10, 'Cash', '2023-04-09 13:10:43.766140', '2023-04-09 13:10:43.766140', NULL, 1, 5, 7),
(50, 1, 15, 0, 40, 40, 0, 'Cash', '2023-04-09 13:14:29.157936', '2023-04-09 13:14:29.000000', NULL, 1, NULL, 7),
(51, 1, 15, 0, 40, 50, 10, 'Cash', '2023-04-09 13:15:59.076572', '2023-04-09 13:15:59.000000', NULL, 1, NULL, 7),
(52, 1, 15, 0, 45, 5000, 4955, 'Cash', '2023-04-09 13:19:47.895660', '2023-04-09 13:19:48.000000', NULL, 1, NULL, 7),
(53, 1, 15, 0, 40, 500, 460, 'Cash', '2023-04-09 14:45:21.822215', '2023-04-09 14:45:21.822215', NULL, 1, NULL, 7),
(54, 1, 15, 0, 40, 50, 10, 'Cash', '2023-04-09 14:45:49.277542', '2023-04-09 14:45:49.277542', NULL, 1, NULL, 7),
(55, 1, 15, 0, 80, 100, 20, 'Cash', '2023-04-09 14:47:31.803178', '2023-04-09 14:47:31.803178', NULL, 1, NULL, 7),
(56, 1, 15, 0, 40, 50, 10, 'Cash', '2023-04-09 14:47:44.882334', '2023-04-09 14:47:44.882334', NULL, 1, NULL, 7),
(57, 1, 15, 0, 40, 40, 0, 'Cash', '2023-04-09 14:48:36.769300', '2023-04-09 14:48:36.769300', NULL, 1, NULL, 7),
(58, 1, 15, 0, 40, 200, 160, 'Cash', '2023-04-09 14:49:10.275143', '2023-04-09 14:49:10.275143', NULL, 1, 5, 7),
(59, 1, 15, 0, 40, 40, 0, 'Cash', '2023-04-09 14:49:26.735531', '2023-04-09 14:49:26.735531', NULL, 1, NULL, 7),
(60, 1, 15, 0, 40, 40, 0, 'Cash', '2023-04-09 14:50:54.211145', '2023-04-09 14:50:54.000000', NULL, 1, NULL, 7),
(61, 1, 15, 0, 40, 50, 10, 'Cash', '2023-04-09 14:52:22.480683', '2023-04-09 14:52:23.000000', NULL, 1, NULL, 7),
(62, 1, 15, 0, 50, 50, 0, 'Cash', '2023-04-09 16:20:59.812771', '2023-04-09 16:20:59.812771', NULL, 1, 5, 7),
(63, 1, 15, 0, 255, 300, 45, 'Cash', '2023-04-09 16:29:15.576112', '2023-04-09 16:29:15.576112', NULL, 1, 2, 11),
(64, 1, 15, 0, 130, 150, 20, 'Cash', '2023-04-09 17:52:36.272625', '2023-04-09 17:52:37.000000', NULL, 1, NULL, 1),
(65, 1, 15, 0, 120, 150, 30, 'Cash', '2023-04-09 18:58:51.045051', '2023-04-09 18:58:51.000000', NULL, 1, NULL, 1),
(66, 1, 15, 0, 360, 400, 40, 'Cash', '2023-04-09 21:12:33.022382', '2023-04-09 21:12:34.000000', NULL, 1, NULL, 1),
(67, 1, 15, 0, 650, 1000, 350, 'Cash', '2023-04-09 21:13:30.906779', '2023-04-09 21:13:30.906779', NULL, 1, 5, 7),
(68, 1, 15, 0, 45, 45, 0, 'Cash', '2023-04-09 21:16:12.391719', '2023-04-09 21:16:12.000000', NULL, 1, NULL, 7),
(69, 1, 15, 0, 55, 70, 15, 'Cash', '2023-04-09 21:16:24.588959', '2023-04-09 21:16:25.000000', NULL, 1, NULL, 7),
(70, 1, 15, 0, 40, 40, 0, 'Cash', '2023-04-09 21:16:41.920624', '2023-04-09 21:16:42.000000', NULL, 1, NULL, 7),
(71, 1, 15, 0, 100, 200, 100, 'Cash', '2023-04-09 21:16:49.985277', '2023-04-09 21:16:50.000000', NULL, 1, NULL, 7),
(72, 1, 15, 0, 50, 50, 0, 'Cash', '2023-04-09 21:17:02.976669', '2023-04-09 21:17:03.000000', NULL, 1, NULL, 7),
(73, 1, 15, 0, 50, 500, 450, 'Cash', '2023-04-09 21:42:17.597092', '2023-04-09 21:42:18.000000', NULL, 1, NULL, 7),
(74, 1, 15, 0, 80, 100, 20, 'Cash', '2023-04-10 00:14:30.864376', '2023-04-10 00:14:31.000000', NULL, 1, NULL, 1),
(75, 1, 15, 30, 20, 20, 0, 'Cash', '2023-04-10 00:29:30.386855', '2023-04-10 00:29:30.386855', NULL, 1, 3, 1),
(76, 1, 15, 0, 40, 50, 10, 'Cash', '2023-04-10 02:10:49.486363', '2023-04-10 02:10:49.000000', NULL, 1, NULL, 7),
(77, 1, 15, 30, 370, 1000, 630, 'Cash', '2023-04-10 03:17:33.136273', '2023-04-10 03:17:33.136273', NULL, 1, 56, 8),
(78, 1, 15, 0, 195, 200, 5, 'Cash', '2023-04-10 04:51:46.863483', '2023-04-10 04:51:48.000000', NULL, 1, NULL, 7),
(79, 1, 15, 0, 165, 200, 35, 'Cash', '2023-04-10 05:36:10.793990', '2023-04-10 05:36:10.000000', NULL, 1, NULL, 7),
(80, 1, 15, 0, 100, 200, 100, 'Cash', '2023-04-10 05:37:11.701060', '2023-04-10 05:37:11.701060', NULL, 1, 5, 7),
(81, 1, 15, 0, 50, 100, 50, 'Cash', '2023-04-10 17:02:02.298189', '2023-04-10 17:02:02.000000', NULL, 1, NULL, 3);

--
-- Triggers `reciept`
--
DELIMITER $$
CREATE TRIGGER `insTimeDw` AFTER INSERT ON `reciept` FOR EACH ROW BEGIN
  INSERT INTO TimeDw (Time_original, Date, DayOfWeek, Weekend, Month, Quarter, Season, Year)
  SELECT DISTINCT
    CAST(NEW.rec_createdAt AS DATETIME),
    DAY(CAST(NEW.rec_createdAt AS DATE)),
    DAYNAME(CAST(NEW.rec_createdAt AS DATE)),
    CASE WHEN DAYOFWEEK(CAST(NEW.rec_createdAt AS DATE)) IN (1, 7) THEN 'Yes' ELSE 'No' END,
    MONTH(CAST(NEW.rec_createdAt AS DATE)),
    QUARTER(CAST(NEW.rec_createdAt AS DATE)),
    CASE WHEN MONTH(CAST(NEW.rec_createdAt AS DATE)) IN (2, 3, 4, 5) THEN 'Summer'
         WHEN MONTH(CAST(NEW.rec_createdAt AS DATE)) IN (6, 7, 8, 9) THEN 'Rainy'
         ELSE 'Winter' END,
    YEAR(CAST(NEW.rec_createdAt AS DATE))
  FROM reciept
  WHERE NOT EXISTS (SELECT * FROM TimeDw WHERE rec_id = NEW.rec_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reciept_detail`
--

CREATE TABLE `reciept_detail` (
  `rcd_id` int(11) NOT NULL,
  `rcd_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rcd_amount` int(11) NOT NULL,
  `rcd_price` int(11) NOT NULL,
  `rcd_total` int(11) NOT NULL,
  `rcd_createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `rcd_updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `rcd_deletedAt` datetime(6) DEFAULT NULL,
  `productsProductId` int(11) DEFAULT NULL,
  `recieptsRecId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reciept_detail`
--

INSERT INTO `reciept_detail` (`rcd_id`, `rcd_name`, `rcd_amount`, `rcd_price`, `rcd_total`, `rcd_createdAt`, `rcd_updatedAt`, `rcd_deletedAt`, `productsProductId`, `recieptsRecId`) VALUES
(1, 'ICED Espresso(12  Oz.) 125%', 1, 35, 35, '2023-04-03 16:11:03.193893', '2023-04-03 16:11:03.193893', NULL, 26, 14),
(2, 'Pig Pad Krapow(M) ', 2, 40, 80, '2023-04-03 16:47:26.115652', '2023-04-03 16:47:26.115652', NULL, 44, 15),
(4, 'Pig Pad Krapow(M) + Omelet', 1, 50, 50, '2023-04-03 16:47:26.156125', '2023-04-03 16:47:26.156125', NULL, 44, 15),
(5, 'Pig Pad Krapow(M) + Fried Egg', 1, 45, 45, '2023-04-03 16:47:26.179460', '2023-04-03 16:47:26.179460', NULL, 44, 15),
(6, 'Seafood Pad Krapow(M) ', 1, 50, 50, '2023-04-03 16:47:26.201516', '2023-04-03 16:47:26.201516', NULL, 44, 15),
(7, 'Iced Thai Tea(8  Oz.) 125%', 1, 16, 16, '2023-04-04 11:38:30.780974', '2023-04-04 11:38:30.780974', NULL, 29, 18),
(8, 'Iced Latte(16  Oz.) 50%', 1, 50, 50, '2023-04-04 13:06:09.979827', '2023-04-04 13:06:09.979827', NULL, 24, 19),
(10, 'Seafood Pad Krapow(L) + Fried Egg', 1, 60, 60, '2023-04-04 13:06:10.202267', '2023-04-04 13:06:10.202267', NULL, 44, 19),
(11, 'Iced Latte(12  Oz.) 100%', 1, 45, 45, '2023-04-05 13:15:18.164266', '2023-04-05 13:15:18.164266', NULL, 24, 20),
(12, 'Smoothie Strawberry soda(16  Oz.) 125%', 1, 55, 55, '2023-04-05 13:15:18.256926', '2023-04-05 13:15:18.256926', NULL, 32, 20),
(13, 'Chocolate Cake', 1, 50, 50, '2023-04-05 13:15:18.345802', '2023-04-05 13:15:18.345802', NULL, 37, 20),
(15, 'Seafood Pad Krapow(L) + Omelet', 1, 65, 65, '2023-04-05 13:15:18.552919', '2023-04-05 13:15:18.552919', NULL, 44, 20),
(16, 'Iced Cappuccino(8  Oz.) 125%', 1, 40, 40, '2023-04-05 14:21:39.644928', '2023-04-05 14:21:39.644928', NULL, 25, 21),
(17, 'Iced Espresso(8  Oz.) 100%', 2, 30, 60, '2023-04-06 14:59:19.085058', '2023-04-06 14:59:19.085058', NULL, 26, 22),
(18, 'Iced Matcha Latta(8  Oz.) 100%', 2, 40, 80, '2023-04-06 15:01:20.292129', '2023-04-06 15:01:20.292129', NULL, 29, 23),
(19, 'Iced Espresso(8  Oz.) 100%', 4, 30, 120, '2023-04-07 15:02:55.046381', '2023-04-07 15:02:55.046381', NULL, 26, 24),
(20, 'Smoothie Milk(16  Oz.) 125%', 1, 50, 50, '2023-04-07 15:03:38.780384', '2023-04-07 15:03:38.780384', NULL, 31, 25),
(21, 'Hot Milk(16  Oz.) 100%', 1, 40, 40, '2023-04-07 15:03:38.822963', '2023-04-07 15:03:38.822963', NULL, 31, 25),
(22, 'Hot Cocoa(8  Oz.) 100%', 1, 45, 45, '2023-04-07 15:03:38.863044', '2023-04-07 15:03:38.863044', NULL, 30, 25),
(23, 'Smoothie Cocoa(16  Oz.) 100%', 1, 55, 55, '2023-04-07 15:03:38.900115', '2023-04-07 15:03:38.900115', NULL, 30, 25),
(24, 'Iced Espresso(8  Oz.) 0%', 1, 30, 30, '2023-04-07 15:05:00.590578', '2023-04-07 15:05:00.590578', NULL, 26, 26),
(25, 'Iced Matcha Latta(8  Oz.) 125%', 3, 40, 120, '2023-04-07 15:05:00.647905', '2023-04-07 15:05:00.647905', NULL, 29, 26),
(26, 'Frappe Latte(12  Oz.) 50%', 1, 50, 50, '2023-04-08 15:14:18.720218', '2023-04-08 15:14:18.720218', NULL, 24, 27),
(27, 'Iced Espresso(8  Oz.) 100%', 1, 30, 30, '2023-04-08 15:15:28.767744', '2023-04-08 15:15:28.767744', NULL, 26, 28),
(28, 'Iced Espresso(16  Oz.) 125%', 3, 40, 120, '2023-04-08 15:16:02.591880', '2023-04-08 15:16:02.591880', NULL, 26, 29),
(29, 'Frappe Latte(12  Oz.) 50%', 1, 50, 50, '2023-04-08 15:18:18.986144', '2023-04-08 15:18:18.986144', NULL, 24, 30),
(30, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-08 15:34:36.977719', '2023-04-08 15:34:36.977719', NULL, 26, 31),
(31, 'Iced Matcha Latta(8  Oz.) 100%', 1, 40, 40, '2023-04-08 15:34:37.035573', '2023-04-08 15:34:37.035573', NULL, 29, 31),
(32, 'Iced Espresso(8  Oz.) 100%', 3, 40, 120, '2023-04-08 15:35:35.482591', '2023-04-08 15:35:35.482591', NULL, 26, 32),
(33, 'Iced Choco(8  Oz.) 25%', 1, 45, 45, '2023-04-08 15:50:18.866684', '2023-04-08 15:50:18.866684', NULL, 52, 33),
(34, 'Iced Choco(8  Oz.) 100%', 1, 40, 40, '2023-04-08 15:53:37.425866', '2023-04-08 15:53:37.425866', NULL, 52, 34),
(35, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-08 15:55:29.656459', '2023-04-08 15:55:29.656459', NULL, 26, 35),
(36, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-08 16:13:48.567660', '2023-04-08 16:13:48.567660', NULL, 26, 36),
(37, 'Iced Cappuccino(8  Oz.) 100%', 1, 40, 40, '2023-04-08 19:38:34.652075', '2023-04-08 19:38:34.652075', NULL, 25, 37),
(38, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-08 19:38:59.326797', '2023-04-08 19:38:59.326797', NULL, 26, 38),
(39, 'Frappe Espresso(12  Oz.) 100%', 2, 50, 100, '2023-04-08 22:32:10.288844', '2023-04-08 22:32:10.288844', NULL, 26, 39),
(40, 'Iced Latte(8  Oz.) 100%', 1, 40, 40, '2023-04-08 22:48:45.883341', '2023-04-08 22:48:45.883341', NULL, 24, 40),
(41, 'Pork American Fried Rice(M) ', 1, 40, 40, '2023-04-09 14:25:45.613052', '2023-04-09 14:25:45.613052', NULL, 45, 41),
(42, 'Pork Pad Thai(M) ', 1, 50, 50, '2023-04-09 14:25:45.930954', '2023-04-09 14:25:45.930954', NULL, 46, 41),
(43, 'Iced Latte(12  Oz.) 25%', 1, 45, 45, '2023-04-09 15:40:52.690368', '2023-04-09 15:40:52.690368', NULL, 24, 42),
(44, 'Iced Cappuccino(8  Oz.) 100%', 1, 45, 45, '2023-04-09 15:41:32.144806', '2023-04-09 15:41:32.144806', NULL, 25, 43),
(45, 'Iced Espresso(8  Oz.) 100%', 1, 45, 45, '2023-04-09 15:41:32.266316', '2023-04-09 15:41:32.266316', NULL, 26, 43),
(46, 'Iced Espresso(8  Oz.) 100%', 1, 45, 45, '2023-04-09 15:42:01.581515', '2023-04-09 15:42:01.581515', NULL, 26, 44),
(47, 'Iced Cappuccino(8  Oz.) 100%', 1, 45, 45, '2023-04-09 15:42:01.698578', '2023-04-09 15:42:01.698578', NULL, 25, 44),
(48, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 15:58:26.001098', '2023-04-09 15:58:26.001098', NULL, 26, 45),
(49, 'Iced Cappuccino(8  Oz.) 25%', 1, 45, 45, '2023-04-09 18:39:30.472293', '2023-04-09 18:39:30.472293', NULL, 25, 46),
(50, 'Iced Milk(8  Oz.) 100%', 7, 35, 245, '2023-04-09 18:57:23.641634', '2023-04-09 18:57:23.641634', NULL, 31, 47),
(51, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 19:35:56.515855', '2023-04-09 19:35:56.515855', NULL, 26, 48),
(52, 'Iced Latte(8  Oz.) 100%', 1, 40, 40, '2023-04-09 20:10:44.241754', '2023-04-09 20:10:44.241754', NULL, 24, 49),
(53, 'Iced Latte(8  Oz.) 100%', 1, 40, 40, '2023-04-09 20:14:29.411009', '2023-04-09 20:14:29.411009', NULL, 24, 50),
(54, 'Iced Latte(8  Oz.) 100%', 1, 40, 40, '2023-04-09 20:15:59.330804', '2023-04-09 20:15:59.330804', NULL, 24, 51),
(55, 'Hot Americano(16  Oz.) 50%', 1, 45, 45, '2023-04-09 20:19:48.153076', '2023-04-09 20:19:48.153076', NULL, 28, 52),
(56, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 21:45:22.111363', '2023-04-09 21:45:22.111363', NULL, 26, 53),
(57, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 21:45:49.529706', '2023-04-09 21:45:49.529706', NULL, 26, 54),
(58, 'Iced Espresso(8  Oz.) 100%', 2, 40, 80, '2023-04-09 21:47:32.058694', '2023-04-09 21:47:32.058694', NULL, 26, 55),
(59, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 21:47:45.153150', '2023-04-09 21:47:45.153150', NULL, 26, 56),
(60, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 21:48:37.048658', '2023-04-09 21:48:37.048658', NULL, 26, 57),
(61, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 21:49:10.770480', '2023-04-09 21:49:10.770480', NULL, 26, 58),
(62, 'Iced Cappuccino(8  Oz.) 100%', 1, 40, 40, '2023-04-09 21:49:27.002776', '2023-04-09 21:49:27.002776', NULL, 25, 59),
(63, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 21:50:54.472199', '2023-04-09 21:50:54.472199', NULL, 26, 60),
(64, 'Iced Espresso(8  Oz.) 100%', 1, 40, 40, '2023-04-09 21:52:22.736856', '2023-04-09 21:52:22.736856', NULL, 26, 61),
(65, 'Iced Cappuccino(16  Oz.) 125%', 1, 50, 50, '2023-04-09 23:21:00.335015', '2023-04-09 23:21:00.335015', NULL, 25, 62),
(66, 'Iced Latte(16  Oz.) 25%', 1, 50, 50, '2023-04-09 23:29:15.721948', '2023-04-09 23:29:15.721948', NULL, 24, 63),
(67, 'Croissant', 2, 40, 80, '2023-04-09 23:29:15.848420', '2023-04-09 23:29:15.848420', NULL, 94, 63),
(68, 'Strawberry Cheese Cake', 1, 50, 50, '2023-04-09 23:29:16.010392', '2023-04-09 23:29:16.010392', NULL, 37, 63),
(69, 'Seafood Pad Krapow(L) + Omelet', 1, 75, 75, '2023-04-09 23:29:16.170800', '2023-04-09 23:29:16.170800', NULL, 43, 63),
(70, 'Frappe Espresso(8  Oz.) 100%', 2, 45, 90, '2023-04-10 00:52:36.583737', '2023-04-10 00:52:36.583737', NULL, 26, 64),
(71, 'Iced Americano(8  Oz.) 100%', 1, 40, 40, '2023-04-10 00:52:36.889954', '2023-04-10 00:52:36.889954', NULL, 28, 64),
(72, 'Iced Espresso(8  Oz.) 125%', 2, 40, 80, '2023-04-10 01:58:51.390147', '2023-04-10 01:58:51.390147', NULL, 26, 65),
(73, 'Iced Americano(8  Oz.) 100%', 1, 40, 40, '2023-04-10 01:58:51.701437', '2023-04-10 01:58:51.701437', NULL, 28, 65),
(74, 'Pretzel', 3, 40, 120, '2023-04-10 04:12:33.332300', '2023-04-10 04:12:33.332300', NULL, 95, 66),
(75, ' Chocolate Chip Cookie', 4, 30, 120, '2023-04-10 04:12:33.636615', '2023-04-10 04:12:33.636615', NULL, 96, 66),
(76, 'Blueberry Cupcake', 3, 40, 120, '2023-04-10 04:12:33.937202', '2023-04-10 04:12:33.937202', NULL, 53, 66),
(77, 'Strawberry Cake', 2, 50, 100, '2023-04-10 04:13:31.411436', '2023-04-10 04:13:31.411436', NULL, 33, 67),
(78, 'Lamon Cake', 3, 50, 150, '2023-04-10 04:13:31.913169', '2023-04-10 04:13:31.913169', NULL, 38, 67),
(79, 'Castella Cake', 1, 40, 40, '2023-04-10 04:13:32.416422', '2023-04-10 04:13:32.416422', NULL, 39, 67),
(80, 'Cheese Cake', 4, 50, 200, '2023-04-10 04:13:32.911316', '2023-04-10 04:13:32.911316', NULL, 36, 67),
(81, 'Pork Fried Rice(M) ', 1, 50, 50, '2023-04-10 04:13:33.412582', '2023-04-10 04:13:33.412582', NULL, 44, 67),
(82, 'Breakfast', 1, 50, 50, '2023-04-10 04:13:33.923090', '2023-04-10 04:13:33.923090', NULL, 100, 67),
(83, 'Tonkatsu', 1, 60, 60, '2023-04-10 04:13:34.421686', '2023-04-10 04:13:34.421686', NULL, 102, 67),
(84, 'Smoothie Strawberry soda(16  Oz.) 125%', 1, 45, 45, '2023-04-10 04:16:12.664072', '2023-04-10 04:16:12.664072', NULL, 91, 68),
(85, 'Smoothie Green Tea(16  Oz.) 125%', 1, 55, 55, '2023-04-10 04:16:24.866911', '2023-04-10 04:16:24.866911', NULL, 63, 69),
(86, 'Strawberry Cupcake', 1, 40, 40, '2023-04-10 04:16:42.195941', '2023-04-10 04:16:42.195941', NULL, 93, 70),
(87, 'Strawberry Cake', 1, 50, 50, '2023-04-10 04:16:50.251566', '2023-04-10 04:16:50.251566', NULL, 33, 71),
(88, 'Cheese Cake', 1, 50, 50, '2023-04-10 04:16:50.519501', '2023-04-10 04:16:50.519501', NULL, 36, 71),
(89, 'Breakfast', 1, 50, 50, '2023-04-10 04:17:03.254545', '2023-04-10 04:17:03.254545', NULL, 100, 72),
(90, 'Frappe Latte(12  Oz.) 50%', 1, 50, 50, '2023-04-10 04:42:17.877998', '2023-04-10 04:42:17.877998', NULL, 24, 73),
(91, 'Iced Choco(8  Oz.) 50%', 1, 40, 40, '2023-04-10 07:14:31.197941', '2023-04-10 07:14:31.197941', NULL, 52, 74),
(92, 'Smoothie Milk(8  Oz.) 125%', 1, 40, 40, '2023-04-10 07:14:31.503599', '2023-04-10 07:14:31.503599', NULL, 31, 74),
(93, 'Iced Espresso(8  Oz.) 100%', 1, 50, 50, '2023-04-10 07:29:30.961558', '2023-04-10 07:29:30.961558', NULL, 26, 75),
(94, 'Iced Cappuccino(8  Oz.) 100%', 1, 40, 40, '2023-04-10 09:10:49.512201', '2023-04-10 09:10:49.512201', NULL, 25, 76),
(95, 'Iced Latte(8  Oz.) 100%', 10, 40, 400, '2023-04-10 10:17:33.273787', '2023-04-10 10:17:33.273787', NULL, 24, 77),
(96, 'Hot Cappuccino(8  Oz.) 50%', 2, 35, 70, '2023-04-10 11:51:47.108353', '2023-04-10 11:51:47.108353', NULL, 25, 78),
(97, 'Frappe Cappuccino(8  Oz.) 100%', 1, 45, 45, '2023-04-10 11:51:47.456091', '2023-04-10 11:51:47.456091', NULL, 25, 78),
(98, 'Hot Cappuccino(8  Oz.) 100%', 1, 35, 35, '2023-04-10 11:51:47.836569', '2023-04-10 11:51:47.836569', NULL, 25, 78),
(99, 'Hot Cappuccino(16  Oz.) 100%', 1, 45, 45, '2023-04-10 11:51:48.200200', '2023-04-10 11:51:48.200200', NULL, 25, 78),
(100, 'Hot Espresso(12  Oz.) 25%', 1, 40, 40, '2023-04-10 12:36:10.823661', '2023-04-10 12:36:10.823661', NULL, 26, 79),
(101, 'Chocolate Cake', 1, 50, 50, '2023-04-10 12:36:10.874460', '2023-04-10 12:36:10.874460', NULL, 34, 79),
(102, 'Seafood Fried Rice(L) + Omelet', 1, 75, 75, '2023-04-10 12:36:10.897312', '2023-04-10 12:36:10.897312', NULL, 44, 79),
(103, 'Pork American Fried Rice(M) ', 1, 45, 45, '2023-04-10 12:37:11.859960', '2023-04-10 12:37:11.859960', NULL, 45, 80),
(104, 'Pork Fried Rice(M) ', 1, 55, 55, '2023-04-10 12:37:11.950897', '2023-04-10 12:37:11.950897', NULL, 44, 80),
(105, 'Frappe Espresso(12  Oz.) 25%', 1, 50, 50, '2023-04-11 00:02:02.510649', '2023-04-11 00:02:02.510649', NULL, 26, 81);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reciept_view`
-- (See below for the actual view)
--
CREATE TABLE `reciept_view` (
`rec_id` int(11)
,`store_name` varchar(64)
,`employee_name` varchar(255)
,`customer_name` varchar(255)
,`rec_payment` varchar(255)
,`SUM(rec.rec_total)` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `ss_id` int(11) NOT NULL,
  `ss_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `ss_work_hour` int(11) NOT NULL,
  `ss_salary` int(11) NOT NULL,
  `updatedDate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedDate` timestamp(6) NULL DEFAULT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  `employeeEmployeeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`ss_id`, `ss_date`, `ss_work_hour`, `ss_salary`, `updatedDate`, `deletedDate`, `EmployeeId`, `employeeEmployeeId`) VALUES
(11, '2023-04-08 05:17:17.060093', 12, 480, '2023-04-08 17:51:10.448092', NULL, 1, 1),
(12, '2023-04-08 05:18:20.390512', 6, 240, '2023-04-08 17:51:12.264874', NULL, 1, 1),
(13, '2023-04-09 00:23:50.217404', 33, 1320, '2023-04-09 00:23:53.000000', NULL, 1, 1),
(14, '2023-04-09 00:32:23.398268', 35, 1400, '2023-04-09 00:32:24.000000', NULL, 1, 1),
(15, '2023-04-09 00:34:38.962170', 30, 1200, '2023-04-09 00:34:40.000000', NULL, 7, 7),
(16, '2023-04-09 00:37:29.354248', 11, 440, '2023-04-09 00:37:29.000000', NULL, 1, 1),
(17, '2023-04-09 00:47:40.875028', 10, 400, '2023-04-09 00:47:41.000000', NULL, 1, 1),
(18, '2023-04-09 00:48:48.863372', 10, 400, '2023-04-09 00:48:49.000000', NULL, 1, 1),
(19, '2023-04-09 00:50:02.508413', 10, 400, '2023-04-09 00:50:03.000000', NULL, 1, 1),
(20, '2023-04-09 00:56:25.155818', 10, 400, '2023-04-09 00:56:25.000000', NULL, 1, 1),
(21, '2023-04-09 04:13:57.500961', 7, 280, '2023-04-09 04:13:58.000000', NULL, 1, 1),
(22, '2023-04-09 04:17:00.120847', 14, 560, '2023-04-09 04:17:01.000000', NULL, 1, 1),
(23, '2023-04-09 04:21:39.584488', 7, 280, '2023-04-09 04:21:40.000000', NULL, 1, 1),
(24, '2023-04-09 08:59:21.775471', 6, 240, '2023-04-09 08:59:22.000000', NULL, 1, 1),
(25, '2023-04-09 09:23:28.914789', 8, 320, '2023-04-09 09:23:29.000000', NULL, 7, 7),
(26, '2023-04-09 10:04:04.458475', 3, 210, '2023-04-09 10:04:04.000000', NULL, 11, 11),
(27, '2023-04-09 10:43:18.666004', 0, 0, '2023-04-09 10:43:19.000000', NULL, 7, 7),
(28, '2023-04-09 10:45:38.264816', 0, 0, '2023-04-09 10:45:39.000000', NULL, 7, 7),
(29, '2023-04-09 23:08:29.483751', 14, 560, '2023-04-09 23:08:31.000000', NULL, 7, 7),
(30, '2023-04-09 23:08:57.092533', 23, 920, '2023-04-09 23:08:58.000000', NULL, 1, 1),
(31, '2023-04-09 23:10:59.175511', 13, 520, '2023-04-09 23:10:59.000000', NULL, 1, 1),
(32, '2023-04-10 00:01:56.652168', 12, 480, '2023-04-10 00:01:57.000000', NULL, 1, 1),
(33, '2023-04-10 03:22:11.168115', 43, 1720, '2023-04-10 03:22:11.000000', NULL, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `store_province` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `store_district` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `store_sub_district` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `store_tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_name`, `store_province`, `store_district`, `store_sub_district`, `store_tel`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'D-Coffee Burapa University', 'Chonburi', 'Mueang', 'Saensuk', '0821234567', '2023-04-07 02:21:25.795399', '2023-04-09 01:33:51.222481', NULL);

--
-- Triggers `store`
--
DELIMITER $$
CREATE TRIGGER `insStoreDw` AFTER INSERT ON `store` FOR EACH ROW BEGIN
    INSERT INTO StoreDw (
        Store_id,
        Store_name,
        Store_sub_district,
        Store_district,
        Store_province
    )
    SELECT
        store.store_id AS Store_id,
        store.store_name AS Store_name,
        store.store_sub_district AS Store_sub_district,
        store.store_district AS Store_district,
        store.store_province AS Store_province
    FROM
        store
    WHERE
        store.store_id = NEW.store_id
        AND NOT EXISTS (
            SELECT * FROM StoreDw WHERE Store_id = NEW.store_id
        );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `StoreDw`
--

CREATE TABLE `StoreDw` (
  `Store_id` int(11) NOT NULL,
  `Store_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Store_sub_district` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Store_district` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Store_province` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `StoreDw`
--

INSERT INTO `StoreDw` (`Store_id`, `Store_name`, `Store_sub_district`, `Store_district`, `Store_province`) VALUES
(1, 'D-Coffee Prachinburi', 'Noen Hom', 'Mueng Prachinburi', 'Prachinburi');

-- --------------------------------------------------------

--
-- Stand-in structure for view `store_info`
-- (See below for the actual view)
--
CREATE TABLE `store_info` (
`store_id` int(11)
,`store_name` varchar(64)
,`store_province` varchar(255)
,`store_district` varchar(255)
,`store_sub_district` varchar(255)
,`store_tel` varchar(10)
,`createdAt` timestamp(6)
,`updatedAt` timestamp(6)
,`deletedAt` timestamp(6)
);

-- --------------------------------------------------------

--
-- Table structure for table `TimeDw`
--

CREATE TABLE `TimeDw` (
  `Time_id` int(11) NOT NULL,
  `Time_original` datetime NOT NULL,
  `Date` int(11) NOT NULL,
  `DayOfWeek` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `Weekend` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `Month` int(11) NOT NULL,
  `Quarter` int(11) NOT NULL,
  `Season` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `TimeDw`
--

INSERT INTO `TimeDw` (`Time_id`, `Time_original`, `Date`, `DayOfWeek`, `Weekend`, `Month`, `Quarter`, `Season`, `Year`) VALUES
(1, '2023-04-03 16:11:03', 3, 'Monday', 'No', 4, 2, 'Summer', 2023),
(2, '2023-04-03 16:47:26', 3, 'Monday', 'No', 4, 2, 'Summer', 2023),
(5, '2023-04-04 11:38:31', 4, 'Tuesday', 'Yes', 4, 2, 'Summer', 2023),
(6, '2023-04-04 13:06:10', 4, 'Tuesday', 'Yes', 4, 2, 'Summer', 2023),
(7, '2023-04-05 13:15:18', 5, 'Wednesday', 'Yes', 4, 2, 'Summer', 2023),
(8, '2023-04-05 14:21:40', 5, 'Wednesday', 'Yes', 4, 2, 'Summer', 2023),
(9, '2023-04-06 14:59:19', 6, 'Thursday', 'Yes', 4, 2, 'Summer', 2023),
(10, '2023-04-06 15:01:20', 6, 'Thursday', 'Yes', 4, 2, 'Summer', 2023),
(11, '2023-04-07 15:02:55', 7, 'Friday', 'Yes', 4, 2, 'Summer', 2023),
(12, '2023-04-07 15:03:39', 7, 'Friday', 'Yes', 4, 2, 'Summer', 2023),
(13, '2023-04-07 15:05:01', 7, 'Friday', 'Yes', 4, 2, 'Summer', 2023),
(14, '2023-04-08 15:14:19', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(15, '2023-04-08 15:15:29', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(16, '2023-04-08 15:16:03', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(17, '2023-04-08 15:18:19', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(18, '2023-04-08 15:34:37', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(19, '2023-04-08 15:35:35', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(20, '2023-04-08 15:50:19', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(21, '2023-04-08 15:53:37', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(22, '2023-04-08 15:55:29', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(23, '2023-04-08 16:13:49', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(32, '2023-04-08 19:38:34', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(33, '2023-04-08 19:38:59', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(34, '2023-04-08 22:32:10', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(35, '2023-04-08 22:48:46', 8, 'Saturday', 'Yes', 4, 2, 'Summer', 2023),
(36, '2023-04-09 14:25:45', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(37, '2023-04-09 15:40:53', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(38, '2023-04-09 15:41:32', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(39, '2023-04-09 15:42:01', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(40, '2023-04-09 15:58:26', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(41, '2023-04-09 18:39:30', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(42, '2023-04-09 18:57:23', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(43, '2023-04-09 19:35:56', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(44, '2023-04-09 20:10:44', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(45, '2023-04-09 20:14:29', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(46, '2023-04-09 20:15:59', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(47, '2023-04-09 20:19:48', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(48, '2023-04-09 21:45:22', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(49, '2023-04-09 21:45:49', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(50, '2023-04-09 21:47:32', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(51, '2023-04-09 21:47:45', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(52, '2023-04-09 21:48:37', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(53, '2023-04-09 21:49:10', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(54, '2023-04-09 21:49:27', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(55, '2023-04-09 21:50:54', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(56, '2023-04-09 21:52:22', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(57, '2023-04-09 23:21:00', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(58, '2023-04-09 23:29:16', 9, 'Sunday', 'Yes', 4, 2, 'Summer', 2023),
(59, '2023-04-10 00:52:36', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(60, '2023-04-10 01:58:51', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(61, '2023-04-10 04:12:33', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(62, '2023-04-10 04:13:31', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(63, '2023-04-10 04:16:12', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(64, '2023-04-10 04:16:25', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(65, '2023-04-10 04:16:42', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(66, '2023-04-10 04:16:50', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(67, '2023-04-10 04:17:03', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(68, '2023-04-10 04:42:18', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(69, '2023-04-10 07:14:31', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(70, '2023-04-10 07:29:30', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(71, '2023-04-10 09:10:49', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(72, '2023-04-10 10:17:33', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(73, '2023-04-10 11:51:47', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(74, '2023-04-10 12:36:11', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(75, '2023-04-10 12:37:12', 10, 'Monday', 'No', 4, 2, 'Summer', 2023),
(76, '2023-04-11 00:02:02', 11, 'Tuesday', 'No', 4, 2, 'Summer', 2023);

--
-- Triggers `TimeDw`
--
DELIMITER $$
CREATE TRIGGER `insMonthDw` AFTER INSERT ON `TimeDw` FOR EACH ROW BEGIN
    INSERT INTO MonthDw (Time_original, Month, Quarter, Year, Season)
    SELECT DISTINCT 
        NEW.Time_original AS Time_original,
        MONTH(NEW.Time_original) AS Month,
        QUARTER(NEW.Time_original) AS Quarter,
        YEAR(NEW.Time_original) AS Year,
        CASE
            WHEN (MONTH(NEW.Time_original) BETWEEN 2 AND 5) THEN "Summer"
            WHEN (MONTH(NEW.Time_original) BETWEEN 6 AND 10) THEN "Rainy"
            ELSE "Winter"
        END AS Season
    FROM TimeDw
    WHERE NOT EXISTS (
        SELECT * FROM MonthDw WHERE MonthDw.Time_original = NEW.Time_original
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `reciept_view`
--
DROP TABLE IF EXISTS `reciept_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`guest01`@`%` SQL SECURITY DEFINER VIEW `reciept_view`  AS SELECT `rec`.`rec_id` AS `rec_id`, `store`.`store_name` AS `store_name`, `emp`.`employee_name` AS `employee_name`, `cus`.`customer_name` AS `customer_name`, `rec`.`rec_payment` AS `rec_payment`, sum(`rec`.`rec_total`) AS `SUM(rec.rec_total)` FROM (((`reciept` `rec` left join `store` on((`rec`.`storeStoreId` = `store`.`store_id`))) left join `customer` `cus` on((`rec`.`customerCustomerId` = `cus`.`customer_id`))) left join `employee` `emp` on((`rec`.`employeeEmployeeId` = `emp`.`employee_id`))) GROUP BY `rec`.`rec_id` ORDER BY `rec`.`rec_id` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `store_info`
--
DROP TABLE IF EXISTS `store_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`guest01`@`%` SQL SECURITY DEFINER VIEW `store_info`  AS SELECT `store`.`store_id` AS `store_id`, `store`.`store_name` AS `store_name`, `store`.`store_province` AS `store_province`, `store`.`store_district` AS `store_district`, `store`.`store_sub_district` AS `store_sub_district`, `store`.`store_tel` AS `store_tel`, `store`.`createdAt` AS `createdAt`, `store`.`updatedAt` AS `updatedAt`, `store`.`deletedAt` AS `deletedAt` FROM `store``store`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `FK_395f3b3a4d325a47819debecf34` (`employeeEmployeeId`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_detail_id`),
  ADD KEY `FK_77617f05d9b7f1368190c6b6e29` (`materialsMatId`),
  ADD KEY `FK_e572e41de51c9ddb40ab8ea9ce9` (`billBillId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `check_in_out`
--
ALTER TABLE `check_in_out`
  ADD PRIMARY KEY (`cio_id`),
  ADD KEY `FK_1067cfd3d0fd017fbff0d251b26` (`employeeEmployeeId`),
  ADD KEY `FK_b2e99cba27601ed9c0fb37eff73` (`salarySsId`);

--
-- Indexes for table `check_material`
--
ALTER TABLE `check_material`
  ADD PRIMARY KEY (`check_mat_id`),
  ADD KEY `FK_758289e9efffe5543f554de03a3` (`employeeEmployeeId`);

--
-- Indexes for table `check_material_detial`
--
ALTER TABLE `check_material_detial`
  ADD PRIMARY KEY (`cmd_id`),
  ADD KEY `FK_47a27c1b2280d34e0322564bc04` (`checkMaterialCheckMatId`),
  ADD KEY `FK_407a97314d12ef33b68fbab10d7` (`materialMatId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `IDX_f1b591aa5d700e49c1d0bbf486` (`customer_tel`);

--
-- Indexes for table `CustomerDw`
--
ALTER TABLE `CustomerDw`
  ADD PRIMARY KEY (`Customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `IDX_f1f1a8ff7c4e90ac37d480668b` (`employee_login`);

--
-- Indexes for table `EmployeeDw`
--
ALTER TABLE `EmployeeDw`
  ADD PRIMARY KEY (`Employee_id`);

--
-- Indexes for table `FactAgg`
--
ALTER TABLE `FactAgg`
  ADD PRIMARY KEY (`Fact_agg_id`),
  ADD UNIQUE KEY `const2` (`Month_id`,`Employee_id`,`Store_id`,`Customer_id`,`Product_id`),
  ADD KEY `Employee_id` (`Employee_id`),
  ADD KEY `Store_id` (`Store_id`),
  ADD KEY `Customer_id` (`Customer_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- Indexes for table `FactDw`
--
ALTER TABLE `FactDw`
  ADD PRIMARY KEY (`Fact_id`),
  ADD UNIQUE KEY `const` (`Time_id`,`Employee_id`,`Store_id`,`Customer_id`,`Product_id`),
  ADD KEY `Employee_id` (`Employee_id`),
  ADD KEY `Store_id` (`Store_id`),
  ADD KEY `Customer_id` (`Customer_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`mat_id`);

--
-- Indexes for table `MonthDw`
--
ALTER TABLE `MonthDw`
  ADD PRIMARY KEY (`Month_id`),
  ADD UNIQUE KEY `Time_original` (`Time_original`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK_8b4d0e2be5e945a828f313b4f30` (`categoryCategoryId`);

--
-- Indexes for table `ProductDw`
--
ALTER TABLE `ProductDw`
  ADD PRIMARY KEY (`Product_id`),
  ADD UNIQUE KEY `Product_id` (`Product_id`);

--
-- Indexes for table `reciept`
--
ALTER TABLE `reciept`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `FK_550849be97c4c2156753b0714bc` (`storeStoreId`),
  ADD KEY `FK_aab2983459ba49ab5719a03741f` (`customerCustomerId`),
  ADD KEY `FK_224631885e78f82d9ba46659d8a` (`employeeEmployeeId`);

--
-- Indexes for table `reciept_detail`
--
ALTER TABLE `reciept_detail`
  ADD PRIMARY KEY (`rcd_id`),
  ADD KEY `FK_3f9331b7809652197050c673725` (`productsProductId`),
  ADD KEY `FK_d042dd9634a2e9b7759ed1e2599` (`recieptsRecId`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`ss_id`),
  ADD KEY `FK_959f08518ab8867592c874c2dca` (`employeeEmployeeId`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `StoreDw`
--
ALTER TABLE `StoreDw`
  ADD PRIMARY KEY (`Store_id`);

--
-- Indexes for table `TimeDw`
--
ALTER TABLE `TimeDw`
  ADD PRIMARY KEY (`Time_id`),
  ADD UNIQUE KEY `Time_original` (`Time_original`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `bill_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `check_in_out`
--
ALTER TABLE `check_in_out`
  MODIFY `cio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `check_material`
--
ALTER TABLE `check_material`
  MODIFY `check_mat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `check_material_detial`
--
ALTER TABLE `check_material_detial`
  MODIFY `cmd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `FactAgg`
--
ALTER TABLE `FactAgg`
  MODIFY `Fact_agg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `FactDw`
--
ALTER TABLE `FactDw`
  MODIFY `Fact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `mat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `MonthDw`
--
ALTER TABLE `MonthDw`
  MODIFY `Month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `reciept`
--
ALTER TABLE `reciept`
  MODIFY `rec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `reciept_detail`
--
ALTER TABLE `reciept_detail`
  MODIFY `rcd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `ss_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `TimeDw`
--
ALTER TABLE `TimeDw`
  MODIFY `Time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_395f3b3a4d325a47819debecf34` FOREIGN KEY (`employeeEmployeeId`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `FK_77617f05d9b7f1368190c6b6e29` FOREIGN KEY (`materialsMatId`) REFERENCES `material` (`mat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e572e41de51c9ddb40ab8ea9ce9` FOREIGN KEY (`billBillId`) REFERENCES `bill` (`bill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `check_in_out`
--
ALTER TABLE `check_in_out`
  ADD CONSTRAINT `FK_1067cfd3d0fd017fbff0d251b26` FOREIGN KEY (`employeeEmployeeId`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b2e99cba27601ed9c0fb37eff73` FOREIGN KEY (`salarySsId`) REFERENCES `salary` (`ss_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `check_material`
--
ALTER TABLE `check_material`
  ADD CONSTRAINT `FK_758289e9efffe5543f554de03a3` FOREIGN KEY (`employeeEmployeeId`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `check_material_detial`
--
ALTER TABLE `check_material_detial`
  ADD CONSTRAINT `FK_407a97314d12ef33b68fbab10d7` FOREIGN KEY (`materialMatId`) REFERENCES `material` (`mat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_47a27c1b2280d34e0322564bc04` FOREIGN KEY (`checkMaterialCheckMatId`) REFERENCES `check_material` (`check_mat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `FactAgg`
--
ALTER TABLE `FactAgg`
  ADD CONSTRAINT `FactAgg_ibfk_1` FOREIGN KEY (`Month_id`) REFERENCES `MonthDw` (`Month_id`),
  ADD CONSTRAINT `FactAgg_ibfk_2` FOREIGN KEY (`Employee_id`) REFERENCES `EmployeeDw` (`Employee_id`),
  ADD CONSTRAINT `FactAgg_ibfk_3` FOREIGN KEY (`Store_id`) REFERENCES `StoreDw` (`Store_id`),
  ADD CONSTRAINT `FactAgg_ibfk_4` FOREIGN KEY (`Customer_id`) REFERENCES `CustomerDw` (`Customer_id`),
  ADD CONSTRAINT `FactAgg_ibfk_5` FOREIGN KEY (`Product_id`) REFERENCES `ProductDw` (`Product_id`);

--
-- Constraints for table `FactDw`
--
ALTER TABLE `FactDw`
  ADD CONSTRAINT `FactDw_ibfk_1` FOREIGN KEY (`Time_id`) REFERENCES `TimeDw` (`Time_id`),
  ADD CONSTRAINT `FactDw_ibfk_2` FOREIGN KEY (`Employee_id`) REFERENCES `EmployeeDw` (`Employee_id`),
  ADD CONSTRAINT `FactDw_ibfk_3` FOREIGN KEY (`Store_id`) REFERENCES `StoreDw` (`Store_id`),
  ADD CONSTRAINT `FactDw_ibfk_4` FOREIGN KEY (`Customer_id`) REFERENCES `CustomerDw` (`Customer_id`),
  ADD CONSTRAINT `FactDw_ibfk_5` FOREIGN KEY (`Product_id`) REFERENCES `ProductDw` (`Product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_8b4d0e2be5e945a828f313b4f30` FOREIGN KEY (`categoryCategoryId`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reciept`
--
ALTER TABLE `reciept`
  ADD CONSTRAINT `FK_224631885e78f82d9ba46659d8a` FOREIGN KEY (`employeeEmployeeId`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_550849be97c4c2156753b0714bc` FOREIGN KEY (`storeStoreId`) REFERENCES `store` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_aab2983459ba49ab5719a03741f` FOREIGN KEY (`customerCustomerId`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reciept_detail`
--
ALTER TABLE `reciept_detail`
  ADD CONSTRAINT `FK_3f9331b7809652197050c673725` FOREIGN KEY (`productsProductId`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d042dd9634a2e9b7759ed1e2599` FOREIGN KEY (`recieptsRecId`) REFERENCES `reciept` (`rec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `FK_959f08518ab8867592c874c2dca` FOREIGN KEY (`employeeEmployeeId`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
