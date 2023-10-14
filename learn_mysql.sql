-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27 يوليو 2023 الساعة 16:04
-- إصدار الخادم: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learn_mysql`
--

-- --------------------------------------------------------

--
-- بنية الجدول `card`
--

CREATE TABLE `card` (
  `users_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `card_idcard` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `card`
--

INSERT INTO `card` (`users_id`, `card_id`, `card_idcard`) VALUES
(5, 1, 23443224),
(7, 2, 1234565432),
(6, 3, 242575454);

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`) VALUES
(1, 'labtop'),
(2, 'mobile'),
(3, 'screen'),
(4, 'coffe'),
(5, 'OFFICE PROG'),
(6, 'SOFTWARE');

-- --------------------------------------------------------

--
-- بنية الجدول `datatype_float`
--

CREATE TABLE `datatype_float` (
  `decimal` decimal(10,0) NOT NULL,
  `float` float NOT NULL,
  `double` double NOT NULL,
  `real` double NOT NULL,
  `serial` bigint(20) UNSIGNED NOT NULL,
  `boolean` tinyint(1) NOT NULL,
  `bit` bit(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `datatype_float`
--

INSERT INTO `datatype_float` (`decimal`, `float`, `double`, `real`, `serial`, `boolean`, `bit`) VALUES
('2', 23322.4, 333.333, 33.3321, 1, 1, b'0111111111111111111111111111111111111111111111111111111111111111'),
('2', 23322.4, 333.333, 33.3321, 2, 1, b'0111111111111111111111111111111111111111111111111111111111111111');

-- --------------------------------------------------------

--
-- بنية الجدول `datatype_int`
--

CREATE TABLE `datatype_int` (
  `tinyint` tinyint(4) NOT NULL,
  `smallint` smallint(6) NOT NULL,
  `mediumint` mediumint(9) NOT NULL,
  `int` int(11) NOT NULL,
  `bigint` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `datatype_int`
--

INSERT INTO `datatype_int` (`tinyint`, `smallint`, `mediumint`, `int`, `bigint`) VALUES
(127, 0, 0, 0, 0),
(127, 32767, 8388607, 2147483647, 9223372036854775807),
(127, 32767, 8388607, 2147483647, 9223372036854775807),
(-128, -32768, -8388608, -2147483648, -9223372036854775808),
(-128, -32768, -8388608, -2147483648, -9223372036854775808);

-- --------------------------------------------------------

--
-- بنية الجدول `datatype_select`
--

CREATE TABLE `datatype_select` (
  `enum` enum('flutter','sql','php','getx') NOT NULL DEFAULT 'flutter',
  `set` set('flutter','getx','php','sql') NOT NULL DEFAULT 'flutter',
  `serial` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `datatype_text`
--

CREATE TABLE `datatype_text` (
  `serial` bigint(20) UNSIGNED NOT NULL,
  `char` char(100) NOT NULL,
  `varchar` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `datatype_text`
--

INSERT INTO `datatype_text` (`serial`, `char`, `varchar`, `text`) VALUES
(1, 'sskcaca', 'sxk asckakc sacac asklmcmc slc', 'sxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slcsxk asckakc sacac asklmcmc slc');

-- --------------------------------------------------------

--
-- بنية الجدول `datetimetype`
--

CREATE TABLE `datetimetype` (
  `serial` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `datetime` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `time` time NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `datetimetype`
--

INSERT INTO `datetimetype` (`serial`, `date`, `datetime`, `timestamp`, `time`, `year`) VALUES
(1, '2023-07-07', '2023-07-18 16:08:39', '2023-07-18 13:08:39', '16:08:39', 2009);

-- --------------------------------------------------------

--
-- بنية الجدول `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(100) NOT NULL,
  `items_catogeries` int(11) NOT NULL,
  `items_price` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_catogeries`, `items_price`) VALUES
(1, 's20', 2, 100),
(2, 'probook 6470b', 1, 1221),
(3, 'a20', 2, 3432),
(4, 'ice cofffe', 4, 3532),
(5, '200x200', 3, 3523),
(6, 'dell x2333', 1, 321),
(7, 'S20', 2, 0),
(8, 'S20', 2, 0),
(9, 'HHHH', 2, 0),
(10, 'S20A', 2, NULL),
(11, 'S20A', 2, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `itemsforahmed`
--

CREATE TABLE `itemsforahmed` (
  `i_id` int(11) NOT NULL,
  `i_price` float DEFAULT NULL,
  `i_categories` int(11) NOT NULL,
  `i_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemslabtop`
-- (See below for the actual view)
--
CREATE TABLE `itemslabtop` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_catogeries` int(11)
,`items_price` int(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsmobile`
-- (See below for the actual view)
--
CREATE TABLE `itemsmobile` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_catogeries` int(11)
,`items_price` int(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsmobile2`
-- (See below for the actual view)
--
CREATE TABLE `itemsmobile2` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_catogeries` int(11)
,`items_price` int(100)
);

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_users` int(11) NOT NULL,
  `orders_price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_users`, `orders_price`) VALUES
(3, 6, 2000),
(4, 6, 1323),
(8, 7, 4232),
(9, 5, 3422),
(10, 7, 414),
(11, 5, 233);

-- --------------------------------------------------------

--
-- بنية الجدول `ordersdetails`
--

CREATE TABLE `ordersdetails` (
  `ordersdetails_id` int(11) NOT NULL,
  `ordersdetails_orders` int(11) NOT NULL,
  `ordersdetails_items` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `ordersdetails`
--

INSERT INTO `ordersdetails` (`ordersdetails_id`, `ordersdetails_orders`, `ordersdetails_items`, `quantity`) VALUES
(3, 3, 5, 1),
(4, 3, 6, 2),
(5, 4, 3, 1),
(6, 4, 2, 2),
(7, 8, 1, 2),
(8, 8, 3, 1),
(9, 9, 3, 1),
(10, 10, 1, 2),
(11, 11, 5, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`users_id`, `users_username`, `password`, `age`) VALUES
(5, 'xcc', 'zcz', 22),
(6, 'ahmed', 'ahmed', 23),
(7, 'ali', 'ali', 33);

-- --------------------------------------------------------

--
-- Structure for view `itemslabtop`
--
DROP TABLE IF EXISTS `itemslabtop`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemslabtop`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_catogeries` AS `items_catogeries`, `items`.`items_price` AS `items_price` FROM `items` WHERE `items`.`items_catogeries` = 22  ;

-- --------------------------------------------------------

--
-- Structure for view `itemsmobile`
--
DROP TABLE IF EXISTS `itemsmobile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsmobile`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_catogeries` AS `items_catogeries`, `items`.`items_price` AS `items_price` FROM `items` WHERE `items`.`items_catogeries` = 22  ;

-- --------------------------------------------------------

--
-- Structure for view `itemsmobile2`
--
DROP TABLE IF EXISTS `itemsmobile2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsmobile2`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_catogeries` AS `items_catogeries`, `items`.`items_price` AS `items_price` FROM `items` WHERE `items`.`items_catogeries` = 11  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`),
  ADD UNIQUE KEY `users_id` (`users_id`),
  ADD UNIQUE KEY `card_idcard` (`card_idcard`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `datatype_float`
--
ALTER TABLE `datatype_float`
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Indexes for table `datatype_select`
--
ALTER TABLE `datatype_select`
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Indexes for table `datatype_text`
--
ALTER TABLE `datatype_text`
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Indexes for table `datetimetype`
--
ALTER TABLE `datetimetype`
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_catogeries` (`items_catogeries`);

--
-- Indexes for table `itemsforahmed`
--
ALTER TABLE `itemsforahmed`
  ADD PRIMARY KEY (`i_id`),
  ADD KEY `i_categories` (`i_categories`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  ADD PRIMARY KEY (`ordersdetails_id`),
  ADD KEY `ordersdetails_items` (`ordersdetails_items`),
  ADD KEY `ordersdetails_orders` (`ordersdetails_orders`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `users_username` (`users_username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `datatype_float`
--
ALTER TABLE `datatype_float`
  MODIFY `serial` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `datatype_select`
--
ALTER TABLE `datatype_select`
  MODIFY `serial` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datatype_text`
--
ALTER TABLE `datatype_text`
  MODIFY `serial` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `datetimetype`
--
ALTER TABLE `datetimetype`
  MODIFY `serial` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `itemsforahmed`
--
ALTER TABLE `itemsforahmed`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  MODIFY `ordersdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_catogeries`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `itemsforahmed`
--
ALTER TABLE `itemsforahmed`
  ADD CONSTRAINT `itemsforahmed_ibfk_1` FOREIGN KEY (`i_categories`) REFERENCES `categories` (`categories_id`);

--
-- القيود للجدول `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orders_users`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `ordersdetails`
--
ALTER TABLE `ordersdetails`
  ADD CONSTRAINT `ordersdetails_ibfk_1` FOREIGN KEY (`ordersdetails_items`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordersdetails_ibfk_2` FOREIGN KEY (`ordersdetails_orders`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
