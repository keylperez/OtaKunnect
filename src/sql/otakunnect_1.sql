-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2021 at 11:16 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otakunnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `anime`
--

CREATE TABLE `anime` (
  `anime_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anime`
--

INSERT INTO `anime` (`anime_id`, `name`, `description`) VALUES
(1, 'Love is war', NULL),
(2, 'Kakegurui', NULL),
(3, 'My hero academia', NULL),
(4, 'Re:Zero', NULL),
(5, 'Classroom of the elite', NULL),
(6, 'Horimiya', NULL),
(7, 'Naruto', NULL),
(8, 'Darling in the franxx', NULL),
(9, 'Fullmetal alchemist', NULL),
(10, 'One punch man', NULL),
(11, 'Genshin Impact', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_count` int(11) NOT NULL DEFAULT 1,
  `product_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`) VALUES
(1, 'Jackets', NULL),
(2, 'Pants', NULL),
(3, 'Sweaters', NULL),
(4, 'Pins', NULL),
(5, 'Key Chains', NULL),
(6, 'Posters', NULL),
(7, 'Figurines', NULL),
(8, 'Phone Cases', NULL),
(9, 'Stickers', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `preference_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `anime_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `preference`
--

INSERT INTO `preference` (`preference_id`, `user_id`, `anime_id`, `category_id`) VALUES
(4, 2, 8, NULL),
(5, 2, 11, NULL),
(6, 2, NULL, 4),
(7, 3, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `anime_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `deleted` enum('Not deleted','Deleted') NOT NULL DEFAULT 'Not deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `img`, `price`, `description`, `category_id`, `anime_id`, `store_id`, `deleted`) VALUES
(2, 'Klee\'s Jumpty Dumpty', 'src/img/stores/KleeJumptyDumty.jpg', '850.00', NULL, NULL, 11, 1, 'Not deleted'),
(3, 'Genshin Key Chains', 'src/img/stores/genshinKeyChains.jpg', '500.00', NULL, 5, 11, 1, 'Not deleted'),
(4, 'Genshin Pins', 'src/img/stores/genshinPins.jpg', '500.00', NULL, 4, 11, 1, 'Not deleted'),
(5, 'Love is War - Chika Fugiwara Figurine', 'src/img/stores/chikakaguyasama.jpg', '1200.00', NULL, 7, 1, 2, 'Not deleted'),
(6, 'Darling in the Franxx - Ichigo Poster', 'src/img/stores/darlinginthefranxxposter.jpg', '1399.90', NULL, 6, 8, 1, 'Not deleted'),
(7, 'Darling in the Franxx - Zero Two Poster', 'src/img/stores/cyberzerotwo.jpg', '1249.90', NULL, 6, 8, 1, 'Not deleted'),
(8, 'Darling in the Franxx Poster', 'src/img/stores/zerotwoposter.jpg', '1129.90', NULL, 6, 8, 1, 'Not deleted'),
(9, 'Horimiya - Couple', 'src/img/stores/horimiyaposterkyahhh.jpg', '849.90', NULL, 6, 6, 1, 'Not deleted'),
(10, 'Horimiya - Enclosed', 'src/img/stores/horimiyaposter.png', '999.50', NULL, 6, 6, 1, 'Not deleted'),
(11, 'Love is War - Chika Phone Case', 'src/img/stores/chikaphonecase.jpg', '500.00', NULL, 8, 1, 2, 'Not deleted'),
(12, 'Love is War - Main Cast Poster', 'src/img/stores/kaguyaposter.jpg', '750.00', NULL, 6, 1, 2, 'Not deleted'),
(13, 'Love is War - Kaguya Phone Case', 'src/img/stores/kaguyaphonecase.jpg', '500.00', NULL, 8, 1, 2, 'Not deleted'),
(14, 'My Hero Academia - Hawks Poster', 'src/img/stores/mhaposter.jpg', '950.90', NULL, 6, 3, 1, 'Not deleted'),
(15, 'Plus Ultra Phone Case', '', '490.49', NULL, 8, 3, 1, 'Not deleted');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `claim_date` datetime NOT NULL,
  `claim_confirmation` enum('Unclaimed','Claimed') NOT NULL DEFAULT 'Unclaimed',
  `price` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `store_description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_name`, `store_description`) VALUES
(1, 'KrisYam Merch', 'random message'),
(2, 'Keyl\'s Average Store', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` char(11) DEFAULT NULL,
  `auth_level` enum('Admin','Store','User') NOT NULL DEFAULT 'User',
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `name`, `email`, `password`, `phone`, `auth_level`, `store_id`) VALUES
(1, 'krisyam_admin', 'kurisuzchan_desu', 'kris_admin@gmail.com', 'admin', NULL, 'Admin', NULL),
(2, 'krisyam', 'Kristian Ayam', 'kristian.ayam@gmail.com', 'pass', NULL, 'User', NULL),
(3, 'keyl', 'keyleb', 'keylaperez@gmail.com', 'pass', NULL, 'User', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`anime_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`preference_id`),
  ADD KEY `anime_id` (`anime_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `anime_id` (`anime_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `store_id` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anime`
--
ALTER TABLE `anime`
  MODIFY `anime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `preference`
--
ALTER TABLE `preference`
  MODIFY `preference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`),
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `preference`
--
ALTER TABLE `preference`
  ADD CONSTRAINT `preference_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`anime_id`),
  ADD CONSTRAINT `preference_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `preference_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`anime_id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
