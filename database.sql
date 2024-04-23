-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2024 at 08:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `charity_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) NOT NULL,
  `header_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `btn_text` varchar(255) DEFAULT NULL,
  `btn_url` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `backgroud_photo` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `header_title`, `title`, `btn_text`, `btn_url`, `description`, `photo`, `video_id`, `backgroud_photo`) VALUES
(1, 'About us', 'Our Professional Engineers', 'Our Team', 'https://carservice.geniusocean.xyz/', '<p style=\"text-align: justify; \">Our customer service specialists are here to assist you every step of the way, offering seamless appointment scheduling and addressing any inquiries you may have. Behind the scenes, our diagnostic experts use advanced technology to identify and resolve issues efficiently.</p><p style=\"text-align: justify; \"> Our mechanical engineers oversee complex repairs, guaranteeing that your vehicle\'s functionality is optimized. Our service advisors act as trusted consultants, guiding you through our range of services with personalized recommendations.<br></p>', '2979942021706596562.png', 'nUa-bQD7DGY', '4903271651710127708.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verify_token` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verify_token`, `phone`, `photo`, `role_id`, `role`, `status`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '', '09000000', '13920742411690092167.jpg', '0', 'Administrator', 1, '$2y$10$WpCFoErUffgj0T59dorrKuJH5Nef6z7PCpgY52XPNbpWUVBrTw/6C', 'mTwysgKKc9RRPqZAUOPQnN08ci0QsFu5SZ1GDIe9dCXgIqn8PRcAAgjLqWu7', NULL, '2023-07-23 13:02:47'),
(3, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, NULL, NULL, NULL, 'Farhad', 1, '$2y$10$WpCFoErUffgj0T59dorrKuJH5Nef6z7PCpgY52XPNbpWUVBrTw/6C', NULL, '2023-03-20 16:32:09', '2023-03-20 16:32:09'),
(4, 'pronob', 'pronobsarker16@gmail.com', NULL, NULL, NULL, NULL, 'pronob', 1, '$2y$10$FyqCOJm5fsO7OcyL5sfd0.hIvyfM3HH1x153NzpG6niG57uhy2AsO', NULL, '2023-07-25 11:23:56', '2023-07-25 11:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `rtl`) VALUES
(1, 0, 'test', '1638353833MI23H252.json', 0),
(5, 0, 'tet4', '1638353982qIEUykRT.json', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sort_text` text DEFAULT NULL,
  `description` longtext NOT NULL,
  `source` varchar(191) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `slug`, `photo`, `sort_text`, `description`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`, `updated_at`) VALUES
(66, 8, 'Office AC Cooling problem Repair', 'office-ac-cooling-problem-repair', '4221058291688637283.png', 'Cleaning or maintaining the cleanliness of our surroundings is a practice that all of us are accustomed to. But more often than not, people of our country make the mistake of taking the job of a professional cleaner into their own hands. People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought.', '<p><span style=\"font-size: 16px; color: rgb(123, 125, 131); font-family: &quot;DM Sans&quot;, sans-serif;\">Cleaning or maintaining the cleanliness of our surroundings is a practice that all of us are accustomed to. But more often than not, people of our country make the mistake of taking the job of a professional cleaner into their own hands. People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought.</span><br></p><div data-v-3f9453f1=\"\" class=\"service-overview-component\" style=\"margin: 0px 0px 20px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\"><h4 data-v-3f9453f1=\"\" class=\"service-overview-component__title\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 1.56; font-size: 18px; scroll-behavior: smooth; color: rgba(0, 0, 0, 0.8);\">What\'s Included?</h4><p data-v-3f9453f1=\"\" class=\"service-overview-component__info\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; line-height: 1.5; scroll-behavior: smooth; color: rgb(56, 58, 60);\"></p><div data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth;\"><ul data-v-3f9453f1=\"\" class=\"list-unordered\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; list-style: none; padding-left: 25px;\"><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Only service charge</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>7 Days service warranty</li></ul></div></div><div data-v-3f9453f1=\"\" class=\"service-overview-component\" style=\"margin: 0px 0px 20px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\"><h4 data-v-3f9453f1=\"\" class=\"service-overview-component__title\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 1.56; font-size: 18px; scroll-behavior: smooth; color: rgba(0, 0, 0, 0.8);\">What\'s Excluded?</h4><p data-v-3f9453f1=\"\" class=\"service-overview-component__info\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; line-height: 1.5; scroll-behavior: smooth; color: rgb(56, 58, 60);\"></p><div data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth;\"><ul><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Price of materials or parts</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Transportation cost for carrying new materials/parts</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Warranty given by manufacturer</li><li style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\">Hello World</li></ul><p style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><br></p><p style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><br></p></div></div>', NULL, 0, 1, NULL, NULL, NULL, '2023-03-12 05:28:22', '2024-03-24 23:07:23'),
(67, 9, 'Home Electric Cable lines Repair', 'home-electric-cable-lines-repair', '3321587541688637275.png', 'Cleaning or maintaining the cleanliness of our surroundings is a practice that all of us are accustomed to. But more often than not, people of our country make the mistake of taking the job of a professional cleaner into their own hands. People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought.', '<p><span style=\"font-size: 16px; color: rgb(123, 125, 131); font-family: &quot;DM Sans&quot;, sans-serif;\">Cleaning or maintaining the cleanliness of our surroundings is a practice that all of us are accustomed to. But more often than not, people of our country make the mistake of taking the job of a professional cleaner into their own hands. People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought.</span><br></p><div data-v-3f9453f1=\"\" class=\"service-overview-component\" style=\"margin: 0px 0px 20px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\"><h4 data-v-3f9453f1=\"\" class=\"service-overview-component__title\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 1.56; font-size: 18px; scroll-behavior: smooth; color: rgba(0, 0, 0, 0.8);\">What\'s Included?</h4><p data-v-3f9453f1=\"\" class=\"service-overview-component__info\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; line-height: 1.5; scroll-behavior: smooth; color: rgb(56, 58, 60);\"></p><div data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth;\"><ul data-v-3f9453f1=\"\" class=\"list-unordered\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; list-style: none; padding-left: 25px;\"><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Only service charge</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>7 Days service warranty</li></ul></div></div><div data-v-3f9453f1=\"\" class=\"service-overview-component\" style=\"margin: 0px 0px 20px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\"><h4 data-v-3f9453f1=\"\" class=\"service-overview-component__title\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 1.56; font-size: 18px; scroll-behavior: smooth; color: rgba(0, 0, 0, 0.8);\">What\'s Excluded?</h4><p data-v-3f9453f1=\"\" class=\"service-overview-component__info\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; line-height: 1.5; scroll-behavior: smooth; color: rgb(56, 58, 60);\"></p><div data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth;\"><ul data-v-3f9453f1=\"\" class=\"list-unordered\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; list-style: none; padding-left: 25px;\"><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Price of materials or parts</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Transportation cost for carrying new materials/parts</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Warranty given by manufacturer</li></ul></div></div>', NULL, 0, 1, NULL, NULL, NULL, '2023-03-12 05:28:44', '2024-03-24 23:07:08'),
(68, 9, 'Early Summer Deal Aircondition Services', 'early-summer-deal-aircondition-services', '16137807391688637266.png', 'Cleaning or maintaining the cleanliness of our surroundings is a practice that all of us are accustomed to. But more often than not, people of our country make the mistake of taking the job of a professional cleaner into their own hands. People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought.', '<p><span style=\"color: rgb(123, 125, 131); font-family: &quot;DM Sans&quot;, sans-serif; font-size: 16px;\">Cleaning or maintaining the cleanliness of our surroundings is a practice that all of us are accustomed to. But more often than not, people of our country make the mistake of taking the job of a professional cleaner into their own hands. People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought.</span><br></p><div data-v-3f9453f1=\"\" class=\"service-overview-component\" style=\"margin: 0px 0px 20px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\"><h4 data-v-3f9453f1=\"\" class=\"service-overview-component__title\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; scroll-behavior: smooth; line-height: 1.56; font-size: 18px; color: rgba(0, 0, 0, 0.8);\">What\'s Included?</h4><p data-v-3f9453f1=\"\" class=\"service-overview-component__info\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60);\"></p><div data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth;\"><ul data-v-3f9453f1=\"\" class=\"list-unordered\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; list-style: none; padding-left: 25px;\"><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Only service charge</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>7 Days service warranty</li></ul></div></div><div data-v-3f9453f1=\"\" class=\"service-overview-component\" style=\"margin: 0px 0px 20px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\"><h4 data-v-3f9453f1=\"\" class=\"service-overview-component__title\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; scroll-behavior: smooth; line-height: 1.56; font-size: 18px; color: rgba(0, 0, 0, 0.8);\">What\'s Excluded?</h4><p data-v-3f9453f1=\"\" class=\"service-overview-component__info\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60);\"></p><div data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth;\"><ul data-v-3f9453f1=\"\" class=\"list-unordered\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; list-style: none; padding-left: 25px;\"><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Price of materials or parts</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Transportation cost for carrying new materials/parts</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Warranty given by manufacturer</li></ul></div></div><p><br></p>', NULL, 0, 1, NULL, NULL, NULL, '2023-03-12 05:28:59', '2024-03-24 23:06:59'),
(72, 9, 'Office Car Cooling problem Repair', 'office-car-cooling-problem-repair', '3685925031688637302.png', 'Cleaning or maintaining the cleanliness of our surroundings is a practice that all of us are accustomed to. But more often than not, people of our country make the mistake of taking the job of a professional cleaner into their own hands. People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought.', '<p><span style=\"font-size: 16px; color: rgb(123, 125, 131); font-family: &quot;DM Sans&quot;, sans-serif;\">Cleaning or maintaining the cleanliness of our surroundings is a practice that all of us are accustomed to. But more often than not, people of our country make the mistake of taking the job of a professional cleaner into their own hands. People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought.</span><br></p><div data-v-3f9453f1=\"\" class=\"service-overview-component\" style=\"margin: 0px 0px 20px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\"><h4 data-v-3f9453f1=\"\" class=\"service-overview-component__title\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 1.56; font-size: 18px; scroll-behavior: smooth; color: rgba(0, 0, 0, 0.8);\">What\'s Included?</h4><p data-v-3f9453f1=\"\" class=\"service-overview-component__info\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; line-height: 1.5; scroll-behavior: smooth; color: rgb(56, 58, 60);\"></p><div data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth;\"><ul data-v-3f9453f1=\"\" class=\"list-unordered\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; list-style: none; padding-left: 25px;\"><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Only service charge</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>7 Days service warranty</li></ul></div></div><div data-v-3f9453f1=\"\" class=\"service-overview-component\" style=\"margin: 0px 0px 20px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\"><h4 data-v-3f9453f1=\"\" class=\"service-overview-component__title\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 1.56; font-size: 18px; scroll-behavior: smooth; color: rgba(0, 0, 0, 0.8);\">What\'s Excluded?</h4><p data-v-3f9453f1=\"\" class=\"service-overview-component__info\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; line-height: 1.5; scroll-behavior: smooth; color: rgb(56, 58, 60);\"></p><div data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth;\"><ul data-v-3f9453f1=\"\" class=\"list-unordered\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; list-style: none; padding-left: 25px;\"><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Price of materials or parts</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Transportation cost for carrying new materials/parts</li><li data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; line-height: 1.5; color: rgb(56, 58, 60); padding-bottom: 10px; padding-left: 0px; position: relative;\"><span data-v-3f9453f1=\"\" style=\"margin: 0px; scroll-behavior: smooth; position: absolute; content: &quot;&quot;; width: 5px; height: 5px; line-height: 16px; border-radius: 50%; background-image: linear-gradient(135deg, rgb(0, 0, 0) 100%, rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px); color: rgb(255, 255, 255); text-align: center; top: 10px; left: -21px;\"></span>Warranty given by manufacturer</li></ul></div></div><p><br></p>', NULL, 0, 1, NULL, NULL, NULL, '2023-07-06 03:55:02', '2024-03-24 23:06:48');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `status`) VALUES
(8, 'TV Repair', 'tv-repair', 1),
(9, 'Service', 'service', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `raised` double NOT NULL DEFAULT 0,
  `goal` double NOT NULL DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `close_type` varchar(191) DEFAULT NULL,
  `is_faq` int(11) NOT NULL DEFAULT 0,
  `is_feature` tinyint(4) NOT NULL DEFAULT 0,
  `is_preloaded` tinyint(4) NOT NULL DEFAULT 1,
  `location` varchar(255) DEFAULT NULL,
  `benefits` int(11) NOT NULL DEFAULT 0,
  `end_date` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `title`, `slug`, `category_id`, `user_id`, `photo`, `raised`, `goal`, `description`, `status`, `close_type`, `is_faq`, `is_feature`, `is_preloaded`, `location`, `benefits`, `end_date`, `video_link`, `created_at`, `updated_at`) VALUES
(8, 'test', 'test', 3, NULL, '8465080681708142609.jpg', 3, 5, '<p>test</p>', 1, 'goal', 1, 1, 1, 'test', 5, '2024-03-15', 'r2456246', '2024-02-16 22:03:29', '2024-04-16 00:17:33'),
(9, 'dasfa', 'dasfa', 3, NULL, '2837413001708164872.jpg', 50, 500, '<p>asdfasdf</p>', 1, 'goal', 0, 1, 0, 'London', 5, '2024-03-15', 'adfssd', '2024-02-17 04:14:32', '2024-03-22 21:47:19'),
(10, 'test test5 last check', 'test-test5-last-check', 3, 22, '12978448341710133301.png', 10, 5, '<p>asdfasdf hgjgjg jhufgjktg</p>', 2, 'goal', 1, 1, 0, 'asdfad', 5, '2024-12-02', 'adfssd', '2024-02-17 04:28:52', '2024-04-16 21:42:01'),
(11, 'New Data again', 'new-data-again', 3, 22, '13510299461708165868.png', 0, 5, '<p>asdfasdf</p>', 1, 'goal', 0, 0, 0, 'asdfad', 5, '2024-12-02', 'adfssd', '2024-02-17 04:31:08', '2024-02-17 04:31:08'),
(12, 'New Data again 5', 'new-data-again-5', 3, 22, '5042978721708165880.png', 0, 5, '<p><br></p>', 2, 'end_date', 0, 0, 0, 'asdfad', 5, '2024-12-02', 'adfssd', '2024-02-17 04:31:21', '2024-04-16 02:39:32'),
(13, 'DSAFASDF', 'dsafasdf', 3, 22, '4156866211708165984.png', 0, 5, '<p>SDFASDF</p>', 2, 'end_date', 0, 0, 0, 'TEST', 5, '2024-12-02', 'ASDFAS', '2024-02-17 04:33:04', '2024-04-16 02:35:40'),
(14, 'SDFASD', 'sdfasd', 2, 22, '20421391321708166036.png', 0, 5, '<p>ASDFAS</p>', 2, 'end_date', 0, 0, 0, '5', 5, '2024-03-20', 'ASDFA', '2024-02-17 04:33:56', '2024-04-16 02:32:29'),
(15, 'SDFASDASDFA', 'sdfasdasdfa', 3, 22, '1537121141708166093.png', 0, 5, '<p>ASDFASDF</p>', 2, 'end_date', 0, 0, 0, '5', 5, '2024-12-02', 'ASDFA', '2024-02-17 04:34:53', '2024-02-17 04:34:53'),
(16, 'ASDFASDF', 'asdfasdf', 3, 22, '7852570471708166141.png', 100, 5, '<p>ASDFASDF</p>', 1, 'end_date', 0, 0, 0, '5', 5, '2024-12-02', 'DFASDF', '2024-02-17 04:35:41', '2024-04-16 21:40:00'),
(17, 'ASDFASDFFGHDGH', 'asdfasdffghdgh', 3, 22, '5230319571708166183.jpg', 18.9, 5, '<p>GFSDFGS</p>', 1, 'end_date', 0, 0, 0, '5', 5, '2024-12-02', 'DFASDF', '2024-02-17 04:36:23', '2024-04-16 21:37:04'),
(18, 'ASDFASDFFGHDGH ADSFGASD', 'asdfasdffghdgh-adsfgasd', 3, 22, '14172479461708166296.jpg', 0, 5, '<p>ASDFGSDFGSD</p>', 0, 'goal', 0, 0, 0, '5', 5, '2024-12-02', 'DFASDF', '2024-02-17 04:38:16', '2024-02-17 04:38:16'),
(19, 'asdfasdfsadfasdfasdfasfasfasff', 'asdfasdfsadfasdfasdfasfasfasff', 2, 22, '21465030701708166397.png', 0, 78, '<p>asdfasdf</p>', 2, 'goal', 0, 0, 0, 'asdf', 77, '2024-12-02', 'erertew', '2024-02-17 04:39:57', '2024-04-16 02:36:08'),
(20, 'sadfasdf', 'sadfasdf', 3, 22, '15035961041708166486.png', 0, 5, '<p>asdfasdf</p>', 0, 'goal', 0, 0, 0, 'dfasdf', 5, '2024-12-02', 'asdfasd', '2024-02-17 04:41:26', '2024-02-17 04:41:26'),
(21, 'dsfaf', 'dsfaf', 3, 22, '21410562541708166600.jpg', 52.49, 56, '<p>asdfas</p>', 1, 'end_date', 0, 0, 0, 'asdfas', 5, '2024-12-02', 'asdfa', '2024-02-17 04:43:20', '2024-04-04 03:21:56'),
(22, 'This is test for postman', 'this-is-test-for-postman', 4, 0, '17452860621708332489.jpg', 0, 1, 'Postman test description', 1, 'end_date', 0, 0, 0, 'dhaka', 40, '2024-12-02', 'ok', '2024-02-19 02:48:10', '2024-04-16 03:08:55'),
(23, 'taba to', 'taba-to', 2, 22, '5213016221710068281.jpg', 0, 5, '<p>asdfasdf</p>', 2, 'end_date', 0, 0, 0, '5', 5, '2024-03-10', '5', '2024-03-10 04:58:02', '2024-04-16 03:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_faqs`
--

CREATE TABLE `campaign_faqs` (
  `id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campaign_faqs`
--

INSERT INTO `campaign_faqs` (`id`, `campaign_id`, `title`, `content`) VALUES
(93, 10, 'tt', 'tt'),
(94, 10, 'a', 'a'),
(96, 8, 'asdfa', 'sdafasdf');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_galleries`
--

CREATE TABLE `campaign_galleries` (
  `id` bigint(20) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campaign_galleries`
--

INSERT INTO `campaign_galleries` (`id`, `campaign_id`, `photo`) VALUES
(18, 9, '2782947511709090877.png'),
(19, 9, '19624118351709701513.png'),
(20, 10, '15839757651710068624.png'),
(21, 10, '1657717671710133168.jpg'),
(22, 10, '7929818751710133168.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`) VALUES
(2, 'Nonprofit', 'nonprofit', 1, '2578867611704356833.jpg'),
(3, 'Environment', 'environment', 1, '1017959301704356842.png');

-- --------------------------------------------------------

--
-- Table structure for table `chooses`
--

CREATE TABLE `chooses` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chooses`
--

INSERT INTO `chooses` (`id`, `title`, `photo`, `text`) VALUES
(1, 'Estimates', '10026261521688555230.png', 'We believe in transparency and honesty when it comes to pricing.'),
(2, 'Trusted', '13471329781688555321.png', 'We promise to listen to your needs, your concerns and ensure your satisfaction.'),
(3, 'Guarantees', '13161045951688555345.png', 'We take pride in our team of skilled and experienced mechanics.');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `subject`, `message`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 'showrav Hasan', 'teacher@gmail.com', '01728332009', 'test', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.', NULL, '2023-03-15 06:24:00', '2023-03-15 06:24:00'),
(6, 'Farhad', 'farhadwts@gmail.com', '01779002302', 'asdasd', 'qweqwewq qweqweqwe qwe qweqw eqwe qweqweqw', NULL, '2023-03-19 16:57:11', '2023-03-19 16:57:11'),
(9, 'Test Name', 'test@gmail.com', '017000000000', NULL, 'Lorem ipsum dolor sit amet consectetur. Ut tellus suspendisse nulla aliquam. Risus rutrum tellus as eget ultrices amet facilisis.', 4, '2023-03-22 16:40:41', '2023-03-22 16:40:41'),
(10, 'Demo Name', 'demouser@gmail.com', '01800000000', NULL, 'Lorem ipsum dolor sit amet consectetur. Ut tellus suspendisse nulla aliquam. Risus rutrum tellus as eget ultrices amet facilisis.', 3, '2023-03-22 16:41:14', '2023-03-22 16:41:14'),
(11, 'Dummy Name', 'dummy@gmail.com', '01900000000', NULL, 'Lorem ipsum dolor sit amet consectetur. Ut tellus suspendisse nulla aliquam. Risus rutrum tellus as eget ultrices amet facilisis.', 8, '2023-03-22 16:41:44', '2023-03-22 16:41:44'),
(25, 'test', 'user1@gmail.com', NULL, 'Hello', 'Hello Message', NULL, '2024-03-05 23:34:19', '2024-03-05 23:34:19'),
(26, 'showrav Hasan', 'teacher@gmail.com', NULL, 'asdfa', 'test', NULL, '2024-03-23 03:18:24', '2024-03-23 03:18:24'),
(27, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'asdfasdf', 'asdfasdf', NULL, '2024-03-23 03:38:00', '2024-03-23 03:38:00'),
(28, 'showrav Hasan', 'teacher@gmail.com', NULL, 'asdfasdf', 'trd', NULL, '2024-03-23 21:14:04', '2024-03-23 21:14:04'),
(29, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'Hello', 'fhsg', NULL, '2024-03-23 21:15:47', '2024-03-23 21:15:47'),
(30, 'showrav Hasan', 'teacher@gmail.com', NULL, 'Hello', 'dfgsdfg', NULL, '2024-03-23 21:16:13', '2024-03-23 21:16:13'),
(31, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'Hello', 'gdfgsdf', NULL, '2024-03-23 21:18:30', '2024-03-23 21:18:30'),
(32, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'asdfas', 'asdfasdf', NULL, '2024-03-23 21:19:39', '2024-03-23 21:19:39'),
(33, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'sdfasdf', 'asdfa', NULL, '2024-03-23 21:20:40', '2024-03-23 21:20:40'),
(34, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'asdfasdf', 'asdfasd', NULL, '2024-03-23 21:24:28', '2024-03-23 21:24:28'),
(35, 'showrav Hasan', 'teacher@gmail.com', NULL, 'fasd', 'asdfadf', NULL, '2024-03-23 21:25:07', '2024-03-23 21:25:07'),
(36, 'showrav Hasan', 'teacher@gmail.com', NULL, 'sdfasdf', 'asdfasdf', NULL, '2024-03-23 21:25:35', '2024-03-23 21:25:35'),
(37, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'asdfasdf', 'asdfasdf', NULL, '2024-03-23 21:27:32', '2024-03-23 21:27:32'),
(38, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'asdfasd', 'dsafasd', NULL, '2024-03-23 21:30:12', '2024-03-23 21:30:12'),
(39, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'dfasdf', 'asdfasd', NULL, '2024-03-23 21:30:31', '2024-03-23 21:30:31'),
(40, 'showrav Hasan', 'teacher@gmail.com', NULL, 'dfgsdf', 'asdfa', NULL, '2024-03-23 21:30:51', '2024-03-23 21:30:51'),
(41, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'dfafsda', 'sdfasd', NULL, '2024-03-23 21:32:07', '2024-03-23 21:32:07'),
(42, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'asdfadf', 'asdfasdfa', NULL, '2024-03-23 21:33:20', '2024-03-23 21:33:20'),
(43, 'showrav Hasan', 'showrabhasan715@gmail.com', NULL, 'asfdasdf', 'asdfasdf', NULL, '2024-03-23 21:33:34', '2024-03-23 21:33:34'),
(44, 'showrav Hasan', 'teacher@gmail.com', NULL, 'asdfasdf', 'asdfasdf', NULL, '2024-03-23 21:33:42', '2024-03-23 21:33:42'),
(45, 'showrav Hasan', 'teacher@gmail.com', NULL, 'sdfasdf', 'asdfadf', NULL, '2024-03-23 21:41:50', '2024-03-23 21:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `contact_pages`
--

CREATE TABLE `contact_pages` (
  `id` int(11) NOT NULL,
  `email1` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `map_link` text DEFAULT NULL,
  `text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_pages`
--

INSERT INTO `contact_pages` (`id`, `email1`, `email2`, `phone1`, `phone2`, `address`, `title`, `map_link`, `text`) VALUES
(1, 'Envatodemo@gmail.com', 'Envatodemo2@gmail.comm', '+23 (000) 68 6033', '+21 (000) 68 7033', '66 broklyn golden street 600 New york. USA!', 'Contact for Services', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96811.54759587669!2d-74.01263924803828!3d406880494567041!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f131!3m3!1m2!1s0x89c25bae694479a3%3A0xb9949385da52e69e!2sBarclays%20Center!5e0!3m2!1sen!2sbd!4v1636195194646!5m2!1sen!2sbd', 'Lorem Ipsum is simply dummy text of the printing and typesetting isum has been the industry\'s');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `counter_number` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `title`, `counter_number`, `icon`) VALUES
(1, 'Active Project', 5076, 'fab fa-amazon-pay'),
(3, 'Successful Services', 507, 'fas fa-align-center'),
(4, 'Winning Project', 4568, 'fab fa-adversal'),
(5, 'Total Services', 103, 'fas fa-address-book');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `default` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1 => default, 0 => not default',
  `symbol` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1 => active, 0 => inactive',
  `value` decimal(11,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `default`, `symbol`, `code`, `status`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, '$', 'USD', 1, 1.00, '2021-12-19 16:12:58', '2022-11-29 22:53:30'),
(4, 1, '€', 'EUR', 1, 0.89, '2021-12-19 16:12:58', '2022-12-06 15:31:17'),
(7, 0, '₹', 'INR', 1, 75.00, '2022-01-25 14:28:23', '2022-11-29 22:37:29'),
(8, 0, '₦', 'NGN', 1, 416.00, '2022-02-05 17:41:35', '2022-11-29 21:14:16'),
(11, 0, 'SAR', 'SAR', 1, 1.00, '2022-02-05 17:41:35', '2022-11-29 21:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_info` text DEFAULT NULL,
  `status` varchar(111) DEFAULT NULL,
  `txn_id` varchar(222) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `method` varchar(255) NOT NULL,
  `currency_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `user_info`, `status`, `txn_id`, `created_at`, `updated_at`, `amount`, `method`, `currency_info`) VALUES
(7, 1, '{\"id\":1,\"name\":\"User Hasan\",\"email\":\"user@gmail.com\",\"photo\":\"TLA1588136853people.png\",\"phone\":\"17283320\",\"country\":\"Belarus\",\"city\":\"add\",\"address\":\"Tangail,Dhaka,Bangladesh\",\"zip\":\"1234\",\"status\":1,\"email_verified\":null,\"verification_link\":null,\"balance\":600,\"created_at\":null,\"updated_at\":\"2022-01-11T11:08:36.000000Z\"}', 'completed', '2813400', '2022-01-11 05:09:59', '2022-01-11 05:09:59', 100, 'flutterwave', '{\"id\":1,\"name\":\"USD\",\"sign\":\"$\",\"value\":1,\"is_default\":1}'),
(8, 1, '{\"id\":1,\"name\":\"User Hasan\",\"email\":\"user@gmail.com\",\"photo\":\"TLA1588136853people.png\",\"phone\":\"17283320\",\"country\":\"Belarus\",\"city\":\"add\",\"address\":\"Tangail,Dhaka,Bangladesh\",\"zip\":\"1234\",\"status\":1,\"email_verified\":null,\"verification_link\":null,\"balance\":700,\"created_at\":null,\"updated_at\":\"2022-01-11T11:09:59.000000Z\"}', 'completed', '955160748', '2022-01-11 21:47:57', '2022-01-11 21:47:57', 0.2747864222533, '0', '{\"id\":9,\"name\":\"NGN\",\"sign\":\"\\u20a6\",\"value\":363.919,\"is_default\":1}'),
(9, 1, '{\"id\":1,\"name\":\"User Hasan\",\"email\":\"user@gmail.com\",\"photo\":\"TLA1588136853people.png\",\"phone\":\"17283320\",\"country\":\"Belarus\",\"city\":\"add\",\"address\":\"Tangail,Dhaka,Bangladesh\",\"zip\":\"1234\",\"status\":1,\"email_verified\":null,\"verification_link\":null,\"balance\":700.27478642225,\"created_at\":null,\"updated_at\":\"2022-01-12T03:47:57.000000Z\"}', 'completed', '85656909', '2022-01-11 21:48:36', '2022-01-11 21:48:36', 0.2747864222533, '0', '{\"id\":9,\"name\":\"NGN\",\"sign\":\"\\u20a6\",\"value\":363.919,\"is_default\":1}'),
(10, 1, '{\"id\":1,\"name\":\"User Hasan\",\"email\":\"user@gmail.com\",\"photo\":\"TLA1588136853people.png\",\"phone\":\"17283320\",\"country\":\"Belarus\",\"city\":\"add\",\"address\":\"Tangail,Dhaka,Bangladesh\",\"zip\":\"1234\",\"status\":1,\"email_verified\":null,\"verification_link\":null,\"balance\":700.5495728445,\"created_at\":null,\"updated_at\":\"2022-01-12T03:48:36.000000Z\"}', 'completed', '40080298343', '2022-01-11 22:07:48', '2022-01-11 22:07:48', 100, '0', '{\"id\":1,\"name\":\"USD\",\"sign\":\"$\",\"value\":1,\"is_default\":1}'),
(11, 1, '{\"id\":1,\"name\":\"User Hasan\",\"email\":\"user@gmail.com\",\"photo\":\"TLA1588136853people.png\",\"phone\":\"17283320\",\"country\":\"Belarus\",\"city\":\"add\",\"address\":\"Tangail,Dhaka,Bangladesh\",\"zip\":\"1234\",\"status\":1,\"email_verified\":null,\"verification_link\":null,\"balance\":800.5495728445,\"created_at\":null,\"updated_at\":\"2022-01-12T04:07:48.000000Z\"}', 'completed', '2951913a35854ea6991f522b6cbe0012', '2022-01-11 23:17:43', '2022-01-11 23:17:43', 100, 'instamojo', '{\"id\":1,\"name\":\"USD\",\"sign\":\"$\",\"value\":1,\"is_default\":1}');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` double NOT NULL,
  `tips` double NOT NULL,
  `currency` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `campaign_slug` text DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `name`, `email`, `phone`, `address`, `owner_id`, `user_id`, `total`, `tips`, `currency`, `status`, `campaign_slug`, `payment_method`, `txn_id`, `created_at`, `updated_at`) VALUES
(8, 'showrav Hasan', NULL, '1728332009', 'Dhaka,Bangladesh', 22, 22, 50, 0, '{\"id\":1,\"default\":0,\"symbol\":\"$\",\"code\":\"USD\",\"status\":1,\"value\":\"1.00\",\"created_at\":\"2021-12-19T22:12:58.000000Z\",\"updated_at\":\"2022-11-30T04:53:30.000000Z\"}', '1', 'asdfasdf', 'paypal', '48377622EA270843D', '2024-04-04 00:21:43', '2024-04-04 00:21:43'),
(9, 'showrav Hasan', 'showrabhasan715@gmail.com', '17283320', 'Tangail,Dhaka,Bangladesh', 22, 22, 50, 0, '{\"id\":1,\"default\":0,\"symbol\":\"$\",\"code\":\"USD\",\"status\":1,\"value\":\"1.00\",\"created_at\":\"2021-12-19T22:12:58.000000Z\",\"updated_at\":\"2022-11-30T04:53:30.000000Z\"}', '1', 'dsfaf', 'stripe', 'pi_3P1mUWJlIV5dN9n71cAqD68b', '2024-04-04 03:21:56', '2024-04-04 03:21:56'),
(10, 'showrav Hasan', 'showrabhasan715@gmail.com', '17283320', 'Tangail,Dhaka,Bangladesh', 22, NULL, 8.9, 0, '{\"id\":1,\"default\":0,\"symbol\":\"$\",\"code\":\"USD\",\"status\":1,\"value\":\"1.00\",\"created_at\":\"2021-12-19T22:12:58.000000Z\",\"updated_at\":\"2022-11-30T04:53:30.000000Z\"}', '1', 'asdfasdffghdgh', 'flutterwave', '5009240', '2024-04-06 00:10:56', '2024-04-06 00:10:56'),
(11, NULL, NULL, NULL, NULL, 22, NULL, 10, 0, '{\"id\":1,\"default\":0,\"symbol\":\"$\",\"code\":\"USD\",\"status\":1,\"value\":\"1.00\",\"created_at\":\"2021-12-19T22:12:58.000000Z\",\"updated_at\":\"2022-11-30T04:53:30.000000Z\"}', '1', 'asdfasdffghdgh', 'stripe', 'pi_3P6PIuJlIV5dN9n70m377oAk', '2024-04-16 21:37:04', '2024-04-16 21:37:04'),
(12, NULL, NULL, NULL, NULL, 22, NULL, 50, 0, '{\"id\":1,\"default\":0,\"symbol\":\"$\",\"code\":\"USD\",\"status\":1,\"value\":\"1.00\",\"created_at\":\"2021-12-19T22:12:58.000000Z\",\"updated_at\":\"2022-11-30T04:53:30.000000Z\"}', '1', 'asdfasdf', 'flutterwave', '5031923', '2024-04-16 21:40:00', '2024-04-16 21:40:00'),
(13, 'showrav Hasan', 'teacher@gmail.com', '1728332009', 'Munshinogor,Delduar,Tangail,Dhaka,Bangladesh', 22, NULL, 11, 1, '{\"id\":1,\"default\":0,\"symbol\":\"$\",\"code\":\"USD\",\"status\":1,\"value\":\"1.00\",\"created_at\":\"2021-12-19T22:12:58.000000Z\",\"updated_at\":\"2022-11-30T04:53:30.000000Z\"}', '1', 'test-test5-last-check', 'paypal', '8N8700445X518633T', '2024-04-16 21:40:47', '2024-04-16 21:40:47');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `email_subject` mediumtext DEFAULT NULL,
  `email_body` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Booking Core', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(5, 'user_verification', 'Request for verification.', '<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `event_type` varchar(255) NOT NULL,
  `event_link` varchar(255) DEFAULT NULL,
  `event_location` varchar(255) DEFAULT NULL,
  `organizar_name` varchar(255) NOT NULL,
  `organizar_email` varchar(255) DEFAULT NULL,
  `organizar_phone` varchar(255) DEFAULT NULL,
  `map_link` text DEFAULT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `slug`, `date`, `start_time`, `end_time`, `event_type`, `event_link`, `event_location`, `organizar_name`, `organizar_email`, `organizar_phone`, `map_link`, `description`, `photo`, `website`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giving Hope: A Charity Gala for Children in Need', 'giving-hope-a-charity-gala-for-children-in-need', '2024-04-25', '18:34', '19:34', 'offline', 'test', '170 Washington Square South, New York, NY 10012, United States', 'asdfasd', 'dasfa', 'asdf', 'sdfasd', '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif;\">In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.</span>', '6650090181713780218.png', NULL, 1, '2024-04-22 00:18:52', '2024-04-22 04:34:28'),
(2, 'Giving Hope: A Gala for Children in Need', 'giving-hope-a-gala-for-children-in-need', '2024-04-25', '15:16', '18:36', 'online', 'test', 'dfasd', 'asdfasd', 'dasfa', 'asdf', 'sdfasd', 'asdf test', '9167718691713780252.png', NULL, 1, '2024-04-22 00:18:52', '2024-04-22 04:36:08'),
(3, 'A Charity Gala for Children in Need', 'a-charity-gala-for-children-in-need', '2024-04-25', '15:16', '20:36', 'online', 'test', 'dfasd', 'asdfasd', 'dasfa', 'asdf', 'sdfasd', 'asdf test', '5055423321713780268.png', NULL, 1, '2024-04-22 00:18:52', '2024-04-22 04:36:18'),
(4, 'A charity new event', 'a-charity-new-event', '2024-04-25', '15:16', '20:36', 'online', 'test', 'dfasd', 'asdfasd', 'dasfa', 'asdf', 'sdfasd', 'asdf test', '1050554961713780286.png', NULL, 1, '2024-04-22 00:18:52', '2024-04-22 04:36:27'),
(5, 'New event Comming', 'new-event-comming', '2024-04-25', '15:16', '21:36', 'online', 'test', 'dfasd', 'asdfasd', 'dasfa', 'asdf', 'sdfasd', 'asdf test', '14244038021713780311.png', NULL, 1, '2024-04-22 00:18:52', '2024-04-22 04:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`) VALUES
(3, 'How stay calm from the first time', 'People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought. So, let us find out how choosing the proper cleaning services can benefit you in more ways than you are thinking.'),
(5, 'Our proprietary enables Quality', 'People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought. So, let us find out how choosing the proper cleaning services can benefit you in more ways than you are thinking.'),
(6, 'Locate Clean USA Office Near You', 'People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought. So, let us find out how choosing the proper cleaning services can benefit you in more ways than you are thinking.'),
(7, 'Visit our office and see services', 'People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought. So, let us find out how choosing the proper cleaning services can benefit you in more ways than you are thinking.'),
(8, 'How to get Services.', 'People tend to do such a thing is because they find hiring a cleaning service company too expensive. Even if they do end up hiring a cleaning service, they tend to cheap out on this. Doing so can result in spending more money than you initially thought. So, let us find out how choosing the proper cleaning services can benefit you in more ways than you are thinking.');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `title`, `text`, `photo`) VALUES
(1, 'test', 'testdsaff', '20249012301704357778.jpg'),
(2, 'test', 'esdfas', '11490122441708418983.png');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(11) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL,
  `header_logo` varchar(255) DEFAULT NULL,
  `breadcumb` varchar(255) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `is_maintenance` tinyint(4) DEFAULT 0,
  `maintenance` text DEFAULT NULL,
  `maintenance_photo` varchar(191) DEFAULT NULL,
  `frontend_url` varchar(191) DEFAULT NULL,
  `header_text` varchar(255) DEFAULT NULL,
  `footer_logo` varchar(191) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `hero_title` varchar(255) DEFAULT NULL,
  `hero_subtitle` varchar(255) DEFAULT NULL,
  `hero_video_link` text DEFAULT NULL,
  `hero_btn_text` varchar(255) NOT NULL,
  `hero_btn_url` varchar(255) DEFAULT NULL,
  `hero_photo` varchar(255) DEFAULT NULL,
  `cta_photo` varchar(255) DEFAULT NULL,
  `cta_title` varchar(255) DEFAULT NULL,
  `cta_btn_url` text DEFAULT NULL,
  `cta_btn_text` varchar(255) DEFAULT NULL,
  `smtp_host` varchar(191) DEFAULT NULL,
  `smtp_port` varchar(191) DEFAULT NULL,
  `smtp_user` varchar(191) DEFAULT NULL,
  `mail_encryption` varchar(191) DEFAULT NULL,
  `smtp_pass` varchar(191) DEFAULT NULL,
  `from_email` varchar(191) DEFAULT NULL,
  `from_name` varchar(191) DEFAULT NULL,
  `mail_type` varchar(100) DEFAULT NULL,
  `checkout_success_photo` varchar(255) DEFAULT NULL,
  `checkout_success_text` text DEFAULT NULL,
  `checkout_faild_photo` varchar(255) DEFAULT NULL,
  `checkout_faild_text` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `phone`, `email`, `address`, `copyright_text`, `header_logo`, `breadcumb`, `title`, `is_maintenance`, `maintenance`, `maintenance_photo`, `frontend_url`, `header_text`, `footer_logo`, `footer_text`, `hero_title`, `hero_subtitle`, `hero_video_link`, `hero_btn_text`, `hero_btn_url`, `hero_photo`, `cta_photo`, `cta_title`, `cta_btn_url`, `cta_btn_text`, `smtp_host`, `smtp_port`, `smtp_user`, `mail_encryption`, `smtp_pass`, `from_email`, `from_name`, `mail_type`, `checkout_success_photo`, `checkout_success_text`, `checkout_faild_photo`, `checkout_faild_text`) VALUES
(1, '1571567292logo.png', '01700000000', 'genius@gmail.com', '380 St, New York, USA', 'Copyright © 2023 Reserved Passion by GeniusOcean', '14323369791712379160.png', '9239898951712378821.png', 'Car Service', 0, 'test', '1560221241689753866.png', 'https://carservice.geniusocean.xyz/', 'best Car Service company website forever!', '8665975201712379174.png', 'Your Car Deserves the Best Care', 'Keep you on tha road with services you can trust', 'AUTO REPAIR SPECIALIST', 'TqhNILVX8IE', 'Click Our Service', '#', '16865032191688551090.jpg', '12680630721711185679.webp', 'If You Want To Join With Us As a Volunteer. Contact Us Today!', NULL, NULL, 'sandbox.smtp.mailtrap.io', '2525', '77c8df7c3e0779', 'tls', '509dc95e1382f5', 'support@gmail.com', 'Charity', 'php_mailer', '300097761713773488.png', 'asdf', '5789672881713773533.png', 'asdfad');

-- --------------------------------------------------------

--
-- Table structure for table `hold_orders`
--

CREATE TABLE `hold_orders` (
  `id` bigint(20) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `cart` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `shipping` text DEFAULT NULL,
  `package` text DEFAULT NULL,
  `amount` double DEFAULT 0,
  `method` varchar(111) DEFAULT NULL,
  `callback` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `order_number` varchar(255) DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `charge` double DEFAULT 0,
  `final_amo` double NOT NULL DEFAULT 0,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `try` int(11) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `main_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hold_orders`
--

INSERT INTO `hold_orders` (`id`, `user_name`, `user_email`, `address`, `currency`, `cart`, `country`, `shipping`, `package`, `amount`, `method`, `callback`, `status`, `order_number`, `txn_id`, `charge`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `try`, `admin_feedback`, `main_type`, `user_id`) VALUES
(15, 'dadf', 'teacher@gmail.com', 'Munshinogor,Delduar,Tangail,Dhaka,Bangladesh', '{\"id\":1,\"name\":\"USD\",\"sign\":\"$\",\"value\":1,\"is_default\":1}', '{\"item\":[{\"id\":1,\"name\":\"Test Product 1\",\"price\":100,\"qty\":1,\"slug\":\"test-product-1\",\"photo\":\"https:\\/\\/images.pexels.com\\/photos\\/9697397\\/pexels-photo-9697397.jpeg\"},{\"id\":2,\"name\":\"Test Product 2\",\"price\":100,\"qty\":1,\"slug\":\"test-product-2\",\"photo\":\"https:\\/\\/images.pexels.com\\/photos\\/10253213\\/pexels-photo-10253213.jpeg\"}]}', 'Bangladesh', '{\"id\":1,\"user_id\":0,\"title\":\"Free Shipping\",\"subtitle\":\"(10 - 12 days)\",\"price\":0}', '{\"id\":1,\"user_id\":0,\"title\":\"Default Packaging\",\"subtitle\":\"Default packaging by store\",\"price\":0}', 100, '15', 'paypal', 0, 'YoSAvjyh', NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(16, 'frtr', 'teacher@gmail.com', 'Munshinogor,Delduar,Tangail,Dhaka,Bangladesh', '{\"id\":1,\"name\":\"USD\",\"sign\":\"$\",\"value\":1,\"is_default\":1}', '{\"item\":[{\"id\":1,\"name\":\"Test Product 1\",\"price\":100,\"qty\":1,\"slug\":\"test-product-1\",\"photo\":\"https:\\/\\/images.pexels.com\\/photos\\/9697397\\/pexels-photo-9697397.jpeg\"},{\"id\":2,\"name\":\"Test Product 2\",\"price\":100,\"qty\":1,\"slug\":\"test-product-2\",\"photo\":\"https:\\/\\/images.pexels.com\\/photos\\/10253213\\/pexels-photo-10253213.jpeg\"}]}', 'Bangladesh', '{\"id\":1,\"user_id\":0,\"title\":\"Free Shipping\",\"subtitle\":\"(10 - 12 days)\",\"price\":0}', '{\"id\":1,\"user_id\":0,\"title\":\"Default Packaging\",\"subtitle\":\"Default packaging by store\",\"price\":0}', 100, '14', 'stripe', 1, '5eZS1Sdm', 'txn_3KDM8rJlIV5dN9n71XY4LO8S', 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `home_page_sections`
--

CREATE TABLE `home_page_sections` (
  `id` bigint(20) NOT NULL,
  `service_title` varchar(255) DEFAULT NULL,
  `service_text` text DEFAULT NULL,
  `choose_title` varchar(255) DEFAULT NULL,
  `choose_text` text DEFAULT NULL,
  `team_title` varchar(255) DEFAULT NULL,
  `team_text` text DEFAULT NULL,
  `testimonial_title` varchar(255) DEFAULT NULL,
  `testimonial_text` text DEFAULT NULL,
  `blog_title` varchar(255) DEFAULT NULL,
  `blog_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_page_sections`
--

INSERT INTO `home_page_sections` (`id`, `service_title`, `service_text`, `choose_title`, `choose_text`, `team_title`, `team_text`, `testimonial_title`, `testimonial_text`, `blog_title`, `blog_text`) VALUES
(1, 'Our Service', 'we are passionate about cars and committed to providing top-notch automotive services to our valued customers.', 'Why choose Certified Service ?', 'We believe in transparency and honesty when it comes to pricing.', 'Engineers', 'Our expert team members', 'What Our Loving Clients Saying', 'The purpose of the testimonial section is to build trust and credibility by showcasing positive feedback from satisfied patients.', 'Latest News', 'Welcome to our Car Service Website\'s blog section, where we provide valuable insights, expert tips, and the latest updates in the automotive world.');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`, `rtl`) VALUES
(1, 1, 'English', '163479343308Fu3jm9.json', 0),
(11, 0, 'test', '1638347401hPc8azyI.json', 0);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `designation`, `message`, `photo`) VALUES
(17, 'Test Productss', 'test', 'test', 'nqD1588136884bv-rm.jpg'),
(18, 'showrav Hasan', 'Designation', 'asdfasd', 'Nv41588136853people.png');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_25_053316_create_admins_table', 2),
(6, '2014_10_12_100000_create_password_reset_tokens_table', 3),
(7, '2024_01_01_051802_create_campaign_faqs_table', 4),
(8, '2024_01_01_051808_create_campaign_galleries_table', 5),
(9, '2024_01_03_091827_create_preloadeds_table', 5),
(10, '2024_01_04_083632_create_features_table', 5),
(11, '2024_01_08_055021_create_volunters_table', 5),
(13, '2024_04_02_093614_create_donations_table', 6),
(15, '2024_04_04_075952_create_transactions_table', 7),
(16, '2024_04_20_030938_create_events_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Default Packaging', 'Default packaging by store', 0),
(2, 0, 'Gift Packaging', 'Exclusive Gift packaging', 15);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`) VALUES
(6, 'Terms of use', 'terms-of-use', '<h2 dir=\"ltr\" style=\"line-height: 1.8; margin-top: 0pt; margin-bottom: 0pt; padding: 0pt 0pt 8pt;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\">Welcome to our car service website. Please read these Terms of Use carefully before using our website. By accessing and using this website, you agree to be bound by these Terms of Use. If you do not agree with any part of these terms, please do not use our website.</font></span></p><ol style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style: none; margin: 1.25em 0px; padding: 0px; counter-reset: list-number 0; display: flex; flex-direction: column; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 400; white-space-collapse: preserve;\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">Use of Content</span>: The content provided on this website is for informational purposes only. It may include general information about car services, maintenance tips, and related topics. The content is not intended to be a substitute for professional advice or services. Always consult with a qualified automotive professional for specific car-related issues or concerns.</font></span></p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">Intellectual Property</span>: All content on this website, including text, images, graphics, logos, and trademarks, is the property of [Car Service Company Name] or its licensors and is protected by copyright and other intellectual property laws. You may not reproduce, modify, distribute, or use any content from this website without our prior written permission.</font></span></p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">Website Access and Security</span>: We strive to ensure that our website is accessible and secure. However, we do not guarantee uninterrupted access or that the website will be free of errors or viruses. You are responsible for maintaining the confidentiality of your account credentials, if applicable, and for any activity that occurs under your account.</font></span></p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">Third-Party Links</span>: Our website may contain links to third-party websites for your convenience. These links do not signify endorsement or responsibility for the content of such third-party sites. We are not liable for any damages or losses arising from your use of third-party websites.</font></span></p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">User-Generated Content</span>: If you submit any user-generated content (e.g., reviews, comments, or testimonials) to our website, you grant us a non-exclusive, royalty-free, perpetual, and worldwide license to use, reproduce, modify, and display that content in connection with our website and services.</font></span></p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">Limitation of Liability</span>: To the extent permitted by law, we disclaim all warranties, express or implied, regarding the use and performance of this website. We shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising from your use of this website or any content on it.</font></span></p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">Indemnification</span>: You agree to indemnify and hold harmless [Car Service Company Name], its affiliates, and their respective officers, directors, employees, and agents from any claims, losses, damages, liabilities, and expenses, including attorney\'s fees, arising out of your use of our website or violation of these Terms of Use.</font></span></p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">Modification of Terms</span>: We reserve the right to modify these Terms of Use at any time without prior notice. The updated terms will be posted on this page, and your continued use of the website after any changes signify your acceptance of the modified terms.</font></span></p></li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600;\">Governing Law</span>: These Terms of Use shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflicts of law principles.</font></span></p></li></ol><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\">If you have any questions or concerns regarding these Terms of Use, please contact us</font></span></p></h2><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\"><span style=\"background-color: rgb(255, 255, 255);\"><font color=\"#000000\"><br></font></span></h2><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\"><br></h2>', NULL, NULL),
(7, 'Privacy Policy', 'privacy-policy', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\"><p data-v-1a50ebdc=\"\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\">\"Personal information\" is defined to include information that whether on its own or in combination with other information may be used to readily identify or contact you such as: name, address, email address, phone number etc.</p><p data-v-1a50ebdc=\"\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\">We collect personal information from Service Professionals offering their products and services. This information is partially or completely accessible to all visitors using our website or mobile application, either directly or by submitting a request for a service. Service Professionals and customers are required to create an account to be able to access certain portions of our Website, such as to submit questions, participate in polls or surveys, to request a quote, to submit a bid in response to a quote, and request information. - Service Professionals, if and when they create and use an account with us, will be required to disclose and provide to our account information including personal contact details, bank details, personal identification details and participate in polls or surveys or feedbacks etc. Such information gathered shall be utilized to ensure greater customer satisfaction and help a customer satiate their needs.</p><p data-v-1a50ebdc=\"\" style=\"margin-right: 0px; margin-left: 0px; scroll-behavior: smooth; font-family: Poppins, sans-serif; color: rgb(33, 37, 41); font-size: 16px; word-spacing: 1px;\">The type of personal information that we collect from you varies based on your particular interaction with our Website or mobile application.</p></h2>', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`) VALUES
(1, '18361116961687427251.png'),
(2, '1321263481687427264.png'),
(3, '6611642631687427269.png'),
(4, '7352987441687427273.png'),
(5, '18896084721687427278.png'),
(6, '11793045521687429316.png'),
(7, '6729136941687429320.png'),
(8, '1428628971687429324.png'),
(9, '7191796291687429328.png'),
(10, '15090076141687429332.png');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('manual','automatic') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'manual',
  `information` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(191) DEFAULT NULL,
  `currency_id` varchar(191) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `photo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `name`, `type`, `information`, `keyword`, `currency_id`, `status`, `photo`) VALUES
(1, 'Pay with cash upon delivery.', 'Cash On Delivery', NULL, NULL, 'manual', NULL, 'cod', '0', 0, NULL),
(2, '(5 - 6 days)', 'Mobile Money', '<b>Payment Number: </b>69234324233423', NULL, 'manual', NULL, NULL, '0', 0, NULL),
(4, NULL, NULL, NULL, 'SSLCommerz', 'automatic', '{\"store_id\":\"geniu5e1b00621f81e\",\"store_password\":\"geniu5e1b00621f81e@ssl\",\"sandbox_check\":1,\"text\":\"Pay Via SSLCommerz.\"}', 'sslcommerz', '[\"4\"]', 0, NULL),
(7, NULL, NULL, NULL, 'Mercadopago', 'automatic', '{\"public_key\":\"TEST-6f72a502-51c8-4e9a-8ca3-cb7fa0addad8\",\"token\":\"TEST-6068652511264159-022306-e78da379f3963916b1c7130ff2906826-529753482\",\"sandbox_check\":1,\"text\":\"Pay Via MercadoPago\"}', 'mercadopago', '[\"1\"]', 0, NULL),
(8, NULL, NULL, NULL, 'Authorize.Net', 'automatic', '{\"login_id\":\"76zu9VgUSxrJ\",\"txn_key\":\"2Vj62a6skSrP5U3X\",\"sandbox_check\":1,\"text\":\"Pay Via Authorize.Net\"}', 'authorize', '[\"1\"]', 0, NULL),
(9, NULL, NULL, '', 'Razorpay', 'automatic', '{\"key\":\"rzp_test_xDH74d48cwl8DF\",\"secret\":\"cr0H1BiQ20hVzhpHfHuNbGri\",\"text\":\"Pay via your Razorpay account.\"}', 'razorpay', '[\"7\"]', 1, '10765182811711964934.png'),
(10, NULL, NULL, NULL, 'Mollie Payment', 'automatic', '{\"key\":\"test_5HcWVs9qc5pzy36H9Tu9mwAyats33J\",\"text\":\"Pay with Mollie Payment.\"}', 'mollie', '[\"1\",\"6\"]', 0, NULL),
(11, NULL, NULL, NULL, 'Paytm', 'automatic', '{\"merchant\":\"tkogux49985047638244\",\"secret\":\"LhNGUUKE9xCQ9xY8\",\"website\":\"WEBSTAGING\",\"industry\":\"Retail\",\"sandbox_check\":1,\"text\":\"Pay via your Paytm account.\"}', 'paytm', '[\"8\"]', 0, NULL),
(12, NULL, NULL, NULL, 'Paystack', 'automatic', '{\"key\":\"pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2\",\"email\":\"junnuns@gmail.com\",\"text\":\"Pay via your Paystack account.\"}', 'paystack', '[\"9\"]', 0, NULL),
(13, NULL, NULL, NULL, 'Instamojo', 'automatic', '{\"key\":\"test_172371aa837ae5cad6047dc3052\",\"token\":\"test_4ac5a785e25fc596b67dbc5c267\",\"sandbox_check\":1,\"text\":\"Pay via your Instamojo account.\"}', 'instamojo', '[\"8\"]', 0, NULL),
(14, NULL, NULL, '', 'Stripe', 'automatic', '{\"key\":\"pk_test_UnU1Coi1p5qFGwtpjZMRMgJM\",\"secret\":\"sk_test_QQcg3vGsKRPlW6T3dXcNJsor\",\"text\":\"Pay via your Credit Card.\"}', 'stripe', '[\"1\"]', 1, '13080571861711961996.png'),
(15, NULL, NULL, '', 'Paypal', 'automatic', '{\"client_id\":\"AcWYnysKa_elsQIAnlfsJXokR64Z31CeCbpis9G3msDC-BvgcbAwbacfDfEGSP-9Dp9fZaGgD05pX5Qi\",\"client_secret\":\"EGZXTq6d6vBPq8kysVx8WQA5NpavMpDzOLVOb9u75UfsJ-cFzn6aeBXIMyJW2lN1UZtJg5iDPNL9ocYE\",\"text\":\"Pay via your PayPal account.\",\"sandbox_check\":1}', 'paypal', '[\"1\",\"4\"]', 1, '17470991311711962984.png'),
(18, NULL, NULL, '', 'Flutter Wave', 'automatic', '{\"public_key\":\"FLWPUBK_TEST-299dc2c8bf4c7f14f7d7f48c32433393-X\",\"secret_key\":\"FLWSECK_TEST-afb1f2a4789002d7c0f2185b830450b7-X\",\"text\":\"Pay via your Flutter Wave account.\"}', 'flutterwave', '[\"1\"]', 1, '12882558951712115448.png');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`, `expires_at`) VALUES
(181, 'App\\Models\\User', 24, 'authToken', 'c48f808004d3077ea465f9e4885337a81c94038cb056899bb2ae8540f448186a', '[\"*\"]', NULL, '2024-03-18 01:03:37', '2024-03-18 01:03:37', NULL),
(182, 'App\\Models\\User', 24, 'authToken', 'adf29580bb7c079588cf35bd0da67d1fd04cdf61d4059860bbed92c954601a3b', '[\"*\"]', NULL, '2024-03-18 01:03:44', '2024-03-18 01:03:44', NULL),
(183, 'App\\Models\\User', 24, 'authToken', '04d9af1e213275e4eed3af45b1b28288d9a94ad0fb95420616566e9abd84d46e', '[\"*\"]', NULL, '2024-03-18 01:04:10', '2024-03-18 01:04:10', NULL),
(184, 'App\\Models\\User', 24, 'authToken', '6de62fd4dd7fab3efa43078cdfd2d9e7e6a5b1f7ade8fab4212bf5916514cb8d', '[\"*\"]', NULL, '2024-03-18 01:04:16', '2024-03-18 01:04:16', NULL),
(185, 'App\\Models\\User', 24, 'authToken', 'e2ad9dad21c89e11bd5783a88fe9c8eec5d46717d59056148bc2c14bcf44afce', '[\"*\"]', NULL, '2024-03-18 01:07:55', '2024-03-18 01:07:55', NULL),
(223, 'App\\Models\\User', 22, 'authToken', '69468352ab1ca474d6c022b46d00d131128a39e447ae916cfb9d0590b10b99b4', '[\"*\"]', '2024-04-03 03:53:17', '2024-04-03 02:44:46', '2024-04-03 03:53:17', NULL),
(224, 'App\\Models\\User', 22, 'authToken', '3c7cee17a81c6a065f9ed178c44e5abc9bead917410c2b5c8deb6516e61c1fd7', '[\"*\"]', '2024-04-05 03:13:04', '2024-04-03 03:13:54', '2024-04-05 03:13:04', NULL),
(225, 'App\\Models\\User', 22, 'authToken', '4069d6db3ec4d9fdd7a6a9c47c43ac7053b05374bfb9be874a3fbf5fa84511a9', '[\"*\"]', '2024-04-04 04:00:29', '2024-04-04 00:22:56', '2024-04-04 04:00:29', NULL),
(226, 'App\\Models\\User', 22, 'authToken', 'c16dccc0802f4f0fae0fe545a7017cdd8024e817d6bb6a09b21e458f231dcd98', '[\"*\"]', '2024-04-05 00:24:45', '2024-04-04 21:29:21', '2024-04-05 00:24:45', NULL),
(227, 'App\\Models\\User', 22, 'authToken', '34cc4916c9a4c4ec9a1fbbea71f72865a3df1738476a46d30e9d53727ae06430', '[\"*\"]', '2024-04-05 03:27:22', '2024-04-05 02:26:43', '2024-04-05 03:27:22', NULL),
(228, 'App\\Models\\User', 22, 'authToken', '9fe509ae36d24893b3bcb7c31cf6e5b1475aae60e5fed5ec8866705b995783be', '[\"*\"]', '2024-04-06 00:51:24', '2024-04-06 00:11:26', '2024-04-06 00:51:24', NULL),
(229, 'App\\Models\\User', 22, 'authToken', 'ffc7ae06e4ab5c89f9f63b75fd6c8565f455e3085b1ddf2ba6af554493040769', '[\"*\"]', '2024-04-16 04:48:46', '2024-04-16 02:08:13', '2024-04-16 04:48:46', NULL),
(230, 'App\\Models\\User', 22, 'authToken', 'f7eb433dc2787640335d80fba211f7901340af84343a62f8e5827ed5a7c146f2', '[\"*\"]', '2024-04-17 00:41:40', '2024-04-16 21:41:30', '2024-04-17 00:41:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `preloadeds`
--

CREATE TABLE `preloadeds` (
  `id` bigint(20) NOT NULL,
  `amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preloadeds`
--

INSERT INTO `preloadeds` (`id`, `amount`) VALUES
(1, 50),
(3, 10),
(4, 100),
(5, 200);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(3, 'pronob', '[\"Manage Contact\",\"Blogs\"]');

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_tag` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `google_analytics` varchar(255) DEFAULT NULL,
  `facebook_pixel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `title`, `meta_tag`, `meta_description`, `meta_image`, `google_analytics`, `facebook_pixel`) VALUES
(1, 'Dashboard1', 'a,b,c,d,s', 'test description1', 'fgy1588136884bv-rm.jpg', 'test1', 'test1');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `sort_text` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `service_photo` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_feature` tinyint(4) NOT NULL DEFAULT 0,
  `is_benifit` tinyint(4) NOT NULL DEFAULT 0,
  `benifits` text DEFAULT NULL,
  `benifits_details` text DEFAULT NULL,
  `benifits_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `sort_text`, `photo`, `icon`, `service_photo`, `description`, `status`, `is_feature`, `is_benifit`, `benifits`, `benifits_details`, `benifits_photo`) VALUES
(4, 'Spark Plugs', 'spark-plugs', 'Servicing the spark plugs in your car is a vital maintenance task that helps ensure proper engine performance, fuel efficiency, and overall reliability.', '3776642821688545495.png', '5879911861688545495.png', '20358501181688545495.jpg', '<p><span style=\"color:rgb(0,0,0);font-family:\'bridgestone-type\', \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif;font-size:16px;\">The spark plugs in your engine ignite the gas and air mixture that ultimately powers your vehicle . If your spark plugs aren’t functioning properly, your engine will lose power and won’t run at optimal capacity. Have a professional check and replace any faulty spark plugs depending on vehicle mfr recommendations or when you feel a decrease in your engine’s power. </span><span style=\"font-size:16px;\">Over time, spark plugs can wear out or become fouled, leading to issues like misfires, rough idling, and decreased fuel efficiency. Here\'s a guide on how to service the spark plugs:</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>1. Check the Service Schedule:</b> Refer to your car\'s owner\'s manual or maintenance schedule to determine when the spark plugs should be replaced. Typically, spark plugs are replaced every 30,000 to 100,000 miles, depending on the type of spark plugs and the vehicle\'s make and model.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>2. Gather Necessary Tools:</b> To service the spark plugs, you\'ll need a few basic tools, including a spark plug socket, ratchet wrench, spark plug gap tool (if necessary), and a torque wrench.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>3. Allow the Engine to Cool:</b> Before working on the spark plugs, make sure the engine has cooled down to prevent burns.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>4. Locate the Spark Plugs:</b> The spark plugs are usually located on the engine cylinder head. The number of spark plugs corresponds to the number of cylinders in the engine. In a 4-cylinder engine, you\'ll have four spark plugs, and in a V6 engine, you\'ll have six, etc.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>5. Remove the Spark Plug Wires or Coils:</b> If your car has spark plug wires, gently twist and pull them to remove them from the spark plugs. In modern cars with individual coil-on-plug ignition systems, you\'ll need to remove the ignition coils that sit on top of each spark plug.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>6. Remove the Old Spark Plugs:</b> Use the spark plug socket and ratchet wrench to carefully unscrew and remove the old spark plugs from the engine.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>7. Check the Spark Plug Gap:</b> If you\'re using traditional copper or platinum-tipped spark plugs, check the gap (the distance between the center and ground electrode) using a spark plug gap tool. Adjust the gap as per the manufacturer\'s specifications if necessary.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>8. Install the New Spark Plugs:</b> Insert the new spark plugs into the spark plug socket and carefully thread them by hand into the spark plug holes. Once finger-tight, use the socket and ratchet wrench to snugly tighten the spark plugs. Avoid over-tightening, as it can damage the threads.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>9. Reattach Spark Plug Wires or Ignition Coils:</b> If you have spark plug wires, push them firmly onto the new spark plugs until you hear a click. For ignition coils, reinstall them on top of the new spark plugs.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>10. Repeat for all Spark Plugs:</b> Repeat the process for each spark plug in the engine.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>11. Test the Engine:</b> Start the engine and listen for any abnormalities in the engine\'s operation. The car should run smoothly without misfires or hesitation.</span></p>\n\n<p><br></p>\n\n<p><span style=\"color:rgb(0,0,0);font-family:\'bridgestone-type\', \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif;font-size:16px;\"><br></span><br></p>', 1, 1, 0, NULL, NULL, NULL),
(5, 'Transmission fluid', 'transmission-fluid', 'Transmission fluid is a crucial component in an automatic transmission car. It serves several essential functions to keep the transmission running smoothly.', '6902549261688545478.png', '21360934731688545478.png', '6956820161688545478.jpg', '<p><span style=\"color:rgb(0,0,0);font-family:\'bridgestone-type\', \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif;font-size:16px;\">Much like the oil in your engine, transmission fluid is a lubricant that helps keep all of the moving parts inside of your transmission functioning properly. Whether you’re driving an automatic or manual transmission vehicle, it is essential that you have your transmission fluid checked and changed when needed to avoid costly transmission damage or replacement. Follow the vehicle manufacturer’s recommendations.</span></p>\n\n<p><br></p>\n\n<p><span style=\"font-size:16px;\"><b>Function of Transmission Fluid:</b></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Lubrication: </b>Transmission fluid lubricates the various moving parts within the transmission system, reducing friction and preventing wear and tear.</span></p>\n\n<p><span style=\"font-size:16px;\"><b><br></b></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Heat Dissipation:</b> It helps in dissipating the heat generated due to the constant friction between transmission components, preventing overheating.</span></p>\n\n<p><span style=\"font-size:16px;\"><b><br></b></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Transmission Cooling:</b> In some vehicles, transmission fluid is routed through a separate transmission cooler to further assist in cooling the transmission.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Seal Conditioning: </b>Transmission fluid helps in conditioning and maintaining the integrity of seals to prevent leakage.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Hydraulic Power Transmission:</b> In automatic transmissions, the fluid acts as a hydraulic medium, facilitating gear changes and smooth shifting.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Checking Transmission Fluid:</b></span></p>\n\n<p><span style=\"font-size:16px;\">It\'s essential to check the transmission fluid regularly to ensure it\'s at the correct level and in good condition. Here\'s how to check the transmission fluid:</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Warm-Up: </b>The car\'s engine should be running and warmed up to normal operating temperature. This is usually after driving for a few minutes.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Locate Dipstick:</b> Similar to the engine\'s oil dipstick, automatic transmissions have a dipstick to check the fluid level. The dipstick is often located near the back of the engine bay, labeled as \"Transmission\" or \"ATF.\"</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Check Level: </b>Pull the dipstick out, wipe it clean, reinsert it, and then pull it out again. Check the fluid level against the markings on the dipstick. There is typically a \"Full\" and \"Add\" or \"Low\" mark.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Inspect Fluid Condition:</b> Observe the color and smell of the fluid. It should be a translucent red or pink color and have a slightly sweet smell. If the fluid is dark, dirty, or has a burnt smell, it may indicate a problem and require attention.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<p><br></p>', 1, 1, 0, NULL, NULL, NULL),
(6, 'Suspension system service', 'suspension-system-service', 'Servicing the suspension system of a car is an essential maintenance task to ensure a smooth and safe driving experience.', '18572919681688545461.png', '6425334911688545461.png', '15221529571688545461.png', '<p style=\"text-align:justify;\"><span style=\"font-size:16px;\">Servicing the suspension system of a car is an essential maintenance task to ensure a smooth and safe driving experience. The suspension system is responsible for providing a comfortable ride, improving handling, and keeping the tires in contact with the road surface. Here\'s a general guide on how to perform a suspension system service:</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Visual Inspection:</b> Begin by visually inspecting the suspension components for any signs of damage, wear, or leakage. Look for cracks, rust, or oil leaks on the shock absorbers, struts, control arms, and other related parts.</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Check Tire Pressure and Wear: </b>Proper tire pressure and even tire wear are crucial for the suspension\'s performance. Check the tire pressure and inspect the tires for any uneven wear patterns. If there are irregularities, address them before proceeding with the suspension service.</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Test the Suspension:</b> Test the suspension by bouncing each corner of the car. It should rebound smoothly and not continue to bounce excessively. If there\'s excessive bouncing or uneven responses, it could indicate worn-out shocks or struts.</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Check Wheel Alignment:</b> A proper wheel alignment is vital for the suspension system\'s effectiveness. Have the wheel alignment checked, and if necessary, perform adjustments to ensure the wheels are properly aligned.</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Replace Worn Components:</b> If any suspension components show signs of wear or damage during the inspection, they should be replaced. Common components that may need replacement include shock absorbers, struts, control arms, bushings, ball joints, and sway bar links.</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Lubrication:</b> Properly lubricate any suspension components that require it, such as bushings, to reduce friction and noise.</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Wheel Balancing:</b> Make sure the wheels are balanced correctly. Unbalanced wheels can cause uneven tire wear and adversely affect the suspension.</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Torque Check: </b>Double-check that all suspension components are tightened to the manufacturer\'s recommended torque specifications. Loose components can lead to handling issues and premature wear.</span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><br></span></p>\n\n<p style=\"text-align:justify;\"><span style=\"font-size:16px;\"><b>Test Drive: </b>After the service, take the car for a test drive to evaluate the suspension\'s performance. Pay attention to any unusual noises, vibrations, or handling problems and address them accordingly.</span></p>', 1, 1, 0, NULL, NULL, NULL),
(7, 'Replcae windshield wipers', 'replcae-windshield-wipers', 'Replacing the windshield wipers on your car is a relatively simple task that can greatly improve visibility and driving safety, especially during rainy or snowy conditions.', '12464933091688545445.png', '18405108501688545445.png', '17015643211688545445.jpg', '<p><span style=\"color:rgb(0,0,0);font-family:\'bridgestone-type\', \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif;font-size:16px;\">Windshield wipers need to be replaced about once every year, or whenever the effectiveness is compromised. In winter months, it could also be a good idea to install winter wiper blades for optimum performance. You should also pull your wipers away from the window when parked during the winter to prevent ice buildup.</span></p>\n\n<p><span style=\"font-size:16px;\"><b>Purchase New Wiper Blades: </b>Head to an auto parts store or online retailer to buy new windshield wiper blades that are compatible with your car\'s make and model. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Lift the Wiper Arm:</b> Carefully lift the wiper arm away from the windshield until it stays in an upright position. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Remove the Old Wiper Blade:</b> Most wiper blades have a small tab or release mechanism where the blade connects to the wiper arm. Press or lift this tab, depending on the design, and slide the wiper blade off the wiper arm. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Prepare the New Wiper Blade:</b> Take the new wiper blade out of its packaging and make sure it matches the same length and connector style as the old one. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Attach the New Wiper Blade: </b>Align the new wiper blade with the wiper arm and slide it into place until you hear or feel a click, indicating it\'s securely attached. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Lower the Wiper Arm:</b> Gently lower the wiper arm back onto the windshield, being cautious not to let it snap down too hard, as it could damage the windshield. Repeat for the Other Wiper: If your car has a rear windshield wiper, follow the same steps to replace it. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Test the New Wiper Blades:</b> Turn on your wipers and test the new blades to ensure they are working correctly and covering the windshield adequately. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Clean the Windshield: </b>Before you hit the road, take a clean cloth or towel and wipe the windshield to remove any dirt, debris, or residue from the old wiper blades.</span><br><br></p>', 1, 1, 0, NULL, NULL, NULL),
(8, 'Battery Performance check', 'battery-performance-check', 'Car battery performance checks are essential to ensure your vehicle starts reliably and to prevent unexpected breakdowns.', '15900299971688545420.png', '6967628441688545421.png', '7833817611688545421.jpg', '<p><span style=\"color:rgb(0,0,0);font-family:\'bridgestone-type\', \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif;font-size:16px;\">Your car battery is one of the most important components for your vehicle to run. A car battery supplies large amounts of electrical current for the starter, engine and other electronic accessories in the vehicle. Extreme temperatures affect the performance of the battery so regular battery testing will ensure that battery will perform when you need it to.</span></p>\n\n<p><span style=\"color:rgb(0,0,0);font-family:\'bridgestone-type\', \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif;font-size:16px;\"><br></span></p>\n\n<p><span style=\"font-size:16px;\"><b>Visual Inspection:</b> Start by visually inspecting the battery for any signs of damage, corrosion, or leaks. Check the battery terminals and cables for tightness and corrosion. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Voltage Check:</b> Use a digital multimeter to measure the battery\'s voltage. A fully charged battery should read around 12.6 volts. If the voltage is significantly lower, it may indicate a weak or discharged battery.</span></p>\n\n<p><span style=\"font-size:16px;\"><b> Load Test:</b> Perform a load test to assess the battery\'s ability to hold a charge under a load. This test simulates the demands of starting the engine and checks the battery\'s capacity. A failing battery may show a significant drop in voltage during the load test. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Charging System Test:</b> Evaluate the vehicle\'s charging system, including the alternator and voltage regulator. A malfunctioning charging system can lead to battery issues. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Battery Health Check:</b> Some modern diagnostic tools can conduct a comprehensive battery health check, providing insights into the battery\'s state of health and expected lifespan. </span></p>\n\n<p><span style=\"font-size:16px;\"><b>Replace if Necessary:</b> If the battery fails any of the performance tests or shows signs of aging, it\'s time to replace it with a new one.</span><br><br></p>', 1, 1, 0, NULL, NULL, NULL),
(9, 'Car Tube', 'car-tube', 'The consectetur adipisicing elit. Tenetur Lorem ipsum dolor sit amet consectetur adipisicing elit', '19152523701688539495.png', '4063931131688539563.png', '6364738321688539495.jpg', '<p><span style=\"color:rgb(118,110,110);font-family:Roboto, sans-serif;font-size:16px;\">The consectetur adipisicing elit. Tenetur Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis quod veniam voluptatibus accusantium eligendi voluptas. officiis eos sequi ab. Obcaecati doloremque inventore ex. Placeat fugit aliquid doloribus officiis tempora reprehenderit, in nisi non harum animi!</span><br></p>', 1, 1, 1, NULL, 'The consectetur adipisicing elit. Tenetur Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis quod veniam voluptatibus accusantium eligendi voluptas. officiis eos sequi ab. Obcaecati doloremque inventore ex. Placeat fugit aliquid doloribus officiis tempora reprehenderit, in nisi non harum animi!', '19453973631688539495.jpg'),
(10, 'Wheel Change', 'wheel-change', 'Car Service expert engineer dolor sit amet consectetur adipisicing elit.', '13588038391688537937.png', '16159283381688537937.png', '16509102721688537937.jpg', '<p>Car Service expert engineer dolor sit amet consectetur adipisicing elit. Quibusdam repudiandae ducimus laborum odit vel ipsum officiis temporibus officia quas enim eveniet, doloribus numquam modi quia iure vero dolor debitis iusto quis itaque reprehenderit fugiat! Sint, illum.</p>\r\n\r\n<p><br></p>\r\n\r\n<p>Exper Engineer dolor sit amet consectetur adipisicing elit. Quibusdam repudiandae ducimus laborum odit vel ipsum officiis temporibus officia quas enim eveniet, doloribus numquam modi quia iure vero dolor debitis iusto quis itaque reprehenderit fugiat! Sint, illum.</p>', 1, 0, 1, 'Customer Care & Convenience,Customer Care & Convenience,Customer Care & Convenience', 'Car Service expert engineer odit vel ipsum officiis temporibus officia quas enim eveniet, doloribus numquam modi quia iure vero dolor debitis iusto quis itaque reprehenderit fugiat! Sint, illum.\r\nQuibusdam repudiandae ducimus laborum odit velnumquam modi quia iure vero dolor debitis iusto quis itaque reprehenderit fugiat! Sint, illum.', '11436801981688539215.jpg'),
(11, 'Oil and cooling levels', 'oil-and-cooling-levels', 'Regularly checking and maintaining proper oil and coolant levels in your car is essential for optimal engine performance and longevity.', '1905875181690455298.jpg', '21463644161688637671.png', '5202268661688539377.jpg', '<p><span style=\"font-size:16px;\">Regularly checking and maintaining proper oil and coolant levels in your car is essential for optimal engine performance and longevity. Engine oil lubricates vital components, reducing friction and heat, while coolant regulates engine temperature, preventing overheating. Low oil levels can lead to engine damage, while insufficient coolant may cause the engine to overheat. Make it a habit to check these levels regularly and top them up as needed to ensure your car runs smoothly and efficiently on the road.</span></p>\n\n<p><span style=\"font-size:16px;\"><br></span></p>\n\n<div><span style=\"color:rgb(0,0,0);font-family:\'bridgestone-type\', \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif;font-size:16px;\">Every month, or every few gas fill-ups and especially before any longer road trips, it’s a good idea to get under the hood of your car and inspect both the oil and coolant levels while the engine is cool. Low levels of either can lead to engine problems if left unchecked. Refer to your owner’s manual to locate both on your specific vehicle.</span></div>\n\n<p><br></p>', 1, 0, 1, 'Customer Care & Convenience,Customer Care & Convenience,Customer Care & Convenience,Customer Care & Convenience', 'The consectetur adipisicing elit. Tenetur Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis quod veniam voluptatibus accusantium eligendi voluptas. officiis eos sequi ab. Obcaecati doloremque inventore ex. Placeat fugit aliquid doloribus officiis tempora reprehenderit, in nisi non harum animi!', '823654741690455320.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `service_faqs`
--

CREATE TABLE `service_faqs` (
  `id` bigint(20) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_faqs`
--

INSERT INTO `service_faqs` (`id`, `service_id`, `title`, `content`) VALUES
(7, 9, 'What is a car tube service?', 'A car tube service involves inspecting, repairing, or replacing inner tubes used in certain types of tires. Inner tubes are used in older vehicles, some off-road tires, and certain specialty tires. The service ensures the tubes are in good condition and properly inflated to maintain tire performance and prevent punctures or leaks.'),
(8, 10, 'How often should I replace my tires?', 'The lifespan of tires varies depending on factors such as driving habits, road conditions, and tire quality. On average, tires can last anywhere from 25,000 to 50,000 miles. Regularly check your tire\'s tread depth and consult with a professional to determine if replacement is necessary.'),
(9, 8, 'What is a battery performance check car service?', 'A battery performance check car service involves evaluating the health and functionality of your vehicle\'s battery. Technicians use specialized tools to measure the battery\'s voltage, cold cranking amps (CCA), and overall condition to determine if it requires maintenance, charging, or replacement.'),
(10, 4, 'How stay calm from the first time.', 'Lorem ipsum dolor sit amet consectetur. suspendisse nulla aliquam. Risus rutrum tellus eget ultrices pretium nisi amet facilisis dummy text now.'),
(11, 5, 'How stay calm from the first time.', 'Lorem ipsum dolor sit amet consectetur. suspendisse nulla aliquam. Risus rutrum tellus eget ultrices pretium nisi amet facilisis dummy text now.'),
(12, 11, 'What is an oil and cooling levels service?', 'An oil and cooling levels service involves checking and maintaining the oil and coolant levels in your vehicle. It ensures that your engine remains properly lubricated and cooled, which is essential for its smooth and efficient functioning.'),
(15, 11, 'Why is it important to maintain proper oil levels?', 'Maintaining proper oil levels is crucial because oil lubricates the engine\'s moving parts, reducing friction and preventing wear and tear. It also helps in dissipating heat, keeping the engine cool. Without enough oil, the engine could overheat, leading to potential damage and expensive repairs.'),
(16, 11, 'How often should I check the oil and coolant levels in my car?', 'It\'s recommended to check your oil level at least once a month and before long trips. As for the coolant level, it\'s good to check it at the same interval. However, always refer to your vehicle\'s owner\'s manual for specific recommendations.'),
(17, 11, 'Can I check the oil level myself? Is it difficult?', 'Yes, you can check the oil level yourself. It\'s a straightforward process in most vehicles. Simply park your car on level ground, wait a few minutes after turning off the engine, pull out the oil dipstick, wipe it clean, reinsert it, and then check the oil level on the dipstick. The owner\'s manual will have more detailed instructions.'),
(18, 10, 'What is a wheel change service?', 'A wheel change service involves replacing one or more wheels on a vehicle with either the same type of tires or different ones based on the customer\'s preferences or requirements. This service is essential for maintaining proper tire condition and ensuring optimal vehicle performance.'),
(19, 10, 'When should I consider getting a wheel change?', 'There are several scenarios when you should consider getting a wheel change:\r\n1. When your tires are worn out and no longer safe to drive on.\r\n2. When you want to switch to seasonal tires (e.g., winter tires or summer tires).\r\n3. If you need to replace damaged or punctured tires.\r\n4. When upgrading to new tires for improved performance or different driving conditions.'),
(20, 9, 'Do all cars use inner tubes in their tires?', 'No, not all cars use inner tubes in their tires. Most modern passenger vehicles use tubeless tires, which do not require inner tubes. However, some older vehicles, agricultural or off-road vehicles, and certain specialty tires still use tubes.'),
(21, 9, 'Can inner tubes be repaired if they get punctured?', 'Yes, in many cases, punctured inner tubes can be repaired. Small punctures or leaks can often be patched, restoring the tube\'s integrity. However, if the puncture is too large or in a critical area, the tube may need to be replaced.'),
(22, 8, 'Why is a battery performance check important?', 'A battery performance check is essential because the battery is a critical component of your vehicle\'s electrical system. Regular checks help identify potential issues early on, such as low charge levels or a weak battery, preventing unexpected breakdowns and ensuring reliable vehicle starting.'),
(23, 7, '1. When should I replace my windshield wipers?', 'Windshield wipers should be replaced every six months to one year, depending on usage and weather conditions. Signs that you may need new wipers include streaks, skipping, or smearing on the windshield, reduced visibility, or damaged rubber blades.'),
(24, 7, '2. Can I replace my windshield wipers myself?', 'Yes, replacing windshield wipers can be a simple DIY task. Most wiper blades come with easy-to-follow instructions. However, if you\'re unsure or uncomfortable doing it yourself, it\'s best to seek professional assistance.'),
(25, 6, 'What is the suspension system in a car?', 'The suspension system is a crucial component of a car that connects the vehicle\'s wheels to the chassis. Its primary function is to absorb shocks from the road surface, providing a smooth and comfortable ride while maintaining optimal tire contact with the road for better handling and stability.'),
(26, 6, 'When should I have my suspension system inspected or serviced?', 'It\'s recommended to have your suspension system inspected at least once a year or every 12,000 to 15,000 miles. However, if you notice any of the following signs, you should have it checked immediately: uneven tire wear, excessive bouncing or swaying, knocking or clunking noises when driving over bumps, or a noticeable change in handling and steering responsiveness.'),
(27, 6, 'What are the common components of a suspension system?', 'The typical suspension system includes components such as shocks or struts, coil springs, control arms, sway bars, ball joints, and bushings. Some vehicles may also have air springs or torsion bars, depending on their design.'),
(28, 5, 'What is transmission fluid, and what does it do?', 'Transmission fluid is a specialized lubricant used in automatic and manual transmissions. It serves multiple functions, including providing lubrication for moving parts, cooling the transmission, transmitting power, and facilitating smooth gear shifts.'),
(29, 5, 'Can I use any type of transmission fluid for my car?', 'No, it\'s essential to use the type of transmission fluid recommended by the vehicle manufacturer. Using the wrong fluid can lead to transmission damage and may void the warranty.'),
(30, 5, 'What are the signs that my transmission fluid needs to be replaced?', 'Signs that your transmission fluid may need replacement include gear slipping or grinding, rough or delayed shifting, unusual noises during gear changes, and dark or burnt-smelling transmission fluid.'),
(31, 4, 'What are spark plugs, and what do they do?', 'Spark plugs are essential components of an internal combustion engine. They create the spark needed to ignite the air-fuel mixture in the engine\'s cylinders, enabling combustion and powering the vehicle.'),
(32, 4, 'What are the signs that my spark plugs need replacement?', 'Common signs that your spark plugs may need replacement include rough idling, engine misfires, decreased fuel efficiency, difficulty starting the engine, and a noticeable loss of power or acceleration.'),
(33, 4, 'What is the typical cost of spark plug replacement?', 'The cost of spark plug replacement depends on the type of spark plugs required for your car and labor charges in your area. On average, the total cost can range from $50 to $200 or more.');

-- --------------------------------------------------------

--
-- Table structure for table `service_modules`
--

CREATE TABLE `service_modules` (
  `id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_modules`
--

INSERT INTO `service_modules` (`id`, `service_id`, `title`, `photo`) VALUES
(1, 10, 'OVER 5 YEARS OF EXPERIENCE', '17702066841688548899.png'),
(2, 10, 'ASE CERTIFIED MASTER TECHNICIAN', '6283418021688549059.png'),
(3, 10, 'ENGINE MASTER TECHNICIAN', '5245992701688549082.png'),
(4, 10, 'WE OFFER FINANCING OPTIONS', '4009300631688549100.png');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Free Shipping', '(10 - 12 days)', 0),
(2, 0, 'Express Shipping', '(5 - 6 days)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `fclient_id` text DEFAULT NULL,
  `fclient_secret` text DEFAULT NULL,
  `fredirect` text DEFAULT NULL,
  `gclient_id` text DEFAULT NULL,
  `gclient_secret` text DEFAULT NULL,
  `gredirect` text DEFAULT NULL,
  `website_url` varchar(191) DEFAULT NULL,
  `social_icons` text DEFAULT NULL,
  `social_urls` text DEFAULT NULL,
  `facebook_check` tinyint(4) NOT NULL DEFAULT 0,
  `google_check` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`, `website_url`, `social_icons`, `social_urls`, `facebook_check`, `google_check`) VALUES
(1, '353155922795407', '55f8379d2e9717b72f862d07e92af8ed', 'http://localhost/booking-laravel-7', '915191002660-okcvhj4qspmbcm4qgn9et4vnu5q3mdei.apps.googleusercontent.com', 'PP-ZuCXvvdIPrpUy2WEDeIck', 'http://localhost/charity/main-charity/auth/google/callback', 'http://localhost/booking-laravel-7', '[\"fab fa-font-awesome\",\"fab fa-fonticons\",\"fas fa-football-ball\"]', '[\"tttt\",\"tttt4\",\"test\"]', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint(20) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `name`, `icon`, `link`) VALUES
(1, 'Facebook', 'fab fa-facebook-f', 'https://getbootstrap.com'),
(2, 'Twitter', 'fab fa-twitter', 'https://getbootstrap.com'),
(3, 'Instagram', 'fab fa-instagram', 'https://getbootstrap.com'),
(4, 'Linkedin', 'fab fa-linkedin-in', '#');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`) VALUES
(37, 'owner@gmail.com'),
(38, 'shaon@gmail.com'),
(39, 'showrav@gmail.com'),
(40, 'showrabhasan@gmail.com'),
(41, 'user@gmail.com'),
(43, 'user1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_email` varchar(255) DEFAULT NULL,
  `guest_name` varchar(255) DEFAULT NULL,
  `ticket_num` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = replied. ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `guest_email`, `guest_name`, `ticket_num`, `subject`, `status`, `created_at`, `updated_at`) VALUES
(7, 22, NULL, NULL, 'tk345434534', 'Hi', 0, NULL, '2024-04-17 00:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `designation`, `photo`) VALUES
(1, 'Jennifer D. Holland', 'Associate Engineer', '20646390641688621459.jpg'),
(2, 'Cathryn J. Maxwell', 'Jr. Officer', '9792633341688621450.jpg'),
(3, 'Nicole J. Mullins', 'Sr. Executive', '3751893231688621442.jpg'),
(4, 'Glen S. Buck', 'Oil and level tester', '19011135371688621434.jpg'),
(5, 'Jhon Charles', 'Battery Tester', '6319952641688621426.jpg'),
(6, 'Smith Jhon', 'Tier Mechanic', '13719874541688621418.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `photo`, `message`) VALUES
(2, 'Mr. Aashik', '572951221688621014.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam'),
(3, 'Jhon Due', '12756126191688621009.jpg', 'Car battery performance checks are essential to ensure your vehicle starts reliably and to prevent unexpected breakdowns.'),
(4, 'Mr. Marlie', '17895208911688621004.jpg', 'The purpose of the testimonial section is to build trust and credibility by showcasing positive feedback from satisfied patients.'),
(6, 'Brain Due', '1600736101688621040.jpg', 'The Creative Director is a visionary leader responsible for shaping and executing the overall creative direction of a company or organization.');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `ticket_num` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_messages`
--

INSERT INTO `ticket_messages` (`id`, `ticket_id`, `ticket_num`, `user_id`, `admin_id`, `message`, `file`, `created_at`, `updated_at`) VALUES
(1, 7, 'tk345434534', 22, NULL, 'dadf', NULL, '2024-03-13 09:08:31', NULL),
(2, 7, 'tk345434534', 22, 1, 'Hello', NULL, '2024-04-05 02:48:46', '2024-04-05 02:48:46'),
(3, 7, 'tk345434534', 22, 1, 'hI', NULL, '2024-04-16 21:48:28', '2024-04-16 21:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `txn_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `txn_id`, `type`, `remark`, `created_at`, `updated_at`) VALUES
(1, 22, 50.00, 'pi_3P1mUWJlIV5dN9n71cAqD68b', '-', 'My Donation', '2024-04-04 03:21:56', '2024-04-04 03:21:56'),
(2, 22, 50.00, 'pi_3P1mUWJlIV5dN9n71cAqD68b', '+', 'Donation Received', '2024-04-04 03:21:56', '2024-04-04 03:21:56'),
(3, 22, 8.90, '5009240', '+', 'Donation Received', '2024-04-06 00:10:56', '2024-04-06 00:10:56'),
(4, 22, 10.00, 'pi_3P6PIuJlIV5dN9n70m377oAk', '+', 'Donation Received', '2024-04-16 21:37:04', '2024-04-16 21:37:04'),
(5, 22, 50.00, '5031923', '+', 'Donation Received', '2024-04-16 21:40:00', '2024-04-16 21:40:00'),
(6, 22, 10.00, '8N8700445X518633T', '+', 'Donation Received', '2024-04-16 21:40:47', '2024-04-16 21:40:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `balance` decimal(20,10) NOT NULL DEFAULT 0.0000000000,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified` tinyint(1) DEFAULT 0,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  `verification_link` varchar(255) DEFAULT NULL,
  `verify_code` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `kyc_status` tinyint(1) DEFAULT 0,
  `kyc_info` text DEFAULT NULL,
  `kyc_reject_reason` varchar(255) DEFAULT NULL,
  `two_fa_status` tinyint(1) NOT NULL DEFAULT 0,
  `two_fa` tinyint(1) NOT NULL DEFAULT 0,
  `two_fa_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `photo`, `phone`, `country`, `city`, `address`, `zip`, `balance`, `status`, `email_verified`, `verified`, `verification_link`, `verify_code`, `password`, `remember_token`, `kyc_status`, `kyc_info`, `kyc_reject_reason`, `two_fa_status`, `two_fa`, `two_fa_code`, `created_at`, `updated_at`) VALUES
(21, 'pronob', 'pronob sarker', 'pronobsarker16@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000000000, 1, 1, 0, '2b87825289f1295548cb02ead5e26f26', 509122, '$2y$10$WFScVHDotNTlCOkJdI.LH./TLEYTq4U9IB73jY4QKVtyO3xh0n0G.', NULL, 0, NULL, NULL, 0, 0, NULL, '2024-01-29 02:43:28', '2024-01-29 02:43:28'),
(22, 'John Doe 1', 'showrav', 'user@gmail.com', '8015376991708331559.jpg', '01777777777', NULL, 'dhaka', 'Uttara', '1230', 0.0000000000, 1, 1, 0, '2389aeac2249c3ea428bdbe5c780fe48', NULL, '$2y$10$jjViKn87SZ.1V0pCOBEg5OEZtHLOnGRk6geaMWaX1921ktlaLYp2i', NULL, 0, NULL, NULL, 0, 0, NULL, '2024-01-29 02:44:23', '2024-03-18 03:04:14'),
(23, 'user', 'user hasan', 'user1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000000000, 1, 1, 0, '3d8d196830d53237aaf2413aa8f511d4', 840977, '$2y$10$6DKHhIUA26qFd5iGfjDSIeoaemZeVb0zZLDP37kYhkFiS94vxmHki', NULL, 0, NULL, NULL, 0, 0, NULL, '2024-01-30 00:31:21', '2024-01-30 00:31:21'),
(24, 'showrav Hasan', 'showrav', 'showrav@gmail.com', '7097274731707732769.jpg', '17283320', NULL, 'add', 'Tangail,Dhaka,Bangladesh', '1234', 0.0000000000, 1, 0, 0, '2598e04c45701b2519f7e3a2ec6f28fc', 579718, '$2y$10$YHxF9kWfgwB9s5dK1DXJ3eRFh72Wrc6LRZQjIrIuy6eCtB0/DW71C', NULL, 0, NULL, NULL, 0, 0, NULL, '2024-02-12 02:08:27', '2024-03-18 00:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cv` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`id`, `name`, `designation`, `facebook`, `instagram`, `twitter`, `linkedin`, `photo`, `cv`, `status`) VALUES
(1, 'test', 'test', 'dfadsfa', NULL, 'asdfasdf', 'adsfasdf', '16980947051706503568.png', NULL, 0),
(2, 'test', 'test', NULL, NULL, 'test', 'test', '4287302191706503561.png', NULL, 0),
(3, 'test', 'test', 'fadf', NULL, 'asdfas', 'asdfas', '20801095961706503553.png', NULL, 0),
(4, 'showrav Hasan', 'CEO GeniusTeam', 'asdfasdf', 'adfadsf', 'adfadf', 'adsfad', '7206087471711184410.jpg', '5969178211711184410.pdf', 0),
(5, 'showrav Hasan', 'CEO GeniusTeam', 'asdfasdf', 'adfadsf', 'adfadf', 'adsfad', '3896477871711184442.jpg', '10877937881711184442.pdf', 0),
(6, 'showrav Hasan', 'Creative Director', 'https://www.facebook.com/', 'adfadsf', 'https://www.twitter.com/', 'adsfad', '19425756621711184705.jpg', '14067941971711184705.pdf', 0),
(7, '.htaccess', 'CEO GeniusTeam', 'https://www.facebook.com/', 'adfadsf', 'https://www.twitter.com/', 'adsfad', '11128550151711184999.jpg', '3906412491711184999.pdf', 0);

-- --------------------------------------------------------

--
-- Table structure for table `volunters`
--

CREATE TABLE `volunters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_faqs`
--
ALTER TABLE `campaign_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_galleries`
--
ALTER TABLE `campaign_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chooses`
--
ALTER TABLE `chooses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hold_orders`
--
ALTER TABLE `hold_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_sections`
--
ALTER TABLE `home_page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `preloadeds`
--
ALTER TABLE `preloadeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_faqs`
--
ALTER TABLE `service_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_modules`
--
ALTER TABLE `service_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunters`
--
ALTER TABLE `volunters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `campaign_faqs`
--
ALTER TABLE `campaign_faqs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `campaign_galleries`
--
ALTER TABLE `campaign_galleries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chooses`
--
ALTER TABLE `chooses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hold_orders`
--
ALTER TABLE `hold_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `home_page_sections`
--
ALTER TABLE `home_page_sections`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `preloadeds`
--
ALTER TABLE `preloadeds`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_faqs`
--
ALTER TABLE `service_faqs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `service_modules`
--
ALTER TABLE `service_modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `volunters`
--
ALTER TABLE `volunters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
