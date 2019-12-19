-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 19, 2019 at 12:40 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `android_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractor_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(75) COLLATE utf8mb4_bin NOT NULL,
  `mobile` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `amount` decimal(15,0) NOT NULL DEFAULT '0',
  `email_verify_code` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `email_verify_status` enum('yes','no') COLLATE utf8mb4_bin NOT NULL,
  `otp` int(6) NOT NULL,
  `mobile_verify_status` enum('yes','no') COLLATE utf8mb4_bin NOT NULL,
  `ip` varchar(75) COLLATE utf8mb4_bin NOT NULL,
  `browser_detail` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `os` varchar(75) COLLATE utf8mb4_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_status` enum('enable','disable') COLLATE utf8mb4_bin NOT NULL DEFAULT 'disable',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `contractor_id`, `username`, `password`, `email`, `mobile`, `amount`, `email_verify_code`, `email_verify_status`, `otp`, `mobile_verify_status`, `ip`, `browser_detail`, `os`, `last_login`, `added_on`, `modified_on`, `account_status`) VALUES
(1, 0, 'ron', 'roint', 'ronitkumar@gmail.com', '8285342397', '0', '254856', 'yes', 325545, 'yes', '127.0.0.1', 'chrome', '74558', '2019-12-17 18:30:00', '2019-12-18 09:18:27', '2019-12-17 18:30:00', 'enable'),
(3, 0, 'ronn', 'ronitkumar', 'ronit@gmail.com', '10.1', '0', 'jf58e', 'yes', 875965, 'yes', 'undefined', 'undefined', 'undefined', '2019-12-18 10:25:40', '2019-12-18 10:25:40', '2019-12-18 10:25:40', 'enable'),
(5, 0, 'ronnk', 'ronitkumar', 'ronit54@gmail.com', '10.2', '0', 'jf58e', 'yes', 875965, 'yes', '::1', 'PostmanRuntime', 'unknown', '2019-12-18 10:32:25', '2019-12-18 10:32:25', '2019-12-18 10:32:25', 'enable'),
(7, 0, 'onnkr', 'ronitkumar', 'ronit5447@gmail.com', '98917593250', '1', 'hf58e', 'yes', 875955, 'yes', '::1', 'PostmanRuntime', 'unknown', '2019-12-18 10:44:40', '2019-12-18 10:44:40', '2019-12-18 10:44:40', 'enable'),
(8, 0, 'yonnkr', 'ronitkumar', 'ronit9447@gmail.com', '9891753250', '1', 'hf58e', 'yes', 875955, 'yes', '::1', 'PostmanRuntime', 'unknown', '2019-12-18 10:45:10', '2019-12-18 10:45:10', '2019-12-18 10:45:10', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_activity`
--

DROP TABLE IF EXISTS `user_login_activity`;
CREATE TABLE IF NOT EXISTS `user_login_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `ip` varchar(75) NOT NULL,
  `browser_detail` varchar(255) NOT NULL,
  `os` varchar(75) NOT NULL,
  `success` tinyint(4) NOT NULL DEFAULT '0',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_transactions`
--

DROP TABLE IF EXISTS `user_transactions`;
CREATE TABLE IF NOT EXISTS `user_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `betting_id` int(11) NOT NULL,
  `game_type` enum('dice','teenpati') NOT NULL,
  `amount` decimal(15,0) NOT NULL DEFAULT '0',
  `total_amount` decimal(15,0) NOT NULL DEFAULT '0',
  `type` enum('credit','debit') NOT NULL,
  `remark` varchar(255) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_transactions`
--

INSERT INTO `user_transactions` (`id`, `user_id`, `betting_id`, `game_type`, `amount`, `total_amount`, `type`, `remark`, `added_on`) VALUES
(1, 1, 1, 'dice', '100', '100', 'credit', 'ok', '2019-12-19 11:17:26'),
(2, 1, 1, 'dice', '20', '200', 'credit', 'ok', '2019-12-19 11:21:52'),
(3, 1, 1, 'dice', '20', '200', 'credit', 'ok', '2019-12-19 11:25:30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
