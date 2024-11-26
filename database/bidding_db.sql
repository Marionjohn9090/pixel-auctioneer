-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 01:15 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bidding_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `bid_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=bid,2=confirmed,3=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `bids`:
--

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `user_id`, `product_id`, `bid_amount`, `status`, `date_created`) VALUES
(2, 5, 1, 7500, 1, '2024-10-27 14:18:50'),
(4, 5, 3, 155000, 1, '2024-10-27 16:37:29'),
(5, 9, 6, 58000, 1, '2024-11-21 16:22:01'),
(6, 8, 6, 59999, 1, '2024-11-21 16:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `categories`:
--

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Paintings'),
(2, 'Drawings & Sketches'),
(3, 'Vintage Photographs'),
(4, 'Glass art'),
(5, 'Sculptures');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `start_bid` float NOT NULL,
  `regular_price` float NOT NULL,
  `bid_end_datetime` datetime NOT NULL,
  `img_fname` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `products`:
--

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `start_bid`, `regular_price`, `bid_end_datetime`, `img_fname`, `date_created`) VALUES
(4, 5, 'tree hair sculpture', 'a tree sculpture of a female', 20500, 15000, '2024-11-21 03:10:00', '4.jpeg', '2024-11-20 19:58:58'),
(5, 1, 'cloud and mountain painting', 'an impressive cloud painting', 81700, 67000, '2024-11-21 03:06:00', '5.jpeg', '2024-11-21 03:04:28'),
(6, 1, 'people painting', 'painting of people in a village', 40900, 17000, '2024-11-21 17:00:00', '6.jpeg', '2024-11-21 16:19:45'),
(7, 2, 'owly owl', 'an owl pen drawing', 7500, 5000, '2024-11-21 17:00:00', '7.jpeg', '2024-11-21 16:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `system_settings`:
--

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'PixelAuctioneers', 'customer@pixelauctioneers.org', '+254722000000', '1732148160_p10.jpeg', '&lt;p style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative;&quot;&gt;&lt;span style=&quot;text-align: start;&quot;&gt;&lt;span style=&quot;font-size:20px;text-align: start;&quot;&gt;&lt;span style=&quot;text-align: start; font-size: 20px;&quot;&gt;&amp;nbsp;&lt;/span&gt;Welcome to the PixelAuctioneer! This isn&rsquo;t just any art auction site &ndash; it&rsquo;s where &quot;local legends&quot; meet wallet-friendly bidding wars and finger-painting prodigies rub shoulders with the pros. Whether you&rsquo;re an artist, an art lover, or just here to make sure local paintings finally sells, we&rsquo;re glad you&rsquo;re here!&lt;/span&gt;&lt;br style=&quot;font-size: 18px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-size: 18px; text-align: center; background: transparent; position: relative;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Buyer',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `users`:
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `contact`, `address`, `type`, `date_created`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 'admin@admin.com', '+254722334455', '78 Nakuru', 1, '2024-11-13 01:19:59'),
(5, 'John Doe', 'jdoe', '1254737c076cf867dc53d60a0364f38e', 'jdoe@.gmail.com', '+254790340934', '89 Turkana', 2, '2024-11-20 14:18:32'),
(6, 'Brian Chebii', 'brian', '929064f2a141f812f1c2efb3ff8194ca', 'brian@pixelauctioneer.org', '+254722000888', '5 Bomet', 2, '2024-11-20 19:27:48'),
(7, 'Jane Doe', 'janedoe', '5570c0cd80d575f9db152f9cc8bf1c6a', 'jane@yahoo.com', '+25472244558900', '900 Kitui', 2, '2024-11-21 01:10:08'),
(8, 'Marion John', 'mj', 'd499e800ab764caea75d277e4e56b006', 'mj@pixelauctioneers.org', '+254722111111', '876 Kisumu', 2, '2024-11-21 02:15:06'),
(9, 'Daisy Mwanaidi', 'daisy', '1b3c2c45d0a977b508f637097a94cbfb', 'daisy@kenyarailways.com', '+254722000546', '7878 Mombasa', 2, '2024-11-21 03:09:24'),
(10, 'Kamau Njoroge', 'knjoro', 'f5cc361b8cee68c3a366f818f480e456', 'kwa@proton.com', '+254722000666', '57 Wakanda', 2, '2024-11-21 17:20:20'),
(11, 'Joshua Mutai', 'jmutai', '9a8bde5ddc9a41c567eb2db07c7e7dd6', 'jm@kabaka.io', '+254722558900', '6789 Buganda', 2, '2024-11-22 13:21:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table bids
--

--
-- Metadata for table categories
--

--
-- Metadata for table products
--

--
-- Metadata for table system_settings
--

--
-- Metadata for table users
--

--
-- Metadata for database bidding_db
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
