-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2017 at 04:33 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shopenmore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_items`
--

CREATE TABLE `tb_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `description` text NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `item_status_id` int(1) NOT NULL DEFAULT '0',
  `image_url` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_items`
--

INSERT INTO `tb_items` (`id`, `user_id`, `item_category_id`, `name`, `price`, `description`, `date_posted`, `item_status_id`, `image_url`, `is_active`) VALUES
(33, 21, 1, 'Playstation 3 package', 6800, 'Second hand PS3 unit complete with accessories with bonus games', '2017-07-09 13:40:46', 1, '1499607646148685962325e35907-149959350327425961fb1fc33bd-download (2).jpg', 1),
(34, 21, 5, 'Kyrie Shoe 3', 3000, 'Used Kyrie Irving Basketball shoes', '2017-07-09 13:53:30', 1, '1499608410224435962355aeb0d4-sneakers-Nike-Kyrie-1-Air-Mag.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_item_category`
--

CREATE TABLE `tb_item_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `theme` text NOT NULL,
  `image_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_item_category`
--

INSERT INTO `tb_item_category` (`id`, `name`, `theme`, `image_url`) VALUES
(1, 'Gadgets', 'success', 'images/category/gadgets.jpg\n'),
(2, 'Clothes', 'info', 'images/category/clothes.jpg'),
(3, 'School supplies', 'warning', 'images/category/school_supplies.jpg'),
(4, 'Accessories', 'default', 'images/category/accessories.jpg'),
(5, 'Shoes', 'danger', 'images/category/shoes.jpg'),
(6, 'Bags', 'primary', 'images/category/bags.jpg'),
(7, 'Services', 'success', 'images/category/services.jpg'),
(8, 'Food', 'info', 'images/category/food.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_item_status`
--

CREATE TABLE `tb_item_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `theme` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_item_status`
--

INSERT INTO `tb_item_status` (`id`, `name`, `theme`) VALUES
(1, 'For Sale', 'success'),
(2, 'For Rent', 'info'),
(3, 'Limited Stock', 'danger'),
(4, 'Out of Stock', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `tb_site_info`
--

CREATE TABLE `tb_site_info` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tagline` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_site_info`
--

INSERT INTO `tb_site_info` (`id`, `title`, `tagline`) VALUES
(1, 'ShopenMore', 'ICCT students buy and sell without the hassle. We help you find the product you need and make the deal with fellow students.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `student_id` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `image_url` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `user_role_id`, `student_id`, `email`, `password`, `fname`, `lname`, `contact`, `image_url`, `is_active`, `date_reg`) VALUES
(21, 1, '', 'roeldingle@gmail.com', '77b182f33eff49a3b70206e530bb47a3', 'Roel', 'Dingle', '09103629974', '1499607069186125962301d07b69-149897626410080595890089bd14-11825953_1047734388583992_1727016485304329009_n.jpg', 1, '2017-07-02 06:17:44');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_role`
--

CREATE TABLE `tb_user_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `theme` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_role`
--

INSERT INTO `tb_user_role` (`id`, `name`, `theme`) VALUES
(1, 'Superadmin', 'danger'),
(2, 'Admin', 'primary'),
(3, 'Member', 'default');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_items`
--
ALTER TABLE `tb_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_item_category`
--
ALTER TABLE `tb_item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_item_status`
--
ALTER TABLE `tb_item_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_site_info`
--
ALTER TABLE `tb_site_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user_role`
--
ALTER TABLE `tb_user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_items`
--
ALTER TABLE `tb_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `tb_item_category`
--
ALTER TABLE `tb_item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_item_status`
--
ALTER TABLE `tb_item_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_site_info`
--
ALTER TABLE `tb_site_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `tb_user_role`
--
ALTER TABLE `tb_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
