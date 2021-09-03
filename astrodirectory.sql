-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2021 at 01:30 PM
-- Server version: 10.5.12-MariaDB-1:10.5.12+maria~focal
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astrodirectory`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `advertisement_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advertisement_status` int(11) NOT NULL DEFAULT 0 COMMENT '0: disable 1: enable',
  `advertisement_place` int(11) NOT NULL DEFAULT 1 COMMENT '1:listing results pages 2: listing search page 3: business listing page 4: blog posts pages 5: blog topic pages 6: blog tag pages 7: single post page',
  `advertisement_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `advertisement_position` int(11) NOT NULL DEFAULT 1 COMMENT '0: disable 1: enable',
  `advertisement_alignment` int(11) NOT NULL DEFAULT 1 COMMENT '1: left 2: center 3: right',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `attribute_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_type` int(11) NOT NULL DEFAULT 1 COMMENT '1:text 2:select 3:multi-select 4:link',
  `attribute_seed_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_posts`
--

CREATE TABLE `canvas_posts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_image_caption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_posts_tags`
--

CREATE TABLE `canvas_posts_tags` (
  `post_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_posts_topics`
--

CREATE TABLE `canvas_posts_topics` (
  `post_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_tags`
--

CREATE TABLE `canvas_tags` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_topics`
--

CREATE TABLE `canvas_topics` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_user_meta`
--

CREATE TABLE `canvas_user_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_mode` tinyint(4) DEFAULT 0,
  `digest` tinyint(4) DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_views`
--

CREATE TABLE `canvas_views` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_visits`
--

CREATE TABLE `canvas_visits` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_parent_id` int(11) DEFAULT NULL,
  `category_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_icon`, `created_at`, `updated_at`, `category_parent_id`, `category_description`) VALUES
(1, 'Pest Control', 'pest-control', 'fas fa-utensils', '2021-06-30 07:34:55', '2021-07-01 08:21:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_custom_field`
--

CREATE TABLE `category_custom_field` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_item`
--

CREATE TABLE `category_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `city_name`, `city_state`, `city_slug`, `city_lat`, `city_lng`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nicobar', 'AN', 'nicobar', NULL, NULL, '2021-08-31 05:15:36', '2021-08-31 05:15:36'),
(2, 1, 'North Middle Andaman', 'AN', 'north-middle-andaman', NULL, NULL, '2021-08-31 05:17:15', '2021-08-31 05:17:15'),
(3, 1, 'South Andaman', 'AN', 'south-andaman', NULL, NULL, '2021-08-31 05:19:44', '2021-08-31 05:19:44'),
(4, 2, 'Anantapur', 'AP', 'anantapur', NULL, NULL, '2021-08-31 05:20:26', '2021-08-31 05:20:26'),
(5, 2, 'Chittoor', 'AP', 'chittoor', NULL, NULL, '2021-08-31 05:20:49', '2021-08-31 05:20:49'),
(6, 2, 'East Godavari', 'AP', 'east-godavari', NULL, NULL, '2021-08-31 05:22:53', '2021-08-31 05:22:53'),
(7, 2, 'Guntur', 'AP', 'guntur', NULL, NULL, '2021-08-31 05:24:47', '2021-08-31 05:24:47'),
(8, 2, 'Kadapa', 'AP', 'kadapa', NULL, NULL, '2021-08-31 05:27:09', '2021-08-31 05:27:09'),
(9, 2, 'Krishna', 'AP', 'krishna', NULL, NULL, '2021-08-31 05:28:25', '2021-08-31 05:28:25'),
(10, 2, 'Kurnool', 'AP', 'kurnool', NULL, NULL, '2021-08-31 05:30:20', '2021-08-31 05:30:20'),
(11, 2, 'Nellore', 'AP', 'nellore', NULL, NULL, '2021-08-31 05:31:35', '2021-08-31 05:31:35'),
(12, 2, 'Prakasam', 'AP', 'prakasam', NULL, NULL, '2021-08-31 05:33:43', '2021-08-31 05:33:43'),
(13, 2, 'Srikakulam', 'AP', 'srikakulam', NULL, NULL, '2021-08-31 05:36:35', '2021-08-31 05:36:35'),
(14, 2, 'Visakhapatnam', 'AP', 'visakhapatnam', NULL, NULL, '2021-08-31 05:37:50', '2021-08-31 05:37:50'),
(15, 2, 'Vizianagaram', 'AP', 'vizianagaram', NULL, NULL, '2021-08-31 05:38:53', '2021-08-31 05:38:53'),
(16, 2, 'West Godavari', 'AP', 'west-godavari', NULL, NULL, '2021-08-31 05:40:15', '2021-08-31 05:40:15'),
(17, 3, 'Anjaw', 'AR', 'anjaw', NULL, NULL, '2021-08-31 05:42:11', '2021-08-31 05:42:11'),
(18, 3, 'Central Siang', 'AR', 'central-siang', NULL, NULL, '2021-08-31 05:44:38', '2021-08-31 05:44:38'),
(19, 3, 'Changlang', 'AR', 'changlang', NULL, NULL, '2021-08-31 05:46:57', '2021-08-31 05:46:57'),
(20, 3, 'Dibang Valley', 'AR', 'dibang-valley', NULL, NULL, '2021-08-31 05:48:49', '2021-08-31 05:48:49'),
(21, 3, 'East Kameng', 'AR', 'east-kameng', NULL, NULL, '2021-08-31 05:51:10', '2021-08-31 05:51:10'),
(22, 3, 'East Siang', 'AR', 'east-siang', NULL, NULL, '2021-08-31 05:53:04', '2021-08-31 05:53:04'),
(23, 3, 'Kamle', 'AR', 'kamle', NULL, NULL, '2021-08-31 05:55:24', '2021-08-31 05:55:24'),
(24, 3, 'Kra Daadi', 'AR', 'kra-daadi', NULL, NULL, '2021-08-31 05:58:15', '2021-08-31 05:58:15'),
(25, 3, 'Kurung Kumey', 'AR', 'kurung-kumey', NULL, NULL, '2021-08-31 05:58:45', '2021-08-31 05:58:45'),
(26, 3, 'Lepa Rada', 'AR', 'lepa-rada', NULL, NULL, '2021-08-31 05:59:54', '2021-08-31 05:59:54'),
(27, 3, 'Lohit', 'AR', 'lohit', NULL, NULL, '2021-08-31 06:00:35', '2021-08-31 06:00:35'),
(28, 3, 'Longding', 'AR', 'longding', NULL, NULL, '2021-08-31 06:02:28', '2021-08-31 06:02:28'),
(29, 3, 'Lower Dibang Valley', 'AR', 'lower-dibang-valley', NULL, NULL, '2021-08-31 06:04:51', '2021-08-31 06:04:51'),
(30, 3, 'Lower Siang', 'AR', 'lower-siang', NULL, NULL, '2021-08-31 06:07:10', '2021-08-31 06:07:10'),
(31, 3, 'Lower Subansiri', 'AR', 'lower-subansiri', NULL, NULL, '2021-08-31 06:09:11', '2021-08-31 06:09:11'),
(32, 3, 'Namsai', 'AR', 'namsai', NULL, NULL, '2021-08-31 06:11:35', '2021-08-31 06:11:35'),
(33, 3, 'Pakke Kessang', 'AR', 'pakke-kessang', NULL, NULL, '2021-08-31 06:14:29', '2021-08-31 06:14:29'),
(34, 3, 'Papum Pare', 'AR', 'papum-pare', NULL, NULL, '2021-08-31 06:16:29', '2021-08-31 06:16:29'),
(35, 3, 'Shi Yomi', 'AR', 'shi-yomi', NULL, NULL, '2021-08-31 06:17:11', '2021-08-31 06:17:11'),
(36, 3, 'Tawang', 'AR', 'tawang', NULL, NULL, '2021-08-31 06:17:52', '2021-08-31 06:17:52'),
(37, 3, 'Tirap', 'AR', 'tirap', NULL, NULL, '2021-08-31 06:19:15', '2021-08-31 06:19:15'),
(38, 3, 'Upper Siang', 'AR', 'upper-siang', NULL, NULL, '2021-08-31 06:20:06', '2021-08-31 06:20:06'),
(39, 3, 'Upper Subansiri', 'AR', 'upper-subansiri', NULL, NULL, '2021-08-31 06:22:56', '2021-08-31 06:22:56'),
(40, 3, 'West Kameng', 'AR', 'west-kameng', NULL, NULL, '2021-08-31 06:25:18', '2021-08-31 06:25:18'),
(41, 3, 'West Siang', 'AR', 'west-siang', NULL, NULL, '2021-08-31 06:27:14', '2021-08-31 06:27:14'),
(42, 4, 'Bajali', 'AS', 'bajali', NULL, NULL, '2021-08-31 06:29:10', '2021-08-31 06:29:10'),
(43, 4, 'Baksa', 'AS', 'baksa', NULL, NULL, '2021-08-31 06:30:42', '2021-08-31 06:30:42'),
(44, 4, 'Barpeta', 'AS', 'barpeta', NULL, NULL, '2021-08-31 06:33:36', '2021-08-31 06:33:36'),
(45, 4, 'Biswanath', 'AS', 'biswanath', NULL, NULL, '2021-08-31 06:34:17', '2021-08-31 06:34:17'),
(46, 4, 'Bongaigaon', 'AS', 'bongaigaon', NULL, NULL, '2021-08-31 06:36:10', '2021-08-31 06:36:10'),
(47, 4, 'Cachar', 'AS', 'cachar', NULL, NULL, '2021-08-31 06:38:11', '2021-08-31 06:38:11'),
(48, 4, 'Charaideo', 'AS', 'charaideo', NULL, NULL, '2021-08-31 06:40:06', '2021-08-31 06:40:06'),
(49, 4, 'Chirang', 'AS', 'chirang', NULL, NULL, '2021-08-31 06:42:31', '2021-08-31 06:42:31'),
(50, 4, 'Darrang', 'AS', 'darrang', NULL, NULL, '2021-08-31 06:44:28', '2021-08-31 06:44:28'),
(51, 4, 'Dhemaji', 'AS', 'dhemaji', NULL, NULL, '2021-08-31 06:46:25', '2021-08-31 06:46:25'),
(52, 4, 'Dhubri', 'AS', 'dhubri', NULL, NULL, '2021-08-31 06:49:20', '2021-08-31 06:49:20'),
(53, 4, 'Dibrugarh', 'AS', 'dibrugarh', NULL, NULL, '2021-08-31 06:51:47', '2021-08-31 06:51:47'),
(54, 4, 'Dima Hasao', 'AS', 'dima-hasao', NULL, NULL, '2021-08-31 06:52:21', '2021-08-31 06:52:21'),
(55, 4, 'Goalpara', 'AS', 'goalpara', NULL, NULL, '2021-08-31 06:55:43', '2021-08-31 06:55:43'),
(56, 4, 'Golaghat', 'AS', 'golaghat', NULL, NULL, '2021-08-31 06:58:07', '2021-08-31 06:58:07'),
(57, 4, 'Hailakandi', 'AS', 'hailakandi', NULL, NULL, '2021-08-31 07:00:04', '2021-08-31 07:00:04'),
(58, 4, 'Hojai', 'AS', 'hojai', NULL, NULL, '2021-08-31 07:01:04', '2021-08-31 07:01:04'),
(59, 4, 'Jorhat', 'AS', 'jorhat', NULL, NULL, '2021-08-31 07:04:33', '2021-08-31 07:04:33'),
(60, 4, 'Kamrup', 'AS', 'kamrup', NULL, NULL, '2021-08-31 07:06:40', '2021-08-31 07:06:40'),
(61, 4, 'Kamrup Metropolitan', 'AS', 'kamrup-metropolitan', NULL, NULL, '2021-08-31 07:08:36', '2021-08-31 07:08:36'),
(62, 4, 'Karbi Anglong', 'AS', 'karbi-anglong', NULL, NULL, '2021-08-31 07:10:33', '2021-08-31 07:10:33'),
(63, 4, 'Karimganj', 'AS', 'karimganj', NULL, NULL, '2021-08-31 07:12:28', '2021-08-31 07:12:28'),
(64, 4, 'Kokrajhar', 'AS', 'kokrajhar', NULL, NULL, '2021-08-31 07:14:03', '2021-08-31 07:14:03'),
(65, 4, 'Lakhimpur', 'AS', 'lakhimpur', NULL, NULL, '2021-08-31 07:16:00', '2021-08-31 07:16:00'),
(66, 4, 'Majuli', 'AS', 'majuli', NULL, NULL, '2021-08-31 07:18:25', '2021-08-31 07:18:25'),
(67, 4, 'Morigaon', 'AS', 'morigaon', NULL, NULL, '2021-08-31 07:20:48', '2021-08-31 07:20:48'),
(68, 4, 'Nagaon', 'AS', 'nagaon', NULL, NULL, '2021-08-31 07:24:11', '2021-08-31 07:24:11'),
(69, 4, 'Nalbari', 'AS', 'nalbari', NULL, NULL, '2021-08-31 07:26:20', '2021-08-31 07:26:20'),
(70, 4, 'Sivasagar', 'AS', 'sivasagar', NULL, NULL, '2021-08-31 07:28:15', '2021-08-31 07:28:15'),
(71, 4, 'Sonitpur', 'AS', 'sonitpur', NULL, NULL, '2021-08-31 07:30:51', '2021-08-31 07:30:51'),
(72, 4, 'South Salmara-Mankachar', 'AS', 'south-salmara-mankachar', NULL, NULL, '2021-08-31 07:32:46', '2021-08-31 07:32:46'),
(73, 4, 'Tinsukia', 'AS', 'tinsukia', NULL, NULL, '2021-08-31 07:35:12', '2021-08-31 07:35:12'),
(74, 4, 'Udalguri', 'AS', 'udalguri', NULL, NULL, '2021-08-31 07:36:34', '2021-08-31 07:36:34'),
(75, 4, 'West Karbi Anglong', 'AS', 'west-karbi-anglong', NULL, NULL, '2021-08-31 07:39:00', '2021-08-31 07:39:00'),
(76, 5, 'Araria', 'BI', 'araria', NULL, NULL, '2021-08-31 07:40:58', '2021-08-31 07:40:58'),
(77, 5, 'Arwal', 'BI', 'arwal', NULL, NULL, '2021-08-31 07:43:18', '2021-08-31 07:43:18'),
(78, 5, 'Aurangabad', 'BI', 'aurangabad', NULL, NULL, '2021-08-31 07:45:13', '2021-08-31 07:45:13'),
(79, 5, 'Banka', 'BI', 'banka', NULL, NULL, '2021-08-31 07:47:07', '2021-08-31 07:47:07'),
(80, 5, 'Begusarai', 'BI', 'begusarai', NULL, NULL, '2021-08-31 07:49:29', '2021-08-31 07:49:29'),
(81, 5, 'Bhagalpur', 'BI', 'bhagalpur', NULL, NULL, '2021-08-31 07:51:29', '2021-08-31 07:51:29'),
(82, 5, 'Bhojpur', 'BI', 'bhojpur', NULL, NULL, '2021-08-31 07:53:25', '2021-08-31 07:53:25'),
(83, 5, 'Buxar', 'BI', 'buxar', NULL, NULL, '2021-08-31 07:55:21', '2021-08-31 07:55:21'),
(84, 5, 'Darbhanga', 'BI', 'darbhanga', NULL, NULL, '2021-08-31 07:57:23', '2021-08-31 07:57:23'),
(85, 5, 'East Champaran', 'BI', 'east-champaran', NULL, NULL, '2021-08-31 07:59:17', '2021-08-31 07:59:17'),
(86, 5, 'Gaya', 'BI', 'gaya', NULL, NULL, '2021-08-31 08:02:12', '2021-08-31 08:02:12'),
(87, 5, 'Gopalganj', 'BI', 'gopalganj', NULL, NULL, '2021-08-31 08:03:40', '2021-08-31 08:03:40'),
(88, 5, 'Jamui', 'BI', 'jamui', NULL, NULL, '2021-08-31 08:06:02', '2021-08-31 08:06:02'),
(89, 5, 'Jehanabad', 'BI', 'jehanabad', NULL, NULL, '2021-08-31 08:07:56', '2021-08-31 08:07:56'),
(90, 5, 'Kaimur', 'BI', 'kaimur', NULL, NULL, '2021-08-31 08:08:50', '2021-08-31 08:08:50'),
(91, 5, 'Katihar', 'BI', 'katihar', NULL, NULL, '2021-08-31 08:10:41', '2021-08-31 08:10:41'),
(92, 5, 'Khagaria', 'BI', 'khagaria', NULL, NULL, '2021-08-31 08:12:43', '2021-08-31 08:12:43'),
(93, 5, 'Kishanganj', 'BI', 'kishanganj', NULL, NULL, '2021-08-31 08:13:13', '2021-08-31 08:13:13'),
(94, 5, 'Lakhisarai', 'BI', 'lakhisarai', NULL, NULL, '2021-08-31 08:15:09', '2021-08-31 08:15:09'),
(95, 5, 'Madhepura', 'BI', 'madhepura', NULL, NULL, '2021-08-31 08:17:07', '2021-08-31 08:17:07'),
(96, 5, 'Madhubani', 'BI', 'madhubani', NULL, NULL, '2021-08-31 08:19:32', '2021-08-31 08:19:32'),
(97, 5, 'Munger', 'BI', 'munger', NULL, NULL, '2021-08-31 08:21:28', '2021-08-31 08:21:28'),
(98, 5, 'Muzaffarpur', 'BI', 'muzaffarpur', NULL, NULL, '2021-08-31 08:23:23', '2021-08-31 08:23:23'),
(99, 5, 'Nalanda', 'BI', 'nalanda', NULL, NULL, '2021-08-31 08:25:49', '2021-08-31 08:25:49'),
(100, 5, 'Nawada', 'BI', 'nawada', NULL, NULL, '2021-08-31 08:27:48', '2021-08-31 08:27:48'),
(101, 5, 'Patna', 'BI', 'patna', NULL, NULL, '2021-08-31 08:29:43', '2021-08-31 08:29:43'),
(102, 5, 'Purnia', 'BI', 'purnia', NULL, NULL, '2021-08-31 08:31:59', '2021-08-31 08:31:59'),
(103, 5, 'Rohtas', 'BI', 'rohtas', NULL, NULL, '2021-08-31 08:34:03', '2021-08-31 08:34:03'),
(104, 5, 'Saharsa', 'BI', 'saharsa', NULL, NULL, '2021-08-31 08:36:06', '2021-08-31 08:36:06'),
(105, 5, 'Samastipur', 'BI', 'samastipur', NULL, NULL, '2021-08-31 08:38:31', '2021-08-31 08:38:31'),
(106, 5, 'Saran', 'BI', 'saran', NULL, NULL, '2021-08-31 08:40:54', '2021-08-31 08:40:54'),
(107, 5, 'Sheikhpura', 'BI', 'sheikhpura', NULL, NULL, '2021-08-31 08:42:51', '2021-08-31 08:42:51'),
(108, 5, 'Sheohar', 'BI', 'sheohar', NULL, NULL, '2021-08-31 08:44:56', '2021-08-31 08:44:56'),
(109, 5, 'Sitamarhi', 'BI', 'sitamarhi', NULL, NULL, '2021-08-31 08:46:52', '2021-08-31 08:46:52'),
(110, 5, 'Siwan', 'BI', 'siwan', NULL, NULL, '2021-08-31 08:48:15', '2021-08-31 08:48:15'),
(111, 5, 'Supaul', 'BI', 'supaul', NULL, NULL, '2021-08-31 08:50:36', '2021-08-31 08:50:36'),
(112, 5, 'Vaishali', 'BI', 'vaishali', NULL, NULL, '2021-08-31 08:52:07', '2021-08-31 08:52:07'),
(113, 5, 'West Champaran', 'BI', 'west-champaran', NULL, NULL, '2021-08-31 08:54:00', '2021-08-31 08:54:00'),
(114, 6, 'Chandigarh', 'CG', 'chandigarh', NULL, NULL, '2021-08-31 08:56:53', '2021-08-31 08:56:53'),
(115, 7, 'Balod', 'CH', 'balod', NULL, NULL, '2021-08-31 08:57:52', '2021-08-31 08:57:52'),
(116, 7, 'Baloda Bazar', 'CH', 'baloda-bazar', NULL, NULL, '2021-08-31 09:00:41', '2021-08-31 09:00:41'),
(117, 7, 'Balrampur', 'CH', 'balrampur', NULL, NULL, '2021-08-31 09:02:37', '2021-08-31 09:02:37'),
(118, 7, 'Bastar', 'CH', 'bastar', NULL, NULL, '2021-08-31 09:05:56', '2021-08-31 09:05:56'),
(119, 7, 'Bemetara', 'CH', 'bemetara', NULL, NULL, '2021-08-31 09:07:51', '2021-08-31 09:07:51'),
(120, 7, 'Bijapur', 'CH', 'bijapur', NULL, NULL, '2021-08-31 09:09:47', '2021-08-31 09:09:47'),
(121, 7, 'Bilaspur', 'CH', 'bilaspur', NULL, NULL, '2021-08-31 09:13:09', '2021-08-31 09:13:09'),
(122, 7, 'Dantewada', 'CH', 'dantewada', NULL, NULL, '2021-08-31 09:15:41', '2021-08-31 09:15:41'),
(123, 7, 'Dhamtari', 'CH', 'dhamtari', NULL, NULL, '2021-08-31 09:17:36', '2021-08-31 09:17:36'),
(124, 7, 'Durg', 'CH', 'durg', NULL, NULL, '2021-08-31 09:19:29', '2021-08-31 09:19:29'),
(125, 7, 'Gariaband', 'CH', 'gariaband', NULL, NULL, '2021-08-31 09:22:06', '2021-08-31 09:22:06'),
(126, 7, 'Gaurela Pendra Marwahi', 'CH', 'gaurela-pendra-marwahi', NULL, NULL, '2021-08-31 09:24:02', '2021-08-31 09:24:02'),
(127, 7, 'Janjgir Champa', 'CH', 'janjgir-champa', NULL, NULL, '2021-08-31 09:25:58', '2021-08-31 09:25:58'),
(128, 7, 'Jashpur', 'CH', 'jashpur', NULL, NULL, '2021-08-31 09:28:17', '2021-08-31 09:28:17'),
(129, 7, 'Kabirdham', 'CH', 'kabirdham', NULL, NULL, '2021-08-31 09:29:18', '2021-08-31 09:29:18'),
(130, 7, 'Kanker', 'CH', 'kanker', NULL, NULL, '2021-08-31 09:31:11', '2021-08-31 09:31:11'),
(131, 7, 'Kondagaon', 'CH', 'kondagaon', NULL, NULL, '2021-08-31 09:33:04', '2021-08-31 09:33:04'),
(132, 7, 'Korba', 'CH', 'korba', NULL, NULL, '2021-08-31 09:34:59', '2021-08-31 09:34:59'),
(133, 7, 'Koriya', 'CH', 'koriya', NULL, NULL, '2021-08-31 09:37:31', '2021-08-31 09:37:31'),
(134, 7, 'Mahasamund', 'CH', 'mahasamund', NULL, NULL, '2021-08-31 09:39:25', '2021-08-31 09:39:25'),
(135, 7, 'Mungeli', 'CH', 'mungeli', NULL, NULL, '2021-08-31 09:41:20', '2021-08-31 09:41:20'),
(136, 7, 'Narayanpur', 'CH', 'narayanpur', NULL, NULL, '2021-08-31 09:43:44', '2021-08-31 09:43:44'),
(137, 7, 'Raigarh', 'CH', 'raigarh', NULL, NULL, '2021-08-31 09:44:43', '2021-08-31 09:44:43'),
(138, 7, 'Raipur', 'CH', 'raipur', NULL, NULL, '2021-08-31 09:46:44', '2021-08-31 09:46:44'),
(139, 7, 'Rajnandgaon', 'CH', 'rajnandgaon', NULL, NULL, '2021-08-31 09:48:52', '2021-08-31 09:48:52'),
(140, 7, 'Sukma', 'CH', 'sukma', NULL, NULL, '2021-08-31 09:50:12', '2021-08-31 09:50:12'),
(141, 7, 'Surajpur', 'CH', 'surajpur', NULL, NULL, '2021-08-31 09:52:06', '2021-08-31 09:52:06'),
(142, 7, 'Surguja', 'CH', 'surguja', NULL, NULL, '2021-08-31 09:54:01', '2021-08-31 09:54:01'),
(143, 8, 'Dadra Nagar Haveli', 'DA', 'dadra-nagar-haveli', NULL, NULL, '2021-08-31 09:55:53', '2021-08-31 09:55:53'),
(144, 9, 'Daman', 'DD', 'daman', NULL, NULL, '2021-08-31 09:57:45', '2021-08-31 09:57:45'),
(145, 9, 'Diu', 'DD', 'diu', NULL, NULL, '2021-08-31 09:59:16', '2021-08-31 09:59:16'),
(146, 10, 'Central Delhi', 'DE', 'central-delhi', NULL, NULL, '2021-08-31 10:02:31', '2021-08-31 10:02:31'),
(147, 10, 'East Delhi', 'DE', 'east-delhi', NULL, NULL, '2021-08-31 10:04:33', '2021-08-31 10:04:33'),
(148, 10, 'New Delhi', 'DE', 'new-delhi', NULL, NULL, '2021-08-31 10:06:31', '2021-08-31 10:06:31'),
(149, 10, 'North Delhi', 'DE', 'north-delhi', NULL, NULL, '2021-08-31 10:07:31', '2021-08-31 10:07:31'),
(150, 10, 'North East Delhi', 'DE', 'north-east-delhi', NULL, NULL, '2021-08-31 10:09:31', '2021-08-31 10:09:31'),
(151, 10, 'North West Delhi', 'DE', 'north-west-delhi', NULL, NULL, '2021-08-31 10:11:32', '2021-08-31 10:11:32'),
(152, 10, 'Shahdara', 'DE', 'shahdara', NULL, NULL, '2021-08-31 10:13:30', '2021-08-31 10:13:30'),
(153, 10, 'South Delhi', 'DE', 'south-delhi', NULL, NULL, '2021-08-31 10:15:35', '2021-08-31 10:15:35'),
(154, 10, 'South East Delhi', 'DE', 'south-east-delhi', NULL, NULL, '2021-08-31 10:17:33', '2021-08-31 10:17:33'),
(155, 10, 'South West Delhi', 'DE', 'south-west-delhi', NULL, NULL, '2021-08-31 10:19:30', '2021-08-31 10:19:30'),
(156, 10, 'West Delhi', 'DE', 'west-delhi', NULL, NULL, '2021-08-31 10:21:23', '2021-08-31 10:21:23'),
(157, 11, 'North Goa', 'GO', 'north-goa', NULL, NULL, '2021-08-31 10:23:23', '2021-08-31 10:23:23'),
(158, 11, 'South Goa', 'GO', 'south-goa', NULL, NULL, '2021-08-31 10:25:13', '2021-08-31 10:25:13'),
(159, 12, 'Ahmedabad', 'GU', 'ahmedabad', NULL, NULL, '2021-08-31 10:27:04', '2021-08-31 10:27:04'),
(160, 12, 'Amreli', 'GU', 'amreli', NULL, NULL, '2021-08-31 10:29:11', '2021-08-31 10:29:11'),
(161, 12, 'Anand', 'GU', 'anand', NULL, NULL, '2021-08-31 10:30:03', '2021-08-31 10:30:03'),
(162, 12, 'Aravalli', 'GU', 'aravalli', NULL, NULL, '2021-08-31 10:32:09', '2021-08-31 10:32:09'),
(163, 12, 'Banaskantha', 'GU', 'banaskantha', NULL, NULL, '2021-08-31 10:34:08', '2021-08-31 10:34:08'),
(164, 12, 'Bharuch', 'GU', 'bharuch', NULL, NULL, '2021-08-31 10:36:00', '2021-08-31 10:36:00'),
(165, 12, 'Bhavnagar', 'GU', 'bhavnagar', NULL, NULL, '2021-08-31 10:37:34', '2021-08-31 10:37:34'),
(166, 12, 'Botad', 'GU', 'botad', NULL, NULL, '2021-08-31 10:38:07', '2021-08-31 10:38:07'),
(167, 12, 'Chhota Udaipur', 'GU', 'chhota-udaipur', NULL, NULL, '2021-08-31 10:39:09', '2021-08-31 10:39:09'),
(168, 12, 'Dahod', 'GU', 'dahod', NULL, NULL, '2021-08-31 10:41:30', '2021-08-31 10:41:30'),
(169, 12, 'Dang', 'GU', 'dang', NULL, NULL, '2021-08-31 10:42:21', '2021-08-31 10:42:21'),
(170, 12, 'Devbhoomi Dwarka', 'GU', 'devbhoomi-dwarka', NULL, NULL, '2021-08-31 10:44:45', '2021-08-31 10:44:45'),
(171, 12, 'Gandhinagar', 'GU', 'gandhinagar', NULL, NULL, '2021-08-31 10:47:07', '2021-08-31 10:47:07'),
(172, 12, 'Gir Somnath', 'GU', 'gir-somnath', NULL, NULL, '2021-08-31 10:49:18', '2021-08-31 10:49:18'),
(173, 12, 'Jamnagar', 'GU', 'jamnagar', NULL, NULL, '2021-08-31 10:52:35', '2021-08-31 10:52:35'),
(174, 12, 'Junagadh', 'GU', 'junagadh', NULL, NULL, '2021-08-31 10:54:35', '2021-08-31 10:54:35'),
(175, 12, 'Kheda', 'GU', 'kheda', NULL, NULL, '2021-08-31 10:56:17', '2021-08-31 10:56:17'),
(176, 12, 'Kutch', 'GU', 'kutch', NULL, NULL, '2021-08-31 10:58:12', '2021-08-31 10:58:12'),
(177, 12, 'Mahisagar', 'GU', 'mahisagar', NULL, NULL, '2021-08-31 11:00:06', '2021-08-31 11:00:06'),
(178, 12, 'Mehsana', 'GU', 'mehsana', NULL, NULL, '2021-08-31 11:02:00', '2021-08-31 11:02:00'),
(179, 12, 'Morbi', 'GU', 'morbi', NULL, NULL, '2021-08-31 11:03:36', '2021-08-31 11:03:36'),
(180, 12, 'Narmada', 'GU', 'narmada', NULL, NULL, '2021-08-31 11:04:50', '2021-08-31 11:04:50'),
(181, 12, 'Navsari', 'GU', 'navsari', NULL, NULL, '2021-08-31 11:06:43', '2021-08-31 11:06:43'),
(182, 12, 'Panchmahal', 'GU', 'panchmahal', NULL, NULL, '2021-08-31 11:08:09', '2021-08-31 11:08:09'),
(183, 12, 'Patan', 'GU', 'patan', NULL, NULL, '2021-08-31 11:10:03', '2021-08-31 11:10:03'),
(184, 12, 'Porbandar', 'GU', 'porbandar', NULL, NULL, '2021-08-31 11:12:02', '2021-08-31 11:12:02'),
(185, 12, 'Rajkot', 'GU', 'rajkot', NULL, NULL, '2021-08-31 11:13:56', '2021-08-31 11:13:56'),
(186, 12, 'Sabarkantha', 'GU', 'sabarkantha', NULL, NULL, '2021-08-31 11:15:24', '2021-08-31 11:15:24'),
(187, 12, 'Surat', 'GU', 'surat', NULL, NULL, '2021-08-31 11:17:22', '2021-08-31 11:17:22'),
(188, 12, 'Surendranagar', 'GU', 'surendranagar', NULL, NULL, '2021-08-31 11:20:09', '2021-08-31 11:20:09'),
(189, 12, 'Tapi', 'GU', 'tapi', NULL, NULL, '2021-08-31 11:22:09', '2021-08-31 11:22:09'),
(190, 12, 'Vadodara', 'GU', 'vadodara', NULL, NULL, '2021-08-31 11:24:06', '2021-08-31 11:24:06'),
(191, 12, 'Valsad', 'GU', 'valsad', NULL, NULL, '2021-08-31 11:25:06', '2021-08-31 11:25:06'),
(192, 13, 'Ambala', 'HA', 'ambala', NULL, NULL, '2021-08-31 11:26:59', '2021-08-31 11:26:59'),
(193, 13, 'Bhiwani', 'HA', 'bhiwani', NULL, NULL, '2021-08-31 11:28:58', '2021-08-31 11:28:58'),
(194, 13, 'Charkhi Dadri', 'HA', 'charkhi-dadri', NULL, NULL, '2021-08-31 11:30:55', '2021-08-31 11:30:56'),
(195, 13, 'Faridabad', 'HA', 'faridabad', NULL, NULL, '2021-08-31 11:33:20', '2021-08-31 11:33:20'),
(196, 13, 'Fatehabad', 'HA', 'fatehabad', NULL, NULL, '2021-08-31 11:35:34', '2021-08-31 11:35:34'),
(197, 13, 'Gurugram', 'HA', 'gurugram', NULL, NULL, '2021-08-31 11:39:27', '2021-08-31 11:39:27'),
(198, 13, 'Hisar', 'HA', 'hisar', NULL, NULL, '2021-08-31 11:40:04', '2021-08-31 11:40:04'),
(199, 13, 'Jhajjar', 'HA', 'jhajjar', NULL, NULL, '2021-08-31 11:41:28', '2021-08-31 11:41:28'),
(200, 13, 'Jind', 'HA', 'jind', NULL, NULL, '2021-08-31 11:42:32', '2021-08-31 11:42:32'),
(201, 13, 'Kaithal', 'HA', 'kaithal', NULL, NULL, '2021-08-31 11:44:57', '2021-08-31 11:44:57'),
(202, 13, 'Karnal', 'HA', 'karnal', NULL, NULL, '2021-08-31 11:47:57', '2021-08-31 11:47:57'),
(203, 13, 'Kurukshetra', 'HA', 'kurukshetra', NULL, NULL, '2021-08-31 11:50:02', '2021-08-31 11:50:02'),
(204, 13, 'Mahendragarh', 'HA', 'mahendragarh', NULL, NULL, '2021-08-31 11:51:15', '2021-08-31 11:51:15'),
(205, 13, 'Mewat', 'HA', 'mewat', NULL, NULL, '2021-08-31 11:53:10', '2021-08-31 11:53:10'),
(206, 13, 'Palwal', 'HA', 'palwal', NULL, NULL, '2021-08-31 11:55:06', '2021-08-31 11:55:06'),
(207, 13, 'Panchkula', 'HA', 'panchkula', NULL, NULL, '2021-08-31 11:57:07', '2021-08-31 11:57:07'),
(208, 13, 'Panipat', 'HA', 'panipat', NULL, NULL, '2021-08-31 11:59:12', '2021-08-31 11:59:12'),
(209, 13, 'Rewari', 'HA', 'rewari', NULL, NULL, '2021-08-31 12:01:11', '2021-08-31 12:01:11'),
(210, 13, 'Rohtak', 'HA', 'rohtak', NULL, NULL, '2021-08-31 12:03:11', '2021-08-31 12:03:11'),
(211, 13, 'Sirsa', 'HA', 'sirsa', NULL, NULL, '2021-08-31 12:05:41', '2021-08-31 12:05:41'),
(212, 13, 'Sonipat', 'HA', 'sonipat', NULL, NULL, '2021-08-31 12:09:09', '2021-08-31 12:09:09'),
(213, 13, 'Yamunanagar', 'HA', 'yamunanagar', NULL, NULL, '2021-08-31 12:11:11', '2021-08-31 12:11:11'),
(214, 14, 'Bilaspur', 'HP', 'bilaspur', NULL, NULL, '2021-08-31 12:14:01', '2021-08-31 12:14:01'),
(215, 14, 'Chamba', 'HP', 'chamba', NULL, NULL, '2021-08-31 12:16:20', '2021-08-31 12:16:20'),
(216, 14, 'Hamirpur', 'HP', 'hamirpur', NULL, NULL, '2021-08-31 12:18:38', '2021-08-31 12:18:38'),
(217, 14, 'Kangra', 'HP', 'kangra', NULL, NULL, '2021-08-31 12:20:29', '2021-08-31 12:20:29'),
(218, 14, 'Kinnaur', 'HP', 'kinnaur', NULL, NULL, '2021-08-31 12:21:19', '2021-08-31 12:21:19'),
(219, 14, 'Kullu', 'HP', 'kullu', NULL, NULL, '2021-08-31 12:23:06', '2021-08-31 12:23:06'),
(220, 14, 'Lahaul Spiti', 'HP', 'lahaul-spiti', NULL, NULL, '2021-08-31 12:25:33', '2021-08-31 12:25:33'),
(221, 14, 'Mandi', 'HP', 'mandi', NULL, NULL, '2021-08-31 12:27:51', '2021-08-31 12:27:51'),
(222, 14, 'Shimla', 'HP', 'shimla', NULL, NULL, '2021-08-31 12:29:47', '2021-08-31 12:29:47'),
(223, 14, 'Sirmaur', 'HP', 'sirmaur', NULL, NULL, '2021-08-31 12:31:36', '2021-08-31 12:31:36'),
(224, 14, 'Solan', 'HP', 'solan', NULL, NULL, '2021-08-31 12:33:56', '2021-08-31 12:33:56'),
(225, 14, 'Una', 'HP', 'una', NULL, NULL, '2021-08-31 12:35:47', '2021-08-31 12:35:47'),
(226, 15, 'Anantnag', 'JK', 'anantnag', NULL, NULL, '2021-08-31 12:36:27', '2021-08-31 12:36:27'),
(227, 15, 'Bandipora', 'JK', 'bandipora', NULL, NULL, '2021-08-31 12:38:19', '2021-08-31 12:38:19'),
(228, 15, 'Baramulla', 'JK', 'baramulla', NULL, NULL, '2021-08-31 12:43:05', '2021-08-31 12:43:05'),
(229, 15, 'Budgam', 'JK', 'budgam', NULL, NULL, '2021-08-31 12:44:59', '2021-08-31 12:44:59'),
(230, 15, 'Doda', 'JK', 'doda', NULL, NULL, '2021-08-31 12:48:14', '2021-08-31 12:48:14'),
(231, 15, 'Ganderbal', 'JK', 'ganderbal', NULL, NULL, '2021-08-31 12:50:06', '2021-08-31 12:50:06'),
(232, 15, 'Jammu', 'JK', 'jammu', NULL, NULL, '2021-08-31 12:51:09', '2021-08-31 12:51:09'),
(233, 15, 'Kathua', 'JK', 'kathua', NULL, NULL, '2021-08-31 12:53:13', '2021-08-31 12:53:13'),
(234, 15, 'Kishtwar', 'JK', 'kishtwar', NULL, NULL, '2021-08-31 12:55:12', '2021-08-31 12:55:12'),
(235, 15, 'Kulgam', 'JK', 'kulgam', NULL, NULL, '2021-08-31 12:57:07', '2021-08-31 12:57:07'),
(236, 15, 'Kupwara', 'JK', 'kupwara', NULL, NULL, '2021-08-31 12:58:08', '2021-08-31 12:58:08'),
(237, 15, 'Poonch', 'JK', 'poonch', NULL, NULL, '2021-08-31 13:01:31', '2021-08-31 13:01:31'),
(238, 15, 'Pulwama', 'JK', 'pulwama', NULL, NULL, '2021-08-31 13:03:25', '2021-08-31 13:03:25'),
(239, 15, 'Rajouri', 'JK', 'rajouri', NULL, NULL, '2021-08-31 13:05:15', '2021-08-31 13:05:15'),
(240, 15, 'Ramban', 'JK', 'ramban', NULL, NULL, '2021-08-31 13:07:10', '2021-08-31 13:07:10'),
(241, 15, 'Reasi', 'JK', 'reasi', NULL, NULL, '2021-08-31 13:10:26', '2021-08-31 13:10:26'),
(242, 15, 'Samba', 'JK', 'samba', NULL, NULL, '2021-08-31 13:12:17', '2021-08-31 13:12:17'),
(243, 15, 'Shopian', 'JK', 'shopian', NULL, NULL, '2021-08-31 13:14:09', '2021-08-31 13:14:09'),
(244, 15, 'Srinagar', 'JK', 'srinagar', NULL, NULL, '2021-08-31 13:15:29', '2021-08-31 13:15:29'),
(245, 15, 'Udhampur', 'JK', 'udhampur', NULL, NULL, '2021-08-31 13:18:17', '2021-08-31 13:18:17'),
(246, 16, 'Bokaro', 'JH', 'bokaro', NULL, NULL, '2021-08-31 13:20:11', '2021-08-31 13:20:11'),
(247, 16, 'Chatra', 'JH', 'chatra', NULL, NULL, '2021-08-31 13:21:13', '2021-08-31 13:21:13'),
(248, 16, 'Deoghar', 'JH', 'deoghar', NULL, NULL, '2021-08-31 13:23:09', '2021-08-31 13:23:09'),
(249, 16, 'Dhanbad', 'JH', 'dhanbad', NULL, NULL, '2021-08-31 13:25:12', '2021-08-31 13:25:12'),
(250, 16, 'Dumka', 'JH', 'dumka', NULL, NULL, '2021-08-31 13:27:14', '2021-08-31 13:27:14'),
(251, 16, 'East Singhbhum', 'JH', 'east-singhbhum', NULL, NULL, '2021-08-31 13:29:14', '2021-08-31 13:29:14'),
(252, 16, 'Garhwa', 'JH', 'garhwa', NULL, NULL, '2021-08-31 13:31:10', '2021-08-31 13:31:10'),
(253, 16, 'Giridih', 'JH', 'giridih', NULL, NULL, '2021-08-31 13:33:07', '2021-08-31 13:33:07'),
(254, 16, 'Godda', 'JH', 'godda', NULL, NULL, '2021-08-31 13:35:34', '2021-08-31 13:35:34'),
(255, 16, 'Gumla', 'JH', 'gumla', NULL, NULL, '2021-08-31 13:37:27', '2021-08-31 13:37:27'),
(256, 16, 'Hazaribagh', 'JH', 'hazaribagh', NULL, NULL, '2021-08-31 13:39:28', '2021-08-31 13:39:28'),
(257, 16, 'Jamtara', 'JH', 'jamtara', NULL, NULL, '2021-08-31 13:41:29', '2021-08-31 13:41:29'),
(258, 16, 'Khunti', 'JH', 'khunti', NULL, NULL, '2021-08-31 13:43:24', '2021-08-31 13:43:24'),
(259, 16, 'Koderma', 'JH', 'koderma', NULL, NULL, '2021-08-31 13:45:47', '2021-08-31 13:45:47'),
(260, 16, 'Latehar', 'JH', 'latehar', NULL, NULL, '2021-08-31 13:47:45', '2021-08-31 13:47:45'),
(261, 16, 'Lohardaga', 'JH', 'lohardaga', NULL, NULL, '2021-08-31 13:49:42', '2021-08-31 13:49:42'),
(262, 16, 'Pakur', 'JH', 'pakur', NULL, NULL, '2021-08-31 13:51:38', '2021-08-31 13:51:38'),
(263, 16, 'Palamu', 'JH', 'palamu', NULL, NULL, '2021-08-31 13:53:37', '2021-08-31 13:53:37'),
(264, 16, 'Ramgarh', 'JH', 'ramgarh', NULL, NULL, '2021-08-31 13:55:32', '2021-08-31 13:55:32'),
(265, 16, 'Ranchi', 'JH', 'ranchi', NULL, NULL, '2021-08-31 13:57:56', '2021-08-31 13:57:56'),
(266, 16, 'Sahebganj', 'JH', 'sahebganj', NULL, NULL, '2021-08-31 14:00:06', '2021-08-31 14:00:06'),
(267, 16, 'Seraikela Kharsawan', 'JH', 'seraikela-kharsawan', NULL, NULL, '2021-08-31 14:02:30', '2021-08-31 14:02:30'),
(268, 16, 'Simdega', 'JH', 'simdega', NULL, NULL, '2021-08-31 14:04:24', '2021-08-31 14:04:24'),
(269, 16, 'West Singhbhum', 'JH', 'west-singhbhum', NULL, NULL, '2021-08-31 14:06:22', '2021-08-31 14:06:22'),
(270, 17, 'Bagalkot', 'KA', 'bagalkot', NULL, NULL, '2021-08-31 14:08:17', '2021-08-31 14:08:17'),
(271, 17, 'Bangalore Rural', 'KA', 'bangalore-rural', NULL, NULL, '2021-08-31 14:09:25', '2021-08-31 14:09:25'),
(272, 17, 'Bangalore Urban', 'KA', 'bangalore-urban', NULL, NULL, '2021-08-31 14:11:20', '2021-08-31 14:11:20'),
(273, 17, 'Belgaum', 'KA', 'belgaum', NULL, NULL, '2021-08-31 14:13:22', '2021-08-31 14:13:22'),
(274, 17, 'Bellary', 'KA', 'bellary', NULL, NULL, '2021-08-31 14:16:44', '2021-08-31 14:16:44'),
(275, 17, 'Bidar', 'KA', 'bidar', NULL, NULL, '2021-08-31 14:20:09', '2021-08-31 14:20:09'),
(276, 17, 'Chamarajanagar', 'KA', 'chamarajanagar', NULL, NULL, '2021-08-31 14:22:15', '2021-08-31 14:22:15'),
(277, 17, 'Chikkaballapur', 'KA', 'chikkaballapur', NULL, NULL, '2021-08-31 14:23:27', '2021-08-31 14:23:27'),
(278, 17, 'Chikkamagaluru', 'KA', 'chikkamagaluru', NULL, NULL, '2021-08-31 14:24:19', '2021-08-31 14:24:19'),
(279, 17, 'Chitradurga', 'KA', 'chitradurga', NULL, NULL, '2021-08-31 14:26:45', '2021-08-31 14:26:45'),
(280, 17, 'Dakshina Kannada', 'KA', 'dakshina-kannada', NULL, NULL, '2021-08-31 14:28:39', '2021-08-31 14:28:39'),
(281, 17, 'Davanagere', 'KA', 'davanagere', NULL, NULL, '2021-08-31 14:30:34', '2021-08-31 14:30:34'),
(282, 17, 'Dharwad', 'KA', 'dharwad', NULL, NULL, '2021-08-31 14:31:48', '2021-08-31 14:31:48'),
(283, 17, 'Gadag', 'KA', 'gadag', NULL, NULL, '2021-08-31 14:33:22', '2021-08-31 14:33:22'),
(284, 17, 'Gulbarga', 'KA', 'gulbarga', NULL, NULL, '2021-08-31 14:35:21', '2021-08-31 14:35:21'),
(285, 17, 'Hassan', 'KA', 'hassan', NULL, NULL, '2021-08-31 14:35:56', '2021-08-31 14:35:56'),
(286, 17, 'Haveri', 'KA', 'haveri', NULL, NULL, '2021-08-31 14:36:48', '2021-08-31 14:36:48'),
(287, 17, 'Kodagu', 'KA', 'kodagu', NULL, NULL, '2021-08-31 14:39:18', '2021-08-31 14:39:18'),
(288, 17, 'Kolar', 'KA', 'kolar', NULL, NULL, '2021-08-31 14:42:38', '2021-08-31 14:42:38'),
(289, 17, 'Koppal', 'KA', 'koppal', NULL, NULL, '2021-08-31 14:43:42', '2021-08-31 14:43:42'),
(290, 17, 'Mandya', 'KA', 'mandya', NULL, NULL, '2021-08-31 14:47:38', '2021-08-31 14:47:38'),
(291, 17, 'Mysore', 'KA', 'mysore', NULL, NULL, '2021-08-31 14:49:34', '2021-08-31 14:49:34'),
(292, 17, 'Raichur', 'KA', 'raichur', NULL, NULL, '2021-08-31 14:51:57', '2021-08-31 14:51:57'),
(293, 17, 'Ramanagara', 'KA', 'ramanagara', NULL, NULL, '2021-08-31 14:53:08', '2021-08-31 14:53:08'),
(294, 17, 'Shimoga', 'KA', 'shimoga', NULL, NULL, '2021-08-31 14:55:05', '2021-08-31 14:55:05'),
(295, 17, 'Tumkur', 'KA', 'tumkur', NULL, NULL, '2021-08-31 14:57:03', '2021-08-31 14:57:03'),
(296, 17, 'Udupi', 'KA', 'udupi', NULL, NULL, '2021-08-31 14:58:58', '2021-08-31 14:58:58'),
(297, 17, 'Uttara Kannada', 'KA', 'uttara-kannada', NULL, NULL, '2021-08-31 15:01:15', '2021-08-31 15:01:15'),
(298, 17, 'Vijayanagara', 'KA', 'vijayanagara', NULL, NULL, '2021-08-31 15:03:09', '2021-08-31 15:03:09'),
(299, 17, 'Vijayapura ', 'KA', 'vijayapura', NULL, NULL, '2021-08-31 15:05:11', '2021-08-31 15:05:11'),
(300, 17, 'Yadgir', 'KA', 'yadgir', NULL, NULL, '2021-08-31 15:07:05', '2021-08-31 15:07:05'),
(301, 18, 'Alappuzha', 'KE', 'alappuzha', NULL, NULL, '2021-08-31 15:07:56', '2021-08-31 15:07:56'),
(302, 18, 'Ernakulam', 'KE', 'ernakulam', NULL, NULL, '2021-08-31 15:09:21', '2021-08-31 15:09:21'),
(303, 18, 'Idukki', 'KE', 'idukki', NULL, NULL, '2021-08-31 15:11:24', '2021-08-31 15:11:24'),
(304, 18, 'Kannur', 'KE', 'kannur', NULL, NULL, '2021-08-31 15:13:18', '2021-08-31 15:13:18'),
(305, 18, 'Kasaragod', 'KE', 'kasaragod', NULL, NULL, '2021-08-31 15:16:00', '2021-08-31 15:16:00'),
(306, 18, 'Kollam', 'KE', 'kollam', NULL, NULL, '2021-08-31 15:18:01', '2021-08-31 15:18:01'),
(307, 18, 'Kottayam', 'KE', 'kottayam', NULL, NULL, '2021-08-31 15:20:34', '2021-08-31 15:20:34'),
(308, 18, 'Kozhikode', 'KE', 'kozhikode', NULL, NULL, '2021-08-31 15:22:38', '2021-08-31 15:22:38'),
(309, 18, 'Malappuram', 'KE', 'malappuram', NULL, NULL, '2021-08-31 15:24:45', '2021-08-31 15:24:45'),
(310, 18, 'Palakkad', 'KE', 'palakkad', NULL, NULL, '2021-08-31 15:26:42', '2021-08-31 15:26:42'),
(311, 18, 'Pathanamthitta', 'KE', 'pathanamthitta', NULL, NULL, '2021-08-31 15:29:03', '2021-08-31 15:29:03'),
(312, 18, 'Thiruvananthapuram', 'KE', 'thiruvananthapuram', NULL, NULL, '2021-08-31 15:31:25', '2021-08-31 15:31:25'),
(313, 18, 'Thrissur', 'KE', 'thrissur', NULL, NULL, '2021-08-31 15:32:02', '2021-08-31 15:32:02'),
(314, 18, 'Wayanad', 'KE', 'wayanad', NULL, NULL, '2021-08-31 15:34:07', '2021-08-31 15:34:07'),
(315, 37, 'Kargil', 'LA', 'kargil', NULL, NULL, '2021-08-31 15:36:32', '2021-08-31 15:36:32'),
(316, 37, 'Leh', 'LA', 'leh', NULL, NULL, '2021-08-31 15:38:27', '2021-08-31 15:38:27'),
(317, 19, 'Lakshadweep', 'LD', 'lakshadweep', NULL, NULL, '2021-08-31 15:40:29', '2021-08-31 15:40:29'),
(318, 20, 'Agar Malwa', 'MP', 'agar-malwa', NULL, NULL, '2021-08-31 15:42:25', '2021-08-31 15:42:25'),
(319, 20, 'Alirajpur', 'MP', 'alirajpur', NULL, NULL, '2021-08-31 15:44:48', '2021-08-31 15:44:48'),
(320, 20, 'Anuppur', 'MP', 'anuppur', NULL, NULL, '2021-08-31 15:46:41', '2021-08-31 15:46:41'),
(321, 20, 'Ashoknagar', 'MP', 'ashoknagar', NULL, NULL, '2021-08-31 15:49:07', '2021-08-31 15:49:07'),
(322, 20, 'Balaghat', 'MP', 'balaghat', NULL, NULL, '2021-08-31 15:51:04', '2021-08-31 15:51:04'),
(323, 20, 'Barwani', 'MP', 'barwani', NULL, NULL, '2021-08-31 15:54:01', '2021-08-31 15:54:01'),
(324, 20, 'Betul', 'MP', 'betul', NULL, NULL, '2021-08-31 15:57:21', '2021-08-31 15:57:21'),
(325, 20, 'Bhind', 'MP', 'bhind', NULL, NULL, '2021-08-31 15:58:25', '2021-08-31 15:58:25'),
(326, 20, 'Bhopal', 'MP', 'bhopal', NULL, NULL, '2021-08-31 16:00:51', '2021-08-31 16:00:51'),
(327, 20, 'Burhanpur', 'MP', 'burhanpur', NULL, NULL, '2021-08-31 16:03:06', '2021-08-31 16:03:06'),
(328, 20, 'Chachaura', 'MP', 'chachaura', NULL, NULL, '2021-08-31 16:04:29', '2021-08-31 16:04:29'),
(329, 20, 'Chhatarpur', 'MP', 'chhatarpur', NULL, NULL, '2021-08-31 16:06:23', '2021-08-31 16:06:23'),
(330, 20, 'Chhindwara', 'MP', 'chhindwara', NULL, NULL, '2021-08-31 16:07:38', '2021-08-31 16:07:38'),
(331, 20, 'Damoh', 'MP', 'damoh', NULL, NULL, '2021-08-31 16:09:03', '2021-08-31 16:09:03'),
(332, 20, 'Datia', 'MP', 'datia', NULL, NULL, '2021-08-31 16:10:56', '2021-08-31 16:10:56'),
(333, 20, 'Dewas', 'MP', 'dewas', NULL, NULL, '2021-08-31 16:12:50', '2021-08-31 16:12:50'),
(334, 20, 'Dhar', 'MP', 'dhar', NULL, NULL, '2021-08-31 16:15:20', '2021-08-31 16:15:20'),
(335, 20, 'Dindori', 'MP', 'dindori', NULL, NULL, '2021-08-31 16:17:42', '2021-08-31 16:17:42'),
(336, 20, 'Guna', 'MP', 'guna', NULL, NULL, '2021-08-31 16:20:06', '2021-08-31 16:20:06'),
(337, 20, 'Gwalior', 'MP', 'gwalior', NULL, NULL, '2021-08-31 16:22:34', '2021-08-31 16:22:34'),
(338, 20, 'Harda', 'MP', 'harda', NULL, NULL, '2021-08-31 16:24:42', '2021-08-31 16:24:42'),
(339, 20, 'Hoshangabad', 'MP', 'hoshangabad', NULL, NULL, '2021-08-31 16:26:44', '2021-08-31 16:26:44'),
(340, 20, 'Indore', 'MP', 'indore', NULL, NULL, '2021-08-31 16:28:40', '2021-08-31 16:28:40'),
(341, 20, 'Jabalpur', 'MP', 'jabalpur', NULL, NULL, '2021-08-31 16:30:49', '2021-08-31 16:30:49'),
(342, 20, 'Jhabua', 'MP', 'jhabua', NULL, NULL, '2021-08-31 16:32:58', '2021-08-31 16:32:58'),
(343, 20, 'Katni', 'MP', 'katni', NULL, NULL, '2021-08-31 16:34:56', '2021-08-31 16:34:56'),
(344, 20, 'Khandwa', 'MP', 'khandwa', NULL, NULL, '2021-08-31 16:37:25', '2021-08-31 16:37:25'),
(345, 20, 'Khargone', 'MP', 'khargone', NULL, NULL, '2021-08-31 16:39:23', '2021-08-31 16:39:23'),
(346, 20, 'Maihar', 'MP', 'maihar', NULL, NULL, '2021-08-31 16:40:14', '2021-08-31 16:40:14'),
(347, 20, 'Mandla', 'MP', 'mandla', NULL, NULL, '2021-08-31 16:42:41', '2021-08-31 16:42:41'),
(348, 20, 'Mandsaur', 'MP', 'mandsaur', NULL, NULL, '2021-08-31 16:45:05', '2021-08-31 16:45:05'),
(349, 20, 'Morena', 'MP', 'morena', NULL, NULL, '2021-08-31 16:47:55', '2021-08-31 16:47:55'),
(350, 20, 'Nagda', 'MP', 'nagda', NULL, NULL, '2021-08-31 16:48:50', '2021-08-31 16:48:50'),
(351, 20, 'Narsinghpur', 'MP', 'narsinghpur', NULL, NULL, '2021-08-31 16:52:14', '2021-08-31 16:52:14'),
(352, 20, 'Neemuch', 'MP', 'neemuch', NULL, NULL, '2021-08-31 16:54:08', '2021-08-31 16:54:08'),
(353, 20, 'Niwari', 'MP', 'niwari', NULL, NULL, '2021-08-31 16:56:39', '2021-08-31 16:56:39'),
(354, 20, 'Panna', 'MP', 'panna', NULL, NULL, '2021-08-31 16:59:01', '2021-08-31 16:59:01'),
(355, 20, 'Raisen', 'MP', 'raisen', NULL, NULL, '2021-08-31 17:00:44', '2021-08-31 17:00:44'),
(356, 20, 'Rajgarh', 'MP', 'rajgarh', NULL, NULL, '2021-08-31 17:02:40', '2021-08-31 17:02:40'),
(357, 20, 'Ratlam', 'MP', 'ratlam', NULL, NULL, '2021-08-31 17:05:02', '2021-08-31 17:05:02'),
(358, 20, 'Rewa', 'MP', 'rewa', NULL, NULL, '2021-08-31 17:07:00', '2021-08-31 17:07:00'),
(359, 20, 'Sagar', 'MP', 'sagar', NULL, NULL, '2021-08-31 17:09:03', '2021-08-31 17:09:03'),
(360, 20, 'Satna', 'MP', 'satna', NULL, NULL, '2021-08-31 17:10:48', '2021-08-31 17:10:48'),
(361, 20, 'Sehore', 'MP', 'sehore', NULL, NULL, '2021-08-31 17:12:24', '2021-08-31 17:12:24'),
(362, 20, 'Seoni', 'MP', 'seoni', NULL, NULL, '2021-08-31 17:14:49', '2021-08-31 17:14:49'),
(363, 20, 'Shahdol', 'MP', 'shahdol', NULL, NULL, '2021-08-31 17:15:23', '2021-08-31 17:15:23'),
(364, 20, 'Shajapur', 'MP', 'shajapur', NULL, NULL, '2021-08-31 17:16:05', '2021-08-31 17:16:05'),
(365, 20, 'Sheopur', 'MP', 'sheopur', NULL, NULL, '2021-08-31 17:17:16', '2021-08-31 17:17:16'),
(366, 20, 'Shivpuri', 'MP', 'shivpuri', NULL, NULL, '2021-08-31 17:19:11', '2021-08-31 17:19:11'),
(367, 20, 'Sidhi', 'MP', 'sidhi', NULL, NULL, '2021-08-31 17:20:02', '2021-08-31 17:20:02'),
(368, 20, 'Singrauli', 'MP', 'singrauli', NULL, NULL, '2021-08-31 17:21:56', '2021-08-31 17:21:56'),
(369, 20, 'Tikamgarh', 'MP', 'tikamgarh', NULL, NULL, '2021-08-31 17:24:54', '2021-08-31 17:24:54'),
(370, 20, 'Ujjain', 'MP', 'ujjain', NULL, NULL, '2021-08-31 17:26:51', '2021-08-31 17:26:51'),
(371, 20, 'Umaria', 'MP', 'umaria', NULL, NULL, '2021-08-31 17:28:51', '2021-08-31 17:28:51'),
(372, 20, 'Vidisha', 'MP', 'vidisha', NULL, NULL, '2021-08-31 17:30:58', '2021-08-31 17:30:58'),
(373, 21, 'Ahmednagar', 'MH', 'ahmednagar', NULL, NULL, '2021-08-31 17:33:09', '2021-08-31 17:33:09'),
(374, 21, 'Akola', 'MH', 'akola', NULL, NULL, '2021-08-31 17:35:16', '2021-08-31 17:35:16'),
(375, 21, 'Amravati', 'MH', 'amravati', NULL, NULL, '2021-08-31 17:37:13', '2021-08-31 17:37:13'),
(376, 21, 'Aurangabad', 'MH', 'aurangabad', NULL, NULL, '2021-08-31 17:39:26', '2021-08-31 17:39:26'),
(377, 21, 'Beed', 'MH', 'beed', NULL, NULL, '2021-08-31 17:41:43', '2021-08-31 17:41:43'),
(378, 21, 'Bhandara', 'MH', 'bhandara', NULL, NULL, '2021-08-31 17:43:51', '2021-08-31 17:43:51'),
(379, 21, 'Buldhana', 'MH', 'buldhana', NULL, NULL, '2021-08-31 17:46:02', '2021-08-31 17:46:02'),
(380, 21, 'Chandrapur', 'MH', 'chandrapur', NULL, NULL, '2021-08-31 17:48:07', '2021-08-31 17:48:07'),
(381, 21, 'Dhule', 'MH', 'dhule', NULL, NULL, '2021-08-31 17:50:20', '2021-08-31 17:50:20'),
(382, 21, 'Gadchiroli', 'MH', 'gadchiroli', NULL, NULL, '2021-08-31 17:52:22', '2021-08-31 17:52:22'),
(383, 21, 'Gondia', 'MH', 'gondia', NULL, NULL, '2021-08-31 17:53:06', '2021-08-31 17:53:06'),
(384, 21, 'Hingoli', 'MH', 'hingoli', NULL, NULL, '2021-08-31 17:54:20', '2021-08-31 17:54:20'),
(385, 21, 'Jalgaon', 'MH', 'jalgaon', NULL, NULL, '2021-08-31 17:56:33', '2021-08-31 17:56:33'),
(386, 21, 'Jalna', 'MH', 'jalna', NULL, NULL, '2021-08-31 17:58:47', '2021-08-31 17:58:47'),
(387, 21, 'Kolhapur', 'MH', 'kolhapur', NULL, NULL, '2021-08-31 18:00:03', '2021-08-31 18:00:03'),
(388, 21, 'Latur', 'MH', 'latur', NULL, NULL, '2021-08-31 18:02:52', '2021-08-31 18:02:52'),
(389, 21, 'Mumbai City', 'MH', 'mumbai-city', NULL, NULL, '2021-08-31 18:04:28', '2021-08-31 18:04:28'),
(390, 21, 'Mumbai Suburban', 'MH', 'mumbai-suburban', NULL, NULL, '2021-08-31 18:06:34', '2021-08-31 18:06:34'),
(391, 21, 'Nagpur', 'MH', 'nagpur', NULL, NULL, '2021-08-31 18:08:43', '2021-08-31 18:08:43'),
(392, 21, 'Nanded', 'MH', 'nanded', NULL, NULL, '2021-08-31 18:11:06', '2021-08-31 18:11:06'),
(393, 21, 'Nandurbar', 'MH', 'nandurbar', NULL, NULL, '2021-08-31 18:13:19', '2021-08-31 18:13:19'),
(394, 21, 'Nashik', 'MH', 'nashik', NULL, NULL, '2021-08-31 18:15:33', '2021-08-31 18:15:33'),
(395, 21, 'Osmanabad', 'MH', 'osmanabad', NULL, NULL, '2021-08-31 18:17:56', '2021-08-31 18:17:56'),
(396, 21, 'Palghar', 'MH', 'palghar', NULL, NULL, '2021-08-31 18:20:04', '2021-08-31 18:20:04'),
(397, 21, 'Parbhani', 'MH', 'parbhani', NULL, NULL, '2021-08-31 18:22:12', '2021-08-31 18:22:12'),
(398, 21, 'Pune', 'MH', 'pune', NULL, NULL, '2021-08-31 18:24:22', '2021-08-31 18:24:22'),
(399, 21, 'Raigad', 'MH', 'raigad', NULL, NULL, '2021-08-31 18:26:44', '2021-08-31 18:26:44'),
(400, 21, 'Ratnagiri', 'MH', 'ratnagiri', NULL, NULL, '2021-08-31 18:29:11', '2021-08-31 18:29:11'),
(401, 21, 'Sangli', 'MH', 'sangli', NULL, NULL, '2021-08-31 18:31:19', '2021-08-31 18:31:19'),
(402, 21, 'Satara', 'MH', 'satara', NULL, NULL, '2021-08-31 18:33:25', '2021-08-31 18:33:25'),
(403, 21, 'Sindhudurg', 'MH', 'sindhudurg', NULL, NULL, '2021-08-31 18:35:08', '2021-08-31 18:35:08'),
(404, 21, 'Solapur', 'MH', 'solapur', NULL, NULL, '2021-08-31 18:37:41', '2021-08-31 18:37:41'),
(405, 21, 'Thane', 'MH', 'thane', NULL, NULL, '2021-08-31 18:40:05', '2021-08-31 18:40:05'),
(406, 21, 'Wardha', 'MH', 'wardha', NULL, NULL, '2021-08-31 18:42:26', '2021-08-31 18:42:26'),
(407, 21, 'Washim', 'MH', 'washim', NULL, NULL, '2021-08-31 18:44:36', '2021-08-31 18:44:36'),
(408, 21, 'Yavatmal', 'MH', 'yavatmal', NULL, NULL, '2021-08-31 18:46:43', '2021-08-31 18:46:43'),
(409, 22, 'Bishnupur', 'MN', 'bishnupur', NULL, NULL, '2021-08-31 18:47:59', '2021-08-31 18:47:59'),
(410, 22, 'Chandel', 'MN', 'chandel', NULL, NULL, '2021-08-31 18:50:03', '2021-08-31 18:50:03'),
(411, 22, 'Churachandpur', 'MN', 'churachandpur', NULL, NULL, '2021-08-31 18:51:30', '2021-08-31 18:51:30'),
(412, 22, 'Imphal East', 'MN', 'imphal-east', NULL, NULL, '2021-08-31 18:53:44', '2021-08-31 18:53:44'),
(413, 22, 'Imphal West', 'MN', 'imphal-west', NULL, NULL, '2021-08-31 18:55:49', '2021-08-31 18:55:49'),
(414, 22, 'Jiribam', 'MN', 'jiribam', NULL, NULL, '2021-08-31 18:57:54', '2021-08-31 18:57:54'),
(415, 22, 'Kakching', 'MN', 'kakching', NULL, NULL, '2021-08-31 18:59:56', '2021-08-31 18:59:56'),
(416, 22, 'Kamjong', 'MN', 'kamjong', NULL, NULL, '2021-08-31 19:02:03', '2021-08-31 19:02:03'),
(417, 22, 'Kangpokpi', 'MN', 'kangpokpi', NULL, NULL, '2021-08-31 19:04:14', '2021-08-31 19:04:14'),
(418, 22, 'Noney', 'MN', 'noney', NULL, NULL, '2021-08-31 19:06:19', '2021-08-31 19:06:19'),
(419, 22, 'Pherzawl', 'MN', 'pherzawl', NULL, NULL, '2021-08-31 19:08:20', '2021-08-31 19:08:20'),
(420, 22, 'Senapati', 'MN', 'senapati', NULL, NULL, '2021-08-31 19:09:11', '2021-08-31 19:09:11'),
(421, 22, 'Tamenglong', 'MN', 'tamenglong', NULL, NULL, '2021-08-31 19:13:06', '2021-08-31 19:13:06'),
(422, 22, 'Tengnoupal', 'MN', 'tengnoupal', NULL, NULL, '2021-08-31 19:14:51', '2021-08-31 19:14:51'),
(423, 22, 'Thoubal', 'MN', 'thoubal', NULL, NULL, '2021-08-31 19:16:33', '2021-08-31 19:16:33'),
(424, 22, 'Ukhrul', 'MN', 'ukhrul', NULL, NULL, '2021-08-31 19:18:29', '2021-08-31 19:18:29'),
(425, 23, 'East Garo Hills', 'MG', 'east-garo-hills', NULL, NULL, '2021-08-31 19:20:24', '2021-08-31 19:20:24'),
(426, 23, 'East Jaintia Hills', 'MG', 'east-jaintia-hills', NULL, NULL, '2021-08-31 19:23:45', '2021-08-31 19:23:45'),
(427, 23, 'East Khasi Hills', 'MG', 'east-khasi-hills', NULL, NULL, '2021-08-31 19:26:39', '2021-08-31 19:26:39'),
(428, 23, 'North Garo Hills', 'MG', 'north-garo-hills', NULL, NULL, '2021-08-31 19:29:35', '2021-08-31 19:29:35'),
(429, 23, 'Ri Bhoi', 'MG', 'ri-bhoi', NULL, NULL, '2021-08-31 19:31:31', '2021-08-31 19:31:31'),
(430, 23, 'South Garo Hills', 'MG', 'south-garo-hills', NULL, NULL, '2021-08-31 19:33:58', '2021-08-31 19:33:58'),
(431, 23, 'South West Garo Hills', 'MG', 'south-west-garo-hills', NULL, NULL, '2021-08-31 19:35:45', '2021-08-31 19:35:45'),
(432, 23, 'South West Khasi Hills', 'MG', 'south-west-khasi-hills', NULL, NULL, '2021-08-31 19:38:06', '2021-08-31 19:38:06'),
(433, 23, 'West Garo Hills', 'MG', 'west-garo-hills', NULL, NULL, '2021-08-31 19:40:25', '2021-08-31 19:40:25'),
(434, 23, 'West Jaintia Hills', 'MG', 'west-jaintia-hills', NULL, NULL, '2021-08-31 19:42:10', '2021-08-31 19:42:10'),
(435, 23, 'West Khasi Hills', 'MG', 'west-khasi-hills', NULL, NULL, '2021-08-31 19:45:04', '2021-08-31 19:45:04'),
(436, 24, 'Aizawl', 'MI', 'aizawl', NULL, NULL, '2021-08-31 19:46:59', '2021-08-31 19:46:59'),
(437, 24, 'Champhai', 'MI', 'champhai', NULL, NULL, '2021-08-31 19:47:35', '2021-08-31 19:47:35'),
(438, 24, 'Hnahthial', 'MI', 'hnahthial', NULL, NULL, '2021-08-31 19:50:27', '2021-08-31 19:50:27'),
(439, 24, 'Kolasib', 'MI', 'kolasib', NULL, NULL, '2021-08-31 19:53:15', '2021-08-31 19:53:15'),
(440, 24, 'Khawzawl', 'MI', 'khawzawl', NULL, NULL, '2021-08-31 19:55:39', '2021-08-31 19:55:39'),
(441, 24, 'Lawngtlai', 'MI', 'lawngtlai', NULL, NULL, '2021-08-31 19:58:01', '2021-08-31 19:58:01'),
(442, 24, 'Lunglei', 'MI', 'lunglei', NULL, NULL, '2021-08-31 20:01:52', '2021-08-31 20:01:52'),
(443, 24, 'Mamit', 'MI', 'mamit', NULL, NULL, '2021-08-31 20:03:12', '2021-08-31 20:03:12'),
(444, 24, 'Saiha', 'MI', 'saiha', NULL, NULL, '2021-08-31 20:06:07', '2021-08-31 20:06:07'),
(445, 24, 'Serchhip', 'MI', 'serchhip', NULL, NULL, '2021-08-31 20:08:01', '2021-08-31 20:08:01'),
(446, 24, 'Saitual', 'MI', 'saitual', NULL, NULL, '2021-08-31 20:10:54', '2021-08-31 20:10:54'),
(447, 25, 'Dimapur', 'NG', 'dimapur', NULL, NULL, '2021-08-31 20:13:18', '2021-08-31 20:13:18'),
(448, 25, 'Kiphire', 'NG', 'kiphire', NULL, NULL, '2021-08-31 20:15:31', '2021-08-31 20:15:31'),
(449, 25, 'Kohima', 'NG', 'kohima', NULL, NULL, '2021-08-31 20:17:27', '2021-08-31 20:17:27'),
(450, 25, 'Longleng', 'NG', 'longleng', NULL, NULL, '2021-08-31 20:19:35', '2021-08-31 20:19:35'),
(451, 25, 'Mokokchung', 'NG', 'mokokchung', NULL, NULL, '2021-08-31 20:21:58', '2021-08-31 20:21:58'),
(452, 25, 'Mon', 'NG', 'mon', NULL, NULL, '2021-08-31 20:23:02', '2021-08-31 20:23:02'),
(453, 25, 'Noklak', 'NG', 'noklak', NULL, NULL, '2021-08-31 20:25:29', '2021-08-31 20:25:29'),
(454, 25, 'Peren', 'NG', 'peren', NULL, NULL, '2021-08-31 20:27:21', '2021-08-31 20:27:21'),
(455, 25, 'Phek', 'NG', 'phek', NULL, NULL, '2021-08-31 20:29:13', '2021-08-31 20:29:13'),
(456, 25, 'Tuensang', 'NG', 'tuensang', NULL, NULL, '2021-08-31 20:31:05', '2021-08-31 20:31:05'),
(457, 25, 'Wokha', 'NG', 'wokha', NULL, NULL, '2021-08-31 20:32:25', '2021-08-31 20:32:25'),
(458, 25, 'Zunheboto', 'NG', 'zunheboto', NULL, NULL, '2021-08-31 20:34:17', '2021-08-31 20:34:17'),
(459, 26, 'Angul', 'OD', 'angul', NULL, NULL, '2021-08-31 20:36:11', '2021-08-31 20:36:11'),
(460, 26, 'Balangir', 'OD', 'balangir', NULL, NULL, '2021-08-31 20:38:04', '2021-08-31 20:38:04'),
(461, 26, 'Balasore', 'OD', 'balasore', NULL, NULL, '2021-08-31 20:39:57', '2021-08-31 20:39:57'),
(462, 26, 'Bargarh', 'OD', 'bargarh', NULL, NULL, '2021-08-31 20:41:50', '2021-08-31 20:41:50'),
(463, 26, 'Bhadrak', 'OD', 'bhadrak', NULL, NULL, '2021-08-31 20:43:39', '2021-08-31 20:43:39'),
(464, 26, 'Boudh', 'OD', 'boudh', NULL, NULL, '2021-08-31 20:45:34', '2021-08-31 20:45:34'),
(465, 26, 'Cuttack', 'OD', 'cuttack', NULL, NULL, '2021-08-31 20:47:27', '2021-08-31 20:47:27'),
(466, 26, 'Debagarh', 'OD', 'debagarh', NULL, NULL, '2021-08-31 20:50:02', '2021-08-31 20:50:02'),
(467, 26, 'Dhenkanal', 'OD', 'dhenkanal', NULL, NULL, '2021-08-31 20:51:55', '2021-08-31 20:51:55'),
(468, 26, 'Gajapati', 'OD', 'gajapati', NULL, NULL, '2021-08-31 20:53:48', '2021-08-31 20:53:48'),
(469, 26, 'Ganjam', 'OD', 'ganjam', NULL, NULL, '2021-08-31 20:56:38', '2021-08-31 20:56:38'),
(470, 26, 'Jagatsinghpur', 'OD', 'jagatsinghpur', NULL, NULL, '2021-08-31 20:58:31', '2021-08-31 20:58:31'),
(471, 26, 'Jajpur', 'OD', 'jajpur', NULL, NULL, '2021-08-31 21:00:23', '2021-08-31 21:00:23'),
(472, 26, 'Jharsuguda', 'OD', 'jharsuguda', NULL, NULL, '2021-08-31 21:02:17', '2021-08-31 21:02:17'),
(473, 26, 'Kalahandi', 'OD', 'kalahandi', NULL, NULL, '2021-08-31 21:04:46', '2021-08-31 21:04:46'),
(474, 26, 'Kandhamal', 'OD', 'kandhamal', NULL, NULL, '2021-08-31 21:07:03', '2021-08-31 21:07:03'),
(475, 26, 'Kendrapara', 'OD', 'kendrapara', NULL, NULL, '2021-08-31 21:09:22', '2021-08-31 21:09:22'),
(476, 26, 'Kendujhar', 'OD', 'kendujhar', NULL, NULL, '2021-08-31 21:11:16', '2021-08-31 21:11:16'),
(477, 26, 'Khordha', 'OD', 'khordha', NULL, NULL, '2021-08-31 21:12:25', '2021-08-31 21:12:25'),
(478, 26, 'Koraput', 'OD', 'koraput', NULL, NULL, '2021-08-31 21:14:18', '2021-08-31 21:14:18'),
(479, 26, 'Malkangiri', 'OD', 'malkangiri', NULL, NULL, '2021-08-31 21:16:11', '2021-08-31 21:16:11'),
(480, 26, 'Mayurbhanj', 'OD', 'mayurbhanj', NULL, NULL, '2021-08-31 21:19:01', '2021-08-31 21:19:01'),
(481, 26, 'Nabarangpur', 'OD', 'nabarangpur', NULL, NULL, '2021-08-31 21:20:56', '2021-08-31 21:20:56'),
(482, 26, 'Nayagarh', 'OD', 'nayagarh', NULL, NULL, '2021-08-31 21:23:45', '2021-08-31 21:23:45'),
(483, 26, 'Nuapada', 'OD', 'nuapada', NULL, NULL, '2021-08-31 21:25:40', '2021-08-31 21:25:40'),
(484, 26, 'Puri', 'OD', 'puri', NULL, NULL, '2021-08-31 21:28:05', '2021-08-31 21:28:05'),
(485, 26, 'Rayagada', 'OD', 'rayagada', NULL, NULL, '2021-08-31 21:30:25', '2021-08-31 21:30:25'),
(486, 26, 'Sambalpur', 'OD', 'sambalpur', NULL, NULL, '2021-08-31 21:32:50', '2021-08-31 21:32:50'),
(487, 26, 'Subarnapur', 'OD', 'subarnapur', NULL, NULL, '2021-08-31 21:33:15', '2021-08-31 21:33:15'),
(488, 26, 'Sundergarh', 'OD', 'sundergarh', NULL, NULL, '2021-08-31 21:35:12', '2021-08-31 21:35:12'),
(489, 27, 'Karaikal', 'PC', 'karaikal', NULL, NULL, '2021-08-31 21:36:23', '2021-08-31 21:36:23'),
(490, 27, 'Mahe', 'PC', 'mahe', NULL, NULL, '2021-08-31 21:37:46', '2021-08-31 21:37:46'),
(491, 27, 'Puducherry', 'PC', 'puducherry', NULL, NULL, '2021-08-31 21:39:41', '2021-08-31 21:39:41'),
(492, 27, 'Yanam', 'PC', 'yanam', NULL, NULL, '2021-08-31 21:41:52', '2021-08-31 21:41:52'),
(493, 28, 'Amritsar', 'PU', 'amritsar', NULL, NULL, '2021-08-31 21:44:13', '2021-08-31 21:44:13'),
(494, 28, 'Barnala', 'PU', 'barnala', NULL, NULL, '2021-08-31 21:45:36', '2021-08-31 21:45:36'),
(495, 28, 'Bathinda', 'PU', 'bathinda', NULL, NULL, '2021-08-31 21:47:29', '2021-08-31 21:47:29'),
(496, 28, 'Faridkot', 'PU', 'faridkot', NULL, NULL, '2021-08-31 21:48:57', '2021-08-31 21:48:57'),
(497, 28, 'Fatehgarh Sahib', 'PU', 'fatehgarh-sahib', NULL, NULL, '2021-08-31 21:52:16', '2021-08-31 21:52:16'),
(498, 28, 'Fazilka', 'PU', 'fazilka', NULL, NULL, '2021-08-31 21:54:39', '2021-08-31 21:54:39'),
(499, 28, 'Firozpur', 'PU', 'firozpur', NULL, NULL, '2021-08-31 21:56:09', '2021-08-31 21:56:09'),
(500, 28, 'Gurdaspur', 'PU', 'gurdaspur', NULL, NULL, '2021-08-31 21:57:33', '2021-08-31 21:57:33'),
(501, 28, 'Hoshiarpur', 'PU', 'hoshiarpur', NULL, NULL, '2021-08-31 22:00:23', '2021-08-31 22:00:23'),
(502, 28, 'Jalandhar', 'PU', 'jalandhar', NULL, NULL, '2021-08-31 22:02:20', '2021-08-31 22:02:20'),
(503, 28, 'Kapurthala', 'PU', 'kapurthala', NULL, NULL, '2021-08-31 22:04:19', '2021-08-31 22:04:19'),
(504, 28, 'Ludhiana', 'PU', 'ludhiana', NULL, NULL, '2021-08-31 22:05:46', '2021-08-31 22:05:46'),
(505, 28, 'Malerkotla', 'PU', 'malerkotla', NULL, NULL, '2021-08-31 22:07:29', '2021-08-31 22:07:29'),
(506, 28, 'Mansa', 'PU', 'mansa', NULL, NULL, '2021-08-31 22:09:31', '2021-08-31 22:09:31'),
(507, 28, 'Moga', 'PU', 'moga', NULL, NULL, '2021-08-31 22:10:26', '2021-08-31 22:10:26'),
(508, 28, 'Mohali', 'PU', 'mohali', NULL, NULL, '2021-08-31 22:13:00', '2021-08-31 22:13:00'),
(509, 28, 'Muktsar', 'PU', 'muktsar', NULL, NULL, '2021-08-31 22:14:25', '2021-08-31 22:14:25'),
(510, 28, 'Pathankot', 'PU', 'pathankot', NULL, NULL, '2021-08-31 22:15:31', '2021-08-31 22:15:31'),
(511, 28, 'Patiala', 'PU', 'patiala', NULL, NULL, '2021-08-31 22:17:42', '2021-08-31 22:17:42'),
(512, 28, 'Rupnagar', 'PU', 'rupnagar', NULL, NULL, '2021-08-31 22:19:47', '2021-08-31 22:19:47'),
(513, 28, 'Sangrur', 'PU', 'sangrur', NULL, NULL, '2021-08-31 22:21:54', '2021-08-31 22:21:54');
INSERT INTO `cities` (`id`, `state_id`, `city_name`, `city_state`, `city_slug`, `city_lat`, `city_lng`, `created_at`, `updated_at`) VALUES
(514, 28, 'Shaheed Bhagat Singh Nagar', 'PU', 'shaheed-bhagat-singh-nagar', NULL, NULL, '2021-08-31 22:23:33', '2021-08-31 22:23:33'),
(515, 28, 'Tarn Taran', 'PU', 'tarn-taran', NULL, NULL, '2021-08-31 22:25:38', '2021-08-31 22:25:38'),
(516, 29, 'Ajmer', 'RJ', 'ajmer', NULL, NULL, '2021-08-31 22:27:43', '2021-08-31 22:27:43'),
(517, 29, 'Alwar', 'RJ', 'alwar', NULL, NULL, '2021-08-31 22:29:40', '2021-08-31 22:29:40'),
(518, 29, 'Banswara', 'RJ', 'banswara', NULL, NULL, '2021-08-31 22:31:21', '2021-08-31 22:31:21'),
(519, 29, 'Baran', 'RJ', 'baran', NULL, NULL, '2021-08-31 22:32:03', '2021-08-31 22:32:03'),
(520, 29, 'Barmer', 'RJ', 'barmer', NULL, NULL, '2021-08-31 22:35:11', '2021-08-31 22:35:11'),
(521, 29, 'Bharatpur', 'RJ', 'bharatpur', NULL, NULL, '2021-08-31 22:37:26', '2021-08-31 22:37:26'),
(522, 29, 'Bhilwara', 'RJ', 'bhilwara', NULL, NULL, '2021-08-31 22:39:37', '2021-08-31 22:39:37'),
(523, 29, 'Bikaner', 'RJ', 'bikaner', NULL, NULL, '2021-08-31 22:40:39', '2021-08-31 22:40:39'),
(524, 29, 'Bundi', 'RJ', 'bundi', NULL, NULL, '2021-08-31 22:42:12', '2021-08-31 22:42:12'),
(525, 29, 'Chittorgarh', 'RJ', 'chittorgarh', NULL, NULL, '2021-08-31 22:44:19', '2021-08-31 22:44:19'),
(526, 29, 'Churu', 'RJ', 'churu', NULL, NULL, '2021-08-31 22:46:14', '2021-08-31 22:46:14'),
(527, 29, 'Dausa', 'RJ', 'dausa', NULL, NULL, '2021-08-31 22:49:50', '2021-08-31 22:49:50'),
(528, 29, 'Dholpur', 'RJ', 'dholpur', NULL, NULL, '2021-08-31 22:51:59', '2021-08-31 22:51:59'),
(529, 29, 'Dungarpur', 'RJ', 'dungarpur', NULL, NULL, '2021-08-31 22:54:09', '2021-08-31 22:54:09'),
(530, 29, 'Hanumangarh', 'RJ', 'hanumangarh', NULL, NULL, '2021-08-31 22:56:20', '2021-08-31 22:56:20'),
(531, 29, 'Jaipur', 'RJ', 'jaipur', NULL, NULL, '2021-08-31 22:57:14', '2021-08-31 22:57:14'),
(532, 29, 'Jaisalmer', 'RJ', 'jaisalmer', NULL, NULL, '2021-08-31 23:02:01', '2021-08-31 23:02:01'),
(533, 29, 'Jalore', 'RJ', 'jalore', NULL, NULL, '2021-08-31 23:04:12', '2021-08-31 23:04:12'),
(534, 29, 'Jhalawar', 'RJ', 'jhalawar', NULL, NULL, '2021-08-31 23:06:05', '2021-08-31 23:06:05'),
(535, 29, 'Jhunjhunu', 'RJ', 'jhunjhunu', NULL, NULL, '2021-08-31 23:08:44', '2021-08-31 23:08:44'),
(536, 29, 'Jodhpur', 'RJ', 'jodhpur', NULL, NULL, '2021-08-31 23:10:52', '2021-08-31 23:10:52'),
(537, 29, 'Karauli', 'RJ', 'karauli', NULL, NULL, '2021-08-31 23:13:30', '2021-08-31 23:13:30'),
(538, 29, 'Kota', 'RJ', 'kota', NULL, NULL, '2021-08-31 23:15:40', '2021-08-31 23:15:40'),
(539, 29, 'Nagaur', 'RJ', 'nagaur', NULL, NULL, '2021-08-31 23:17:59', '2021-08-31 23:17:59'),
(540, 29, 'Pali', 'RJ', 'pali', NULL, NULL, '2021-08-31 23:20:34', '2021-08-31 23:20:34'),
(541, 29, 'Pratapgarh', 'RJ', 'pratapgarh', NULL, NULL, '2021-08-31 23:22:43', '2021-08-31 23:22:43'),
(542, 29, 'Rajsamand', 'RJ', 'rajsamand', NULL, NULL, '2021-08-31 23:25:18', '2021-08-31 23:25:18'),
(543, 29, 'Sawai Madhopur', 'RJ', 'sawai-madhopur', NULL, NULL, '2021-08-31 23:27:24', '2021-08-31 23:27:24'),
(544, 29, 'Sikar', 'RJ', 'sikar', NULL, NULL, '2021-08-31 23:28:18', '2021-08-31 23:28:18'),
(545, 29, 'Sirohi', 'RJ', 'sirohi', NULL, NULL, '2021-08-31 23:30:29', '2021-08-31 23:30:29'),
(546, 29, 'Sri Ganganagar', 'RJ', 'sri-ganganagar', NULL, NULL, '2021-08-31 23:32:37', '2021-08-31 23:32:37'),
(547, 29, 'Tonk', 'RJ', 'tonk', NULL, NULL, '2021-08-31 23:33:14', '2021-08-31 23:33:14'),
(548, 29, 'Udaipur', 'RJ', 'udaipur', NULL, NULL, '2021-08-31 23:35:25', '2021-08-31 23:35:25'),
(549, 30, 'East Sikkim', 'SK', 'east-sikkim', NULL, NULL, '2021-08-31 23:37:42', '2021-08-31 23:37:42'),
(550, 30, 'North Sikkim', 'SK', 'north-sikkim', NULL, NULL, '2021-08-31 23:40:19', '2021-08-31 23:40:19'),
(551, 30, 'South Sikkim', 'SK', 'south-sikkim', NULL, NULL, '2021-08-31 23:42:52', '2021-08-31 23:42:52'),
(552, 30, 'West Sikkim', 'SK', 'west-sikkim', NULL, NULL, '2021-08-31 23:44:55', '2021-08-31 23:44:55'),
(553, 31, 'Ariyalur', 'TN', 'ariyalur', NULL, NULL, '2021-08-31 23:47:27', '2021-08-31 23:47:27'),
(554, 31, 'Chengalpattu', 'TN', 'chengalpattu', NULL, NULL, '2021-08-31 23:49:28', '2021-08-31 23:49:28'),
(555, 31, 'Chennai', 'TN', 'chennai', NULL, NULL, '2021-08-31 23:50:58', '2021-08-31 23:50:58'),
(556, 31, 'Coimbatore', 'TN', 'coimbatore', NULL, NULL, '2021-08-31 23:53:25', '2021-08-31 23:53:25'),
(557, 31, 'Cuddalore', 'TN', 'cuddalore', NULL, NULL, '2021-08-31 23:55:45', '2021-08-31 23:55:45'),
(558, 31, 'Dharmapuri', 'TN', 'dharmapuri', NULL, NULL, '2021-08-31 23:58:25', '2021-08-31 23:58:25'),
(559, 31, 'Dindigul', 'TN', 'dindigul', NULL, NULL, '2021-09-01 00:01:32', '2021-09-01 00:01:32'),
(560, 31, 'Erode', 'TN', 'erode', NULL, NULL, '2021-09-01 00:03:34', '2021-09-01 00:03:34'),
(561, 31, 'Kallakurichi', 'TN', 'kallakurichi', NULL, NULL, '2021-09-01 00:06:18', '2021-09-01 00:06:18'),
(562, 31, 'Kanchipuram', 'TN', 'kanchipuram', NULL, NULL, '2021-09-01 00:08:53', '2021-09-01 00:08:53'),
(563, 31, 'Kanyakumari', 'TN', 'kanyakumari', NULL, NULL, '2021-09-01 00:11:01', '2021-09-01 00:11:01'),
(564, 31, 'Karur', 'TN', 'karur', NULL, NULL, '2021-09-01 00:13:08', '2021-09-01 00:13:08'),
(565, 31, 'Krishnagiri', 'TN', 'krishnagiri', NULL, NULL, '2021-09-01 00:14:44', '2021-09-01 00:14:44'),
(566, 31, 'Madurai', 'TN', 'madurai', NULL, NULL, '2021-09-01 00:16:41', '2021-09-01 00:16:41'),
(567, 31, 'Mayiladuthurai ', 'TN', 'mayiladuthurai', NULL, NULL, '2021-09-01 00:18:54', '2021-09-01 00:18:54'),
(568, 31, 'Nagapattinam', 'TN', 'nagapattinam', NULL, NULL, '2021-09-01 00:21:47', '2021-09-01 00:21:47'),
(569, 31, 'Namakkal', 'TN', 'namakkal', NULL, NULL, '2021-09-01 00:24:38', '2021-09-01 00:24:38'),
(570, 31, 'Nilgiris', 'TN', 'nilgiris', NULL, NULL, '2021-09-01 00:26:34', '2021-09-01 00:26:34'),
(571, 31, 'Perambalur', 'TN', 'perambalur', NULL, NULL, '2021-09-01 00:29:27', '2021-09-01 00:29:27'),
(572, 31, 'Pudukkottai', 'TN', 'pudukkottai', NULL, NULL, '2021-09-01 00:31:22', '2021-09-01 00:31:22'),
(573, 31, 'Ramanathapuram', 'TN', 'ramanathapuram', NULL, NULL, '2021-09-01 00:32:15', '2021-09-01 00:32:15'),
(574, 31, 'Ranipet', 'TN', 'ranipet', NULL, NULL, '2021-09-01 00:34:29', '2021-09-01 00:34:29'),
(575, 31, 'Salem', 'TN', 'salem', NULL, NULL, '2021-09-01 00:36:45', '2021-09-01 00:36:45'),
(576, 31, 'Sivaganga', 'TN', 'sivaganga', NULL, NULL, '2021-09-01 00:38:56', '2021-09-01 00:38:56'),
(577, 31, 'Tenkasi', 'TN', 'tenkasi', NULL, NULL, '2021-09-01 00:40:51', '2021-09-01 00:40:51'),
(578, 31, 'Thanjavur', 'TN', 'thanjavur', NULL, NULL, '2021-09-01 00:42:46', '2021-09-01 00:42:46'),
(579, 31, 'Theni', 'TN', 'theni', NULL, NULL, '2021-09-01 00:44:56', '2021-09-01 00:44:56'),
(580, 31, 'Thoothukudi', 'TN', 'thoothukudi', NULL, NULL, '2021-09-01 00:45:49', '2021-09-01 00:45:49'),
(581, 31, 'Tiruchirappalli', 'TN', 'tiruchirappalli', NULL, NULL, '2021-09-01 00:46:47', '2021-09-01 00:46:47'),
(582, 31, 'Tirunelveli', 'TN', 'tirunelveli', NULL, NULL, '2021-09-01 00:48:50', '2021-09-01 00:48:50'),
(583, 31, 'Tirupattur', 'TN', 'tirupattur', NULL, NULL, '2021-09-01 00:51:20', '2021-09-01 00:51:20'),
(584, 31, 'Tiruppur', 'TN', 'tiruppur', NULL, NULL, '2021-09-01 00:52:21', '2021-09-01 00:52:21'),
(585, 31, 'Tiruvallur', 'TN', 'tiruvallur', NULL, NULL, '2021-09-01 00:54:10', '2021-09-01 00:54:10'),
(586, 31, 'Tiruvannamalai', 'TN', 'tiruvannamalai', NULL, NULL, '2021-09-01 00:55:32', '2021-09-01 00:55:32'),
(587, 31, 'Tiruvarur', 'TN', 'tiruvarur', NULL, NULL, '2021-09-01 00:57:07', '2021-09-01 00:57:07'),
(588, 31, 'Vellore', 'TN', 'vellore', NULL, NULL, '2021-09-01 00:59:02', '2021-09-01 00:59:02'),
(589, 31, 'Viluppuram', 'TN', 'viluppuram', NULL, NULL, '2021-09-01 01:01:09', '2021-09-01 01:01:09'),
(590, 31, 'Virudhunagar', 'TN', 'virudhunagar', NULL, NULL, '2021-09-01 01:03:05', '2021-09-01 01:03:05'),
(591, 36, 'Adilabad', 'TG', 'adilabad', NULL, NULL, '2021-09-01 01:05:01', '2021-09-01 01:05:01'),
(592, 36, 'Bhadradri Kothagudem', 'TG', 'bhadradri-kothagudem', NULL, NULL, '2021-09-01 01:05:54', '2021-09-01 01:05:54'),
(593, 36, 'Hyderabad', 'TG', 'hyderabad', NULL, NULL, '2021-09-01 01:08:14', '2021-09-01 01:08:14'),
(594, 36, 'Jagtial', 'TG', 'jagtial', NULL, NULL, '2021-09-01 01:10:30', '2021-09-01 01:10:30'),
(595, 36, 'Jangaon', 'TG', 'jangaon', NULL, NULL, '2021-09-01 01:12:23', '2021-09-01 01:12:23'),
(596, 36, 'Jayashankar', 'TG', 'jayashankar', NULL, NULL, '2021-09-01 01:14:20', '2021-09-01 01:14:20'),
(597, 36, 'Jogulamba', 'TG', 'jogulamba', NULL, NULL, '2021-09-01 01:16:19', '2021-09-01 01:16:19'),
(598, 36, 'Kamareddy', 'TG', 'kamareddy', NULL, NULL, '2021-09-01 01:19:15', '2021-09-01 01:19:15'),
(599, 36, 'Karimnagar', 'TG', 'karimnagar', NULL, NULL, '2021-09-01 01:21:14', '2021-09-01 01:21:14'),
(600, 36, 'Khammam', 'TG', 'khammam', NULL, NULL, '2021-09-01 01:23:05', '2021-09-01 01:23:05'),
(601, 36, 'Komaram Bheem', 'TG', 'komaram-bheem', NULL, NULL, '2021-09-01 01:25:06', '2021-09-01 01:25:06'),
(602, 36, 'Mahabubabad', 'TG', 'mahabubabad', NULL, NULL, '2021-09-01 01:27:01', '2021-09-01 01:27:01'),
(603, 36, 'Mahbubnagar', 'TG', 'mahbubnagar', NULL, NULL, '2021-09-01 01:28:55', '2021-09-01 01:28:55'),
(604, 36, 'Mancherial', 'TG', 'mancherial', NULL, NULL, '2021-09-01 01:29:27', '2021-09-01 01:29:27'),
(605, 36, 'Medak', 'TG', 'medak', NULL, NULL, '2021-09-01 01:31:30', '2021-09-01 01:31:30'),
(606, 36, 'Medchal', 'TG', 'medchal', NULL, NULL, '2021-09-01 01:33:24', '2021-09-01 01:33:24'),
(607, 36, 'Mulugu', 'TG', 'mulugu', NULL, NULL, '2021-09-01 01:35:21', '2021-09-01 01:35:21'),
(608, 36, 'Nagarkurnool', 'TG', 'nagarkurnool', NULL, NULL, '2021-09-01 01:37:13', '2021-09-01 01:37:13'),
(609, 36, 'Nalgonda', 'TG', 'nalgonda', NULL, NULL, '2021-09-01 01:37:55', '2021-09-01 01:37:55'),
(610, 36, 'Narayanpet', 'TG', 'narayanpet', NULL, NULL, '2021-09-01 01:39:53', '2021-09-01 01:39:53'),
(611, 36, 'Nirmal', 'TG', 'nirmal', NULL, NULL, '2021-09-01 01:40:45', '2021-09-01 01:40:45'),
(612, 36, 'Nizamabad', 'TG', 'nizamabad', NULL, NULL, '2021-09-01 01:42:36', '2021-09-01 01:42:36'),
(613, 36, 'Peddapalli', 'TG', 'peddapalli', NULL, NULL, '2021-09-01 01:43:09', '2021-09-01 01:43:09'),
(614, 36, 'Rajanna Sircilla', 'TG', 'rajanna-sircilla', NULL, NULL, '2021-09-01 01:45:29', '2021-09-01 01:45:29'),
(615, 36, 'Ranga Reddy', 'TG', 'ranga-reddy', NULL, NULL, '2021-09-01 01:48:18', '2021-09-01 01:48:18'),
(616, 36, 'Sangareddy', 'TG', 'sangareddy', NULL, NULL, '2021-09-01 01:50:16', '2021-09-01 01:50:16'),
(617, 36, 'Siddipet', 'TG', 'siddipet', NULL, NULL, '2021-09-01 01:51:08', '2021-09-01 01:51:08'),
(618, 36, 'Suryapet', 'TG', 'suryapet', NULL, NULL, '2021-09-01 01:52:00', '2021-09-01 01:52:00'),
(619, 36, 'Vikarabad', 'TG', 'vikarabad', NULL, NULL, '2021-09-01 01:55:02', '2021-09-01 01:55:02'),
(620, 36, 'Wanaparthy', 'TG', 'wanaparthy', NULL, NULL, '2021-09-01 01:56:57', '2021-09-01 01:56:57'),
(621, 36, 'Warangal', 'TG', 'warangal', NULL, NULL, '2021-09-01 01:59:48', '2021-09-01 01:59:48'),
(622, 36, 'Hanamkonda', 'TG', 'hanamkonda', NULL, NULL, '2021-09-01 02:01:47', '2021-09-01 02:01:47'),
(623, 36, 'Yadadri Bhuvanagiri', 'TG', 'yadadri-bhuvanagiri', NULL, NULL, '2021-09-01 02:03:50', '2021-09-01 02:03:50'),
(624, 32, 'Dhalai', 'TR', 'dhalai', NULL, NULL, '2021-09-01 02:06:17', '2021-09-01 02:06:17'),
(625, 32, 'Gomati', 'TR', 'gomati', NULL, NULL, '2021-09-01 02:08:40', '2021-09-01 02:08:40'),
(626, 32, 'Khowai', 'TR', 'khowai', NULL, NULL, '2021-09-01 02:10:33', '2021-09-01 02:10:33'),
(627, 32, 'North Tripura', 'TR', 'north-tripura', NULL, NULL, '2021-09-01 02:13:25', '2021-09-01 02:13:25'),
(628, 32, 'Sepahijala', 'TR', 'sepahijala', NULL, NULL, '2021-09-01 02:15:48', '2021-09-01 02:15:48'),
(629, 32, 'South Tripura', 'TR', 'south-tripura', NULL, NULL, '2021-09-01 02:18:14', '2021-09-01 02:18:14'),
(630, 32, 'Unakoti', 'TR', 'unakoti', NULL, NULL, '2021-09-01 02:20:40', '2021-09-01 02:20:40'),
(631, 32, 'West Tripura', 'TR', 'west-tripura', NULL, NULL, '2021-09-01 02:23:28', '2021-09-01 02:23:28'),
(632, 33, 'Agra', 'UP', 'agra', NULL, NULL, '2021-09-01 02:24:50', '2021-09-01 02:24:50'),
(633, 33, 'Aligarh', 'UP', 'aligarh', NULL, NULL, '2021-09-01 02:26:09', '2021-09-01 02:26:09'),
(634, 33, 'Ambedkar Nagar', 'UP', 'ambedkar-nagar', NULL, NULL, '2021-09-01 02:29:13', '2021-09-01 02:29:13'),
(635, 33, 'Amethi', 'UP', 'amethi', NULL, NULL, '2021-09-01 02:31:04', '2021-09-01 02:31:04'),
(636, 33, 'Amroha', 'UP', 'amroha', NULL, NULL, '2021-09-01 02:32:37', '2021-09-01 02:32:37'),
(637, 33, 'Auraiya', 'UP', 'auraiya', NULL, NULL, '2021-09-01 02:33:30', '2021-09-01 02:33:30'),
(638, 33, 'Ayodhya', 'UP', 'ayodhya', NULL, NULL, '2021-09-01 02:35:25', '2021-09-01 02:35:25'),
(639, 33, 'Azamgarh', 'UP', 'azamgarh', NULL, NULL, '2021-09-01 02:39:16', '2021-09-01 02:39:16'),
(640, 33, 'Baghpat', 'UP', 'baghpat', NULL, NULL, '2021-09-01 02:40:14', '2021-09-01 02:40:14'),
(641, 33, 'Bahraich', 'UP', 'bahraich', NULL, NULL, '2021-09-01 02:42:37', '2021-09-01 02:42:37'),
(642, 33, 'Ballia', 'UP', 'ballia', NULL, NULL, '2021-09-01 02:44:30', '2021-09-01 02:44:30'),
(643, 33, 'Balrampur', 'UP', 'balrampur', NULL, NULL, '2021-09-01 02:46:29', '2021-09-01 02:46:29'),
(644, 33, 'Banda', 'UP', 'banda', NULL, NULL, '2021-09-01 02:49:01', '2021-09-01 02:49:01'),
(645, 33, 'Barabanki', 'UP', 'barabanki', NULL, NULL, '2021-09-01 02:51:26', '2021-09-01 02:51:26'),
(646, 33, 'Bareilly', 'UP', 'bareilly', NULL, NULL, '2021-09-01 02:53:10', '2021-09-01 02:53:10'),
(647, 33, 'Basti', 'UP', 'basti', NULL, NULL, '2021-09-01 02:54:20', '2021-09-01 02:54:20'),
(648, 33, 'Bhadohi', 'UP', 'bhadohi', NULL, NULL, '2021-09-01 02:55:12', '2021-09-01 02:55:12'),
(649, 33, 'Bijnor', 'UP', 'bijnor', NULL, NULL, '2021-09-01 02:57:05', '2021-09-01 02:57:05'),
(650, 33, 'Budaun', 'UP', 'budaun', NULL, NULL, '2021-09-01 02:59:00', '2021-09-01 02:59:00'),
(651, 33, 'Bulandshahr', 'UP', 'bulandshahr', NULL, NULL, '2021-09-01 03:00:54', '2021-09-01 03:00:54'),
(652, 33, 'Chandauli', 'UP', 'chandauli', NULL, NULL, '2021-09-01 03:02:50', '2021-09-01 03:02:50'),
(653, 33, 'Chitrakoot', 'UP', 'chitrakoot', NULL, NULL, '2021-09-01 03:04:44', '2021-09-01 03:04:44'),
(654, 33, 'Deoria', 'UP', 'deoria', NULL, NULL, '2021-09-01 03:06:37', '2021-09-01 03:06:37'),
(655, 33, 'Etah', 'UP', 'etah', NULL, NULL, '2021-09-01 03:07:59', '2021-09-01 03:07:59'),
(656, 33, 'Etawah', 'UP', 'etawah', NULL, NULL, '2021-09-01 03:10:23', '2021-09-01 03:10:23'),
(657, 33, 'Farrukhabad', 'UP', 'farrukhabad', NULL, NULL, '2021-09-01 03:11:15', '2021-09-01 03:11:15'),
(658, 33, 'Fatehpur', 'UP', 'fatehpur', NULL, NULL, '2021-09-01 03:13:17', '2021-09-01 03:13:17'),
(659, 33, 'Firozabad', 'UP', 'firozabad', NULL, NULL, '2021-09-01 03:15:14', '2021-09-01 03:15:14'),
(660, 33, 'Gautam Buddha Nagar', 'UP', 'gautam-buddha-nagar', NULL, NULL, '2021-09-01 03:17:37', '2021-09-01 03:17:37'),
(661, 33, 'Ghaziabad', 'UP', 'ghaziabad', NULL, NULL, '2021-09-01 03:19:32', '2021-09-01 03:19:32'),
(662, 33, 'Ghazipur', 'UP', 'ghazipur', NULL, NULL, '2021-09-01 03:21:47', '2021-09-01 03:21:47'),
(663, 33, 'Gonda', 'UP', 'gonda', NULL, NULL, '2021-09-01 03:22:38', '2021-09-01 03:22:38'),
(664, 33, 'Gorakhpur', 'UP', 'gorakhpur', NULL, NULL, '2021-09-01 03:24:19', '2021-09-01 03:24:19'),
(665, 33, 'Hamirpur', 'UP', 'hamirpur', NULL, NULL, '2021-09-01 03:26:30', '2021-09-01 03:26:30'),
(666, 33, 'Hapur', 'UP', 'hapur', NULL, NULL, '2021-09-01 03:28:28', '2021-09-01 03:28:28'),
(667, 33, 'Hardoi', 'UP', 'hardoi', NULL, NULL, '2021-09-01 03:30:27', '2021-09-01 03:30:27'),
(668, 33, 'Hathras', 'UP', 'hathras', NULL, NULL, '2021-09-01 03:32:58', '2021-09-01 03:32:58'),
(669, 33, 'Jalaun', 'UP', 'jalaun', NULL, NULL, '2021-09-01 03:34:52', '2021-09-01 03:34:52'),
(670, 33, 'Jaunpur', 'UP', 'jaunpur', NULL, NULL, '2021-09-01 03:36:46', '2021-09-01 03:36:46'),
(671, 33, 'Jhansi', 'UP', 'jhansi', NULL, NULL, '2021-09-01 03:38:38', '2021-09-01 03:38:38'),
(672, 33, 'Kannauj', 'UP', 'kannauj', NULL, NULL, '2021-09-01 03:40:24', '2021-09-01 03:40:24'),
(673, 33, 'Kanpur Dehat', 'UP', 'kanpur-dehat', NULL, NULL, '2021-09-01 03:42:20', '2021-09-01 03:42:20'),
(674, 33, 'Kanpur Nagar', 'UP', 'kanpur-nagar', NULL, NULL, '2021-09-01 03:44:15', '2021-09-01 03:44:15'),
(675, 33, 'Kasganj', 'UP', 'kasganj', NULL, NULL, '2021-09-01 03:46:10', '2021-09-01 03:46:10'),
(676, 33, 'Kaushambi', 'UP', 'kaushambi', NULL, NULL, '2021-09-01 03:48:08', '2021-09-01 03:48:08'),
(677, 33, 'Kheri', 'UP', 'kheri', NULL, NULL, '2021-09-01 03:50:03', '2021-09-01 03:50:03'),
(678, 33, 'Kushinagar', 'UP', 'kushinagar', NULL, NULL, '2021-09-01 03:52:54', '2021-09-01 03:52:54'),
(679, 33, 'Lalitpur', 'UP', 'lalitpur', NULL, NULL, '2021-09-01 03:54:48', '2021-09-01 03:54:48'),
(680, 33, 'Lucknow', 'UP', 'lucknow', NULL, NULL, '2021-09-01 03:55:39', '2021-09-01 03:55:39'),
(681, 33, 'Maharajganj', 'UP', 'maharajganj', NULL, NULL, '2021-09-01 03:57:59', '2021-09-01 03:57:59'),
(682, 33, 'Mahoba', 'UP', 'mahoba', NULL, NULL, '2021-09-01 03:59:52', '2021-09-01 03:59:52'),
(683, 33, 'Mainpuri', 'UP', 'mainpuri', NULL, NULL, '2021-09-01 04:01:53', '2021-09-01 04:01:53'),
(684, 33, 'Mathura', 'UP', 'mathura', NULL, NULL, '2021-09-01 04:04:23', '2021-09-01 04:04:23'),
(685, 33, 'Mau', 'UP', 'mau', NULL, NULL, '2021-09-01 04:06:10', '2021-09-01 04:06:10'),
(686, 33, 'Meerut', 'UP', 'meerut', NULL, NULL, '2021-09-01 04:08:05', '2021-09-01 04:08:05'),
(687, 33, 'Mirzapur', 'UP', 'mirzapur', NULL, NULL, '2021-09-01 04:10:20', '2021-09-01 04:10:20'),
(688, 33, 'Moradabad', 'UP', 'moradabad', NULL, NULL, '2021-09-01 04:12:14', '2021-09-01 04:12:14'),
(689, 33, 'Muzaffarnagar', 'UP', 'muzaffarnagar', NULL, NULL, '2021-09-01 04:13:53', '2021-09-01 04:13:53'),
(690, 33, 'Pilibhit', 'UP', 'pilibhit', NULL, NULL, '2021-09-01 04:15:52', '2021-09-01 04:15:52'),
(691, 33, 'Pratapgarh', 'UP', 'pratapgarh', NULL, NULL, '2021-09-01 04:16:43', '2021-09-01 04:16:43'),
(692, 33, 'Prayagraj', 'UP', 'prayagraj', NULL, NULL, '2021-09-01 04:18:35', '2021-09-01 04:18:35'),
(693, 33, 'Raebareli', 'UP', 'raebareli', NULL, NULL, '2021-09-01 04:19:13', '2021-09-01 04:19:13'),
(694, 33, 'Rampur', 'UP', 'rampur', NULL, NULL, '2021-09-01 04:21:14', '2021-09-01 04:21:14'),
(695, 33, 'Saharanpur', 'UP', 'saharanpur', NULL, NULL, '2021-09-01 04:23:02', '2021-09-01 04:23:02'),
(696, 33, 'Sambhal', 'UP', 'sambhal', NULL, NULL, '2021-09-01 04:24:26', '2021-09-01 04:24:26'),
(697, 33, 'Sant Kabir Nagar', 'UP', 'sant-kabir-nagar', NULL, NULL, '2021-09-01 04:27:19', '2021-09-01 04:27:19'),
(698, 33, 'Shahjahanpur', 'UP', 'shahjahanpur', NULL, NULL, '2021-09-01 04:29:42', '2021-09-01 04:29:42'),
(699, 33, 'Shamli', 'UP', 'shamli', NULL, NULL, '2021-09-01 04:32:32', '2021-09-01 04:32:32'),
(700, 33, 'Shravasti', 'UP', 'shravasti', NULL, NULL, '2021-09-01 04:34:55', '2021-09-01 04:34:55'),
(701, 33, 'Siddharthnagar', 'UP', 'siddharthnagar', NULL, NULL, '2021-09-01 04:36:49', '2021-09-01 04:36:49'),
(702, 33, 'Sitapur', 'UP', 'sitapur', NULL, NULL, '2021-09-01 04:39:12', '2021-09-01 04:39:12'),
(703, 33, 'Sonbhadra', 'UP', 'sonbhadra', NULL, NULL, '2021-09-01 04:41:08', '2021-09-01 04:41:08'),
(704, 33, 'Sultanpur', 'UP', 'sultanpur', NULL, NULL, '2021-09-01 04:43:04', '2021-09-01 04:43:04'),
(705, 33, 'Unnao', 'UP', 'unnao', NULL, NULL, '2021-09-01 04:44:56', '2021-09-01 04:44:56'),
(706, 33, 'Varanasi', 'UP', 'varanasi', NULL, NULL, '2021-09-01 04:46:51', '2021-09-01 04:46:51'),
(707, 34, 'Almora', 'UK', 'almora', NULL, NULL, '2021-09-01 04:48:57', '2021-09-01 04:48:57'),
(708, 34, 'Bageshwar', 'UK', 'bageshwar', NULL, NULL, '2021-09-01 04:50:47', '2021-09-01 04:50:47'),
(709, 34, 'Chamoli', 'UK', 'chamoli', NULL, NULL, '2021-09-01 04:52:39', '2021-09-01 04:52:39'),
(710, 34, 'Champawat', 'UK', 'champawat', NULL, NULL, '2021-09-01 04:54:29', '2021-09-01 04:54:29'),
(711, 34, 'Dehradun', 'UK', 'dehradun', NULL, NULL, '2021-09-01 04:56:53', '2021-09-01 04:56:53'),
(712, 34, 'Haridwar', 'UK', 'haridwar', NULL, NULL, '2021-09-01 04:59:01', '2021-09-01 04:59:01'),
(713, 34, 'Nainital', 'UK', 'nainital', NULL, NULL, '2021-09-01 05:00:58', '2021-09-01 05:00:58'),
(714, 34, 'Pauri', 'UK', 'pauri', NULL, NULL, '2021-09-01 05:02:55', '2021-09-01 05:02:55'),
(715, 34, 'Pithoragarh', 'UK', 'pithoragarh', NULL, NULL, '2021-09-01 05:04:50', '2021-09-01 05:04:50'),
(716, 34, 'Rudraprayag', 'UK', 'rudraprayag', NULL, NULL, '2021-09-01 05:06:51', '2021-09-01 05:06:51'),
(717, 34, 'Tehri', 'UK', 'tehri', NULL, NULL, '2021-09-01 05:08:46', '2021-09-01 05:08:46'),
(718, 34, 'Udham Singh Nagar', 'UK', 'udham-singh-nagar', NULL, NULL, '2021-09-01 05:10:36', '2021-09-01 05:10:36'),
(719, 34, 'Uttarkashi', 'UK', 'uttarkashi', NULL, NULL, '2021-09-01 05:12:28', '2021-09-01 05:12:28'),
(720, 35, 'Alipurduar', 'WB', 'alipurduar', NULL, NULL, '2021-09-01 05:14:23', '2021-09-01 05:14:23'),
(721, 35, 'Bankura', 'WB', 'bankura', NULL, NULL, '2021-09-01 05:16:16', '2021-09-01 05:16:16'),
(722, 35, 'Birbhum', 'WB', 'birbhum', NULL, NULL, '2021-09-01 05:18:40', '2021-09-01 05:18:40'),
(723, 35, 'Cooch Behar', 'WB', 'cooch-behar', NULL, NULL, '2021-09-01 05:21:01', '2021-09-01 05:21:01'),
(724, 35, 'Dakshin Dinajpur', 'WB', 'dakshin-dinajpur', NULL, NULL, '2021-09-01 05:24:01', '2021-09-01 05:24:01'),
(725, 35, 'Darjeeling', 'WB', 'darjeeling', NULL, NULL, '2021-09-01 05:27:48', '2021-09-01 05:27:48'),
(726, 35, 'Hooghly', 'WB', 'hooghly', NULL, NULL, '2021-09-01 05:29:47', '2021-09-01 05:29:47'),
(727, 35, 'Howrah', 'WB', 'howrah', NULL, NULL, '2021-09-01 05:31:41', '2021-09-01 05:31:41'),
(728, 35, 'Jalpaiguri', 'WB', 'jalpaiguri', NULL, NULL, '2021-09-01 05:33:44', '2021-09-01 05:33:44'),
(729, 35, 'Jhargram', 'WB', 'jhargram', NULL, NULL, '2021-09-01 05:35:38', '2021-09-01 05:35:38'),
(730, 35, 'Kalimpong', 'WB', 'kalimpong', NULL, NULL, '2021-09-01 05:36:09', '2021-09-01 05:36:09'),
(731, 35, 'Kolkata', 'WB', 'kolkata', NULL, NULL, '2021-09-01 05:38:10', '2021-09-01 05:38:10'),
(732, 35, 'Malda', 'WB', 'malda', NULL, NULL, '2021-09-01 05:40:34', '2021-09-01 05:40:34'),
(733, 35, 'Murshidabad', 'WB', 'murshidabad', NULL, NULL, '2021-09-01 05:42:29', '2021-09-01 05:42:29'),
(734, 35, 'Nadia', 'WB', 'nadia', NULL, NULL, '2021-09-01 05:44:55', '2021-09-01 05:44:55'),
(735, 35, 'North 24 Parganas', 'WB', 'north-24-parganas', NULL, NULL, '2021-09-01 05:46:47', '2021-09-01 05:46:47'),
(736, 35, 'Paschim Bardhaman', 'WB', 'paschim-bardhaman', NULL, NULL, '2021-09-01 05:48:45', '2021-09-01 05:48:45'),
(737, 35, 'Paschim Medinipur', 'WB', 'paschim-medinipur', NULL, NULL, '2021-09-01 05:51:10', '2021-09-01 05:51:10'),
(738, 35, 'Purba Bardhaman', 'WB', 'purba-bardhaman', NULL, NULL, '2021-09-01 05:53:56', '2021-09-01 05:53:56'),
(739, 35, 'Purba Medinipur', 'WB', 'purba-medinipur', NULL, NULL, '2021-09-01 05:56:20', '2021-09-01 05:56:20'),
(740, 35, 'Purulia', 'WB', 'purulia', NULL, NULL, '2021-09-01 05:58:16', '2021-09-01 05:58:16'),
(741, 35, 'South 24 Parganas', 'WB', 'south-24-parganas', NULL, NULL, '2021-09-01 05:59:20', '2021-09-01 05:59:20'),
(742, 35, 'Uttar Dinajpur', 'WB', 'uttar-dinajpur', NULL, NULL, '2021-09-01 06:01:16', '2021-09-01 06:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commenter_id` varchar(95) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commenter_type` varchar(95) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentable_type` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `child_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_abbr` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `country_abbr`, `country_slug`, `created_at`, `updated_at`) VALUES
(105, 'India', 'IN', 'india', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customizations`
--

CREATE TABLE `customizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customization_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customization_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customization_default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_id` int(11) NOT NULL,
  `customization_recommend_width_px` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'for homepage or innerpage background image',
  `customization_recommend_height_px` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'for homepage or innerpage background image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customizations`
--

INSERT INTO `customizations` (`id`, `customization_key`, `customization_value`, `created_at`, `updated_at`, `customization_default_value`, `theme_id`, `customization_recommend_width_px`, `customization_recommend_height_px`) VALUES
(1, 'site_primary_color', '#30e3ca', '2021-07-01 07:34:53', '2021-07-01 07:34:53', '#30e3ca', 1, NULL, NULL),
(2, 'site_header_background_color', '#fff', '2021-07-01 07:34:53', '2021-07-01 07:34:53', '#fff', 1, NULL, NULL),
(3, 'site_footer_background_color', '#333333', '2021-07-01 07:34:53', '2021-07-01 07:34:53', '#333333', 1, NULL, NULL),
(4, 'site_header_font_color', '#000', '2021-07-01 07:34:53', '2021-07-01 07:34:53', '#000', 1, NULL, NULL),
(5, 'site_footer_font_color', '#fff', '2021-07-01 07:34:53', '2021-07-01 07:34:53', '#fff', 1, NULL, NULL),
(6, 'site_homepage_header_background_type', 'default_background', '2021-07-01 07:34:53', '2021-07-01 07:34:53', 'default_background', 1, NULL, NULL),
(7, 'site_homepage_header_background_color', NULL, '2021-07-01 07:34:53', '2021-07-01 07:34:53', NULL, 1, NULL, NULL),
(8, 'site_homepage_header_background_image', NULL, '2021-07-01 07:34:53', '2021-07-01 07:34:54', NULL, 1, '1200', '800'),
(9, 'site_homepage_header_background_youtube_video', NULL, '2021-07-01 07:34:53', '2021-07-01 07:34:53', NULL, 1, NULL, NULL),
(10, 'site_innerpage_header_background_type', 'default_background', '2021-07-01 07:34:53', '2021-07-01 07:34:53', 'default_background', 1, NULL, NULL),
(11, 'site_innerpage_header_background_color', NULL, '2021-07-01 07:34:53', '2021-07-01 07:34:53', NULL, 1, NULL, NULL),
(12, 'site_innerpage_header_background_image', NULL, '2021-07-01 07:34:53', '2021-07-01 07:34:54', NULL, 1, '1200', '600'),
(13, 'site_innerpage_header_background_youtube_video', NULL, '2021-07-01 07:34:53', '2021-07-01 07:34:53', NULL, 1, NULL, NULL),
(14, 'site_homepage_header_title_font_color', '#fff', '2021-07-01 07:34:53', '2021-07-01 07:34:53', '#fff', 1, NULL, NULL),
(15, 'site_homepage_header_paragraph_font_color', 'rgba(255, 255, 255, 0.5)', '2021-07-01 07:34:53', '2021-07-01 07:34:53', 'rgba(255, 255, 255, 0.5)', 1, NULL, NULL),
(16, 'site_innerpage_header_title_font_color', '#fff', '2021-07-01 07:34:53', '2021-07-01 07:34:53', '#fff', 1, NULL, NULL),
(17, 'site_innerpage_header_paragraph_font_color', 'rgba(255, 255, 255, 0.5)', '2021-07-01 07:34:53', '2021-07-01 07:34:53', 'rgba(255, 255, 255, 0.5)', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'ABANDONED',
  `custom_field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_field_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1:text 2:select 3:multi-select 4:link',
  `custom_field_seed_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `districtid` int(11) NOT NULL,
  `district_title` varchar(100) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_description` text NOT NULL,
  `district_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`districtid`, `district_title`, `state_id`, `district_description`, `district_status`) VALUES
(36, 'Anantnag', 15, '', 'Active'),
(37, 'Bandipore', 15, '', 'Active'),
(38, 'Baramulla', 15, '', 'Active'),
(39, 'Budgam', 15, '', 'Active'),
(40, 'Doda', 15, '', 'Active'),
(41, 'Ganderbal', 15, '', 'Active'),
(42, 'Jammu', 15, '', 'Active'),
(43, 'Kargil', 15, '', 'Active'),
(44, 'Kathua', 15, '', 'Active'),
(45, 'Kishtwar', 15, '', 'Active'),
(46, 'Kulgam', 15, '', 'Active'),
(47, 'Kupwara', 15, '', 'Active'),
(48, 'Leh (Ladakh)', 15, '', 'Active'),
(49, 'Poonch', 15, '', 'Active'),
(50, 'Pulwama', 15, '', 'Active'),
(51, 'Rajouri', 15, '', 'Active'),
(52, 'Ramban', 15, '', 'Active'),
(53, 'Reasi', 15, '', 'Active'),
(54, 'Samba', 15, '', 'Active'),
(55, 'Shopian', 15, '', 'Active'),
(56, 'Srinagar', 15, '', 'Active'),
(57, 'Udhampur', 15, '', 'Active'),
(58, 'Bilaspur (Himachal Pradesh)', 14, '', 'Active'),
(59, 'Chamba', 14, '', 'Active'),
(60, 'Hamirpur (Himachal Pradesh)', 14, '', 'Active'),
(61, 'Kangra', 14, '', 'Active'),
(62, 'Kinnaur', 14, '', 'Active'),
(63, 'Kullu', 14, '', 'Active'),
(64, 'Lahul & Spiti', 14, '', 'Active'),
(65, 'Mandi', 14, '', 'Active'),
(66, 'Shimla', 14, '', 'Active'),
(67, 'Sirmaur', 14, '', 'Active'),
(68, 'Solan', 14, '', 'Active'),
(69, 'Una', 14, '', 'Active'),
(70, 'Amritsar', 28, '', 'Active'),
(71, 'Barnala', 28, '', 'Active'),
(72, 'Bathinda', 28, '', 'Active'),
(73, 'Faridkot', 28, '', 'Active'),
(74, 'Fatehgarh Sahib', 28, '', 'Active'),
(75, 'Firozpur', 28, '', 'Active'),
(76, 'Gurdaspur', 28, '', 'Active'),
(77, 'Hoshiarpur', 28, '', 'Active'),
(78, 'Jalandhar', 28, '', 'Active'),
(79, 'Kapurthala', 28, '', 'Active'),
(80, 'Ludhiana', 28, '', 'Active'),
(81, 'Mansa', 28, '', 'Active'),
(82, 'Moga', 28, '', 'Active'),
(83, 'Muktsar', 28, '', 'Active'),
(84, 'Patiala', 28, '', 'Active'),
(85, 'Rupnagar (Ropar)', 28, '', 'Active'),
(86, 'Sahibzada Ajit Singh Nagar (Mohali)', 28, '', 'Active'),
(87, 'Sangrur', 28, '', 'Active'),
(88, 'Shahid Bhagat Singh Nagar (Nawanshahr)', 28, '', 'Active'),
(89, 'Tarn Taran', 28, '', 'Active'),
(90, 'Chandigarh', 6, '', 'Active'),
(91, 'Almora', 34, '', 'Active'),
(92, 'Bageshwar', 34, '', 'Active'),
(93, 'Chamoli', 34, '', 'Active'),
(94, 'Champawat', 34, '', 'Active'),
(95, 'Dehradun', 34, '', 'Active'),
(96, 'Haridwar', 34, '', 'Active'),
(97, 'Nainital', 34, '', 'Active'),
(98, 'Pauri Garhwal', 34, '', 'Active'),
(99, 'Pithoragarh', 34, '', 'Active'),
(100, 'Rudraprayag', 34, '', 'Active'),
(101, 'Tehri Garhwal', 34, '', 'Active'),
(102, 'Udham Singh Nagar', 34, '', 'Active'),
(103, 'Uttarkashi', 34, '', 'Active'),
(104, 'Ambala', 13, '', 'Active'),
(105, 'Bhiwani', 13, '', 'Active'),
(106, 'Faridabad', 13, '', 'Active'),
(107, 'Fatehabad', 13, '', 'Active'),
(108, 'Gurgaon', 13, '', 'Active'),
(109, 'Hisar', 13, '', 'Active'),
(110, 'Jhajjar', 13, '', 'Active'),
(111, 'Jind', 13, '', 'Active'),
(112, 'Kaithal', 13, '', 'Active'),
(113, 'Karnal', 13, '', 'Active'),
(114, 'Kurukshetra', 13, '', 'Active'),
(115, 'Mahendragarh', 13, '', 'Active'),
(116, 'Mewat', 13, '', 'Active'),
(117, 'Palwal', 13, '', 'Active'),
(118, 'Panchkula', 13, '', 'Active'),
(119, 'Panipat', 13, '', 'Active'),
(120, 'Rewari', 13, '', 'Active'),
(121, 'Rohtak', 13, '', 'Active'),
(122, 'Sirsa', 13, '', 'Active'),
(123, 'Sonipat', 13, '', 'Active'),
(124, 'Yamuna Nagar', 13, '', 'Active'),
(125, 'Central Delhi', 10, '', 'Active'),
(126, 'East Delhi', 10, '', 'Active'),
(127, 'New Delhi', 10, '', 'Active'),
(128, 'North Delhi', 10, '', 'Active'),
(129, 'North East Delhi', 10, '', 'Active'),
(130, 'North West Delhi', 10, '', 'Active'),
(131, 'South Delhi', 10, '', 'Active'),
(132, 'South West Delhi', 10, '', 'Active'),
(133, 'West Delhi', 10, '', 'Active'),
(134, 'Ajmer', 29, '', 'Active'),
(135, 'Alwar', 29, '', 'Active'),
(136, 'Banswara', 29, '', 'Active'),
(137, 'Baran', 29, '', 'Active'),
(138, 'Barmer', 29, '', 'Active'),
(139, 'Bharatpur', 29, '', 'Active'),
(140, 'Bhilwara', 29, '', 'Active'),
(141, 'Bikaner', 29, '', 'Active'),
(142, 'Bundi', 29, '', 'Active'),
(143, 'Chittorgarh', 29, '', 'Active'),
(144, 'Churu', 29, '', 'Active'),
(145, 'Dausa', 29, '', 'Active'),
(146, 'Dholpur', 29, '', 'Active'),
(147, 'Dungarpur', 29, '', 'Active'),
(148, 'Ganganagar', 29, '', 'Active'),
(149, 'Hanumangarh', 29, '', 'Active'),
(150, 'Jaipur', 29, '', 'Active'),
(151, 'Jaisalmer', 29, '', 'Active'),
(152, 'Jalor', 29, '', 'Active'),
(153, 'Jhalawar', 29, '', 'Active'),
(154, 'Jhunjhunu', 29, '', 'Active'),
(155, 'Jodhpur', 29, '', 'Active'),
(156, 'Karauli', 29, '', 'Active'),
(157, 'Kota', 29, '', 'Active'),
(158, 'Nagaur', 29, '', 'Active'),
(159, 'Pali', 29, '', 'Active'),
(160, 'Pratapgarh (Rajasthan)', 29, '', 'Active'),
(161, 'Rajsamand', 29, '', 'Active'),
(162, 'Sawai Madhopur', 29, '', 'Active'),
(163, 'Sikar', 29, '', 'Active'),
(164, 'Sirohi', 29, '', 'Active'),
(165, 'Tonk', 29, '', 'Active'),
(166, 'Udaipur', 29, '', 'Active'),
(167, 'Agra', 33, '', 'Active'),
(168, 'Aligarh', 33, '', 'Active'),
(169, 'Allahabad', 33, '', 'Active'),
(170, 'Ambedkar Nagar', 33, '', 'Active'),
(171, 'Auraiya', 33, '', 'Active'),
(172, 'Azamgarh', 33, '', 'Active'),
(173, 'Bagpat', 33, '', 'Active'),
(174, 'Bahraich', 33, '', 'Active'),
(175, 'Ballia', 33, '', 'Active'),
(176, 'Balrampur', 33, '', 'Active'),
(177, 'Banda', 33, '', 'Active'),
(178, 'Barabanki', 33, '', 'Active'),
(179, 'Bareilly', 33, '', 'Active'),
(180, 'Basti', 33, '', 'Active'),
(181, 'Bijnor', 33, '', 'Active'),
(182, 'Budaun', 33, '', 'Active'),
(183, 'Bulandshahr', 33, '', 'Active'),
(184, 'Chandauli', 33, '', 'Active'),
(185, 'Chitrakoot', 33, '', 'Active'),
(186, 'Deoria', 33, '', 'Active'),
(187, 'Etah', 33, '', 'Active'),
(188, 'Etawah', 33, '', 'Active'),
(189, 'Faizabad', 33, '', 'Active'),
(190, 'Farrukhabad', 33, '', 'Active'),
(191, 'Fatehpur', 33, '', 'Active'),
(192, 'Firozabad', 33, '', 'Active'),
(193, 'Gautam Buddha Nagar', 33, '', 'Active'),
(194, 'Ghaziabad', 33, '', 'Active'),
(195, 'Ghazipur', 33, '', 'Active'),
(196, 'Gonda', 33, '', 'Active'),
(197, 'Gorakhpur', 33, '', 'Active'),
(198, 'Hamirpur', 33, '', 'Active'),
(199, 'Hardoi', 33, '', 'Active'),
(200, 'Hathras', 33, '', 'Active'),
(201, 'Jalaun', 33, '', 'Active'),
(202, 'Jaunpur', 33, '', 'Active'),
(203, 'Jhansi', 33, '', 'Active'),
(204, 'Jyotiba Phule Nagar', 33, '', 'Active'),
(205, 'Kannauj', 33, '', 'Active'),
(206, 'Kanpur Dehat', 33, '', 'Active'),
(207, 'Kanpur Nagar', 33, '', 'Active'),
(208, 'Kanshiram Nagar', 33, '', 'Active'),
(209, 'Kaushambi', 33, '', 'Active'),
(210, 'Kheri', 33, '', 'Active'),
(211, 'Kushinagar', 33, '', 'Active'),
(212, 'Lalitpur', 33, '', 'Active'),
(213, 'Lucknow', 33, '', 'Active'),
(214, 'Maharajganj', 33, '', 'Active'),
(215, 'Mahoba', 33, '', 'Active'),
(216, 'Mainpuri', 33, '', 'Active'),
(217, 'Mathura', 33, '', 'Active'),
(218, 'Mau', 33, '', 'Active'),
(219, 'Meerut', 33, '', 'Active'),
(220, 'Mirzapur', 33, '', 'Active'),
(221, 'Moradabad', 33, '', 'Active'),
(222, 'Muzaffarnagar', 33, '', 'Active'),
(223, 'Pilibhit', 33, '', 'Active'),
(224, 'Pratapgarh', 33, '', 'Active'),
(225, 'Rae Bareli', 33, '', 'Active'),
(226, 'Rampur', 33, '', 'Active'),
(227, 'Saharanpur', 33, '', 'Active'),
(228, 'Sant Kabir Nagar', 33, '', 'Active'),
(229, 'Sant Ravidas Nagar (Bhadohi)', 33, '', 'Active'),
(230, 'Shahjahanpur', 33, '', 'Active'),
(231, 'Shrawasti', 33, '', 'Active'),
(232, 'Siddharthnagar', 33, '', 'Active'),
(233, 'Sitapur', 33, '', 'Active'),
(234, 'Sonbhadra', 33, '', 'Active'),
(235, 'Sultanpur', 33, '', 'Active'),
(236, 'Unnao', 33, '', 'Active'),
(237, 'Varanasi', 33, '', 'Active'),
(238, 'Araria', 5, '', 'Active'),
(239, 'Arwal', 5, '', 'Active'),
(240, 'Aurangabad (Bihar)', 5, '', 'Active'),
(241, 'Banka', 5, '', 'Active'),
(242, 'Begusarai', 5, '', 'Active'),
(243, 'Bhagalpur', 5, '', 'Active'),
(244, 'Bhojpur', 5, '', 'Active'),
(245, 'Buxar', 5, '', 'Active'),
(246, 'Darbhanga', 5, '', 'Active'),
(247, 'East Champaran', 5, '', 'Active'),
(248, 'Gaya', 5, '', 'Active'),
(249, 'Gopalganj', 5, '', 'Active'),
(250, 'Jamui', 5, '', 'Active'),
(251, 'Jehanabad', 5, '', 'Active'),
(252, 'Kaimur (Bhabua)', 5, '', 'Active'),
(253, 'Katihar', 5, '', 'Active'),
(254, 'Khagaria', 5, '', 'Active'),
(255, 'Kishanganj', 5, '', 'Active'),
(256, 'Lakhisarai', 5, '', 'Active'),
(257, 'Madhepura', 5, '', 'Active'),
(258, 'Madhubani', 5, '', 'Active'),
(259, 'Munger', 5, '', 'Active'),
(260, 'Muzaffarpur', 5, '', 'Active'),
(261, 'Nalanda', 5, '', 'Active'),
(262, 'Nawada', 5, '', 'Active'),
(263, 'Patna', 5, '', 'Active'),
(264, 'Purnia', 5, '', 'Active'),
(265, 'Rohtas', 5, '', 'Active'),
(266, 'Saharsa', 5, '', 'Active'),
(267, 'Samastipur', 5, '', 'Active'),
(268, 'Saran', 5, '', 'Active'),
(269, 'Sheikhpura', 5, '', 'Active'),
(270, 'Sheohar', 5, '', 'Active'),
(271, 'Sitamarhi', 5, '', 'Active'),
(272, 'Siwan', 5, '', 'Active'),
(273, 'Supaul', 5, '', 'Active'),
(274, 'Vaishali', 5, '', 'Active'),
(275, 'West Champaran', 5, '', 'Active'),
(276, 'East Sikkim', 30, '', 'Active'),
(277, 'North Sikkim', 30, '', 'Active'),
(278, 'South Sikkim', 30, '', 'Active'),
(279, 'West Sikkim', 30, '', 'Active'),
(280, 'Anjaw', 3, '', 'Active'),
(281, 'Changlang', 3, '', 'Active'),
(282, 'Dibang Valley', 3, '', 'Active'),
(283, 'East Kameng', 3, '', 'Active'),
(284, 'East Siang', 3, '', 'Active'),
(285, 'Kurung Kumey', 3, '', 'Active'),
(286, 'Lohit', 3, '', 'Active'),
(287, 'Lower Dibang Valley', 3, '', 'Active'),
(288, 'Lower Subansiri', 3, '', 'Active'),
(289, 'Papum Pare', 3, '', 'Active'),
(290, 'Tawang', 3, '', 'Active'),
(291, 'Tirap', 3, '', 'Active'),
(292, 'Upper Siang', 3, '', 'Active'),
(293, 'Upper Subansiri', 3, '', 'Active'),
(294, 'West Kameng', 3, '', 'Active'),
(295, 'West Siang', 3, '', 'Active'),
(296, 'Dimapur', 25, '', 'Active'),
(297, 'Kiphire', 25, '', 'Active'),
(298, 'Kohima', 25, '', 'Active'),
(299, 'Longleng', 25, '', 'Active'),
(300, 'Mokokchung', 25, '', 'Active'),
(301, 'Mon', 25, '', 'Active'),
(302, 'Peren', 25, '', 'Active'),
(303, 'Phek', 25, '', 'Active'),
(304, 'Tuensang', 25, '', 'Active'),
(305, 'Wokha', 25, '', 'Active'),
(306, 'Zunheboto', 25, '', 'Active'),
(307, 'Bishnupur', 22, '', 'Active'),
(308, 'Chandel', 22, '', 'Active'),
(309, 'Churachandpur', 22, '', 'Active'),
(310, 'Imphal East', 22, '', 'Active'),
(311, 'Imphal West', 22, '', 'Active'),
(312, 'Senapati', 22, '', 'Active'),
(313, 'Tamenglong', 22, '', 'Active'),
(314, 'Thoubal', 22, '', 'Active'),
(315, 'Ukhrul', 22, '', 'Active'),
(316, 'Aizawl', 24, '', 'Active'),
(317, 'Champhai', 24, '', 'Active'),
(318, 'Kolasib', 24, '', 'Active'),
(319, 'Lawngtlai', 24, '', 'Active'),
(320, 'Lunglei', 24, '', 'Active'),
(321, 'Mamit', 24, '', 'Active'),
(322, 'Saiha', 24, '', 'Active'),
(323, 'Serchhip', 24, '', 'Active'),
(324, 'Dhalai', 32, '', 'Active'),
(325, 'North Tripura', 32, '', 'Active'),
(326, 'South Tripura', 32, '', 'Active'),
(327, 'West Tripura', 32, '', 'Active'),
(328, 'East Garo Hills', 23, '', 'Active'),
(329, 'East Khasi Hills', 23, '', 'Active'),
(330, 'Jaintia Hills', 23, '', 'Active'),
(331, 'Ri Bhoi', 23, '', 'Active'),
(332, 'South Garo Hills', 23, '', 'Active'),
(333, 'West Garo Hills', 23, '', 'Active'),
(334, 'West Khasi Hills', 23, '', 'Active'),
(335, 'Baksa', 4, '', 'Active'),
(336, 'Barpeta', 4, '', 'Active'),
(337, 'Bongaigaon', 4, '', 'Active'),
(338, 'Cachar', 4, '', 'Active'),
(339, 'Chirang', 4, '', 'Active'),
(340, 'Darrang', 4, '', 'Active'),
(341, 'Dhemaji', 4, '', 'Active'),
(342, 'Dhubri', 4, '', 'Active'),
(343, 'Dibrugarh', 4, '', 'Active'),
(344, 'Dima Hasao (North Cachar Hills)', 4, '', 'Active'),
(345, 'Goalpara', 4, '', 'Active'),
(346, 'Golaghat', 4, '', 'Active'),
(347, 'Hailakandi', 4, '', 'Active'),
(348, 'Jorhat', 4, '', 'Active'),
(349, 'Kamrup', 4, '', 'Active'),
(350, 'Kamrup Metropolitan', 4, '', 'Active'),
(351, 'Karbi Anglong', 4, '', 'Active'),
(352, 'Karimganj', 4, '', 'Active'),
(353, 'Kokrajhar', 4, '', 'Active'),
(354, 'Lakhimpur', 4, '', 'Active'),
(355, 'Morigaon', 4, '', 'Active'),
(356, 'Nagaon', 4, '', 'Active'),
(357, 'Nalbari', 4, '', 'Active'),
(358, 'Sivasagar', 4, '', 'Active'),
(359, 'Sonitpur', 4, '', 'Active'),
(360, 'Tinsukia', 4, '', 'Active'),
(361, 'Udalguri', 4, '', 'Active'),
(362, 'Bankura', 35, '', 'Active'),
(363, 'Bardhaman', 35, '', 'Active'),
(364, 'Birbhum', 35, '', 'Active'),
(365, 'Cooch Behar', 35, '', 'Active'),
(366, 'Dakshin Dinajpur (South Dinajpur)', 35, '', 'Active'),
(367, 'Darjiling', 35, '', 'Active'),
(368, 'Hooghly', 35, '', 'Active'),
(369, 'Howrah', 35, '', 'Active'),
(370, 'Jalpaiguri', 35, '', 'Active'),
(371, 'Kolkata', 35, '', 'Active'),
(372, 'Maldah', 35, '', 'Active'),
(373, 'Murshidabad', 35, '', 'Active'),
(374, 'Nadia', 35, '', 'Active'),
(375, 'North 24 Parganas', 35, '', 'Active'),
(376, 'Paschim Medinipur (West Midnapore)', 35, '', 'Active'),
(377, 'Purba Medinipur (East Midnapore)', 35, '', 'Active'),
(378, 'Puruliya', 35, '', 'Active'),
(379, 'South 24 Parganas', 35, '', 'Active'),
(380, 'Uttar Dinajpur (North Dinajpur)', 35, '', 'Active'),
(381, 'Bokaro', 16, '', 'Active'),
(382, 'Chatra', 16, '', 'Active'),
(383, 'Deoghar', 16, '', 'Active'),
(384, 'Dhanbad', 16, '', 'Active'),
(385, 'Dumka', 16, '', 'Active'),
(386, 'East Singhbhum', 16, '', 'Active'),
(387, 'Garhwa', 16, '', 'Active'),
(388, 'Giridih', 16, '', 'Active'),
(389, 'Godda', 16, '', 'Active'),
(390, 'Gumla', 16, '', 'Active'),
(391, 'Hazaribagh', 16, '', 'Active'),
(392, 'Jamtara', 16, '', 'Active'),
(393, 'Khunti', 16, '', 'Active'),
(394, 'Koderma', 16, '', 'Active'),
(395, 'Latehar', 16, '', 'Active'),
(396, 'Lohardaga', 16, '', 'Active'),
(397, 'Pakur', 16, '', 'Active'),
(398, 'Palamu', 16, '', 'Active'),
(399, 'Ramgarh', 16, '', 'Active'),
(400, 'Ranchi', 16, '', 'Active'),
(401, 'Sahibganj', 16, '', 'Active'),
(402, 'Seraikela-Kharsawan', 16, '', 'Active'),
(403, 'Simdega', 16, '', 'Active'),
(404, 'West Singhbhum', 16, '', 'Active'),
(405, 'Angul', 26, '', 'Active'),
(406, 'Balangir', 26, '', 'Active'),
(407, 'Baleswar', 26, '', 'Active'),
(408, 'Bargarh', 26, '', 'Active'),
(409, 'Bhadrak', 26, '', 'Active'),
(410, 'Boudh', 26, '', 'Active'),
(411, 'Cuttack', 26, '', 'Active'),
(412, 'Debagarh', 26, '', 'Active'),
(413, 'Dhenkanal', 26, '', 'Active'),
(414, 'Gajapati', 26, '', 'Active'),
(415, 'Ganjam', 26, '', 'Active'),
(416, 'Jagatsinghapur', 26, '', 'Active'),
(417, 'Jajapur', 26, '', 'Active'),
(418, 'Jharsuguda', 26, '', 'Active'),
(419, 'Kalahandi', 26, '', 'Active'),
(420, 'Kandhamal', 26, '', 'Active'),
(421, 'Kendrapara', 26, '', 'Active'),
(422, 'Kendujhar', 26, '', 'Active'),
(423, 'Khordha', 26, '', 'Active'),
(424, 'Koraput', 26, '', 'Active'),
(425, 'Malkangiri', 26, '', 'Active'),
(426, 'Mayurbhanj', 26, '', 'Active'),
(427, 'Nabarangapur', 26, '', 'Active'),
(428, 'Nayagarh', 26, '', 'Active'),
(429, 'Nuapada', 26, '', 'Active'),
(430, 'Puri', 26, '', 'Active'),
(431, 'Rayagada', 26, '', 'Active'),
(432, 'Sambalpur', 26, '', 'Active'),
(433, 'Subarnapur (Sonapur)', 26, '', 'Active'),
(434, 'Sundergarh', 26, '', 'Active'),
(435, 'Bastar', 7, '', 'Active'),
(436, 'Bijapur (Chhattisgarh)', 7, '', 'Active'),
(437, 'Bilaspur (Chhattisgarh)', 7, '', 'Active'),
(438, 'Dakshin Bastar Dantewada', 7, '', 'Active'),
(439, 'Dhamtari', 7, '', 'Active'),
(440, 'Durg', 7, '', 'Active'),
(441, 'Janjgir-Champa', 7, '', 'Active'),
(442, 'Jashpur', 7, '', 'Active'),
(443, 'Kabirdham (Kawardha)', 7, '', 'Active'),
(444, 'Korba', 7, '', 'Active'),
(445, 'Koriya', 7, '', 'Active'),
(446, 'Mahasamund', 7, '', 'Active'),
(447, 'Narayanpur', 7, '', 'Active'),
(448, 'Raigarh (Chhattisgarh)', 7, '', 'Active'),
(449, 'Raipur', 7, '', 'Active'),
(450, 'Rajnandgaon', 7, '', 'Active'),
(451, 'Surguja', 7, '', 'Active'),
(452, 'Uttar Bastar Kanker', 7, '', 'Active'),
(453, 'Alirajpur', 20, '', 'Active'),
(454, 'Anuppur', 20, '', 'Active'),
(455, 'Ashok Nagar', 20, '', 'Active'),
(456, 'Balaghat', 20, '', 'Active'),
(457, 'Barwani', 20, '', 'Active'),
(458, 'Betul', 20, '', 'Active'),
(459, 'Bhind', 20, '', 'Active'),
(460, 'Bhopal', 20, '', 'Active'),
(461, 'Burhanpur', 20, '', 'Active'),
(462, 'Chhatarpur', 20, '', 'Active'),
(463, 'Chhindwara', 20, '', 'Active'),
(464, 'Damoh', 20, '', 'Active'),
(465, 'Datia', 20, '', 'Active'),
(466, 'Dewas', 20, '', 'Active'),
(467, 'Dhar', 20, '', 'Active'),
(468, 'Dindori', 20, '', 'Active'),
(469, 'Guna', 20, '', 'Active'),
(470, 'Gwalior', 20, '', 'Active'),
(471, 'Harda', 20, '', 'Active'),
(472, 'Hoshangabad', 20, '', 'Active'),
(473, 'Indore', 20, '', 'Active'),
(474, 'Jabalpur', 20, '', 'Active'),
(475, 'Jhabua', 20, '', 'Active'),
(476, 'Katni', 20, '', 'Active'),
(477, 'Khandwa (East Nimar)', 20, '', 'Active'),
(478, 'Khargone (West Nimar)', 20, '', 'Active'),
(479, 'Mandla', 20, '', 'Active'),
(480, 'Mandsaur', 20, '', 'Active'),
(481, 'Morena', 20, '', 'Active'),
(482, 'Narsinghpur', 20, '', 'Active'),
(483, 'Neemuch', 20, '', 'Active'),
(484, 'Panna', 20, '', 'Active'),
(485, 'Raisen', 20, '', 'Active'),
(486, 'Rajgarh', 20, '', 'Active'),
(487, 'Ratlam', 20, '', 'Active'),
(488, 'Rewa', 20, '', 'Active'),
(489, 'Sagar', 20, '', 'Active'),
(490, 'Satna', 20, '', 'Active'),
(491, 'Sehore', 20, '', 'Active'),
(492, 'Seoni', 20, '', 'Active'),
(493, 'Shahdol', 20, '', 'Active'),
(494, 'Shajapur', 20, '', 'Active'),
(495, 'Sheopur', 20, '', 'Active'),
(496, 'Shivpuri', 20, '', 'Active'),
(497, 'Sidhi', 20, '', 'Active'),
(498, 'Singrauli', 20, '', 'Active'),
(499, 'Tikamgarh', 20, '', 'Active'),
(500, 'Ujjain', 20, '', 'Active'),
(501, 'Umaria', 20, '', 'Active'),
(502, 'Vidisha', 20, '', 'Active'),
(503, 'Ahmedabad', 12, '', 'Active'),
(504, 'Amreli', 12, '', 'Active'),
(505, 'Anand', 12, '', 'Active'),
(506, 'Banaskantha', 12, '', 'Active'),
(507, 'Bharuch', 12, '', 'Active'),
(508, 'Bhavnagar', 12, '', 'Active'),
(509, 'Dahod', 12, '', 'Active'),
(510, 'Gandhi Nagar', 12, '', 'Active'),
(511, 'Jamnagar', 12, '', 'Active'),
(512, 'Junagadh', 12, '', 'Active'),
(513, 'Kachchh', 12, '', 'Active'),
(514, 'Kheda', 12, '', 'Active'),
(515, 'Mahesana', 12, '', 'Active'),
(516, 'Narmada', 12, '', 'Active'),
(517, 'Navsari', 12, '', 'Active'),
(518, 'Panch Mahals', 12, '', 'Active'),
(519, 'Patan', 12, '', 'Active'),
(520, 'Porbandar', 12, '', 'Active'),
(521, 'Rajkot', 12, '', 'Active'),
(522, 'Sabarkantha', 12, '', 'Active'),
(523, 'Surat', 12, '', 'Active'),
(524, 'Surendra Nagar', 12, '', 'Active'),
(525, 'Tapi', 12, '', 'Active'),
(526, 'The Dangs', 12, '', 'Active'),
(527, 'Vadodara', 12, '', 'Active'),
(528, 'Valsad', 12, '', 'Active'),
(529, 'Daman', 9, '', 'Active'),
(530, 'Diu', 9, '', 'Active'),
(531, 'Dadra & Nagar Haveli', 8, '', 'Active'),
(532, 'Ahmed Nagar', 21, '', 'Active'),
(533, 'Akola', 21, '', 'Active'),
(534, 'Amravati', 21, '', 'Active'),
(535, 'Aurangabad', 21, '', 'Active'),
(536, 'Beed', 21, '', 'Active'),
(537, 'Bhandara', 21, '', 'Active'),
(538, 'Buldhana', 21, '', 'Active'),
(539, 'Chandrapur', 21, '', 'Active'),
(540, 'Dhule', 21, '', 'Active'),
(541, 'Gadchiroli', 21, '', 'Active'),
(542, 'Gondia', 21, '', 'Active'),
(543, 'Hingoli', 21, '', 'Active'),
(544, 'Jalgaon', 21, '', 'Active'),
(545, 'Jalna', 21, '', 'Active'),
(546, 'Kolhapur', 21, '', 'Active'),
(547, 'Latur', 21, '', 'Active'),
(548, 'Mumbai', 21, '', 'Active'),
(549, 'Mumbai Suburban', 21, '', 'Active'),
(550, 'Nagpur', 21, '', 'Active'),
(551, 'Nanded', 21, '', 'Active'),
(552, 'Nandurbar', 21, '', 'Active'),
(553, 'Nashik', 21, '', 'Active'),
(554, 'Osmanabad', 21, '', 'Active'),
(555, 'Parbhani', 21, '', 'Active'),
(556, 'Pune', 21, '', 'Active'),
(557, 'Raigarh (Maharashtra)', 21, '', 'Active'),
(558, 'Ratnagiri', 21, '', 'Active'),
(559, 'Sangli', 21, '', 'Active'),
(560, 'Satara', 21, '', 'Active'),
(561, 'Sindhudurg', 21, '', 'Active'),
(562, 'Solapur', 21, '', 'Active'),
(563, 'Thane', 21, '', 'Active'),
(564, 'Wardha', 21, '', 'Active'),
(565, 'Washim', 21, '', 'Active'),
(566, 'Yavatmal', 21, '', 'Active'),
(567, 'Adilabad', 2, '', 'Active'),
(568, 'Anantapur', 2, '', 'Active'),
(569, 'Chittoor', 2, '', 'Active'),
(570, 'East Godavari', 2, '', 'Active'),
(571, 'Guntur', 2, '', 'Active'),
(572, 'Hyderabad', 2, '', 'Active'),
(573, 'Kadapa (Cuddapah)', 2, '', 'Active'),
(574, 'Karim Nagar', 2, '', 'Active'),
(575, 'Khammam', 2, '', 'Active'),
(576, 'Krishna', 2, '', 'Active'),
(577, 'Kurnool', 2, '', 'Active'),
(578, 'Mahbubnagar', 2, '', 'Active'),
(579, 'Medak', 2, '', 'Active'),
(580, 'Nalgonda', 2, '', 'Active'),
(581, 'Nellore', 2, '', 'Active'),
(582, 'Nizamabad', 2, '', 'Active'),
(583, 'Prakasam', 2, '', 'Active'),
(584, 'Rangareddy', 2, '', 'Active'),
(585, 'Srikakulam', 2, '', 'Active'),
(586, 'Visakhapatnam', 2, '', 'Active'),
(587, 'Vizianagaram', 2, '', 'Active'),
(588, 'Warangal', 2, '', 'Active'),
(589, 'West Godavari', 2, '', 'Active'),
(590, 'Bagalkot', 17, '', 'Active'),
(591, 'Bangalore', 17, '', 'Active'),
(592, 'Bangalore Rural', 17, '', 'Active'),
(593, 'Belgaum', 17, '', 'Active'),
(594, 'Bellary', 17, '', 'Active'),
(595, 'Bidar', 17, '', 'Active'),
(596, 'Bijapur (Karnataka)', 17, '', 'Active'),
(597, 'Chamrajnagar', 17, '', 'Active'),
(598, 'Chickmagalur', 17, '', 'Active'),
(599, 'Chikkaballapur', 17, '', 'Active'),
(600, 'Chitradurga', 17, '', 'Active'),
(601, 'Dakshina Kannada', 17, '', 'Active'),
(602, 'Davanagere', 17, '', 'Active'),
(603, 'Dharwad', 17, '', 'Active'),
(604, 'Gadag', 17, '', 'Active'),
(605, 'Gulbarga', 17, '', 'Active'),
(606, 'Hassan', 17, '', 'Active'),
(607, 'Haveri', 17, '', 'Active'),
(608, 'Kodagu', 17, '', 'Active'),
(609, 'Kolar', 17, '', 'Active'),
(610, 'Koppal', 17, '', 'Active'),
(611, 'Mandya', 17, '', 'Active'),
(612, 'Mysore', 17, '', 'Active'),
(613, 'Raichur', 17, '', 'Active'),
(614, 'Ramanagara', 17, '', 'Active'),
(615, 'Shimoga', 17, '', 'Active'),
(616, 'Tumkur', 17, '', 'Active'),
(617, 'Udupi', 17, '', 'Active'),
(618, 'Uttara Kannada', 17, '', 'Active'),
(619, 'Yadgir', 17, '', 'Active'),
(620, 'North Goa', 11, '', 'Active'),
(621, 'South Goa', 11, '', 'Active'),
(622, 'Lakshadweep', 19, '', 'Active'),
(623, 'Alappuzha', 18, '', 'Active'),
(624, 'Ernakulam', 18, '', 'Active'),
(625, 'Idukki', 18, '', 'Active'),
(626, 'Kannur', 18, '', 'Active'),
(627, 'Kasaragod', 18, '', 'Active'),
(628, 'Kollam', 18, '', 'Active'),
(629, 'Kottayam', 18, '', 'Active'),
(630, 'Kozhikode', 18, '', 'Active'),
(631, 'Malappuram', 18, '', 'Active'),
(632, 'Palakkad', 18, '', 'Active'),
(633, 'Pathanamthitta', 18, '', 'Active'),
(634, 'Thiruvananthapuram', 18, '', 'Active'),
(635, 'Thrissur', 18, '', 'Active'),
(636, 'Wayanad', 18, '', 'Active'),
(637, 'Ariyalur', 31, '', 'Active'),
(638, 'Chennai', 31, '', 'Active'),
(639, 'Coimbatore', 31, '', 'Active'),
(640, 'Cuddalore', 31, '', 'Active'),
(641, 'Dharmapuri', 31, '', 'Active'),
(642, 'Dindigul', 31, '', 'Active'),
(643, 'Erode', 31, '', 'Active'),
(644, 'Kanchipuram', 31, '', 'Active'),
(645, 'Kanyakumari', 31, '', 'Active'),
(646, 'Karur', 31, '', 'Active'),
(647, 'Krishnagiri', 31, '', 'Active'),
(648, 'Madurai', 31, '', 'Active'),
(649, 'Nagapattinam', 31, '', 'Active'),
(650, 'Namakkal', 31, '', 'Active'),
(651, 'Nilgiris', 31, '', 'Active'),
(652, 'Perambalur', 31, '', 'Active'),
(653, 'Pudukkottai', 31, '', 'Active'),
(654, 'Ramanathapuram', 31, '', 'Active'),
(655, 'Salem', 31, '', 'Active'),
(656, 'Sivaganga', 31, '', 'Active'),
(657, 'Thanjavur', 31, '', 'Active'),
(658, 'Theni', 31, '', 'Active'),
(659, 'Thoothukudi (Tuticorin)', 31, '', 'Active'),
(660, 'Tiruchirappalli', 31, '', 'Active'),
(661, 'Tirunelveli', 31, '', 'Active'),
(662, 'Tiruppur', 31, '', 'Active'),
(663, 'Tiruvallur', 31, '', 'Active'),
(664, 'Tiruvannamalai', 31, '', 'Active'),
(665, 'Tiruvarur', 31, '', 'Active'),
(666, 'Vellore', 31, '', 'Active'),
(667, 'Viluppuram', 31, '', 'Active'),
(668, 'Virudhunagar', 31, '', 'Active'),
(669, 'Karaikal', 27, '', 'Active'),
(670, 'Mahe', 27, '', 'Active'),
(671, 'Puducherry (Pondicherry)', 27, '', 'Active'),
(672, 'Yanam', 27, '', 'Active'),
(673, 'Nicobar', 1, '', 'Active'),
(674, 'North And Middle Andaman', 1, '', 'Active'),
(675, 'South Andaman', 1, '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faqs_question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `faqs_question`, `faqs_answer`, `faqs_order`, `created_at`, `updated_at`) VALUES
(1, 'How to list my item?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti esse voluptates deleniti, ratione, suscipit quam cumque beatae, enim mollitia voluptatum velit excepturi possimus odio dolore molestiae officiis aspernatur provident praesentium.', 1, '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(2, 'Is this available in my country?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti esse voluptates deleniti, ratione, suscipit quam cumque beatae, enim mollitia voluptatum velit excepturi possimus odio dolore molestiae officiis aspernatur provident praesentium.', 2, '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(3, 'Is it free?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti esse voluptates deleniti, ratione, suscipit quam cumque beatae, enim mollitia voluptatum velit excepturi possimus odio dolore molestiae officiis aspernatur provident praesentium.', 3, '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(4, 'How the system works?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti esse voluptates deleniti, ratione, suscipit quam cumque beatae, enim mollitia voluptatum velit excepturi possimus odio dolore molestiae officiis aspernatur provident praesentium.', 4, '2021-06-30 07:34:54', '2021-06-30 07:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `import_csv_data`
--

CREATE TABLE `import_csv_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `import_csv_data_filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_csv_data_sample` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_csv_data_skip_first_row` int(11) NOT NULL DEFAULT 1,
  `import_csv_data_total_rows` int(11) NOT NULL,
  `import_csv_data_parsed_rows` int(11) NOT NULL DEFAULT 0,
  `import_csv_data_parse_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:not parsed 2:partial parsed 3:all parsed',
  `import_csv_data_for_model` int(11) NOT NULL DEFAULT 1 COMMENT '1:listing 2:category 3:product',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_item_data`
--

CREATE TABLE `import_item_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `import_item_data_markup` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_social_facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_social_twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_social_linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_item_youtube_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_item_data_process_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:not processed 2:processed success 3:processed error',
  `import_item_data_item_id` int(11) DEFAULT NULL,
  `import_item_data_source` int(11) NOT NULL DEFAULT 1 COMMENT '1:csv file 2:google place',
  `import_item_data_process_error_log` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_item_feature_data`
--

CREATE TABLE `import_item_feature_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `import_item_data_id` int(11) NOT NULL,
  `import_item_feature_data_custom_field_id` int(11) NOT NULL,
  `import_item_feature_data_item_feature_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `invoice_num` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_item_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_item_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_amount` decimal(5,2) NOT NULL,
  `invoice_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_paypal_profile_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_razorpay_payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_razorpay_signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_stripe_invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_bank_transfer_bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_bank_transfer_detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_bank_transfer_future_plan_id` int(11) DEFAULT NULL,
  `invoice_payumoney_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_payumoney_future_plan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'ABANDONED',
  `item_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:submitted 2:published 3:suspended',
  `item_featured` int(11) NOT NULL DEFAULT 0 COMMENT '0/1',
  `item_featured_by_admin` int(11) NOT NULL DEFAULT 0 COMMENT '0/1',
  `item_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_address_hide` int(11) NOT NULL DEFAULT 0 COMMENT '0: not hide 1:hide',
  `city_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `item_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_price` int(11) DEFAULT NULL,
  `item_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_social_facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_social_twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_social_linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_features_string` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_image_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_image_tiny` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_categories_string` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image_blur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_youtube_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_average_rating` decimal(2,1) DEFAULT NULL,
  `item_location_str` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_type` int(11) NOT NULL DEFAULT 1 COMMENT '1: regular item 2:online item'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_claims`
--

CREATE TABLE `item_claims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_claim_full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_claim_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_claim_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_claim_additional_proof` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_claim_additional_upload` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_claim_status` int(11) DEFAULT NULL COMMENT '1:claim requested, 2:claim disapprove, 3:claim approve',
  `item_claim_reply` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_features`
--

CREATE TABLE `item_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `item_feature_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_image_galleries`
--

CREATE TABLE `item_image_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_image_gallery_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image_gallery_thumb_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_image_gallery_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_leads`
--

CREATE TABLE `item_leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_lead_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_lead_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_lead_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_lead_subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_lead_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_sections`
--

CREATE TABLE `item_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_section_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_section_position` int(11) NOT NULL,
  `item_section_order` int(11) NOT NULL,
  `item_section_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:draft, 2:published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_section_collections`
--

CREATE TABLE `item_section_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_section_id` int(11) NOT NULL,
  `item_section_collection_order` int(11) NOT NULL,
  `item_section_collection_collectible_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_section_collection_collectible_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_user`
--

CREATE TABLE `item_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `language`, `created_at`, `updated_at`) VALUES
(1, NULL, 'en', '2021-07-01 07:34:53', '2021-07-01 07:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(541, '2014_10_12_000000_create_users_table', 1),
(542, '2014_10_12_100000_create_password_resets_table', 1),
(543, '2014_10_28_175635_create_threads_table', 1),
(544, '2014_10_28_175710_create_messages_table', 1),
(545, '2014_10_28_180224_create_participants_table', 1),
(546, '2014_11_03_154831_add_soft_deletes_to_participants_table', 1),
(547, '2014_12_04_124531_add_softdeletes_to_threads_table', 1),
(548, '2017_03_30_152742_add_soft_deletes_to_messages_table', 1),
(549, '2018_06_30_113500_create_comments_table', 1),
(550, '2018_08_29_200844_create_languages_table', 1),
(551, '2018_08_29_205156_create_translations_table', 1),
(552, '2018_10_12_000000_create_canvas_tables', 1),
(553, '2019_02_16_000000_create_canvas_topics_tables', 1),
(554, '2019_03_05_000000_add_indexes_to_canvas_views', 1),
(555, '2019_07_26_000000_alter_canvas_posts_published_at_default_value', 1),
(556, '2019_08_19_000000_create_failed_jobs_table', 1),
(557, '2019_12_08_000000_alter_canvas_tags_add_user_id', 1),
(558, '2019_12_08_000000_alter_canvas_topics_add_user_id', 1),
(559, '2019_12_09_000000_alter_canvas_posts_add_compound_index', 1),
(560, '2019_12_09_000000_alter_canvas_posts_user_id_default_value', 1),
(561, '2019_12_09_000000_alter_canvas_views_rename_indexes', 1),
(562, '2019_12_10_000000_create_canvas_user_meta_table', 1),
(563, '2020_02_03_000000_create_canvas_visits_table', 1),
(564, '2020_03_29_000000_alter_canvas_user_meta_add_locale', 1),
(565, '2020_04_10_000000_alter_canvas_tables_user_id_column_type', 1),
(566, '2020_04_14_020740_create_roles_table', 1),
(567, '2020_04_14_020801_create_items_table', 1),
(568, '2020_04_14_020841_create_item_image_galleries_table', 1),
(569, '2020_04_14_020900_create_categories_table', 1),
(570, '2020_04_14_020923_create_custom_fields_table', 1),
(571, '2020_04_14_020953_create_item_features_table', 1),
(572, '2020_04_14_021004_create_cities_table', 1),
(573, '2020_04_14_021013_create_states_table', 1),
(574, '2020_04_14_021028_create_countries_table', 1),
(575, '2020_04_21_123146_create_testimonials_table', 1),
(576, '2020_04_21_123244_create_faqs_table', 1),
(577, '2020_04_21_123334_create_social_medias_table', 1),
(578, '2020_04_21_123430_create_settings_table', 1),
(579, '2020_04_24_122358_create_thread_item_rels_table', 1),
(580, '2020_04_26_045845_create_plans_table', 1),
(581, '2020_04_26_052229_create_subscriptions_table', 1),
(582, '2020_04_27_114810_create_invoices_table', 1),
(583, '2020_04_27_115157_create_paypal_ipn_logs_table', 1),
(584, '2020_06_12_024935_add_social_media_links_to_items_table', 1),
(585, '2020_06_12_090840_add_item_features_string_to_items_table', 1),
(586, '2020_06_13_140234_create_item_user_table', 1),
(587, '2020_06_14_061750_add_item_image_medium_small_to_items_table', 1),
(588, '2020_06_14_073101_add_google_analytics_to_settings_table', 1),
(589, '2020_06_16_025717_add_site_language_to_settings_table', 1),
(590, '2020_06_26_123858_create_reviews_table', 1),
(591, '2020_06_27_160843_alter_reviews_table_body_column_type', 1),
(592, '2020_07_06_051354_add_item_image_gallery_thumb_name_to_item_image_galleries_table', 1),
(593, '2020_07_08_113823_create_advertisements_table', 1),
(594, '2020_07_13_065428_create_social_logins_table', 1),
(595, '2020_07_15_053824_create_socialite_accounts_table', 1),
(596, '2020_07_16_025651_add_header_footer_to_settings_table', 1),
(597, '2020_07_20_061652_add_smtp_to_settings_table', 1),
(598, '2020_07_20_083817_add_user_prefer_lang_to_users_table', 1),
(599, '2020_07_23_131458_add_parent_id_to_categories_table', 1),
(600, '2020_07_24_052425_create_category_custom_field_table', 1),
(601, '2020_07_24_070030_create_category_item_table', 1),
(602, '2020_07_27_021404_add_item_categories_string_to_items_table', 1),
(603, '2020_08_07_134624_create_customizations_table', 1),
(604, '2020_08_14_033350_add_item_image_blur_to_items_table', 1),
(605, '2020_08_14_063101_add_item_youtube_id_to_items_table', 1),
(606, '2020_08_21_024033_add_pay_method_to_subscriptions_table', 1),
(607, '2020_08_21_024408_add_razorpay_to_settings_table', 1),
(608, '2020_08_21_024500_add_razorpay_to_invoices_table', 1),
(609, '2020_08_21_085845_create_razorpay_webhook_logs_table', 1),
(610, '2020_09_11_065009_create_review_image_galleries_table', 1),
(611, '2020_09_15_071953_add_recaptcha_to_settings_table', 1),
(612, '2020_09_17_055219_create_item_claims_table', 1),
(613, '2020_09_23_151719_create_stripe_webhook_logs_table', 1),
(614, '2020_09_23_152258_add_stripe_to_subscriptions_table', 1),
(615, '2020_09_23_152638_add_stripe_to_invoices_table', 1),
(616, '2020_09_24_051101_add_stripe_to_settings_table', 1),
(617, '2020_09_26_025152_create_setting_bank_transfers_table', 1),
(618, '2020_09_26_053209_add_bank_transfer_to_invoices_table', 1),
(619, '2020_09_30_064840_add_sitemap_to_settings_table', 1),
(620, '2020_11_02_072719_create_products_table', 1),
(621, '2020_11_02_074021_create_product_image_galleries_table', 1),
(622, '2020_11_02_074706_create_attributes_table', 1),
(623, '2020_11_02_075734_create_product_features_table', 1),
(624, '2020_11_10_070532_add_product_to_settings_table', 1),
(625, '2020_11_11_072017_create_item_sections_table', 1),
(626, '2020_11_11_072804_create_item_section_collections_table', 1),
(627, '2020_12_03_044914_add_cache_to_settings_table', 1),
(628, '2020_12_03_150332_add_google_map_to_settings_table', 1),
(629, '2020_12_07_022000_add_category_description_to_categories_table', 1),
(630, '2020_12_08_015156_create_import_csv_data_table', 1),
(631, '2020_12_08_071710_create_import_item_data', 1),
(632, '2020_12_14_045936_add_item_average_rating_to_items_table', 1),
(633, '2020_12_16_032106_alter_plans_plan_price_length', 1),
(634, '2020_12_29_033113_add_user_prefer_country_to_users_table', 1),
(635, '2021_01_05_035810_add_payumoney_to_settings_table', 1),
(636, '2021_01_05_040403_add_payumoney_to_invoices_table', 1),
(637, '2021_01_15_060816_create_themes_table', 1),
(638, '2021_01_15_062737_add_theme_id_to_customizations_table', 1),
(639, '2021_01_15_063219_add_theme_id_to_settings_table', 1),
(640, '2021_01_28_120017_add_location_str_to_items_table', 1),
(641, '2021_01_29_083250_add_item_type_to_items_table', 1),
(642, '2021_02_07_122643_add_max_free_listing_to_plans_table', 1),
(643, '2021_02_08_081827_add_abandoned_comment_to_subscriptions_table', 1),
(644, '2021_02_19_070354_create_settings_items_table', 1),
(645, '2021_02_20_024440_create_import_item_feature_data', 1),
(646, '2021_04_17_041556_add_recommend_width_height_to_customizations_table', 1),
(647, '2021_05_28_072011_create_item_leads_table', 1),
(648, '2021_05_29_132017_add_setting_site_recaptcha_item_lead_enable_to_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn_logs`
--

CREATE TABLE `paypal_ipn_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paypal_ipn_log_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_type` int(11) NOT NULL COMMENT '1:free 2:paid 3:admin_plan',
  `plan_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_max_featured_listing` int(11) DEFAULT NULL COMMENT 'unlimited listing if null',
  `plan_features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_period` int(11) NOT NULL COMMENT '1:lifetime 2:monthly 3:quarterly 4:yearly',
  `plan_price` decimal(9,2) NOT NULL,
  `plan_status` int(11) NOT NULL COMMENT '1:enabled 0:disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_max_free_listing` int(11) DEFAULT NULL COMMENT 'unlimited free listing if null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan_type`, `plan_name`, `plan_max_featured_listing`, `plan_features`, `plan_period`, `plan_price`, `plan_status`, `created_at`, `updated_at`, `plan_max_free_listing`) VALUES
(1, 1, 'Free', 0, 'Email support', 1, '0.00', 1, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL),
(2, 3, 'Admin', NULL, 'admin only plan', 1, '0.00', 1, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL),
(3, 2, 'Monthly Premium', 10, 'Priority email support', 2, '9.99', 1, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL),
(4, 2, 'Quarterly Premium', 20, 'Priority email support', 3, '26.99', 1, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL),
(5, 2, 'Yearly Premium', 30, 'Priority email support', 4, '94.99', 1, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_status` int(11) NOT NULL DEFAULT 1 COMMENT '1:pending 2:approved 3:suspend',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` decimal(12,2) DEFAULT NULL,
  `product_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image_large` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `product_feature_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_feature_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_image_galleries`
--

CREATE TABLE `product_image_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image_gallery_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image_gallery_thumb_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_webhook_logs`
--

CREATE TABLE `razorpay_webhook_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `razorpay_webhook_log_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `customer_service_rating` int(11) DEFAULT NULL,
  `quality_rating` int(11) DEFAULT NULL,
  `friendly_rating` int(11) DEFAULT NULL,
  `pricing_rating` int(11) DEFAULT NULL,
  `recommend` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` enum('Sales','Service','Parts') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `reviewrateable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewrateable_id` bigint(20) UNSIGNED NOT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_image_galleries`
--

CREATE TABLE `review_image_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review_id` int(11) NOT NULL,
  `review_image_gallery_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_image_gallery_thumb_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_image_gallery_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(3, 'User', 'user', '2021-06-30 07:34:54', '2021-06-30 07:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_location_lat` double(18,15) NOT NULL,
  `setting_site_location_lng` double(18,15) NOT NULL,
  `setting_site_location_country_id` int(11) NOT NULL,
  `setting_site_seo_home_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_seo_home_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_seo_home_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox' COMMENT 'sandbox or live',
  `setting_site_paypal_payment_action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sale',
  `setting_site_paypal_currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `setting_site_paypal_billing_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MerchantInitiatedBilling',
  `setting_site_paypal_notify_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `setting_site_paypal_locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en_US',
  `setting_site_paypal_validate_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `setting_site_paypal_sandbox_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_sandbox_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_sandbox_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_sandbox_certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_sandbox_app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_live_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_live_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_live_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_live_certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_paypal_live_app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_page_about_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:off, 1:on',
  `setting_page_about` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_page_terms_of_service_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:off, 1:on',
  `setting_page_terms_of_service` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_page_privacy_policy_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:off, 1:on',
  `setting_page_privacy_policy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `setting_site_google_analytic_enabled` int(11) NOT NULL DEFAULT 0 COMMENT '1:on 0:off',
  `setting_site_google_analytic_tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_google_analytic_not_track_admin` int(11) NOT NULL DEFAULT 1 COMMENT '1:track 0:no track',
  `setting_site_language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_header_enabled` int(11) NOT NULL DEFAULT 0 COMMENT '1:on 0:off',
  `setting_site_header` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_footer_enabled` int(11) NOT NULL DEFAULT 0 COMMENT '1:on 0:off',
  `setting_site_footer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings_site_smtp_enabled` int(11) NOT NULL DEFAULT 0 COMMENT '0:disabled 1:enabled',
  `settings_site_smtp_sender_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings_site_smtp_sender_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings_site_smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings_site_smtp_port` int(11) DEFAULT NULL,
  `settings_site_smtp_encryption` int(11) NOT NULL DEFAULT 0 COMMENT '0:null 1:ssl 2:tls',
  `settings_site_smtp_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings_site_smtp_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_razorpay_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `setting_site_razorpay_api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_razorpay_api_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_razorpay_currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INR',
  `setting_site_paypal_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `setting_site_recaptcha_login_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `setting_site_recaptcha_sign_up_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `setting_site_recaptcha_contact_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `setting_site_recaptcha_site_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_recaptcha_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_stripe_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `setting_site_stripe_publishable_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_stripe_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_stripe_webhook_signing_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_stripe_currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'usd',
  `setting_site_sitemap_index_enable` int(11) NOT NULL DEFAULT 1 COMMENT '0:disable 1:enable',
  `setting_site_sitemap_show_in_footer` int(11) NOT NULL DEFAULT 1 COMMENT '0:not show 1:show',
  `setting_site_sitemap_page_enable` int(11) NOT NULL DEFAULT 1 COMMENT '0:disable 1:enable',
  `setting_site_sitemap_page_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'weekly' COMMENT '1:always 2:hourly 3:daily 4:weekly 5:monthly 6:yearly 7:never',
  `setting_site_sitemap_page_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xml' COMMENT '1:xml 2:html 3:txt 4:ror-rss 5:ror-rdf',
  `setting_site_sitemap_page_include_to_index` int(11) NOT NULL DEFAULT 1 COMMENT '0:not include 1:include',
  `setting_site_sitemap_category_enable` int(11) NOT NULL DEFAULT 1 COMMENT '0:disable 1:enable',
  `setting_site_sitemap_category_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'weekly' COMMENT '1:always 2:hourly 3:daily 4:weekly 5:monthly 6:yearly 7:never',
  `setting_site_sitemap_category_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xml' COMMENT '1:xml 2:html 3:txt 4:ror-rss 5:ror-rdf',
  `setting_site_sitemap_category_include_to_index` int(11) NOT NULL DEFAULT 1 COMMENT '0:not include 1:include',
  `setting_site_sitemap_listing_enable` int(11) NOT NULL DEFAULT 1 COMMENT '0:disable 1:enable',
  `setting_site_sitemap_listing_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'weekly' COMMENT '1:always 2:hourly 3:daily 4:weekly 5:monthly 6:yearly 7:never',
  `setting_site_sitemap_listing_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xml' COMMENT '1:xml 2:html 3:txt 4:ror-rss 5:ror-rdf',
  `setting_site_sitemap_listing_include_to_index` int(11) NOT NULL DEFAULT 1 COMMENT '0:not include 1:include',
  `setting_site_sitemap_post_enable` int(11) NOT NULL DEFAULT 1 COMMENT '0:disable 1:enable',
  `setting_site_sitemap_post_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'weekly' COMMENT '1:always 2:hourly 3:daily 4:weekly 5:monthly 6:yearly 7:never',
  `setting_site_sitemap_post_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xml' COMMENT '1:xml 2:html 3:txt 4:ror-rss 5:ror-rdf',
  `setting_site_sitemap_post_include_to_index` int(11) NOT NULL DEFAULT 1 COMMENT '0:not include 1:include',
  `setting_site_sitemap_tag_enable` int(11) NOT NULL DEFAULT 1 COMMENT '0:disable 1:enable',
  `setting_site_sitemap_tag_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'weekly' COMMENT '1:always 2:hourly 3:daily 4:weekly 5:monthly 6:yearly 7:never',
  `setting_site_sitemap_tag_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xml' COMMENT '1:xml 2:html 3:txt 4:ror-rss 5:ror-rdf',
  `setting_site_sitemap_tag_include_to_index` int(11) NOT NULL DEFAULT 1 COMMENT '0:not include 1:include',
  `setting_site_sitemap_topic_enable` int(11) NOT NULL DEFAULT 1 COMMENT '0:disable 1:enable',
  `setting_site_sitemap_topic_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'weekly' COMMENT '1:always 2:hourly 3:daily 4:weekly 5:monthly 6:yearly 7:never',
  `setting_site_sitemap_topic_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xml' COMMENT '1:xml 2:html 3:txt 4:ror-rss 5:ror-rdf',
  `setting_site_sitemap_topic_include_to_index` int(11) NOT NULL DEFAULT 1 COMMENT '0:not include 1:include',
  `setting_product_max_gallery_photos` int(11) NOT NULL DEFAULT 6,
  `setting_product_auto_approval_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `setting_product_currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$',
  `setting_site_last_cached_at` datetime DEFAULT NULL,
  `setting_site_map` int(11) NOT NULL DEFAULT 1 COMMENT '1:OpenStreetMap 2:Google Map',
  `setting_site_map_google_api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_payumoney_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `setting_site_payumoney_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_payumoney_merchant_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_payumoney_salt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_site_active_theme_id` int(11) NOT NULL,
  `setting_site_recaptcha_item_lead_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_site_logo`, `setting_site_favicon`, `setting_site_name`, `setting_site_email`, `setting_site_phone`, `setting_site_address`, `setting_site_state`, `setting_site_city`, `setting_site_country`, `setting_site_postal_code`, `setting_site_about`, `setting_site_location_lat`, `setting_site_location_lng`, `setting_site_location_country_id`, `setting_site_seo_home_title`, `setting_site_seo_home_description`, `setting_site_seo_home_keywords`, `setting_site_paypal_mode`, `setting_site_paypal_payment_action`, `setting_site_paypal_currency`, `setting_site_paypal_billing_type`, `setting_site_paypal_notify_url`, `setting_site_paypal_locale`, `setting_site_paypal_validate_ssl`, `setting_site_paypal_sandbox_username`, `setting_site_paypal_sandbox_password`, `setting_site_paypal_sandbox_secret`, `setting_site_paypal_sandbox_certificate`, `setting_site_paypal_sandbox_app_id`, `setting_site_paypal_live_username`, `setting_site_paypal_live_password`, `setting_site_paypal_live_secret`, `setting_site_paypal_live_certificate`, `setting_site_paypal_live_app_id`, `setting_page_about_enable`, `setting_page_about`, `setting_page_terms_of_service_enable`, `setting_page_terms_of_service`, `setting_page_privacy_policy_enable`, `setting_page_privacy_policy`, `created_at`, `updated_at`, `setting_site_google_analytic_enabled`, `setting_site_google_analytic_tracking_id`, `setting_site_google_analytic_not_track_admin`, `setting_site_language`, `setting_site_header_enabled`, `setting_site_header`, `setting_site_footer_enabled`, `setting_site_footer`, `settings_site_smtp_enabled`, `settings_site_smtp_sender_name`, `settings_site_smtp_sender_email`, `settings_site_smtp_host`, `settings_site_smtp_port`, `settings_site_smtp_encryption`, `settings_site_smtp_username`, `settings_site_smtp_password`, `setting_site_razorpay_enable`, `setting_site_razorpay_api_key`, `setting_site_razorpay_api_secret`, `setting_site_razorpay_currency`, `setting_site_paypal_enable`, `setting_site_recaptcha_login_enable`, `setting_site_recaptcha_sign_up_enable`, `setting_site_recaptcha_contact_enable`, `setting_site_recaptcha_site_key`, `setting_site_recaptcha_secret_key`, `setting_site_stripe_enable`, `setting_site_stripe_publishable_key`, `setting_site_stripe_secret_key`, `setting_site_stripe_webhook_signing_secret`, `setting_site_stripe_currency`, `setting_site_sitemap_index_enable`, `setting_site_sitemap_show_in_footer`, `setting_site_sitemap_page_enable`, `setting_site_sitemap_page_frequency`, `setting_site_sitemap_page_format`, `setting_site_sitemap_page_include_to_index`, `setting_site_sitemap_category_enable`, `setting_site_sitemap_category_frequency`, `setting_site_sitemap_category_format`, `setting_site_sitemap_category_include_to_index`, `setting_site_sitemap_listing_enable`, `setting_site_sitemap_listing_frequency`, `setting_site_sitemap_listing_format`, `setting_site_sitemap_listing_include_to_index`, `setting_site_sitemap_post_enable`, `setting_site_sitemap_post_frequency`, `setting_site_sitemap_post_format`, `setting_site_sitemap_post_include_to_index`, `setting_site_sitemap_tag_enable`, `setting_site_sitemap_tag_frequency`, `setting_site_sitemap_tag_format`, `setting_site_sitemap_tag_include_to_index`, `setting_site_sitemap_topic_enable`, `setting_site_sitemap_topic_frequency`, `setting_site_sitemap_topic_format`, `setting_site_sitemap_topic_include_to_index`, `setting_product_max_gallery_photos`, `setting_product_auto_approval_enable`, `setting_product_currency_symbol`, `setting_site_last_cached_at`, `setting_site_map`, `setting_site_map_google_api_key`, `setting_site_payumoney_enable`, `setting_site_payumoney_mode`, `setting_site_payumoney_merchant_key`, `setting_site_payumoney_salt`, `setting_site_active_theme_id`, `setting_site_recaptcha_item_lead_enable`) VALUES
(1, NULL, NULL, 'Pest Control', 'email@example.com', '+1 232 3235 324', '2345 Garyson Street', 'Rajasthan', 'Jaipur', 'India', '302016', 'Directory Hub is a business directory and listing CMS, inspired by Yelp, provides features like unlimited-level categories, custom fields, listing with multiple categories. It offers buyers the maximum extensibility to make any type of business or niche directory.', 31.891600000000000, -97.067100000000000, 105, 'Restaurants, Dentists, Bars, Beauty Salons, Doctors', 'User Reviews and Recommendations of Best Restaurants, Shopping, Nightlife, Food, Entertainment, Things to Do, Services and More', 'recommendation,local,business,review,friend,restaurant,dentist,doctor,salon,spa,shopping,store,share,community,massage,sushi,pizza,nails', 'sandbox', 'Sale', 'USD', 'MerchantInitiatedBilling', '', 'en_US', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '<h2>Shaping the Future of Business</h2><p>We are committed to nurturing a neutral platform and are helping business establishments maintain high standards.<br></p><p><br></p><h2>Who Are We?</h2><p>Welcome to Listing Plus, your number one source for all things. We\'re dedicated to giving you the very best of business information.</p><p>Listing Plus has come a long way from its beginnings. When first started out, our passion for business growing drove them so that Listing Plus can now serve customers all over the world, and are thrilled that we\'re able to turn our passion into our own website.</p><p>We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us.</p><p><br></p><h2>Our Values</h2><p><br></p><h3>Resilience</h3><p>We push ourselves beyond our abilities when faced with tough times. When we foresee uncertainty, we address it only with flexibility.</p><p><br></p><h3>Acceptance</h3><p>Feedback is never taken personally, we break it into positive pieces and strive to work on each and every element even more effectively.</p><p><br></p><h3>Humility</h3><p>It’s always ‘us’ over ‘me’. We don’t lose ourselves in pride or confidence during individual successes but focus on being our simple selves in every which way.</p><p><br></p><h3>Spark</h3><p>We believe in, stand for, and are evangelists of our culture - both, within Zomato and externally with all our stakeholders.</p><p><br></p><h3>Judgment</h3><p>It’s not our abilities that show who we truly are - it’s our choices. We aim to get these rights, at least in the majority of the cases.</p>', 1, '<p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Please read these terms of service (\"terms\", \"terms of service\") carefully before using [website] website (the \"service\") operated by [name] (\"us\", \'we\", \"our\").</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><strong>Conditions of Use</strong></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">We will provide their services to you, which are subject to the conditions stated below in this document. Every time you visit this website, use its services or make a purchase, you accept the following conditions. This is why we urge you to read them carefully.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><strong>Privacy Policy</strong></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Before you continue using our website we advise you to read our privacy policy [link to privacy policy] regarding our user data collection. It will help you better understand our practices.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><strong>Copyright</strong></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Content published on this website (digital downloads, images, texts, graphics, logos) is the property of [name] and/or its content creators and protected by international copyright laws. The entire compilation of the content found on this website is the exclusive property of [name], with copyright authorship for this compilation by [name].</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><strong>Communications</strong></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">The entire communication with us is electronic. Every time you send us an email or visit our website, you are going to be communicating with us. You hereby consent to receive communications from us. If you subscribe to the news on our website, you are going to receive regular emails from us. We will continue to communicate with you by posting news and notices on our website and by sending you emails. You also agree that all notices, disclosures, agreements and other communications we provide to you electronically meet the legal requirements that such communications be in writing.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><strong>Applicable Law</strong></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">By visiting this website, you agree that the laws of the [your location], without regard to principles of conflict laws, will govern these terms of service, or any dispute of any sort that might come between [name] and you, or its business partners and associates.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><strong style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">Disputes</strong><br></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Any dispute related in any way to your visit to this website or to products you purchase from us shall be arbitrated by state or federal court [your location] and you consent to exclusive jurisdiction and venue of such courts.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\"><strong>Comments, Reviews, and Emails</strong></span><br></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Visitors may post content as long as it is not obscene, illegal, defamatory, threatening, infringing of intellectual property rights, invasive of privacy or injurious in any other way to third parties. Content has to be free of software viruses, political campaign, and commercial solicitation.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">We reserve all rights (but not the obligation) to remove and/or edit such content. When you post your content, you grant [name] non-exclusive, royalty-free and irrevocable right to use, reproduce, publish, modify such content throughout the world in any media.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><strong>License and Site Access</strong></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">We grant you a limited license to access and make personal use of this website. You are not allowed to download or modify it. This may be done only with written consent from us.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\"><strong>User Account</strong></p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">If you are an owner of an account on this website, you are solely responsible for maintaining the confidentiality of your private user details (username and password). You are responsible for all activities that occur under your account or password.</p><p style=\"border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">We reserve all rights to terminate accounts, edit or remove content and cancel orders in their sole discretion.</p>', 1, '<p>This privacy policy (\"policy\") will help you understand how [name] (\"us\", \"we\", \"our\") uses and protects the data you provide to us when you visit and use [website] (\"website\", \"service\").</p><p>We reserve the right to change this policy at any given time, of which you will be promptly updated. If you want to make sure that you are up to date with the latest changes, we advise you to frequently visit this page.</p><p><strong>What User Data We Collect</strong></p><p>When you visit the website, we may collect the following data:</p><p><ul><li>Your IP address.</li><li>Your contact information and email address.</li><li>Other information such as interests and preferences.</li><li>Data profile regarding your online behavior on our website.</li></ul></p><p><strong>Why We Collect Your Data</strong></p><p>We are collecting your data for several reasons:</p><p><ul><li>To better understand your needs.</li><li>To improve our services and products.</li><li>To send you promotional emails containing the information we think you will find interesting.</li><li>To contact you to fill out surveys and participate in other types of market research.</li><li>To customize our website according to your online behavior and personal preferences.</li></ul></p><p><strong>Safeguarding and Securing the Data</strong></p><p>[name] is committed to securing your data and keeping it confidential. [name] has done all in its power to prevent data theft, unauthorized access, and disclosure by implementing the latest technologies and software, which help us safeguard all the information we collect online.</p><p><strong>Our Cookie Policy</strong></p><p>Once you agree to allow our website to use cookies, you also agree to use the data it collects regarding your online behavior (analyze web traffic, web pages you spend the most time on, and websites you visit).</p><p>The data we collect by using cookies is used to customize our website to your needs. After we use the data for statistical analysis, the data is completely removed from our systems.</p><p>Please note that cookies don\'t allow us to gain control of your computer in any way. They are strictly used to monitor which pages you find useful and which you do not so that we can provide a better experience for you.</p><p>If you want to disable cookies, you can do it by accessing the settings of your internet browser. (Provide links for cookie settings for major internet browsers).</p><p><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\"><strong>Links to Other Websites</strong></span></p><p>Our website contains links that lead to other websites. If you click on these links [name] is not held responsible for your data and privacy protection. Visiting those websites is not governed by this privacy policy agreement. Make sure to read the privacy policy documentation of the website you go to from our website.</p><p><strong>Restricting the Collection of your Personal Data</strong></p><p>At some point, you might wish to restrict the use and collection of your personal data. You can achieve this by doing the following:</p><p><ul><li>When you are filling the forms on the website, make sure to check if there is a box which you can leave unchecked, if you don\'t want to disclose your personal information.</li><li>If you have already agreed to share your information with us, feel free to contact us via email and we will be more than happy to change this for you.</li></ul></p><p>[name] will not lease, sell or distribute your personal information to any third parties, unless we have your permission. We might do so if the law forces us. Your personal information will be used when we need to send you promotional materials if you agree to this privacy policy.</p>', '2021-06-30 07:34:55', '2021-06-30 07:34:55', 0, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 'INR', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 'usd', 1, 1, 1, 'weekly', 'xml', 1, 1, 'weekly', 'xml', 1, 1, 'weekly', 'xml', 1, 1, 'weekly', 'xml', 1, 1, 'weekly', 'xml', 1, 1, 'weekly', 'xml', 1, 6, 0, '$', NULL, 1, NULL, 0, NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings_items`
--

CREATE TABLE `settings_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_id` int(11) NOT NULL,
  `setting_item_max_gallery_photos` int(11) NOT NULL DEFAULT 12,
  `setting_item_auto_approval_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable 1:enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings_items`
--

INSERT INTO `settings_items` (`id`, `setting_id`, `setting_item_max_gallery_photos`, `setting_item_auto_approval_enable`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 0, '2021-07-01 07:34:54', '2021-07-01 07:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `setting_bank_transfers`
--

CREATE TABLE `setting_bank_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_bank_transfer_bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_bank_transfer_bank_account_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_bank_transfer_status` int(11) NOT NULL DEFAULT 0 COMMENT '0:disable, 1:enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_bank_transfers`
--

INSERT INTO `setting_bank_transfers` (`id`, `setting_bank_transfer_bank_name`, `setting_bank_transfer_bank_account_info`, `setting_bank_transfer_status`, `created_at`, `updated_at`) VALUES
(1, 'Bank of America', 'Bank of America Account #: 8897 6546 8990 5433', 0, '2021-07-01 07:34:53', '2021-07-01 07:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `socialite_accounts`
--

CREATE TABLE `socialite_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `socialite_account_provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `socialite_account_provider_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_logins`
--

CREATE TABLE `social_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_login_provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_login_provider_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_login_provider_client_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_login_enabled` int(11) NOT NULL DEFAULT 0 COMMENT '0: disabled 1: enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_logins`
--

INSERT INTO `social_logins` (`id`, `social_login_provider_name`, `social_login_provider_client_id`, `social_login_provider_client_secret`, `social_login_enabled`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', '', '', 0, '2021-07-01 07:34:53', '2021-07-01 07:34:53'),
(2, 'Google', '', '', 0, '2021-07-01 07:34:53', '2021-07-01 07:34:53'),
(3, 'Twitter', '', '', 0, '2021-07-01 07:34:53', '2021-07-01 07:34:53'),
(4, 'LinkedIn', '', '', 0, '2021-07-01 07:34:53', '2021-07-01 07:34:53'),
(5, 'GitHub', '', '', 0, '2021-07-01 07:34:53', '2021-07-01 07:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_media_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_media_icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_media_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_media_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `social_media_name`, `social_media_icon`, `social_media_link`, `social_media_order`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', 'fab fa-facebook-f', 'https://facebook.com', 1, '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(2, 'Twitter', 'fab fa-twitter', 'https://twitter.com', 2, '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(3, 'Instagram', 'fab fa-instagram', 'https://instagram.com', 3, '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(4, 'LinkedIn', 'fab fa-linkedin-in', 'https://linkedin.com', 4, '2021-06-30 07:34:54', '2021-06-30 07:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_abbr` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_country_abbr` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state_name`, `state_abbr`, `state_slug`, `state_country_abbr`, `created_at`, `updated_at`) VALUES
(1, 105, 'Andaman & Nicobar Islands', 'AN', 'andaman-nicobar-islands', 'IN', NULL, NULL),
(2, 105, 'Andhra Pradesh', 'AN', 'andhra-pradesh', 'IN', NULL, NULL),
(3, 105, 'Arunachal Pradesh', 'AR', 'arunachal-pradesh', 'IN', NULL, NULL),
(4, 105, 'Assam', 'AS', 'assam', 'IN', NULL, NULL),
(5, 105, 'Bihar', 'BI', 'bihar', 'IN', NULL, NULL),
(6, 105, 'Chandigarh', 'CH', 'chandigarh', 'IN', NULL, NULL),
(7, 105, 'Chhattisgarh', 'CH', 'chhattisgarh', 'IN', NULL, NULL),
(8, 105, 'Dadra & Nagar Haveli', 'DA', 'dadra-nagar-haveli', 'IN', NULL, NULL),
(9, 105, 'Daman & Diu', 'DA', 'daman-diu', 'IN', NULL, NULL),
(10, 105, 'Delhi', 'DE', 'delhi', 'IN', NULL, NULL),
(11, 105, 'Goa', 'GO', 'goa', 'IN', NULL, NULL),
(12, 105, 'Gujarat', 'GU', 'gujarat', 'IN', NULL, NULL),
(13, 105, 'Haryana', 'HA', 'haryana', 'IN', NULL, NULL),
(14, 105, 'Himachal Pradesh', 'HI', 'himachal-pradesh', 'IN', NULL, NULL),
(15, 105, 'Jammu & Kashmir', 'JA', 'jammu-kashmir', 'IN', NULL, NULL),
(16, 105, 'Jharkhand', 'JH', 'jharkhand', 'IN', NULL, NULL),
(17, 105, 'Karnataka', 'KA', 'karnataka', 'IN', NULL, NULL),
(18, 105, 'Kerala', 'KE', 'kerala', 'IN', NULL, NULL),
(19, 105, 'Lakshadweep', 'LA', 'lakshadweep', 'IN', NULL, NULL),
(20, 105, 'Madhya Pradesh', 'MA', 'madhya-pradesh', 'IN', NULL, NULL),
(21, 105, 'Maharashtra', 'MA', 'maharashtra', 'IN', NULL, NULL),
(22, 105, 'Manipur', 'MA', 'manipur', 'IN', NULL, NULL),
(23, 105, 'Meghalaya', 'ME', 'meghalaya', 'IN', NULL, NULL),
(24, 105, 'Mizoram', 'MI', 'mizoram', 'IN', NULL, NULL),
(25, 105, 'Nagaland', 'NA', 'nagaland', 'IN', NULL, NULL),
(26, 105, 'Odisha', 'OD', 'odisha', 'IN', NULL, NULL),
(27, 105, 'Puducherry', 'PU', 'puducherry', 'IN', NULL, NULL),
(28, 105, 'Punjab', 'PU', 'punjab', 'IN', NULL, NULL),
(29, 105, 'Rajasthan', 'RA', 'rajasthan', 'IN', NULL, NULL),
(30, 105, 'Sikkim', 'SI', 'sikkim', 'IN', NULL, NULL),
(31, 105, 'Tamil Nadu', 'TA', 'tamil-nadu', 'IN', NULL, NULL),
(32, 105, 'Tripura', 'TR', 'tripura', 'IN', NULL, NULL),
(33, 105, 'Uttar Pradesh', 'UT', 'uttar-pradesh', 'IN', NULL, NULL),
(34, 105, 'Uttarakhand', 'UT', 'uttarakhand', 'IN', NULL, NULL),
(35, 105, 'West Bengal', 'WE', 'west-bengal', 'IN', NULL, NULL),
(36, 105, 'Telangana', 'TG', 'telangana', 'IN', NULL, NULL),
(37, 105, 'Ladakh', 'LA', 'ladakh', 'IN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stripe_webhook_logs`
--

CREATE TABLE `stripe_webhook_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stripe_webhook_log_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `subscription_start_date` date NOT NULL,
  `subscription_end_date` date DEFAULT NULL,
  `subscription_max_featured_listing` int(11) DEFAULT NULL COMMENT 'ABANDONED',
  `subscription_paypal_profile_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_razorpay_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_razorpay_subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_stripe_customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_stripe_subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_stripe_future_plan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `plan_id`, `subscription_start_date`, `subscription_end_date`, `subscription_max_featured_listing`, `subscription_paypal_profile_id`, `created_at`, `updated_at`, `subscription_razorpay_plan_id`, `subscription_razorpay_subscription_id`, `subscription_pay_method`, `subscription_stripe_customer_id`, `subscription_stripe_subscription_id`, `subscription_stripe_future_plan_id`) VALUES
(1, 1, 2, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, 1, '2021-07-01', NULL, NULL, NULL, '2021-06-30 07:34:55', '2021-06-30 07:34:55', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, 1, '2021-07-01', NULL, NULL, NULL, '2021-07-01 07:39:21', '2021-07-01 07:39:21', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1449, 1, '2021-08-06', NULL, NULL, NULL, '2021-08-06 15:24:23', '2021-08-06 15:24:23', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, 1, '2021-08-28', NULL, NULL, NULL, '2021-08-28 10:10:53', '2021-08-28 10:10:53', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `testimonial_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonial_company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testimonial_job_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testimonial_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testimonial_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `testimonial_name`, `testimonial_company`, `testimonial_job_title`, `testimonial_image`, `testimonial_description`, `created_at`, `updated_at`) VALUES
(1, 'Liam Kaufman', 'Project Studio Solutions', 'Founder', NULL, 'WOW! This is great, I think this will be very soon the best directory solution of all, the developer is releasing updates very often and is open to suggestions, can\'t wait to see how is it going to evolve. Don\'t hesitate to buy it, you won\'t regret it.', '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(2, 'Jeff Dawson', 'JD Web Publishing', 'CEO', NULL, 'Amazing product for local listings with growing features, regular and frequent updates with passion. Always seeks client inputs, collaborative, extends support and clarification, very friendly. Great work!', '2021-06-30 07:34:54', '2021-06-30 07:34:54'),
(3, 'Bette Brennan', 'Forayweb', 'Tech Lead', NULL, 'WOW! One of the Best Creative Software Programmers and Offers Great Support and Listens to suggestions. Great script idea\'s for Entrepreneurs.', '2021-06-30 07:34:54', '2021-06-30 07:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'an unique column',
  `theme_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_preview_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_type` int(11) NOT NULL COMMENT '1:frontend theme, 2:admin theme, 3:user theme',
  `theme_status` int(11) NOT NULL DEFAULT 2 COMMENT '1:active 2:inactive',
  `theme_system_default` int(11) NOT NULL DEFAULT 2 COMMENT '1:system default theme, 2:not system default theme',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_identifier`, `theme_name`, `theme_preview_image`, `theme_author`, `theme_description`, `theme_type`, `theme_status`, `theme_system_default`, `created_at`, `updated_at`) VALUES
(1, 'lduruo10_dh_frontend_default', 'Directory Hub', 'system_default_frontend_theme_preview.jpg', 'lduruo10', 'The Directory Hub Listing & Business Directory CMS default theme. Please use the Edit Colors and Edit Headers buttons to customize the theme styles of yours.', 1, 1, 1, '2021-07-01 07:34:53', '2021-07-01 07:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thread_item_rels`
--

CREATE TABLE `thread_item_rels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_suspended` int(11) NOT NULL DEFAULT 0 COMMENT '0:not suspended 1:suspended',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_prefer_language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_prefer_country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `canvas_posts`
--
ALTER TABLE `canvas_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canvas_posts_slug_user_id_unique` (`slug`,`user_id`),
  ADD KEY `canvas_posts_user_id_index` (`user_id`);

--
-- Indexes for table `canvas_posts_tags`
--
ALTER TABLE `canvas_posts_tags`
  ADD UNIQUE KEY `canvas_posts_tags_post_id_tag_id_unique` (`post_id`,`tag_id`);

--
-- Indexes for table `canvas_posts_topics`
--
ALTER TABLE `canvas_posts_topics`
  ADD UNIQUE KEY `canvas_posts_topics_post_id_topic_id_unique` (`post_id`,`topic_id`);

--
-- Indexes for table `canvas_tags`
--
ALTER TABLE `canvas_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canvas_tags_slug_user_id_unique` (`slug`,`user_id`),
  ADD KEY `canvas_tags_created_at_index` (`created_at`),
  ADD KEY `canvas_tags_user_id_index` (`user_id`);

--
-- Indexes for table `canvas_topics`
--
ALTER TABLE `canvas_topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canvas_topics_slug_user_id_unique` (`slug`,`user_id`),
  ADD KEY `canvas_topics_created_at_index` (`created_at`),
  ADD KEY `canvas_topics_user_id_index` (`user_id`);

--
-- Indexes for table `canvas_user_meta`
--
ALTER TABLE `canvas_user_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `canvas_user_meta_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `canvas_user_meta_username_unique` (`username`);

--
-- Indexes for table `canvas_views`
--
ALTER TABLE `canvas_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canvas_views_post_id_index` (`post_id`),
  ADD KEY `canvas_views_created_at_index` (`created_at`);

--
-- Indexes for table `canvas_visits`
--
ALTER TABLE `canvas_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_custom_field`
--
ALTER TABLE `category_custom_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_item`
--
ALTER TABLE `category_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_commenter_id_commenter_type_index` (`commenter_id`,`commenter_type`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  ADD KEY `comments_child_id_foreign` (`child_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customizations`
--
ALTER TABLE `customizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`districtid`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_csv_data`
--
ALTER TABLE `import_csv_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_item_data`
--
ALTER TABLE `import_item_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_item_feature_data`
--
ALTER TABLE `import_item_feature_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_slug` (`item_slug`);

--
-- Indexes for table `item_claims`
--
ALTER TABLE `item_claims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_features`
--
ALTER TABLE `item_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_image_galleries`
--
ALTER TABLE `item_image_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_leads`
--
ALTER TABLE `item_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_sections`
--
ALTER TABLE `item_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_section_collections`
--
ALTER TABLE `item_section_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_user`
--
ALTER TABLE `item_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paypal_ipn_logs`
--
ALTER TABLE `paypal_ipn_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_image_galleries`
--
ALTER TABLE `product_image_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_webhook_logs`
--
ALTER TABLE `razorpay_webhook_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_reviewrateable_type_reviewrateable_id_index` (`reviewrateable_type`,`reviewrateable_id`),
  ADD KEY `reviews_author_type_author_id_index` (`author_type`,`author_id`);

--
-- Indexes for table `review_image_galleries`
--
ALTER TABLE `review_image_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_items`
--
ALTER TABLE `settings_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_bank_transfers`
--
ALTER TABLE `setting_bank_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialite_accounts`
--
ALTER TABLE `socialite_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stripe_webhook_logs`
--
ALTER TABLE `stripe_webhook_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `themes_theme_identifier_unique` (`theme_identifier`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread_item_rels`
--
ALTER TABLE `thread_item_rels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `canvas_user_meta`
--
ALTER TABLE `canvas_user_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `canvas_views`
--
ALTER TABLE `canvas_views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `canvas_visits`
--
ALTER TABLE `canvas_visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category_custom_field`
--
ALTER TABLE `category_custom_field`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_item`
--
ALTER TABLE `category_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=743;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `customizations`
--
ALTER TABLE `customizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `districtid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6600;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `import_csv_data`
--
ALTER TABLE `import_csv_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_item_data`
--
ALTER TABLE `import_item_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_item_feature_data`
--
ALTER TABLE `import_item_feature_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_claims`
--
ALTER TABLE `item_claims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_features`
--
ALTER TABLE `item_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_image_galleries`
--
ALTER TABLE `item_image_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_leads`
--
ALTER TABLE `item_leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_sections`
--
ALTER TABLE `item_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_section_collections`
--
ALTER TABLE `item_section_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_user`
--
ALTER TABLE `item_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paypal_ipn_logs`
--
ALTER TABLE `paypal_ipn_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_features`
--
ALTER TABLE `product_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_image_galleries`
--
ALTER TABLE `product_image_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_webhook_logs`
--
ALTER TABLE `razorpay_webhook_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_image_galleries`
--
ALTER TABLE `review_image_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings_items`
--
ALTER TABLE `settings_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting_bank_transfers`
--
ALTER TABLE `setting_bank_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socialite_accounts`
--
ALTER TABLE `socialite_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_logins`
--
ALTER TABLE `social_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `stripe_webhook_logs`
--
ALTER TABLE `stripe_webhook_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thread_item_rels`
--
ALTER TABLE `thread_item_rels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
