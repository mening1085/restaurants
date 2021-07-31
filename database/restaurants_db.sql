-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jul 28, 2021 at 07:35 PM
-- Server version: 8.0.25
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurants_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_07_28_080601_create_restaurants_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint UNSIGNED NOT NULL,
  `place_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `place_id`, `name`, `address`, `tel`, `rating`, `is_open`, `latitude`, `longitude`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'ChIJxwDgR_2c4jAR8dk0ZCFkjWQ', 'ข้าวมันไก่เจ๊อ้วน สาขา 1 ตลาดบางเขน', 'Soi Phahon Yothin 32/1, Khwaeng Lat Yao, Khet Chatuchak, Krung Thep Maha Nakhon 10900, Thailand', '02 579 3039', 4, 1, '13.834889', '100.573256', 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png', '2021-07-28 18:07:37', '2021-07-28 18:07:37'),
(2, 'ChIJ24O8w0ib4jARdYa76q1-ykk', 'Nigi Express, Bangsue', '166 23 Thanon Pracha Rat Sai 2, Khwaeng Bang Sue, Khet Bang Sue, Krung Thep Maha Nakhon 10800, Thailand', '092 896 6787', 5, 0, '13.806283', '100.525587', 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png', '2021-07-28 19:18:33', '2021-07-28 19:18:33'),
(3, 'ChIJZ_8Vo32c4jARvMsfFeE69dQ', 'อร่อยแล้วสั่งต่อ', '812/10 ซอย ประชาชื่น 25 Thanon Pracha Chuen, Khwaeng Wong Sawang, Khet Bang Sue, Krung Thep Maha Nakhon 10800, Thailand', '02 913 7260', 4, 0, '13.824160', '100.537434', 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png', '2021-07-28 19:19:24', '2021-07-28 19:19:24'),
(4, 'ChIJ061k53Oc4jARkIYBQXeUDgE', 'อร่อยในบ้าน', '155 Rim Khlong Prapa Fang Khwa Rd, Khwaeng Bang Sue, Khet Bang Sue, Krung Thep Maha Nakhon 10800, Thailand', '092 589 9242', 4, 0, '13.808109', '100.536536', 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png', '2021-07-28 19:20:37', '2021-07-28 19:20:37'),
(5, 'ChIJVVRAKpKb4jARnOY5NDc74gM', 'WASHI เกตเวย์ บางซื่อ ชั้น3', 'ร้านวาชิ ชั้น3 เลขที่ 162/1-2,168 10 ห้อง 3004 Khwaeng Bang Sue, Khet Bang Sue, Krung Thep Maha Nakhon 10800, Thailand', '095 683 1189', 4, 0, '13.805918', '100.524248', 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png', '2021-07-28 19:21:38', '2021-07-28 19:21:38'),
(6, 'ChIJ4dkY766d4jARNfbGtmHVEKM', 'ครัวบางซื่อ', 'เลขที่ 2 ซอย กานต์ประภา Khwaeng Bang Sue, Khet Bang Sue, Krung Thep Maha Nakhon 10800, Thailand', '084 595 9466', 4, 0, '13.809164', '100.534931', 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png', '2021-07-28 19:22:07', '2021-07-28 19:22:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
