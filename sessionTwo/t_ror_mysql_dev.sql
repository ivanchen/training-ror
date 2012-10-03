-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 02, 2012 at 10:09 AM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `t_ror_mysql_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `rating` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `body`, `rating`, `user_id`) VALUES
(1, 'A Little Ugly Duck', 'content of article A Little Ugly Duck', 5, 1),
(2, 'Avatar: The Legend of Aang', 'content of article Avatar: The Legend of Aang', 5, 5),
(3, 'Beauty And The Beast', 'content of article Beauty And The Beast', 3, 3),
(5, 'Pinochio', 'content of article Pinochio', 4, 2),
(7, 'dave Story', 'daveeee', 3, 1),
(16, 'Admin here', 'none', NULL, 1),
(17, 'test', 'test', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Mobile Suit'),
(2, 'Allien');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `article_id`) VALUES
(1, 'Wow', 1),
(2, 'Amazing', 5),
(3, 'Not Bad', 3),
(5, 'Quite Good', 2),
(6, 'test', 2),
(7, 'test 2', 2),
(8, 'test', 17),
(9, 'testtest', 17),
(10, 'testtest', 17),
(11, 'testtest', 17),
(12, 'testtest', 17),
(13, 'testtest', 17),
(14, 'test', 17),
(15, 'test one two three', 17),
(16, 'test lagi aja yu', 17),
(17, 'test lagi aja yu 2', 17),
(18, 'test lagi aja yu 2321', 17),
(19, 'test lagi aja yu 2321', 17),
(20, 'dsfadf32sf3af\r\n', 17),
(21, '4354654', 17),
(22, '22424', 17),
(23, 'dgsdfgsgsgfsg', 17),
(24, 'fsdfafa', 17),
(25, 'fsdfafadfadf', 17),
(26, 'aaa', 17),
(27, 'test', 17),
(28, 'kasus neh prular singular', 17);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'id', 'Indonesia'),
(2, 'sg', 'Singapore'),
(3, 'au', 'Australia'),
(4, 'be', 'Belgia'),
(5, 'cn', 'China'),
(6, 'usa', 'America'),
(7, 'id', 'Indonesia'),
(8, 'frc', 'French');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `user_id`) VALUES
(1, 'Gundam', 2000, 'this is description, so you can read it', 1),
(2, 'Protos', 150, 'this is description, so you can read it', 3),
(3, 'Terran', 100, 'this is description, so you can read it', 4),
(4, 'Zerg', 50, 'this is description, so you can read it', 5),
(5, 'Vagan', 1500, 'this is description, so you can read it', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE IF NOT EXISTS `products_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `products_categories`
--

INSERT INTO `products_categories` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20120924013853'),
('20120924014400'),
('20120924014438'),
('20120924014559'),
('20120924015219'),
('20120924015939'),
('20120924023405'),
('20120924024001'),
('20120924032234'),
('20120924033056'),
('20120924043928'),
('20120924044019'),
('20120924044244'),
('20120925012856'),
('20120925013724'),
('20120926092752');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `age` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `address`, `age`, `birthday`, `country_id`, `password_hash`, `password_salt`) VALUES
(1, 'Ivan', 'Andhika', 'ivan.andhika@kiranatama.com', 'ivan', 'gg Sereh 21', 22, '1990-08-05', 5, '$2a$10$A8qTMy1/7mNrP4Jd4ob2rO0rCAvQB.B1mmslt0LRujk.BccmuHO42', '$2a$10$A8qTMy1/7mNrP4Jd4ob2rO'),
(2, 'Rake', 'Zeheart', 'rake.zeheart@tror.org', 'rake', 'wgs 1', 1, '2011-09-23', 4, NULL, NULL),
(3, 'Seed', 'Bloomberg', 'seed.bloomberg@tror.org', 'seed', 'wgs 2', 1, '2011-09-23', 1, NULL, NULL),
(4, 'Migrate', 'Toheaven', 'migrate.toheave@tror.org', 'migz', 'wgs 3', 1, '2011-09-22', 3, NULL, NULL),
(5, 'Gitz', 'Hubz', 'gitz.hubz@tror.org', 'gitz', 'wgs 4', 1, '2011-09-20', 2, NULL, NULL),
(6, 'Gladys', 'Langi', 'gladys.langi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 'ivan.andhika@rocketmail.com', NULL, NULL, NULL, NULL, NULL, '$2a$10$Z3O0bIrjYLbLQG8WyU4Wyeg8weeiYRt0XZjW0AUKWHid4g43TLvNS', '$2a$10$Z3O0bIrjYLbLQG8WyU4Wye'),
(8, NULL, NULL, 'ivan.andhika@bla3.com', NULL, NULL, NULL, NULL, NULL, '$2a$10$zGXBZwbODED.k6VlTdklve8UY5EcBk.MKPaTQV8NNL0FnsoKtm66G', '$2a$10$zGXBZwbODED.k6VlTdklve'),
(9, 'ivanchen', NULL, 'test@test.test', NULL, NULL, NULL, NULL, NULL, '$2a$10$A8qTMy1/7mNrP4Jd4ob2rO0rCAvQB.B1mmslt0LRujk.BccmuHO42', '$2a$10$A8qTMy1/7mNrP4Jd4ob2rO'),
(18, NULL, NULL, 'ivan.andhika.c@gmail.com', NULL, NULL, NULL, NULL, NULL, '$2a$10$zZIgoGtn/QLZIRJVd6Waiud.Oxxy2tGGZ0JX1FVk9oEdTgpTxX3we', '$2a$10$zZIgoGtn/QLZIRJVd6Waiu');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
