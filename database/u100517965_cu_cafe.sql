-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 11, 2026 at 12:21 AM
-- Server version: 11.8.9-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u100517965_cu_cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `attribute_changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attribute_changes`)),
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `attribute_changes`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'user', 'deleted', 'App\\Models\\User', 6, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"dani\",\"email\":\"dani@cu.com\",\"phone\":\"07511452694\",\"is_active\":true}}', '[]', '2026-07-09 14:13:02', '2026-07-09 14:13:02'),
(2, 'Category', 'created', 'App\\Models\\Category', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-10 10:57:58', '2026-07-10 10:57:58'),
(3, 'Category', 'created', 'App\\Models\\Category', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-10 10:57:59', '2026-07-10 10:57:59'),
(4, 'Item', 'created', 'App\\Models\\Item', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":1,\"name\":\"test\",\"sku\":null,\"price\":\"0.00\",\"manual_cost\":null,\"description\":null,\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-07-10 10:58:37', '2026-07-10 10:58:37'),
(9, 'Item', 'updated', 'App\\Models\\Item', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"100.00\"},\"old\":{\"price\":\"0.00\"}}', '[]', '2026-07-10 11:00:12', '2026-07-10 11:00:12'),
(12, 'Shift', 'created', 'App\\Models\\Shift', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"user_id\":1,\"opened_at\":\"2026-07-10T11:09:38.000000Z\",\"closed_at\":null,\"opening_cash\":\"0.00\",\"closing_cash\":null,\"expected_cash\":null,\"difference\":null,\"total_sales\":\"0.00\",\"total_orders\":0,\"status\":\"open\",\"notes\":null}}', '[]', '2026-07-10 11:09:38', '2026-07-10 11:09:38'),
(17, 'Ingredient', 'created', 'App\\Models\\Ingredient', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"unit_id\":1,\"current_stock\":\"0.003\",\"reorder_level\":\"0.000\",\"cost_per_unit\":\"0.0000\",\"is_active\":true}}', '[]', '2026-07-10 11:13:26', '2026-07-10 11:13:26'),
(33, 'Item', 'deleted', 'App\\Models\\Item', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"category_id\":1,\"name\":\"test\",\"sku\":null,\"price\":\"100.00\",\"manual_cost\":null,\"description\":null,\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-07-10 11:17:30', '2026-07-10 11:17:30'),
(34, 'Category', 'deleted', 'App\\Models\\Category', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"test\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-10 11:17:38', '2026-07-10 11:17:38'),
(35, 'Category', 'deleted', 'App\\Models\\Category', 2, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"test\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-10 11:17:45', '2026-07-10 11:17:45'),
(36, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"is_active\":false},\"old\":{\"is_active\":true}}', '[]', '2026-07-10 11:18:44', '2026-07-10 11:18:44'),
(37, 'Ingredient', 'created', 'App\\Models\\Ingredient', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"ccc\",\"unit_id\":1,\"current_stock\":\"0.015\",\"reorder_level\":\"0.003\",\"cost_per_unit\":\"2.0000\",\"is_active\":true}}', '[]', '2026-07-10 11:19:36', '2026-07-10 11:19:36'),
(38, 'Category', 'created', 'App\\Models\\Category', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Re-born Conditioner1\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-10 11:19:47', '2026-07-10 11:19:47'),
(39, 'Item', 'created', 'App\\Models\\Item', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":3,\"name\":\"Work\\u202fOut Mask\",\"sku\":null,\"price\":\"0.04\",\"manual_cost\":\"0.02\",\"description\":\"CXCXC\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-07-10 11:20:25', '2026-07-10 11:20:25'),
(58, 'Order', 'created', 'App\\Models\\Order', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260720-0001\",\"invoice_number\":\"CU-20260720-B69610\",\"user_id\":1,\"shift_id\":1,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-07-20 00:21:31', '2026-07-20 00:21:31'),
(59, 'Order', 'updated', 'App\\Models\\Order', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"0.04\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.04\",\"cost_total\":\"0.02\",\"profit\":\"0.02\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-07-20 00:21:31', '2026-07-20 00:21:31'),
(60, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.014\"},\"old\":{\"current_stock\":\"0.015\"}}', '[]', '2026-07-20 00:21:31', '2026-07-20 00:21:31'),
(61, 'Shift', 'updated', 'App\\Models\\Shift', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"opened_at\":\"2026-07-20T00:21:31.000000Z\",\"total_orders\":1},\"old\":{\"opened_at\":\"2026-07-10T11:09:38.000000Z\",\"total_orders\":0}}', '[]', '2026-07-20 00:21:31', '2026-07-20 00:21:31'),
(62, 'Shift', 'updated', 'App\\Models\\Shift', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"opened_at\":\"2026-07-20T00:21:31.000000Z\",\"total_sales\":\"0.04\"},\"old\":{\"opened_at\":\"2026-07-10T11:09:38.000000Z\",\"total_sales\":\"0.00\"}}', '[]', '2026-07-20 00:21:31', '2026-07-20 00:21:31'),
(63, 'Item', 'deleted', 'App\\Models\\Item', 2, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"category_id\":3,\"name\":\"Work\\u202fOut Mask\",\"sku\":null,\"price\":\"0.04\",\"manual_cost\":\"0.02\",\"description\":\"CXCXC\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-07-26 23:42:26', '2026-07-26 23:42:26'),
(64, 'Category', 'deleted', 'App\\Models\\Category', 3, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Re-born Conditioner1\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-26 23:42:32', '2026-07-26 23:42:32'),
(65, 'Shift', 'updated', 'App\\Models\\Shift', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"opened_at\":\"2026-07-26T23:44:23.000000Z\",\"closed_at\":\"2026-07-26T23:44:23.000000Z\",\"closing_cash\":\"0.04\",\"expected_cash\":\"0.04\",\"difference\":\"0.00\",\"status\":\"closed\"},\"old\":{\"opened_at\":\"2026-07-20T00:21:31.000000Z\",\"closed_at\":null,\"closing_cash\":null,\"expected_cash\":null,\"difference\":null,\"status\":\"open\"}}', '[]', '2026-07-26 23:44:23', '2026-07-26 23:44:23'),
(66, 'Order', 'updated', 'App\\Models\\Order', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-07-26T23:45:18.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-07-26 23:45:18', '2026-07-26 23:45:18'),
(67, 'Order', 'updated', 'App\\Models\\Order', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-07-26T23:45:20.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-07-26 23:45:20', '2026-07-26 23:45:20'),
(68, 'Order', 'updated', 'App\\Models\\Order', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-07-26T23:45:21.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-07-26 23:45:21', '2026-07-26 23:45:21'),
(69, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"current_stock\":\"0.000\"},\"old\":{\"name\":\"ccc\",\"current_stock\":\"0.014\"}}', '[]', '2026-07-26 23:46:05', '2026-07-26 23:46:05'),
(70, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"0.0000\"},\"old\":{\"cost_per_unit\":\"2.0000\"}}', '[]', '2026-07-26 23:46:11', '2026-07-26 23:46:11'),
(71, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.000\"},\"old\":{\"current_stock\":\"0.003\"}}', '[]', '2026-07-26 23:46:21', '2026-07-26 23:46:21'),
(72, 'Ingredient', 'created', 'App\\Models\\Ingredient', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062d\\u0627\\u0645\\u0644\\u0629 \\u0643\\u0627\\u0633\\u0627\\u062a \\u062b\\u0646\\u0627\\u0626\\u064a\\u0629\",\"unit_id\":2,\"current_stock\":\"3000.000\",\"reorder_level\":\"500.000\",\"cost_per_unit\":\"2200.0000\",\"is_active\":true}}', '[]', '2026-07-26 23:50:46', '2026-07-26 23:50:46'),
(73, 'Ingredient', 'created', 'App\\Models\\Ingredient', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062d\\u0627\\u0645\\u0644\\u0629 \\u0643\\u0627\\u0633\\u0627\\u062a \\u0627\\u062d\\u0627\\u062f\\u064a\\u0629\",\"unit_id\":2,\"current_stock\":\"2400.000\",\"reorder_level\":\"1000.000\",\"cost_per_unit\":\"1550.0000\",\"is_active\":true}}', '[]', '2026-07-26 23:51:54', '2026-07-26 23:51:54'),
(74, 'Ingredient', 'created', 'App\\Models\\Ingredient', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u0627\\u0633\\u0629 \\u0642\\u0647\\u0648\\u0629\",\"unit_id\":2,\"current_stock\":\"5000.000\",\"reorder_level\":\"1500.000\",\"cost_per_unit\":\"1350.0000\",\"is_active\":true}}', '[]', '2026-07-26 23:55:14', '2026-07-26 23:55:14'),
(75, 'Ingredient', 'created', 'App\\Models\\Ingredient', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u0627\\u0633\\u0629 \\u0639\\u0635\\u064a\\u0631\",\"unit_id\":2,\"current_stock\":\"1000.000\",\"reorder_level\":\"500.000\",\"cost_per_unit\":\"1600.0000\",\"is_active\":true}}', '[]', '2026-07-26 23:57:49', '2026-07-26 23:57:49'),
(76, 'Ingredient', 'created', 'App\\Models\\Ingredient', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0644\\u0628\\u0629 \\u0628\\u0631\\u0643\\u0631\",\"unit_id\":2,\"current_stock\":\"3000.000\",\"reorder_level\":\"750.000\",\"cost_per_unit\":\"2200.0000\",\"is_active\":true}}', '[]', '2026-07-27 00:00:59', '2026-07-27 00:00:59'),
(77, 'Ingredient', 'created', 'App\\Models\\Ingredient', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0644\\u0628\\u0629 \\u0628\\u0631\\u0643\\u0631\",\"unit_id\":2,\"current_stock\":\"3000.000\",\"reorder_level\":\"750.000\",\"cost_per_unit\":\"2200.0000\",\"is_active\":true}}', '[]', '2026-07-27 00:00:59', '2026-07-27 00:00:59'),
(78, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"is_active\":true},\"old\":{\"is_active\":false}}', '[]', '2026-07-27 00:01:06', '2026-07-27 00:01:06'),
(79, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"is_active\":false},\"old\":{\"is_active\":true}}', '[]', '2026-07-27 00:01:18', '2026-07-27 00:01:18'),
(80, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"is_active\":false},\"old\":{\"is_active\":true}}', '[]', '2026-07-27 00:01:22', '2026-07-27 00:01:22'),
(81, 'Ingredient', 'deleted', 'App\\Models\\Ingredient', 7, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"\\u0639\\u0644\\u0628\\u0629 \\u0628\\u0631\\u0643\\u0631\",\"unit_id\":2,\"current_stock\":\"3000.000\",\"reorder_level\":\"750.000\",\"cost_per_unit\":\"2200.0000\",\"is_active\":true}}', '[]', '2026-07-27 00:01:51', '2026-07-27 00:01:51'),
(82, 'Ingredient', 'created', 'App\\Models\\Ingredient', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0635\\u062d\\u0646 \\u0633\\u0644\\u0637\\u0629\",\"unit_id\":2,\"current_stock\":\"750.000\",\"reorder_level\":\"500.000\",\"cost_per_unit\":\"1700.0000\",\"is_active\":true}}', '[]', '2026-07-27 00:04:01', '2026-07-27 00:04:01'),
(83, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1750.0000\"},\"old\":{\"cost_per_unit\":\"1600.0000\"}}', '[]', '2026-07-27 00:05:48', '2026-07-27 00:05:48'),
(84, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1850.0000\"},\"old\":{\"cost_per_unit\":\"1700.0000\"}}', '[]', '2026-07-27 00:07:45', '2026-07-27 00:07:45'),
(85, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1700.0000\"},\"old\":{\"cost_per_unit\":\"1850.0000\"}}', '[]', '2026-07-27 00:08:22', '2026-07-27 00:08:22'),
(86, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1600.0000\"},\"old\":{\"cost_per_unit\":\"1750.0000\"}}', '[]', '2026-07-27 00:09:08', '2026-07-27 00:09:08'),
(87, 'Ingredient', 'created', 'App\\Models\\Ingredient', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0634\\u0644\\u0645\\u0648\\u0646\\u0629\",\"unit_id\":2,\"current_stock\":\"2500.000\",\"reorder_level\":\"750.000\",\"cost_per_unit\":\"150.0000\",\"is_active\":true}}', '[]', '2026-07-27 00:10:46', '2026-07-27 00:10:46'),
(88, 'Ingredient', 'created', 'App\\Models\\Ingredient', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0634\\u0648\\u0643\\u0629\",\"unit_id\":2,\"current_stock\":\"2000.000\",\"reorder_level\":\"750.000\",\"cost_per_unit\":\"125.0000\",\"is_active\":true}}', '[]', '2026-07-27 00:11:34', '2026-07-27 00:11:34'),
(89, 'Ingredient', 'created', 'App\\Models\\Ingredient', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u0627\\u0633\\u0629 \\u0634\\u0627\\u064a\",\"unit_id\":2,\"current_stock\":\"2825.000\",\"reorder_level\":\"1000.000\",\"cost_per_unit\":\"1500.0000\",\"is_active\":true}}', '[]', '2026-07-27 00:15:52', '2026-07-27 00:15:52'),
(90, 'Ingredient', 'created', 'App\\Models\\Ingredient', 13, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u064a\\u0633 \\u0633\\u064a\\u0648 \\u0633\\u0641\\u0631\\u064a\",\"unit_id\":2,\"current_stock\":\"2000.000\",\"reorder_level\":\"1000.000\",\"cost_per_unit\":\"3500.0000\",\"is_active\":true}}', '[]', '2026-07-27 00:17:10', '2026-07-27 00:17:10'),
(91, 'Category', 'created', 'App\\Models\\Category', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0628\\u0631\\u063a\\u0631\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-27 00:24:56', '2026-07-27 00:24:56'),
(92, 'Category', 'created', 'App\\Models\\Category', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0633\\u0644\\u0637\\u0627\\u062a\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-27 00:25:05', '2026-07-27 00:25:05'),
(93, 'Category', 'created', 'App\\Models\\Category', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0634\\u0631\\u0648\\u0628\\u0627\\u062a \\u0628\\u0627\\u0631\\u062f\\u0629\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-27 00:25:18', '2026-07-27 00:25:18'),
(94, 'Category', 'created', 'App\\Models\\Category', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0634\\u0631\\u0648\\u0628\\u0627\\u062a \\u0633\\u0627\\u062e\\u0646\\u0629\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-27 00:25:28', '2026-07-27 00:25:28'),
(95, 'Category', 'created', 'App\\Models\\Category', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u064a\\u0644\\u0643 \\u0634\\u064a\\u0643\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-27 00:25:36', '2026-07-27 00:25:36'),
(96, 'Category', 'created', 'App\\Models\\Category', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0631\\u0627\\u0643\\u064a\\u0644\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-07-27 00:25:43', '2026-07-27 00:25:43'),
(97, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1750.0000\"},\"old\":{\"cost_per_unit\":\"1550.0000\"}}', '[]', '2026-08-11 00:26:27', '2026-08-11 00:26:27'),
(98, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"2400.0000\"},\"old\":{\"cost_per_unit\":\"2200.0000\"}}', '[]', '2026-08-11 00:26:43', '2026-08-11 00:26:43'),
(99, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"350.0000\"},\"old\":{\"cost_per_unit\":\"150.0000\"}}', '[]', '2026-08-11 00:27:08', '2026-08-11 00:27:08'),
(100, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"350.0000\"},\"old\":{\"cost_per_unit\":\"125.0000\"}}', '[]', '2026-08-11 00:27:23', '2026-08-11 00:27:23'),
(101, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1900.0000\"},\"old\":{\"cost_per_unit\":\"1700.0000\"}}', '[]', '2026-08-11 00:27:37', '2026-08-11 00:27:37'),
(102, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"2400.0000\"},\"old\":{\"cost_per_unit\":\"2200.0000\"}}', '[]', '2026-08-11 00:27:52', '2026-08-11 00:27:52'),
(103, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1700.0000\"},\"old\":{\"cost_per_unit\":\"1500.0000\"}}', '[]', '2026-08-11 00:28:01', '2026-08-11 00:28:01'),
(104, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1800.0000\"},\"old\":{\"cost_per_unit\":\"1600.0000\"}}', '[]', '2026-08-11 00:28:15', '2026-08-11 00:28:15'),
(105, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"1550.0000\"},\"old\":{\"cost_per_unit\":\"1350.0000\"}}', '[]', '2026-08-11 00:28:28', '2026-08-11 00:28:28'),
(106, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"3700.0000\"},\"old\":{\"cost_per_unit\":\"3500.0000\"}}', '[]', '2026-08-11 00:28:39', '2026-08-11 00:28:39'),
(107, 'Ingredient', 'created', 'App\\Models\\Ingredient', 14, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0628\\u0637\\u064a\\u062e\",\"unit_id\":3,\"current_stock\":\"4.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"3000.0000\",\"is_active\":true}}', '[]', '2026-08-11 21:58:31', '2026-08-11 21:58:31'),
(108, 'Ingredient', 'created', 'App\\Models\\Ingredient', 15, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062c\\u0628\\u0646 \\u0628\\u0644\\u062f\\u064a\",\"unit_id\":3,\"current_stock\":\"50.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"60000.0000\",\"is_active\":true}}', '[]', '2026-08-11 21:59:02', '2026-08-11 21:59:02'),
(109, 'Ingredient', 'created', 'App\\Models\\Ingredient', 16, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0633\\u0644\",\"unit_id\":3,\"current_stock\":\"3.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"100000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:01:33', '2026-08-11 22:01:33'),
(110, 'Ingredient', 'created', 'App\\Models\\Ingredient', 17, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062b\\u0644\\u062c\",\"unit_id\":3,\"current_stock\":\"10.000\",\"reorder_level\":\"3.000\",\"cost_per_unit\":\"7000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:02:25', '2026-08-11 22:02:25'),
(111, 'Ingredient', 'created', 'App\\Models\\Ingredient', 18, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0633\\u064a\\u0631\\u0648\\u0628 \\u0628\\u0637\\u064a\\u062e\",\"unit_id\":3,\"current_stock\":\"3.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"90000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:03:02', '2026-08-11 22:03:02'),
(112, 'Ingredient', 'created', 'App\\Models\\Ingredient', 19, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0635\\u064a\\u0631 \\u0628\\u0631\\u062a\\u0642\\u0627\\u0644\",\"unit_id\":6,\"current_stock\":\"3.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"27000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:04:15', '2026-08-11 22:04:15'),
(113, 'Ingredient', 'created', 'App\\Models\\Ingredient', 20, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0635\\u064a\\u0631 \\u0644\\u064a\\u0645\\u0648\\u0646\",\"unit_id\":6,\"current_stock\":\"4.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"135000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:05:52', '2026-08-11 22:05:52'),
(114, 'Ingredient', 'created', 'App\\Models\\Ingredient', 21, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0633\\u0648\\u062f\\u0627\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"7000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:06:23', '2026-08-11 22:06:23'),
(115, 'Ingredient', 'created', 'App\\Models\\Ingredient', 22, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0648\\u0632\",\"unit_id\":3,\"current_stock\":\"10.000\",\"reorder_level\":\"5.000\",\"cost_per_unit\":\"15000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:06:48', '2026-08-11 22:06:48'),
(116, 'Ingredient', 'created', 'App\\Models\\Ingredient', 23, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062d\\u0644\\u064a\\u0628 \\u0638\\u0631\\u0641\",\"unit_id\":2,\"current_stock\":\"5.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"15000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:08:14', '2026-08-11 22:08:14'),
(117, 'Ingredient', 'created', 'App\\Models\\Ingredient', 24, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0642\\u0647\\u0648\\u0629 \\u0627\\u0633\\u0628\\u0631\\u0633\\u0648\",\"unit_id\":3,\"current_stock\":\"2.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"180000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:08:55', '2026-08-11 22:08:55'),
(118, 'Ingredient', 'created', 'App\\Models\\Ingredient', 25, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0642\\u0647\\u0648\\u0629 \\u062a\\u0631\\u0643\\u064a\",\"unit_id\":3,\"current_stock\":\"2.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"110000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:09:31', '2026-08-11 22:09:31'),
(119, 'Ingredient', 'created', 'App\\Models\\Ingredient', 26, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u0627\\u0628\\u062a\\u0634\\u064a\\u0646\\u0648 \\u0638\\u0631\\u0641\",\"unit_id\":2,\"current_stock\":\"20.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"3000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:11:36', '2026-08-11 22:11:36'),
(120, 'Ingredient', 'created', 'App\\Models\\Ingredient', 27, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u064a\\u0644\\u0648\",\"unit_id\":3,\"current_stock\":\"3.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"112500.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:17:07', '2026-08-11 22:17:07'),
(121, 'Ingredient', 'created', 'App\\Models\\Ingredient', 28, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0634\\u0627\\u064a \\u0627\\u062e\\u0636\\u0631\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"1300.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:20:10', '2026-08-11 22:20:10'),
(122, 'Ingredient', 'created', 'App\\Models\\Ingredient', 29, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0634\\u0627\\u064a \\u0638\\u0631\\u0641\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"500.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:21:44', '2026-08-11 22:21:44'),
(123, 'Ingredient', 'created', 'App\\Models\\Ingredient', 30, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0634\\u0627\\u064a \\u0647\\u0634\\u0627\\u0645 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\",\"unit_id\":3,\"current_stock\":\"5.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"150000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:33:31', '2026-08-11 22:33:31'),
(124, 'Ingredient', 'created', 'App\\Models\\Ingredient', 31, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644 \\u0638\\u0631\\u0641\",\"unit_id\":2,\"current_stock\":\"20.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"1300.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:34:06', '2026-08-11 22:34:06'),
(125, 'Ingredient', 'created', 'App\\Models\\Ingredient', 32, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062c\\u0628\\u0646\\u0629 \\u0645\\u0634\\u0644\\u0644\",\"unit_id\":3,\"current_stock\":\"3.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"65000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:35:03', '2026-08-11 22:35:03'),
(126, 'Ingredient', 'created', 'App\\Models\\Ingredient', 33, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u0627\\u0628\\u062a\\u0634\\u064a\\u0646\\u0648 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\",\"unit_id\":3,\"current_stock\":\"2.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"70000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:35:33', '2026-08-11 22:35:33'),
(127, 'Ingredient', 'created', 'App\\Models\\Ingredient', 34, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0633\\u0643\\u0631\",\"unit_id\":3,\"current_stock\":\"2.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"20000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:36:18', '2026-08-11 22:36:18'),
(128, 'Ingredient', 'created', 'App\\Models\\Ingredient', 35, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\",\"unit_id\":3,\"current_stock\":\"2.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"200000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:37:52', '2026-08-11 22:37:52'),
(129, 'Ingredient', 'created', 'App\\Models\\Ingredient', 36, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062d\\u0644\\u064a\\u0628 \\u0633\\u0627\\u0626\\u0644\",\"unit_id\":6,\"current_stock\":\"6.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"50000.0000\",\"is_active\":true}}', '[]', '2026-08-11 22:40:07', '2026-08-11 22:40:07'),
(130, 'Item', 'created', 'App\\Models\\Item', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":4,\"name\":\"\\u0628\\u0631\\u063a\\u0631 \\u0628\\u0644\\u062f\\u064a \\u0628\\u0627\\u0644\\u0639\\u0633\\u0644\",\"sku\":null,\"price\":\"30000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646\\u0629 \\u0628\\u0644\\u062f\\u064a, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-11 22:45:57', '2026-08-11 22:45:57'),
(131, 'Item', 'created', 'App\\Models\\Item', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":4,\"name\":\"\\u0628\\u0631\\u063a\\u0631 \\u0633\\u0627\\u062f\\u0629\",\"sku\":null,\"price\":\"20000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-11 22:49:47', '2026-08-11 22:49:47'),
(132, 'Item', 'created', 'App\\Models\\Item', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"name\":\"\\u0633\\u0644\\u0637\\u0629 \\u0628\\u0644\\u062f\\u064a\",\"sku\":null,\"price\":\"30000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646 \\u0628\\u0644\\u062f\\u064a, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-11 22:52:53', '2026-08-11 22:52:53'),
(133, 'Item', 'created', 'App\\Models\\Item', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"name\":\"\\u0633\\u0644\\u0637\\u0629 \\u0645\\u0634\\u0644\\u0644\",\"sku\":null,\"price\":\"30000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646\\u0629 \\u0645\\u0634\\u0644\\u0644\\u0629, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-11 22:56:15', '2026-08-11 22:56:15'),
(134, 'Item', 'created', 'App\\Models\\Item', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"name\":\"\\u0633\\u0627\\u062f\\u0629 \\u0639\\u0627\\u0644\\u0633\\u0643\\u064a\\u0646\",\"sku\":null,\"price\":\"20000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e \\u0648\\u0639\\u0633\\u0644\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-11 22:58:06', '2026-08-11 22:58:06'),
(135, 'Item', 'created', 'App\\Models\\Item', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0639\\u0635\\u064a\\u0631 \\u0628\\u0637\\u064a\\u062e\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e \\u0648\\u062b\\u0644\\u062c\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-11 23:04:47', '2026-08-11 23:04:47'),
(136, 'Item', 'updated', 'App\\Models\\Item', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"20000.00\"},\"old\":{\"price\":\"25000.00\"}}', '[]', '2026-08-11 23:04:58', '2026-08-11 23:04:58'),
(137, 'Item', 'created', 'App\\Models\\Item', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0639\\u0635\\u064a\\u0631 \\u0628\\u0631\\u062a\\u0642\\u0627\\u0644\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0631\\u062a\\u0642\\u0627\\u0644 \\u0648\\u062b\\u0644\\u062c\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 00:43:04', '2026-08-12 00:43:04'),
(138, 'Item', 'created', 'App\\Models\\Item', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0645\\u0648\\u0647\\u064a\\u062a\\u0648 \\u0628\\u0637\\u064a\\u062e\",\"sku\":null,\"price\":\"30000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u0644\\u064a\\u0645\\u0648\\u0646, \\u0645\\u064a\\u0627\\u0647 \\u063a\\u0627\\u0632\\u064a\\u0629, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u062b\\u0644\\u062c\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 00:47:13', '2026-08-12 00:47:13'),
(139, 'Item', 'created', 'App\\Models\\Item', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0643\\u0648\\u0643\\u062a\\u064a\\u0644 \\u0645\\u0648\\u0632 \\u0648\\u062d\\u0644\\u064a\\u0628\",\"sku\":null,\"price\":\"32000.00\",\"manual_cost\":null,\"description\":\"\\u0645\\u0648\\u0632, \\u062d\\u0644\\u064a\\u0628 \\u0648\\u062b\\u0644\\u062c\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 00:50:49', '2026-08-12 00:50:49'),
(140, 'Item', 'created', 'App\\Models\\Item', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0627\\u064a\\u0633 \\u0627\\u0645\\u0631\\u064a\\u0643\\u0627\\u0646\\u0648\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0627\\u0633\\u0628\\u0631\\u0633\\u0648, \\u0645\\u0627\\u0621 \\u0648\\u062b\\u0644\\u062c\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 00:56:34', '2026-08-12 00:56:34'),
(141, 'Item', 'created', 'App\\Models\\Item', 13, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0627\\u064a\\u0633 \\u0644\\u0627\\u062a\\u064a\\u0647\",\"sku\":null,\"price\":\"35000.00\",\"manual_cost\":null,\"description\":\"\\u0627\\u0633\\u0628\\u0631\\u0633\\u0648, \\u062d\\u0644\\u064a\\u0628 \\u0648\\u062b\\u0644\\u062c\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:00:52', '2026-08-12 01:00:52'),
(142, 'Item', 'created', 'App\\Models\\Item', 14, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0642\\u0647\\u0648\\u0629 \\u062a\\u0631\\u0643\\u064a\\u0629\",\"sku\":null,\"price\":\"12000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0646 \\u0645\\u0637\\u062d\\u0648\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:04:02', '2026-08-12 01:04:02'),
(143, 'Item', 'created', 'App\\Models\\Item', 15, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0623\\u0633\\u0628\\u0631\\u0633\\u0648\",\"sku\":null,\"price\":\"12000.00\",\"manual_cost\":null,\"description\":\"\\u0642\\u0647\\u0648\\u0629 \\u0627\\u0633\\u0628\\u0631\\u0633\\u0648\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:06:03', '2026-08-12 01:06:03'),
(144, 'Item', 'created', 'App\\Models\\Item', 16, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0634\\u0627\\u064a\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":null,\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:09:59', '2026-08-12 01:09:59'),
(145, 'Item', 'created', 'App\\Models\\Item', 17, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u062d\\u0644\\u064a\\u0628\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u062d\\u0644\\u064a\\u0628 \\u0633\\u0627\\u062e\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:15:45', '2026-08-12 01:15:45'),
(146, 'Item', 'created', 'App\\Models\\Item', 18, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0627\\u0645\\u0631\\u064a\\u0643\\u0627\\u0646\\u0648\",\"sku\":null,\"price\":\"12000.00\",\"manual_cost\":null,\"description\":\"\\u0634\\u0648\\u062a \\u0627\\u0633\\u0628\\u0631\\u0633\\u0648 \\u0648\\u0645\\u0627\\u0621 \\u0633\\u0627\\u062e\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:17:43', '2026-08-12 01:17:43'),
(147, 'Item', 'created', 'App\\Models\\Item', 19, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":9,\"name\":\"\\u0634\\u0627\\u064a \\u0628\\u062d\\u0644\\u064a\\u0628\",\"sku\":null,\"price\":\"12000.00\",\"manual_cost\":null,\"description\":\"\\u0634\\u0627\\u064a \\u0648\\u062d\\u0644\\u064a\\u0628\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:22:28', '2026-08-12 01:22:28'),
(148, 'Item', 'created', 'App\\Models\\Item', 20, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0634\\u0627\\u064a \\u0627\\u062e\\u0636\\u0631\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0634\\u0627\\u064a \\u0627\\u062e\\u0636\\u0631 \\u0633\\u0627\\u062e\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:24:18', '2026-08-12 01:24:18'),
(149, 'Item', 'updated', 'App\\Models\\Item', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7},\"old\":{\"category_id\":9}}', '[]', '2026-08-12 01:25:08', '2026-08-12 01:25:08'),
(150, 'Item', 'created', 'App\\Models\\Item', 21, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0643\\u0627\\u0628\\u062a\\u0634\\u064a\\u0646\\u0648\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0643\\u0627\\u0628\\u062a\\u0634\\u064a\\u0646\\u0648 \\u0633\\u0627\\u062e\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:28:05', '2026-08-12 01:28:05'),
(151, 'Item', 'created', 'App\\Models\\Item', 22, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647\",\"sku\":null,\"price\":\"12000.00\",\"manual_cost\":null,\"description\":\"\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647 \\u0633\\u0627\\u062e\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:30:28', '2026-08-12 01:30:28'),
(152, 'Item', 'created', 'App\\Models\\Item', 23, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0645\\u064a\\u0644\\u0648\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0645\\u064a\\u0644\\u0648 \\u0633\\u0627\\u062e\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:31:31', '2026-08-12 01:31:31'),
(153, 'Item', 'created', 'App\\Models\\Item', 24, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0642\\u0647\\u0648\\u0629 \\u0628\\u062d\\u0644\\u064a\\u0628\",\"sku\":null,\"price\":\"15000.00\",\"manual_cost\":null,\"description\":\"\\u0642\\u0647\\u0648\\u0629 \\u0648 \\u062d\\u0644\\u064a\\u0628\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:34:27', '2026-08-12 01:34:27'),
(154, 'Item', 'created', 'App\\Models\\Item', 25, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0643\\u0627\\u0628\\u062a\\u0634\\u064a\\u0646\\u0648 \\u0627\\u064a\\u0637\\u0627\\u0644\\u064a\",\"sku\":null,\"price\":\"12000.00\",\"manual_cost\":null,\"description\":\"\\u0643\\u0627\\u0628\\u062a\\u0634\\u064a\\u0646\\u0648 \\u0627\\u064a\\u0637\\u0627\\u0644\\u064a \\u0633\\u0627\\u062e\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:36:34', '2026-08-12 01:36:34'),
(155, 'Item', 'created', 'App\\Models\\Item', 26, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644 \\u0633\\u0627\\u062e\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:38:34', '2026-08-12 01:38:34'),
(156, 'Category', 'created', 'App\\Models\\Category', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0633\\u0641\\u0631\\u064a\\u0627\\u062a\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-08-12 01:39:08', '2026-08-12 01:39:08'),
(157, 'Item', 'created', 'App\\Models\\Item', 27, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":10,\"name\":\"\\u062d\\u0627\\u0645\\u0644\\u0629 \\u0643\\u0627\\u0633\\u0627\\u062a \\u062b\\u0646\\u0627\\u0626\\u064a\\u0629\",\"sku\":null,\"price\":\"0.00\",\"manual_cost\":null,\"description\":\"\\u062d\\u0627\\u0645\\u0644\\u0629 \\u0643\\u0627\\u0633\\u0627\\u062a \\u062b\\u0646\\u0627\\u0626\\u064a\\u0629\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:40:11', '2026-08-12 01:40:11'),
(158, 'Item', 'created', 'App\\Models\\Item', 28, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":10,\"name\":\"\\u062d\\u0627\\u0645\\u0644\\u0629 \\u0643\\u0627\\u0633\\u0627\\u062a \\u0627\\u062d\\u0627\\u062f\\u064a\\u0629\",\"sku\":null,\"price\":\"0.00\",\"manual_cost\":null,\"description\":\"\\u062d\\u0627\\u0645\\u0644\\u0629 \\u0643\\u0627\\u0633\\u0627\\u062a \\u0627\\u062d\\u0627\\u062f\\u064a\\u0629\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:41:42', '2026-08-12 01:41:42'),
(159, 'Item', 'created', 'App\\Models\\Item', 29, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":10,\"name\":\"\\u0643\\u064a\\u0633 \\u0633\\u064a\\u0648 \\u0633\\u0641\\u0631\\u064a\",\"sku\":null,\"price\":\"0.00\",\"manual_cost\":null,\"description\":\"\\u0643\\u064a\\u0633 \\u0633\\u064a\\u0648 \\u0633\\u0641\\u0631\\u064a\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-12 01:43:20', '2026-08-12 01:43:20'),
(160, 'Item', 'updated', 'App\\Models\\Item', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"8000.00\"},\"old\":{\"price\":\"10000.00\"}}', '[]', '2026-08-14 23:23:34', '2026-08-14 23:23:34'),
(161, 'Item', 'updated', 'App\\Models\\Item', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"12000.00\"}}', '[]', '2026-08-14 23:24:29', '2026-08-14 23:24:29'),
(162, 'Item', 'updated', 'App\\Models\\Item', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"12000.00\"}}', '[]', '2026-08-14 23:25:29', '2026-08-14 23:25:29'),
(163, 'Item', 'updated', 'App\\Models\\Item', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"12000.00\"}}', '[]', '2026-08-14 23:25:57', '2026-08-14 23:25:57'),
(164, 'Item', 'updated', 'App\\Models\\Item', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"12000.00\"}}', '[]', '2026-08-14 23:27:49', '2026-08-14 23:27:49'),
(165, 'Item', 'updated', 'App\\Models\\Item', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"8000.00\"},\"old\":{\"price\":\"10000.00\"}}', '[]', '2026-08-14 23:28:16', '2026-08-14 23:28:16'),
(166, 'Item', 'updated', 'App\\Models\\Item', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"8000.00\"},\"old\":{\"price\":\"10000.00\"}}', '[]', '2026-08-14 23:29:07', '2026-08-14 23:29:07'),
(167, 'Item', 'updated', 'App\\Models\\Item', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"12000.00\"}}', '[]', '2026-08-14 23:29:36', '2026-08-14 23:29:36'),
(168, 'Ingredient', 'created', 'App\\Models\\Ingredient', 37, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062c\\u0628\\u0646\\u0629 \\u0641\\u064a\\u062a\\u0627\",\"unit_id\":3,\"current_stock\":\"4.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"64000.0000\",\"is_active\":true}}', '[]', '2026-08-14 23:32:33', '2026-08-14 23:32:33'),
(169, 'Item', 'created', 'App\\Models\\Item', 30, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":4,\"name\":\"\\u0628\\u0631\\u063a\\u0631 \\u0641\\u064a\\u062a\\u0627 \\u0628\\u0627\\u0644\\u0639\\u0633\\u0644\",\"sku\":null,\"price\":\"30000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646\\u0629 \\u0641\\u064a\\u062a\\u0627, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-14 23:34:44', '2026-08-14 23:34:44'),
(170, 'Item', 'created', 'App\\Models\\Item', 31, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"name\":\"\\u0633\\u0644\\u0637\\u0629 \\u0641\\u064a\\u062a\\u0627\",\"sku\":null,\"price\":\"30000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646\\u0629 \\u0641\\u064a\\u062a\\u0627, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-14 23:36:46', '2026-08-14 23:36:46'),
(171, 'user', 'deleted', 'App\\Models\\User', 5, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"\\u0645\\u0633\\u0624\\u0648\\u0644 \\u0627\\u0644\\u0645\\u062e\\u0632\\u0646\",\"email\":\"storage@cu.local\",\"phone\":null,\"is_active\":true}}', '[]', '2026-08-14 23:53:40', '2026-08-14 23:53:40'),
(172, 'user', 'deleted', 'App\\Models\\User', 4, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"\\u0627\\u0644\\u0645\\u062d\\u0627\\u0633\\u0628\",\"email\":\"accountant@cu.local\",\"phone\":null,\"is_active\":true}}', '[]', '2026-08-14 23:53:43', '2026-08-14 23:53:43'),
(173, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"17.000\"},\"old\":{\"current_stock\":\"4.000\"}}', '[]', '2026-08-15 07:57:13', '2026-08-15 07:57:13'),
(174, 'Order', 'created', 'App\\Models\\Order', 13, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260815-0001\",\"invoice_number\":\"CU-20260815-6C3249\",\"user_id\":1,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(175, 'Order', 'updated', 'App\\Models\\Order', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"70000.00\",\"item_discount_total\":\"0.00\",\"discount_type\":\"percent\",\"discount_value\":\"50.00\",\"order_discount_amount\":\"35000.00\",\"discount_total\":\"35000.00\",\"total\":\"35000.00\",\"cost_total\":\"18700.00\",\"profit\":\"16300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_type\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(176, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2999.000\"},\"old\":{\"current_stock\":\"3000.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(177, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"16.700\"},\"old\":{\"current_stock\":\"17.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(178, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2.985\"},\"old\":{\"current_stock\":\"3.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(179, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.950\"},\"old\":{\"current_stock\":\"4.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(180, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"4999.000\"},\"old\":{\"current_stock\":\"5000.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(181, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"1.985\"},\"old\":{\"current_stock\":\"2.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(182, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"749.000\"},\"old\":{\"current_stock\":\"750.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(183, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"1999.000\"},\"old\":{\"current_stock\":\"2000.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(184, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"16.400\"},\"old\":{\"current_stock\":\"16.700\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(185, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"49.970\"},\"old\":{\"current_stock\":\"50.000\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(186, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2.970\"},\"old\":{\"current_stock\":\"2.985\"}}', '[]', '2026-08-15 08:16:22', '2026-08-15 08:16:22');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `attribute_changes`, `properties`, `created_at`, `updated_at`) VALUES
(187, 'Order', 'updated', 'App\\Models\\Order', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-15T08:17:54.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-15 08:17:54', '2026-08-15 08:17:54'),
(188, 'Order', 'updated', 'App\\Models\\Order', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-15T08:18:19.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-15 08:18:19', '2026-08-15 08:18:19'),
(189, 'Order', 'updated', 'App\\Models\\Order', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-15T08:18:27.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-15 08:18:27', '2026-08-15 08:18:27'),
(190, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"44.000\"},\"old\":{\"current_stock\":\"16.400\"}}', '[]', '2026-08-15 14:01:19', '2026-08-15 14:01:19'),
(191, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"16.000\"},\"old\":{\"current_stock\":\"44.000\"}}', '[]', '2026-08-15 14:02:38', '2026-08-15 14:02:38'),
(192, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"60.000\"},\"old\":{\"current_stock\":\"16.000\"}}', '[]', '2026-08-15 14:17:39', '2026-08-15 14:17:39'),
(193, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"4.000\"},\"old\":{\"current_stock\":\"10.000\"}}', '[]', '2026-08-15 14:24:32', '2026-08-15 14:24:32'),
(194, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"22.000\"},\"old\":{\"current_stock\":\"49.970\"}}', '[]', '2026-08-16 07:22:06', '2026-08-16 07:22:06'),
(195, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"5.000\"},\"old\":{\"current_stock\":\"2.970\"}}', '[]', '2026-08-16 15:17:10', '2026-08-16 15:17:10'),
(196, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.500\"},\"old\":{\"current_stock\":\"5.000\"}}', '[]', '2026-08-16 15:18:58', '2026-08-16 15:18:58'),
(197, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 29, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"7.000\"},\"old\":{\"current_stock\":\"30.000\"}}', '[]', '2026-08-16 15:21:31', '2026-08-16 15:21:31'),
(198, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 29, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"700.000\"},\"old\":{\"current_stock\":\"7.000\"}}', '[]', '2026-08-16 15:23:30', '2026-08-16 15:23:30'),
(199, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.500\"},\"old\":{\"current_stock\":\"2.000\"}}', '[]', '2026-08-16 15:24:20', '2026-08-16 15:24:20'),
(200, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 30, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2.250\"},\"old\":{\"current_stock\":\"5.000\"}}', '[]', '2026-08-16 15:25:57', '2026-08-16 15:25:57'),
(201, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2.000\"},\"old\":{\"current_stock\":\"3.000\"}}', '[]', '2026-08-16 15:27:23', '2026-08-16 15:27:23'),
(202, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"1.500\"},\"old\":{\"current_stock\":\"5.000\"}}', '[]', '2026-08-16 15:28:52', '2026-08-16 15:28:52'),
(203, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"5.000\"},\"old\":{\"current_stock\":\"1.500\"}}', '[]', '2026-08-16 15:29:37', '2026-08-16 15:29:37'),
(204, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 35, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.500\"},\"old\":{\"current_stock\":\"2.000\"}}', '[]', '2026-08-16 15:32:03', '2026-08-16 15:32:03'),
(205, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2.000\"},\"old\":{\"current_stock\":\"3.000\"}}', '[]', '2026-08-16 15:34:28', '2026-08-16 15:34:28'),
(206, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.000\"},\"old\":{\"current_stock\":\"3.950\"}}', '[]', '2026-08-16 16:01:48', '2026-08-16 16:01:48'),
(207, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 34, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"8.000\"},\"old\":{\"current_stock\":\"2.000\"}}', '[]', '2026-08-16 16:02:32', '2026-08-16 16:02:32'),
(208, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.500\"},\"old\":{\"current_stock\":\"3.000\"}}', '[]', '2026-08-16 16:03:27', '2026-08-16 16:03:27'),
(209, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"700.000\"},\"old\":{\"current_stock\":\"1.985\"}}', '[]', '2026-08-16 16:25:37', '2026-08-16 16:25:37'),
(210, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"1.000\"},\"old\":{\"current_stock\":\"700.000\"}}', '[]', '2026-08-16 16:27:51', '2026-08-16 16:27:51'),
(211, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"1.000\"},\"old\":{\"current_stock\":\"3.000\"}}', '[]', '2026-08-16 16:37:40', '2026-08-16 16:37:40'),
(212, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 33, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.500\"},\"old\":{\"current_stock\":\"2.000\"}}', '[]', '2026-08-16 17:04:19', '2026-08-16 17:04:19'),
(213, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062c\\u0628\\u0646\\u0629 \\u062d\\u0644\\u0648\\u0645\",\"current_stock\":\"4.000\",\"cost_per_unit\":\"80000.0000\"},\"old\":{\"name\":\"\\u062c\\u0628\\u0646\\u0629 \\u0641\\u064a\\u062a\\u0627\",\"current_stock\":\"0.000\",\"cost_per_unit\":\"64000.0000\"}}', '[]', '2026-08-16 21:33:00', '2026-08-16 21:33:00'),
(214, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"5.000\"},\"old\":{\"current_stock\":\"0.500\"}}', '[]', '2026-08-16 21:33:07', '2026-08-16 21:33:07'),
(215, 'Item', 'updated', 'App\\Models\\Item', 30, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0628\\u0631\\u063a\\u0631 \\u062d\\u0644\\u0648\\u0645 \\u0628\\u0627\\u0644\\u0639\\u0633\\u0644\",\"price\":\"35000.00\",\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646\\u0629 \\u062d\\u0644\\u0648\\u0645, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\"},\"old\":{\"name\":\"\\u0628\\u0631\\u063a\\u0631 \\u0641\\u064a\\u062a\\u0627 \\u0628\\u0627\\u0644\\u0639\\u0633\\u0644\",\"price\":\"30000.00\",\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646\\u0629 \\u0641\\u064a\\u062a\\u0627, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\"}}', '[]', '2026-08-16 21:35:20', '2026-08-16 21:35:20'),
(216, 'Item', 'updated', 'App\\Models\\Item', 31, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0633\\u0644\\u0637\\u0629 \\u062d\\u0644\\u0648\\u0645\",\"price\":\"35000.00\",\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646\\u0629 \\u062d\\u0644\\u0648\\u0645, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\"},\"old\":{\"name\":\"\\u0633\\u0644\\u0637\\u0629 \\u0641\\u064a\\u062a\\u0627\",\"price\":\"30000.00\",\"description\":\"\\u0628\\u0637\\u064a\\u062e, \\u062c\\u0628\\u0646\\u0629 \\u0641\\u064a\\u062a\\u0627, \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0639\\u0633\\u0644\"}}', '[]', '2026-08-16 21:52:18', '2026-08-16 21:52:18'),
(217, 'Order', 'created', 'App\\Models\\Order', 14, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260816-0001\",\"invoice_number\":\"CU-20260816-CCF2FE\",\"user_id\":1,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(218, 'Order', 'updated', 'App\\Models\\Order', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"30000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"30000.00\",\"cost_total\":\"7800.00\",\"profit\":\"22200.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(219, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2998.000\"},\"old\":{\"current_stock\":\"2999.000\"}}', '[]', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(220, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"59.700\"},\"old\":{\"current_stock\":\"60.000\"}}', '[]', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(221, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"21.950\"},\"old\":{\"current_stock\":\"22.000\"}}', '[]', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(222, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.485\"},\"old\":{\"current_stock\":\"3.500\"}}', '[]', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(223, 'Supplier', 'created', 'App\\Models\\Supplier', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"x\",\"phone\":\"07511452694\",\"email\":null,\"address\":\"x\",\"notes\":\"x\",\"is_active\":true}}', '[]', '2026-08-16 22:13:21', '2026-08-16 22:13:21'),
(224, 'Purchase', 'created', 'App\\Models\\Purchase', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"reference\":\"PO-20260816-3922C\",\"supplier_id\":1,\"user_id\":1,\"total\":\"0.00\",\"purchased_at\":\"2026-08-16T00:00:00.000000Z\",\"notes\":\"x\"}}', '[]', '2026-08-16 22:14:12', '2026-08-16 22:14:12'),
(225, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"111.000\",\"cost_per_unit\":\"11.0000\"},\"old\":{\"current_stock\":\"0.000\",\"cost_per_unit\":\"0.0000\"}}', '[]', '2026-08-16 22:14:12', '2026-08-16 22:14:12'),
(226, 'Purchase', 'updated', 'App\\Models\\Purchase', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"total\":\"1221.00\"},\"old\":{\"total\":\"0.00\"}}', '[]', '2026-08-16 22:14:12', '2026-08-16 22:14:12'),
(227, 'Supplier', 'deleted', 'App\\Models\\Supplier', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"x\",\"phone\":\"07511452694\",\"email\":null,\"address\":\"x\",\"notes\":\"x\",\"is_active\":true}}', '[]', '2026-08-16 22:25:14', '2026-08-16 22:25:14'),
(228, 'Order', 'created', 'App\\Models\\Order', 15, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260816-0001\",\"invoice_number\":\"CU-20260816-8ABE9F\",\"user_id\":1,\"shift_id\":null,\"table_id\":10,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(229, 'Order', 'updated', 'App\\Models\\Order', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"55000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"55000.00\",\"cost_total\":\"13350.00\",\"profit\":\"41650.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(230, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2997.000\"},\"old\":{\"current_stock\":\"2998.000\"}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(231, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"59.400\"},\"old\":{\"current_stock\":\"59.700\"}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(232, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.470\"},\"old\":{\"current_stock\":\"3.485\"}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(233, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.950\"},\"old\":{\"current_stock\":\"4.000\"}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(234, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"999.000\"},\"old\":{\"current_stock\":\"1000.000\"}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(235, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"1998.000\"},\"old\":{\"current_stock\":\"1999.000\"}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(236, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"59.100\"},\"old\":{\"current_stock\":\"59.400\"}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(237, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.455\"},\"old\":{\"current_stock\":\"3.470\"}}', '[]', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(238, 'Order', 'updated', 'App\\Models\\Order', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-16T22:38:42.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-16 22:38:42', '2026-08-16 22:38:42'),
(239, 'Order', 'updated', 'App\\Models\\Order', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-16T22:38:43.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-16 22:38:43', '2026-08-16 22:38:43'),
(240, 'Order', 'updated', 'App\\Models\\Order', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-16T22:38:44.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-16 22:38:44', '2026-08-16 22:38:44'),
(241, 'Order', 'created', 'App\\Models\\Order', 16, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260816-0001\",\"invoice_number\":\"CU-20260816-D0E06D\",\"user_id\":1,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(242, 'Order', 'updated', 'App\\Models\\Order', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"30000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"30000.00\",\"cost_total\":\"7800.00\",\"profit\":\"22200.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(243, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2996.000\"},\"old\":{\"current_stock\":\"2997.000\"}}', '[]', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(244, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"58.800\"},\"old\":{\"current_stock\":\"59.100\"}}', '[]', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(245, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"21.900\"},\"old\":{\"current_stock\":\"21.950\"}}', '[]', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(246, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.440\"},\"old\":{\"current_stock\":\"3.455\"}}', '[]', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(247, 'Order', 'updated', 'App\\Models\\Order', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-16T22:45:54.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-16 22:45:54', '2026-08-16 22:45:54'),
(248, 'Order', 'updated', 'App\\Models\\Order', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-16T22:45:55.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-16 22:45:55', '2026-08-16 22:45:55'),
(249, 'Order', 'updated', 'App\\Models\\Order', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-16T22:45:55.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-16 22:45:55', '2026-08-16 22:45:55'),
(250, 'Expense', 'created', 'App\\Models\\Expense', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"expense_category_id\":4,\"user_id\":1,\"amount\":\"10000.00\",\"description\":\"j\",\"payment_method\":\"cash\",\"spent_at\":\"2026-08-16T00:00:00.000000Z\",\"attachment\":null,\"reference_type\":null,\"reference_id\":null}}', '[]', '2026-08-16 22:46:33', '2026-08-16 22:46:33'),
(251, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"4.000\",\"cost_per_unit\":\"4000.0000\"},\"old\":{\"reorder_level\":\"2.000\",\"cost_per_unit\":\"3000.0000\"}}', '[]', '2026-08-16 22:56:07', '2026-08-16 22:56:07'),
(252, 'Item', 'updated', 'App\\Models\\Item', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"25000.00\"},\"old\":{\"price\":\"20000.00\"}}', '[]', '2026-08-16 22:58:40', '2026-08-16 22:58:40'),
(253, 'Item', 'updated', 'App\\Models\\Item', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"30000.00\"},\"old\":{\"price\":\"32000.00\"}}', '[]', '2026-08-16 23:01:01', '2026-08-16 23:01:01'),
(254, 'Item', 'updated', 'App\\Models\\Item', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"8000.00\"}}', '[]', '2026-08-16 23:01:55', '2026-08-16 23:01:55'),
(255, 'Item', 'updated', 'App\\Models\\Item', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"8000.00\"}}', '[]', '2026-08-16 23:05:10', '2026-08-16 23:05:10'),
(256, 'Item', 'updated', 'App\\Models\\Item', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"8000.00\"},\"old\":{\"price\":\"12000.00\"}}', '[]', '2026-08-16 23:06:31', '2026-08-16 23:06:31'),
(257, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"2.000\"},\"old\":{\"reorder_level\":\"3.000\"}}', '[]', '2026-08-16 23:39:19', '2026-08-16 23:39:19'),
(258, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"1.000\"},\"old\":{\"reorder_level\":\"10.000\"}}', '[]', '2026-08-16 23:41:44', '2026-08-16 23:41:44'),
(259, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"1.000\"},\"old\":{\"reorder_level\":\"2.000\"}}', '[]', '2026-08-16 23:42:01', '2026-08-16 23:42:01'),
(260, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"1.000\"},\"old\":{\"reorder_level\":\"2.000\"}}', '[]', '2026-08-16 23:42:28', '2026-08-16 23:42:28'),
(261, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"0.500\"},\"old\":{\"reorder_level\":\"2.000\"}}', '[]', '2026-08-16 23:43:11', '2026-08-16 23:43:11'),
(262, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"1.500\"},\"old\":{\"reorder_level\":\"2.000\"}}', '[]', '2026-08-16 23:43:59', '2026-08-16 23:43:59'),
(263, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"0.500\"},\"old\":{\"reorder_level\":\"1.000\"}}', '[]', '2026-08-16 23:44:36', '2026-08-16 23:44:36'),
(264, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"0.500\"},\"old\":{\"reorder_level\":\"1.000\"}}', '[]', '2026-08-16 23:44:47', '2026-08-16 23:44:47'),
(265, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 33, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"0.500\"},\"old\":{\"reorder_level\":\"1.000\"}}', '[]', '2026-08-16 23:45:03', '2026-08-16 23:45:03'),
(266, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"3.000\"},\"old\":{\"reorder_level\":\"5.000\"}}', '[]', '2026-08-16 23:45:53', '2026-08-16 23:45:53'),
(267, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"0.500\"},\"old\":{\"reorder_level\":\"2.000\"}}', '[]', '2026-08-16 23:46:37', '2026-08-16 23:46:37'),
(268, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 35, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"reorder_level\":\"0.500\"},\"old\":{\"reorder_level\":\"1.000\"}}', '[]', '2026-08-16 23:46:51', '2026-08-16 23:46:51'),
(269, 'Ingredient', 'created', 'App\\Models\\Ingredient', 38, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u0627\\u0643\\u0627\\u0648\",\"unit_id\":3,\"current_stock\":\"1.000\",\"reorder_level\":\"0.500\",\"cost_per_unit\":\"200000.0000\",\"is_active\":true}}', '[]', '2026-08-16 23:57:39', '2026-08-16 23:57:39'),
(270, 'Item', 'created', 'App\\Models\\Item', 32, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0647\\u0648\\u062a \\u062c\\u0648\\u0643\\u0644\\u064a\\u062a\",\"sku\":null,\"price\":\"12000.00\",\"manual_cost\":null,\"description\":\"\\u0634\\u0648\\u0643\\u0648\\u0644\\u0627 \\u0633\\u0627\\u062e\\u0646\\u0629\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-16 23:59:03', '2026-08-16 23:59:03'),
(271, 'Ingredient', 'created', 'App\\Models\\Ingredient', 39, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062c\\u0632\\u0631\",\"unit_id\":3,\"current_stock\":\"3.000\",\"reorder_level\":\"1.000\",\"cost_per_unit\":\"15000.0000\",\"is_active\":true}}', '[]', '2026-08-17 23:26:00', '2026-08-17 23:26:00'),
(272, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2.000\",\"reorder_level\":\"1.500\",\"cost_per_unit\":\"67000.0000\"},\"old\":{\"current_stock\":\"4.000\",\"reorder_level\":\"2.000\",\"cost_per_unit\":\"135000.0000\"}}', '[]', '2026-08-17 23:29:10', '2026-08-17 23:29:10'),
(273, 'Ingredient', 'created', 'App\\Models\\Ingredient', 40, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0639\\u0633\\u0644 \\u0644\\u0648\\u0641\",\"unit_id\":3,\"current_stock\":\"1.000\",\"reorder_level\":\"0.250\",\"cost_per_unit\":\"480000.0000\",\"is_active\":true}}', '[]', '2026-08-17 23:35:57', '2026-08-17 23:35:57'),
(274, 'Ingredient', 'created', 'App\\Models\\Ingredient', 41, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0639\\u0633\\u0644 \\u0634\\u0643\\u0644\\u0633\",\"unit_id\":3,\"current_stock\":\"1.000\",\"reorder_level\":\"0.250\",\"cost_per_unit\":\"480000.0000\",\"is_active\":true}}', '[]', '2026-08-17 23:36:41', '2026-08-17 23:36:41'),
(275, 'Ingredient', 'created', 'App\\Models\\Ingredient', 42, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0639\\u0633\\u0644 \\u0628\\u0648\\u0644\\u0648\",\"unit_id\":3,\"current_stock\":\"1.000\",\"reorder_level\":\"0.250\",\"cost_per_unit\":\"480000.0000\",\"is_active\":true}}', '[]', '2026-08-17 23:37:06', '2026-08-17 23:37:06'),
(276, 'Ingredient', 'created', 'App\\Models\\Ingredient', 43, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0639\\u0633\\u0644 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 - \\u0645\\u0632\\u0627\\u064a\\u0627\",\"unit_id\":3,\"current_stock\":\"1.000\",\"reorder_level\":\"0.250\",\"cost_per_unit\":\"480000.0000\",\"is_active\":true}}', '[]', '2026-08-17 23:37:39', '2026-08-17 23:37:39'),
(277, 'Ingredient', 'created', 'App\\Models\\Ingredient', 44, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0639\\u0633\\u0644 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 - \\u0641\\u0627\\u062e\\u0631\",\"unit_id\":3,\"current_stock\":\"1.000\",\"reorder_level\":\"0.250\",\"cost_per_unit\":\"480000.0000\",\"is_active\":true}}', '[]', '2026-08-17 23:38:03', '2026-08-17 23:38:03'),
(278, 'Ingredient', 'created', 'App\\Models\\Ingredient', 45, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 - \\u0646\\u062e\\u0644\\u0629\",\"unit_id\":1,\"current_stock\":\"1.000\",\"reorder_level\":\"0.250\",\"cost_per_unit\":\"480000.0000\",\"is_active\":true}}', '[]', '2026-08-17 23:38:52', '2026-08-17 23:38:52'),
(279, 'Ingredient', 'created', 'App\\Models\\Ingredient', 46, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0639\\u0633\\u0644 \\u0639\\u0644\\u0643 \\u0648\\u0646\\u0639\\u0646\\u0627\\u0639\",\"unit_id\":3,\"current_stock\":\"1.000\",\"reorder_level\":\"0.250\",\"cost_per_unit\":\"480000.0000\",\"is_active\":true}}', '[]', '2026-08-17 23:39:37', '2026-08-17 23:39:37'),
(280, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 42, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"500000.0000\"},\"old\":{\"cost_per_unit\":\"480000.0000\"}}', '[]', '2026-08-17 23:41:10', '2026-08-17 23:41:10'),
(281, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 40, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"500000.0000\"},\"old\":{\"cost_per_unit\":\"480000.0000\"}}', '[]', '2026-08-17 23:41:25', '2026-08-17 23:41:25'),
(282, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 46, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"500000.0000\"},\"old\":{\"cost_per_unit\":\"480000.0000\"}}', '[]', '2026-08-17 23:41:34', '2026-08-17 23:41:34'),
(283, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 44, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"500000.0000\"},\"old\":{\"cost_per_unit\":\"480000.0000\"}}', '[]', '2026-08-17 23:41:52', '2026-08-17 23:41:52'),
(284, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"500000.0000\"},\"old\":{\"cost_per_unit\":\"480000.0000\"}}', '[]', '2026-08-17 23:42:03', '2026-08-17 23:42:03'),
(285, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 41, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost_per_unit\":\"500000.0000\"},\"old\":{\"cost_per_unit\":\"480000.0000\"}}', '[]', '2026-08-17 23:42:12', '2026-08-17 23:42:12'),
(286, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0639\\u0633\\u0644 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 - \\u0646\\u062e\\u0644\\u0629\",\"cost_per_unit\":\"500000.0000\"},\"old\":{\"name\":\"\\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 - \\u0646\\u062e\\u0644\\u0629\",\"cost_per_unit\":\"480000.0000\"}}', '[]', '2026-08-17 23:42:47', '2026-08-17 23:42:47'),
(287, 'Item', 'created', 'App\\Models\\Item', 33, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0627\\u0628\\u0631\\u064a\\u0642 \\u0634\\u0627\\u064a\",\"sku\":null,\"price\":\"30000.00\",\"manual_cost\":null,\"description\":\"\\u0627\\u0628\\u0631\\u064a\\u0642 \\u0634\\u0627\\u064a\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-17 23:45:15', '2026-08-17 23:45:15'),
(288, 'Item', 'created', 'App\\Models\\Item', 34, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":9,\"name\":\"\\u0627\\u0631\\u0643\\u064a\\u0644\\u0629 \\u0644\\u0648\\u0641\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u0639\\u0645 \\u0644\\u0648\\u0641\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-17 23:49:15', '2026-08-17 23:49:15'),
(289, 'Item', 'created', 'App\\Models\\Item', 35, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":9,\"name\":\"\\u0627\\u0631\\u0643\\u064a\\u0644\\u0629 \\u0634\\u0643\\u0644\\u0633\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u0639\\u0645 \\u0639\\u0644\\u0643\\u0629 \\u0634\\u0643\\u0644\\u0633\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-17 23:50:13', '2026-08-17 23:50:13'),
(290, 'Item', 'created', 'App\\Models\\Item', 36, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":9,\"name\":\"\\u0627\\u0631\\u0643\\u064a\\u0644\\u0629 \\u0628\\u0648\\u0644\\u0648\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u0639\\u0645 \\u0627\\u0644\\u0628\\u0648\\u0644\\u0648\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-17 23:50:44', '2026-08-17 23:50:44'),
(291, 'Item', 'created', 'App\\Models\\Item', 37, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":9,\"name\":\"\\u0627\\u0631\\u0643\\u064a\\u0644\\u0629 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 - \\u0645\\u0632\\u0627\\u064a\\u0627\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u0639\\u0645 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 \\u0645\\u0632\\u0627\\u064a\\u0627\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-17 23:52:02', '2026-08-17 23:52:02'),
(292, 'Item', 'created', 'App\\Models\\Item', 38, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":9,\"name\":\"\\u0627\\u0631\\u0643\\u064a\\u0644\\u0629 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 - \\u0641\\u0627\\u062e\\u0631\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u0639\\u0645 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 \\u0641\\u0627\\u062e\\u0631\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-17 23:52:28', '2026-08-17 23:52:28'),
(293, 'Item', 'created', 'App\\Models\\Item', 39, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":9,\"name\":\"\\u0627\\u0631\\u0643\\u064a\\u0644\\u0629 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 - \\u0646\\u062e\\u0644\\u0629\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u0639\\u0645 \\u062a\\u0641\\u0627\\u062d\\u062a\\u064a\\u0646 \\u0646\\u062e\\u0644\\u0629\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-17 23:53:09', '2026-08-17 23:53:09'),
(294, 'Item', 'created', 'App\\Models\\Item', 40, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":9,\"name\":\"\\u0627\\u0631\\u0643\\u064a\\u0644\\u0629 \\u0639\\u0644\\u0643 \\u0648\\u0646\\u0639\\u0646\\u0627\\u0639\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0637\\u0639\\u0645 \\u0639\\u0644\\u0643 \\u0648\\u0646\\u0639\\u0646\\u0627\\u0639\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-17 23:53:36', '2026-08-17 23:53:36'),
(295, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"unit_id\":3},\"old\":{\"unit_id\":1}}', '[]', '2026-08-17 23:53:52', '2026-08-17 23:53:52'),
(296, 'Ingredient', 'deleted', 'App\\Models\\Ingredient', 2, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"test\",\"unit_id\":1,\"current_stock\":\"0.000\",\"reorder_level\":\"0.003\",\"cost_per_unit\":\"0.0000\",\"is_active\":false}}', '[]', '2026-08-17 23:54:04', '2026-08-17 23:54:04'),
(297, 'Ingredient', 'deleted', 'App\\Models\\Ingredient', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"name\":\"test\",\"unit_id\":1,\"current_stock\":\"0.000\",\"reorder_level\":\"0.000\",\"cost_per_unit\":\"11.0000\",\"is_active\":false}}', '[]', '2026-08-17 23:54:14', '2026-08-17 23:54:14'),
(298, 'Ingredient', 'created', 'App\\Models\\Ingredient', 47, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0627\\u0621\",\"unit_id\":2,\"current_stock\":\"50.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"1500.0000\",\"is_active\":true}}', '[]', '2026-08-18 00:08:11', '2026-08-18 00:08:11'),
(299, 'Item', 'created', 'App\\Models\\Item', 41, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0645\\u0627\\u0621\",\"sku\":null,\"price\":\"3000.00\",\"manual_cost\":null,\"description\":\"\\u0645\\u0627\\u0621\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 00:08:46', '2026-08-18 00:08:46'),
(300, 'Item', 'created', 'App\\Models\\Item', 42, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0628\\u0648\\u0644\\u0648\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0644\\u064a\\u0645\\u0648\\u0646 \\u0648\\u0646\\u0639\\u0646\\u0627\\u0639\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 00:16:08', '2026-08-18 00:16:08'),
(301, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0635\\u0648\\u062f\\u0627 \\u0644\\u064a\\u0645\\u0648\\u0646\",\"cost_per_unit\":\"5000.0000\"},\"old\":{\"name\":\"\\u0633\\u0648\\u062f\\u0627\",\"cost_per_unit\":\"7000.0000\"}}', '[]', '2026-08-18 10:06:33', '2026-08-18 10:06:33'),
(302, 'Ingredient', 'created', 'App\\Models\\Ingredient', 48, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0635\\u0648\\u062f\\u0627 \\u0633\\u0627\\u062f\\u0629\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"12.000\",\"cost_per_unit\":\"5000.0000\",\"is_active\":true}}', '[]', '2026-08-18 10:06:51', '2026-08-18 10:06:51'),
(303, 'Ingredient', 'created', 'App\\Models\\Ingredient', 49, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0628\\u0627\\u064a\\u0633\\u0648\\u0646\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"12.000\",\"cost_per_unit\":\"6000.0000\",\"is_active\":true}}', '[]', '2026-08-18 10:07:14', '2026-08-18 10:07:14'),
(304, 'Ingredient', 'created', 'App\\Models\\Ingredient', 50, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u0645\\u0648\\u0646 \\u0648\\u0644\\u064a\\u0645\\u0648\\u0646 \\u0638\\u0631\\u0641\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"2500.0000\",\"is_active\":true}}', '[]', '2026-08-18 10:07:41', '2026-08-18 10:07:41'),
(305, 'Ingredient', 'created', 'App\\Models\\Ingredient', 51, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644 \\u0648\\u0639\\u0633\\u0644 \\u0638\\u0631\\u0641\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"12.000\",\"cost_per_unit\":\"2500.0000\",\"is_active\":true}}', '[]', '2026-08-18 10:08:43', '2026-08-18 10:08:43'),
(306, 'Ingredient', 'created', 'App\\Models\\Ingredient', 52, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644 \\u0648\\u0644\\u064a\\u0645\\u0648\\u0646 \\u0638\\u0631\\u0641\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"12.000\",\"cost_per_unit\":\"2500.0000\",\"is_active\":true}}', '[]', '2026-08-18 10:09:08', '2026-08-18 10:09:08'),
(307, 'Ingredient', 'created', 'App\\Models\\Ingredient', 53, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0632\\u0647\\u0648\\u0631\\u0627\\u062a \\u0638\\u0631\\u0641\",\"unit_id\":2,\"current_stock\":\"30.000\",\"reorder_level\":\"12.000\",\"cost_per_unit\":\"2500.0000\",\"is_active\":true}}', '[]', '2026-08-18 10:09:30', '2026-08-18 10:09:30'),
(308, 'Item', 'created', 'App\\Models\\Item', 43, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0628\\u0627\\u064a\\u0633\\u0648\\u0646\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0627\\u064a\\u0633\\u0648\\u0646 \\u0628\\u0627\\u0631\\u062f\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 10:11:32', '2026-08-18 10:11:32'),
(309, 'Item', 'created', 'App\\Models\\Item', 44, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0645\\u0643\\u0633\\u064a\\u0643\\u064a\",\"sku\":null,\"price\":\"25000.00\",\"manual_cost\":null,\"description\":\"\\u0645\\u0643\\u0633\\u064a\\u0643\\u064a\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 10:13:18', '2026-08-18 10:13:18'),
(310, 'Item', 'created', 'App\\Models\\Item', 45, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0635\\u0648\\u062f\\u0627 \\u0633\\u0627\\u062f\\u0629\",\"sku\":null,\"price\":\"8000.00\",\"manual_cost\":null,\"description\":\"\\u0635\\u0648\\u062f\\u0627 \\u0633\\u0627\\u062f\\u0629\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 10:17:33', '2026-08-18 10:17:33'),
(311, 'Item', 'created', 'App\\Models\\Item', 46, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0635\\u0648\\u062f\\u0627 \\u0644\\u064a\\u0645\\u0648\\u0646\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0635\\u0648\\u062f\\u0627 \\u0644\\u064a\\u0645\\u0648\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 10:19:58', '2026-08-18 10:19:58'),
(312, 'Item', 'created', 'App\\Models\\Item', 47, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0643\\u0645\\u0648\\u0646 \\u0648\\u0644\\u064a\\u0645\\u0648\\u0646\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0643\\u0645\\u0648\\u0646 \\u0648\\u0644\\u064a\\u0645\\u0648\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 13:40:13', '2026-08-18 13:40:13'),
(313, 'Item', 'created', 'App\\Models\\Item', 48, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644 \\u0648\\u0639\\u0633\\u0644\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644 \\u0648\\u0639\\u0633\\u0644\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 13:40:56', '2026-08-18 13:40:56'),
(314, 'Item', 'created', 'App\\Models\\Item', 49, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644 \\u0648\\u0644\\u064a\\u0645\\u0648\\u0646\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0632\\u0646\\u062c\\u0628\\u064a\\u0644 \\u0648\\u0644\\u064a\\u0645\\u0648\\u0646\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 13:41:51', '2026-08-18 13:41:51'),
(315, 'Item', 'created', 'App\\Models\\Item', 50, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":7,\"name\":\"\\u0632\\u0647\\u0648\\u0631\\u0627\\u062a\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0632\\u0647\\u0648\\u0631\\u0627\\u062a\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-18 13:42:50', '2026-08-18 13:42:50'),
(316, 'Order', 'created', 'App\\Models\\Order', 17, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260819-0001\",\"invoice_number\":\"CU-20260819-3DF7A0\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(317, 'Order', 'updated', 'App\\Models\\Order', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"30000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"30000.00\",\"cost_total\":\"6750.00\",\"profit\":\"23250.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(318, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 9, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"748.000\"},\"old\":{\"current_stock\":\"749.000\"}}', '[]', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(319, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 11, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1997.000\"},\"old\":{\"current_stock\":\"1998.000\"}}', '[]', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(320, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"58.500\"},\"old\":{\"current_stock\":\"58.800\"}}', '[]', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(321, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 15, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"21.870\"},\"old\":{\"current_stock\":\"21.900\"}}', '[]', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(322, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.425\"},\"old\":{\"current_stock\":\"3.440\"}}', '[]', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(323, 'Order', 'updated', 'App\\Models\\Order', 17, 'updated', 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-19T15:48:49.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-19 15:48:49', '2026-08-19 15:48:49'),
(324, 'Order', 'updated', 'App\\Models\\Order', 17, 'updated', 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-19T15:48:53.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-19 15:48:53', '2026-08-19 15:48:53'),
(325, 'Order', 'updated', 'App\\Models\\Order', 17, 'updated', 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-19T15:48:58.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-19 15:48:58', '2026-08-19 15:48:58'),
(326, 'Order', 'created', 'App\\Models\\Order', 18, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260819-0002\",\"invoice_number\":\"CU-20260819-F10CDF\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-19 16:15:27', '2026-08-19 16:15:27'),
(327, 'Order', 'updated', 'App\\Models\\Order', 18, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"25000.00\",\"cost_total\":\"7000.00\",\"profit\":\"18000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-19 16:15:27', '2026-08-19 16:15:27'),
(328, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 40, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.986\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-19 16:15:27', '2026-08-19 16:15:27'),
(329, 'Order', 'updated', 'App\\Models\\Order', 18, 'updated', 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-19T16:15:58.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-19 16:15:58', '2026-08-19 16:15:58'),
(330, 'Order', 'updated', 'App\\Models\\Order', 18, 'updated', 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-19T16:18:54.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-19 16:18:54', '2026-08-19 16:18:54'),
(331, 'Order', 'created', 'App\\Models\\Order', 19, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260819-0003\",\"invoice_number\":\"CU-20260819-125579\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-19 16:20:01', '2026-08-19 16:20:01'),
(332, 'Order', 'updated', 'App\\Models\\Order', 19, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"25000.00\",\"cost_total\":\"7000.00\",\"profit\":\"18000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-19 16:20:01', '2026-08-19 16:20:01'),
(333, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 40, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.972\"},\"old\":{\"current_stock\":\"0.986\"}}', '[]', '2026-08-19 16:20:01', '2026-08-19 16:20:01');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `attribute_changes`, `properties`, `created_at`, `updated_at`) VALUES
(334, 'Order', 'created', 'App\\Models\\Order', 20, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260819-0004\",\"invoice_number\":\"CU-20260819-585D0E\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(335, 'Order', 'updated', 'App\\Models\\Order', 20, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"30000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"30000.00\",\"cost_total\":\"6350.00\",\"profit\":\"23650.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(336, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"998.000\"},\"old\":{\"current_stock\":\"999.000\"}}', '[]', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(337, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2499.000\"},\"old\":{\"current_stock\":\"2500.000\"}}', '[]', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(338, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"58.250\"},\"old\":{\"current_stock\":\"58.500\"}}', '[]', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(339, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.900\"},\"old\":{\"current_stock\":\"4.000\"}}', '[]', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(340, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"29.500\"},\"old\":{\"current_stock\":\"30.000\"}}', '[]', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(341, 'Order', 'created', 'App\\Models\\Order', 21, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260819-0005\",\"invoice_number\":\"CU-20260819-8CBB68\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(342, 'Order', 'updated', 'App\\Models\\Order', 21, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"30000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"30000.00\",\"cost_total\":\"6350.00\",\"profit\":\"23650.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(343, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"997.000\"},\"old\":{\"current_stock\":\"998.000\"}}', '[]', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(344, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2498.000\"},\"old\":{\"current_stock\":\"2499.000\"}}', '[]', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(345, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"58.000\"},\"old\":{\"current_stock\":\"58.250\"}}', '[]', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(346, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.800\"},\"old\":{\"current_stock\":\"3.900\"}}', '[]', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(347, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"29.000\"},\"old\":{\"current_stock\":\"29.500\"}}', '[]', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(348, 'Order', 'created', 'App\\Models\\Order', 22, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260819-0006\",\"invoice_number\":\"CU-20260819-F724C7\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-19 16:46:07', '2026-08-19 16:46:07'),
(349, 'Order', 'updated', 'App\\Models\\Order', 22, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"12000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"12000.00\",\"cost_total\":\"5700.00\",\"profit\":\"6300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-19 16:46:07', '2026-08-19 16:46:07'),
(350, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2824.000\"},\"old\":{\"current_stock\":\"2825.000\"}}', '[]', '2026-08-19 16:46:07', '2026-08-19 16:46:07'),
(351, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 38, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.980\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-19 16:46:07', '2026-08-19 16:46:07'),
(352, 'Order', 'created', 'App\\Models\\Order', 23, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260819-0007\",\"invoice_number\":\"CU-20260819-2D7DE5\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-19 16:54:58', '2026-08-19 16:54:58'),
(353, 'Order', 'updated', 'App\\Models\\Order', 23, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"25000.00\",\"cost_total\":\"7000.00\",\"profit\":\"18000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-19 16:54:58', '2026-08-19 16:54:58'),
(354, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 40, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.958\"},\"old\":{\"current_stock\":\"0.972\"}}', '[]', '2026-08-19 16:54:58', '2026-08-19 16:54:58'),
(355, 'Order', 'created', 'App\\Models\\Order', 24, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260821-0001\",\"invoice_number\":\"CU-20260821-366D03\",\"user_id\":1,\"shift_id\":null,\"table_id\":14,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-21 15:03:15', '2026-08-21 15:03:15'),
(356, 'Order', 'updated', 'App\\Models\\Order', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"16000.00\",\"item_discount_total\":\"6000.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"6000.00\",\"total\":\"10000.00\",\"cost_total\":\"7250.00\",\"profit\":\"2750.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-21 15:03:15', '2026-08-21 15:03:15'),
(357, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"48.000\"},\"old\":{\"current_stock\":\"50.000\"}}', '[]', '2026-08-21 15:03:15', '2026-08-21 15:03:15'),
(358, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"4998.000\"},\"old\":{\"current_stock\":\"4999.000\"}}', '[]', '2026-08-21 15:03:15', '2026-08-21 15:03:15'),
(359, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.985\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-21 15:03:15', '2026-08-21 15:03:15'),
(360, 'Order', 'updated', 'App\\Models\\Order', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-21T15:04:49.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-21 15:04:49', '2026-08-21 15:04:49'),
(361, 'Order', 'updated', 'App\\Models\\Order', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-21T15:05:06.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-21 15:05:06', '2026-08-21 15:05:06'),
(362, 'Order', 'updated', 'App\\Models\\Order', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-21T15:05:23.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-21 15:05:23', '2026-08-21 15:05:23'),
(363, 'Order', 'updated', 'App\\Models\\Order', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-21T15:16:45.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-21 15:16:45', '2026-08-21 15:16:45'),
(364, 'Order', 'updated', 'App\\Models\\Order', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-21T15:16:45.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-21 15:16:45', '2026-08-21 15:16:45'),
(365, 'Order', 'updated', 'App\\Models\\Order', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-21T15:16:46.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-21 15:16:46', '2026-08-21 15:16:46'),
(366, 'Order', 'updated', 'App\\Models\\Order', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-21T15:16:46.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-21 15:16:46', '2026-08-21 15:16:46'),
(367, 'Order', 'updated', 'App\\Models\\Order', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-21T15:16:46.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-21 15:16:46', '2026-08-21 15:16:46'),
(368, 'Order', 'updated', 'App\\Models\\Order', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-21T15:16:47.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-21 15:16:47', '2026-08-21 15:16:47'),
(369, 'Order', 'updated', 'App\\Models\\Order', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-21T15:16:47.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-21 15:16:47', '2026-08-21 15:16:47'),
(370, 'Order', 'updated', 'App\\Models\\Order', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-21T15:16:47.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-21 15:16:47', '2026-08-21 15:16:47'),
(371, 'Order', 'updated', 'App\\Models\\Order', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-21T15:16:47.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-21 15:16:47', '2026-08-21 15:16:47'),
(372, 'Order', 'updated', 'App\\Models\\Order', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-21T15:16:48.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-21 15:16:48', '2026-08-21 15:16:48'),
(373, 'Order', 'updated', 'App\\Models\\Order', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-21T15:16:49.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-21 15:16:49', '2026-08-21 15:16:49'),
(374, 'Order', 'updated', 'App\\Models\\Order', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-21T15:16:49.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-21 15:16:49', '2026-08-21 15:16:49'),
(375, 'Order', 'updated', 'App\\Models\\Order', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-21T15:16:49.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-21 15:16:49', '2026-08-21 15:16:49'),
(376, 'Order', 'updated', 'App\\Models\\Order', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-21T15:16:49.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-21 15:16:49', '2026-08-21 15:16:49'),
(377, 'Order', 'updated', 'App\\Models\\Order', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-21T15:16:49.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-21 15:16:49', '2026-08-21 15:16:49'),
(378, 'Order', 'updated', 'App\\Models\\Order', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-21T15:16:49.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-21 15:16:49', '2026-08-21 15:16:49'),
(379, 'Order', 'created', 'App\\Models\\Order', 25, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260821-0001\",\"invoice_number\":\"CU-20260821-8138D2\",\"user_id\":1,\"shift_id\":null,\"table_id\":7,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(380, 'Order', 'updated', 'App\\Models\\Order', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"70000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"70000.00\",\"cost_total\":\"18200.00\",\"profit\":\"51800.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(381, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2994.000\"},\"old\":{\"current_stock\":\"2996.000\"}}', '[]', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(382, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"57.400\"},\"old\":{\"current_stock\":\"58.000\"}}', '[]', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(383, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.395\"},\"old\":{\"current_stock\":\"3.425\"}}', '[]', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(384, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.850\"},\"old\":{\"current_stock\":\"3.950\"}}', '[]', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(385, 'Order', 'created', 'App\\Models\\Order', 26, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260821-0002\",\"invoice_number\":\"CU-20260821-A676D1\",\"user_id\":1,\"shift_id\":null,\"table_id\":11,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(386, 'Order', 'updated', 'App\\Models\\Order', 26, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"40000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"40000.00\",\"cost_total\":\"10200.00\",\"profit\":\"29800.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(387, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2992.000\"},\"old\":{\"current_stock\":\"2994.000\"}}', '[]', '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(388, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"56.800\"},\"old\":{\"current_stock\":\"57.400\"}}', '[]', '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(389, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.365\"},\"old\":{\"current_stock\":\"3.395\"}}', '[]', '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(390, 'Order', 'updated', 'App\\Models\\Order', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"135000.00\",\"total\":\"135000.00\",\"cost_total\":\"39100.00\",\"profit\":\"95900.00\"},\"old\":{\"subtotal\":\"70000.00\",\"total\":\"70000.00\",\"cost_total\":\"18200.00\",\"profit\":\"51800.00\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(391, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"996.000\"},\"old\":{\"current_stock\":\"997.000\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(392, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2497.000\"},\"old\":{\"current_stock\":\"2498.000\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(393, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.600\"},\"old\":{\"current_stock\":\"3.800\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(394, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 39, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2.950\"},\"old\":{\"current_stock\":\"3.000\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(395, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"29.000\"},\"old\":{\"current_stock\":\"30.000\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(396, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"995.000\"},\"old\":{\"current_stock\":\"996.000\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(397, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2496.000\"},\"old\":{\"current_stock\":\"2497.000\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(398, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"56.550\"},\"old\":{\"current_stock\":\"56.800\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(399, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.500\"},\"old\":{\"current_stock\":\"3.600\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(400, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"28.500\"},\"old\":{\"current_stock\":\"29.000\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(401, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"4997.000\"},\"old\":{\"current_stock\":\"4998.000\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(402, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.970\"},\"old\":{\"current_stock\":\"0.985\"}}', '[]', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(403, 'Order', 'created', 'App\\Models\\Order', 27, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260821-0003\",\"invoice_number\":\"CU-20260821-9EB17D\",\"user_id\":1,\"shift_id\":null,\"table_id\":16,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-21 17:28:25', '2026-08-21 17:28:25'),
(404, 'Order', 'updated', 'App\\Models\\Order', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"50000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"50000.00\",\"cost_total\":\"14000.00\",\"profit\":\"36000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-21 17:28:25', '2026-08-21 17:28:25'),
(405, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.972\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-21 17:28:25', '2026-08-21 17:28:25'),
(406, 'Order', 'updated', 'App\\Models\\Order', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"75000.00\",\"total\":\"75000.00\",\"cost_total\":\"21000.00\",\"profit\":\"54000.00\"},\"old\":{\"subtotal\":\"50000.00\",\"total\":\"50000.00\",\"cost_total\":\"14000.00\",\"profit\":\"36000.00\"}}', '[]', '2026-08-21 17:28:32', '2026-08-21 17:28:32'),
(407, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"0.986\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-21 17:28:32', '2026-08-21 17:28:32'),
(408, 'Order', 'updated', 'App\\Models\\Order', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"is_paid\":true,\"delivered_at\":\"2026-08-21T17:34:23.000000Z\"},\"old\":{\"status\":\"new\",\"is_paid\":false,\"delivered_at\":null}}', '[]', '2026-08-21 17:34:23', '2026-08-21 17:34:23'),
(409, 'Order', 'updated', 'App\\Models\\Order', 26, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"is_paid\":true,\"delivered_at\":\"2026-08-21T17:35:01.000000Z\"},\"old\":{\"status\":\"new\",\"is_paid\":false,\"delivered_at\":null}}', '[]', '2026-08-21 17:35:01', '2026-08-21 17:35:01'),
(410, 'Order', 'updated', 'App\\Models\\Order', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"is_paid\":true,\"delivered_at\":\"2026-08-21T17:35:43.000000Z\"},\"old\":{\"status\":\"new\",\"is_paid\":false,\"delivered_at\":null}}', '[]', '2026-08-21 17:35:43', '2026-08-21 17:35:43'),
(411, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"1.000\"},\"old\":{\"current_stock\":\"0.972\"}}', '[]', '2026-08-21 17:36:11', '2026-08-21 17:36:11'),
(412, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"1.000\"},\"old\":{\"current_stock\":\"0.986\"}}', '[]', '2026-08-21 17:36:11', '2026-08-21 17:36:11'),
(413, 'Order', 'updated', 'App\\Models\\Order', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"cancelled\",\"is_paid\":false,\"cancelled_at\":\"2026-08-21T17:36:11.000000Z\"},\"old\":{\"status\":\"delivered\",\"is_paid\":true,\"cancelled_at\":null}}', '[]', '2026-08-21 17:36:11', '2026-08-21 17:36:11'),
(414, 'Order', 'created', 'App\\Models\\Order', 28, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0001\",\"invoice_number\":\"CU-20260822-8A4A75\",\"user_id\":2,\"shift_id\":null,\"table_id\":6,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 05:42:48', '2026-08-22 05:42:48'),
(415, 'Order', 'updated', 'App\\Models\\Order', 28, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"10000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"10000.00\",\"cost_total\":\"4250.00\",\"profit\":\"5750.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 05:42:48', '2026-08-22 05:42:48'),
(416, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4996.000\"},\"old\":{\"current_stock\":\"4997.000\"}}', '[]', '2026-08-22 05:42:48', '2026-08-22 05:42:48'),
(417, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 24, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.955\"},\"old\":{\"current_stock\":\"0.970\"}}', '[]', '2026-08-22 05:42:48', '2026-08-22 05:42:48'),
(418, 'Order', 'updated', 'App\\Models\\Order', 28, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"status\":\"delivered\",\"is_paid\":true,\"delivered_at\":\"2026-08-22T05:52:49.000000Z\"},\"old\":{\"status\":\"new\",\"is_paid\":false,\"delivered_at\":null}}', '[]', '2026-08-22 05:52:49', '2026-08-22 05:52:49'),
(419, 'Order', 'created', 'App\\Models\\Order', 29, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0002\",\"invoice_number\":\"CU-20260822-100EAA\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(420, 'Order', 'updated', 'App\\Models\\Order', 29, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"30000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"30000.00\",\"cost_total\":\"8100.00\",\"profit\":\"21900.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(421, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2991.000\"},\"old\":{\"current_stock\":\"2992.000\"}}', '[]', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(422, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"56.250\"},\"old\":{\"current_stock\":\"56.550\"}}', '[]', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(423, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 15, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"21.820\"},\"old\":{\"current_stock\":\"21.870\"}}', '[]', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(424, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.350\"},\"old\":{\"current_stock\":\"3.365\"}}', '[]', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(425, 'Shift', 'created', 'App\\Models\\Shift', 2, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"user_id\":2,\"opened_at\":\"2026-08-22T05:55:46.000000Z\",\"closed_at\":null,\"opening_cash\":\"127.00\",\"closing_cash\":null,\"expected_cash\":null,\"difference\":null,\"total_sales\":\"0.00\",\"total_orders\":0,\"status\":\"open\",\"notes\":null}}', '[]', '2026-08-22 05:55:46', '2026-08-22 05:55:46'),
(426, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2992.000\"},\"old\":{\"current_stock\":\"2991.000\"}}', '[]', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(427, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"56.550\"},\"old\":{\"current_stock\":\"56.250\"}}', '[]', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(428, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 15, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"21.870\"},\"old\":{\"current_stock\":\"21.820\"}}', '[]', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(429, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.365\"},\"old\":{\"current_stock\":\"3.350\"}}', '[]', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(430, 'Order', 'updated', 'App\\Models\\Order', 29, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"status\":\"cancelled\",\"is_paid\":false,\"cancelled_at\":\"2026-08-22T06:05:27.000000Z\"},\"old\":{\"status\":\"new\",\"is_paid\":true,\"cancelled_at\":null}}', '[]', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(431, 'Shift', 'updated', 'App\\Models\\Shift', 2, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"opened_at\":\"2026-08-22T06:07:46.000000Z\",\"closed_at\":\"2026-08-22T06:07:46.000000Z\",\"closing_cash\":\"35000000.00\",\"expected_cash\":\"127.00\",\"difference\":\"34999873.00\",\"status\":\"closed\"},\"old\":{\"opened_at\":\"2026-08-22T05:55:46.000000Z\",\"closed_at\":null,\"closing_cash\":null,\"expected_cash\":null,\"difference\":null,\"status\":\"open\"}}', '[]', '2026-08-22 06:07:46', '2026-08-22 06:07:46'),
(432, 'Order', 'created', 'App\\Models\\Order', 30, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0003\",\"invoice_number\":\"CU-20260822-09E49E\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(433, 'Order', 'updated', 'App\\Models\\Order', 30, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"5100.00\",\"profit\":\"14900.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(434, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2991.000\"},\"old\":{\"current_stock\":\"2992.000\"}}', '[]', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(435, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"56.250\"},\"old\":{\"current_stock\":\"56.550\"}}', '[]', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(436, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.350\"},\"old\":{\"current_stock\":\"3.365\"}}', '[]', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(437, 'Order', 'created', 'App\\Models\\Order', 31, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0004\",\"invoice_number\":\"CU-20260822-1A34DD\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(438, 'Order', 'updated', 'App\\Models\\Order', 31, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"4850.00\",\"profit\":\"15150.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(439, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"994.000\"},\"old\":{\"current_stock\":\"995.000\"}}', '[]', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(440, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 11, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1996.000\"},\"old\":{\"current_stock\":\"1997.000\"}}', '[]', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(441, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"55.950\"},\"old\":{\"current_stock\":\"56.250\"}}', '[]', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(442, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.335\"},\"old\":{\"current_stock\":\"3.350\"}}', '[]', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(443, 'Order', 'created', 'App\\Models\\Order', 32, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0005\",\"invoice_number\":\"CU-20260822-9D5D60\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(444, 'Order', 'updated', 'App\\Models\\Order', 32, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"4850.00\",\"profit\":\"15150.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(445, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"993.000\"},\"old\":{\"current_stock\":\"994.000\"}}', '[]', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(446, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 11, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1995.000\"},\"old\":{\"current_stock\":\"1996.000\"}}', '[]', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(447, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"55.650\"},\"old\":{\"current_stock\":\"55.950\"}}', '[]', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(448, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.320\"},\"old\":{\"current_stock\":\"3.335\"}}', '[]', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(449, 'Order', 'created', 'App\\Models\\Order', 33, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0006\",\"invoice_number\":\"CU-20260822-3C68C5\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 09:19:47', '2026-08-22 09:19:47'),
(450, 'Order', 'updated', 'App\\Models\\Order', 33, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"30000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"30000.00\",\"cost_total\":\"9600.00\",\"profit\":\"20400.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 09:19:47', '2026-08-22 09:19:47'),
(451, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4993.000\"},\"old\":{\"current_stock\":\"4996.000\"}}', '[]', '2026-08-22 09:19:47', '2026-08-22 09:19:47'),
(452, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.455\"},\"old\":{\"current_stock\":\"3.500\"}}', '[]', '2026-08-22 09:19:47', '2026-08-22 09:19:47'),
(453, 'Order', 'created', 'App\\Models\\Order', 34, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0007\",\"invoice_number\":\"CU-20260822-715E95\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 09:46:47', '2026-08-22 09:46:47'),
(454, 'Order', 'updated', 'App\\Models\\Order', 34, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"25000.00\",\"cost_total\":\"7000.00\",\"profit\":\"18000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 09:46:47', '2026-08-22 09:46:47'),
(455, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 43, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.986\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-22 09:46:47', '2026-08-22 09:46:47'),
(456, 'Order', 'created', 'App\\Models\\Order', 35, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0008\",\"invoice_number\":\"CU-20260822-90D73A\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 09:48:57', '2026-08-22 09:48:57'),
(457, 'Order', 'updated', 'App\\Models\\Order', 35, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_type\":\"percent\",\"discount_value\":\"5.00\",\"order_discount_amount\":\"1250.00\",\"discount_total\":\"1250.00\",\"total\":\"23750.00\",\"cost_total\":\"7000.00\",\"profit\":\"16750.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_type\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 09:48:57', '2026-08-22 09:48:57'),
(458, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 44, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.986\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-22 09:48:57', '2026-08-22 09:48:57'),
(459, 'Order', 'created', 'App\\Models\\Order', 36, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0009\",\"invoice_number\":\"CU-20260822-B0B227\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 09:50:03', '2026-08-22 09:50:03'),
(460, 'Order', 'updated', 'App\\Models\\Order', 36, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"50000.00\",\"item_discount_total\":\"0.00\",\"discount_type\":\"percent\",\"discount_value\":\"100.00\",\"order_discount_amount\":\"50000.00\",\"discount_total\":\"50000.00\",\"total\":\"0.00\",\"cost_total\":\"14000.00\",\"profit\":\"-14000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_type\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 09:50:03', '2026-08-22 09:50:03'),
(461, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.972\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-22 09:50:03', '2026-08-22 09:50:03'),
(462, 'Order', 'created', 'App\\Models\\Order', 37, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0010\",\"invoice_number\":\"CU-20260822-B8B17E\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 09:50:35', '2026-08-22 09:50:35'),
(463, 'Order', 'updated', 'App\\Models\\Order', 37, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_type\":\"percent\",\"discount_value\":\"100.00\",\"order_discount_amount\":\"25000.00\",\"discount_total\":\"25000.00\",\"total\":\"0.00\",\"cost_total\":\"7000.00\",\"profit\":\"-7000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_type\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 09:50:35', '2026-08-22 09:50:35'),
(464, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 44, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.972\"},\"old\":{\"current_stock\":\"0.986\"}}', '[]', '2026-08-22 09:50:35', '2026-08-22 09:50:35'),
(465, 'Order', 'created', 'App\\Models\\Order', 38, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0011\",\"invoice_number\":\"CU-20260822-0A3F8F\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 09:51:12', '2026-08-22 09:51:12'),
(466, 'Order', 'updated', 'App\\Models\\Order', 38, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_type\":\"percent\",\"discount_value\":\"100.00\",\"order_discount_amount\":\"25000.00\",\"discount_total\":\"25000.00\",\"total\":\"0.00\",\"cost_total\":\"7000.00\",\"profit\":\"-7000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_type\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 09:51:12', '2026-08-22 09:51:12'),
(467, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 44, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.958\"},\"old\":{\"current_stock\":\"0.972\"}}', '[]', '2026-08-22 09:51:12', '2026-08-22 09:51:12');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `attribute_changes`, `properties`, `created_at`, `updated_at`) VALUES
(468, 'Order', 'created', 'App\\Models\\Order', 39, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0012\",\"invoice_number\":\"CU-20260822-D4611A\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(469, 'Order', 'updated', 'App\\Models\\Order', 39, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"50000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"50000.00\",\"cost_total\":\"19200.00\",\"profit\":\"30800.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(470, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"991.000\"},\"old\":{\"current_stock\":\"993.000\"}}', '[]', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(471, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2494.000\"},\"old\":{\"current_stock\":\"2496.000\"}}', '[]', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(472, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.300\"},\"old\":{\"current_stock\":\"3.500\"}}', '[]', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(473, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 19, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1.500\"},\"old\":{\"current_stock\":\"2.000\"}}', '[]', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(474, 'Order', 'created', 'App\\Models\\Order', 40, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0013\",\"invoice_number\":\"CU-20260822-2B1C3D\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(475, 'Order', 'updated', 'App\\Models\\Order', 40, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"60000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"60000.00\",\"cost_total\":\"49450.00\",\"profit\":\"10550.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(476, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"989.000\"},\"old\":{\"current_stock\":\"991.000\"}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(477, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2492.000\"},\"old\":{\"current_stock\":\"2494.000\"}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(478, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2.900\"},\"old\":{\"current_stock\":\"3.300\"}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(479, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 20, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1.500\"},\"old\":{\"current_stock\":\"2.000\"}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(480, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"988.000\"},\"old\":{\"current_stock\":\"989.000\"}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(481, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2491.000\"},\"old\":{\"current_stock\":\"2492.000\"}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(482, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2.800\"},\"old\":{\"current_stock\":\"2.900\"}}', '[]', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(483, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"28.000\"},\"old\":{\"current_stock\":\"29.000\"}}', '[]', '2026-08-22 11:29:07', '2026-08-22 11:29:07'),
(484, 'Order', 'created', 'App\\Models\\Order', 41, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0014\",\"invoice_number\":\"CU-20260822-CCEC65\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(485, 'Order', 'updated', 'App\\Models\\Order', 41, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"17700.00\",\"profit\":\"2300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(486, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"986.000\"},\"old\":{\"current_stock\":\"988.000\"}}', '[]', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(487, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2489.000\"},\"old\":{\"current_stock\":\"2491.000\"}}', '[]', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(488, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2.600\"},\"old\":{\"current_stock\":\"2.800\"}}', '[]', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(489, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"26.000\"},\"old\":{\"current_stock\":\"28.000\"}}', '[]', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(490, 'Order', 'created', 'App\\Models\\Order', 42, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0015\",\"invoice_number\":\"CU-20260822-106521\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(491, 'Order', 'updated', 'App\\Models\\Order', 42, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"17700.00\",\"profit\":\"2300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(492, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"984.000\"},\"old\":{\"current_stock\":\"986.000\"}}', '[]', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(493, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2487.000\"},\"old\":{\"current_stock\":\"2489.000\"}}', '[]', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(494, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2.400\"},\"old\":{\"current_stock\":\"2.600\"}}', '[]', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(495, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"24.000\"},\"old\":{\"current_stock\":\"26.000\"}}', '[]', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(496, 'Order', 'created', 'App\\Models\\Order', 43, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0016\",\"invoice_number\":\"CU-20260822-B2F027\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(497, 'Order', 'updated', 'App\\Models\\Order', 43, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"17700.00\",\"profit\":\"2300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(498, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"982.000\"},\"old\":{\"current_stock\":\"984.000\"}}', '[]', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(499, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2485.000\"},\"old\":{\"current_stock\":\"2487.000\"}}', '[]', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(500, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2.200\"},\"old\":{\"current_stock\":\"2.400\"}}', '[]', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(501, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"22.000\"},\"old\":{\"current_stock\":\"24.000\"}}', '[]', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(502, 'Order', 'created', 'App\\Models\\Order', 44, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0017\",\"invoice_number\":\"CU-20260822-050FF9\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(503, 'Order', 'updated', 'App\\Models\\Order', 44, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"50000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"50000.00\",\"cost_total\":\"19200.00\",\"profit\":\"30800.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(504, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"980.000\"},\"old\":{\"current_stock\":\"982.000\"}}', '[]', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(505, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2483.000\"},\"old\":{\"current_stock\":\"2485.000\"}}', '[]', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(506, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2.000\"},\"old\":{\"current_stock\":\"2.200\"}}', '[]', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(507, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 19, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1.000\"},\"old\":{\"current_stock\":\"1.500\"}}', '[]', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(508, 'Order', 'created', 'App\\Models\\Order', 45, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0018\",\"invoice_number\":\"CU-20260822-637EA7\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(509, 'Order', 'updated', 'App\\Models\\Order', 45, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"66000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"66000.00\",\"cost_total\":\"15700.00\",\"profit\":\"50300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(510, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"978.000\"},\"old\":{\"current_stock\":\"980.000\"}}', '[]', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(511, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2481.000\"},\"old\":{\"current_stock\":\"2483.000\"}}', '[]', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(512, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"55.150\"},\"old\":{\"current_stock\":\"55.650\"}}', '[]', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(513, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1.800\"},\"old\":{\"current_stock\":\"2.000\"}}', '[]', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(514, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"27.500\"},\"old\":{\"current_stock\":\"28.500\"}}', '[]', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(515, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"46.000\"},\"old\":{\"current_stock\":\"48.000\"}}', '[]', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(516, 'Order', 'created', 'App\\Models\\Order', 46, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0019\",\"invoice_number\":\"CU-20260822-0F0AA0\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 11:48:00', '2026-08-22 11:48:00'),
(517, 'Order', 'updated', 'App\\Models\\Order', 46, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"91000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"91000.00\",\"cost_total\":\"22700.00\",\"profit\":\"68300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(518, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"976.000\"},\"old\":{\"current_stock\":\"978.000\"}}', '[]', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(519, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2479.000\"},\"old\":{\"current_stock\":\"2481.000\"}}', '[]', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(520, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"54.650\"},\"old\":{\"current_stock\":\"55.150\"}}', '[]', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(521, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1.600\"},\"old\":{\"current_stock\":\"1.800\"}}', '[]', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(522, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"26.500\"},\"old\":{\"current_stock\":\"27.500\"}}', '[]', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(523, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"44.000\"},\"old\":{\"current_stock\":\"46.000\"}}', '[]', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(524, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 42, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.986\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(525, 'Order', 'created', 'App\\Models\\Order', 47, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0020\",\"invoice_number\":\"CU-20260822-6C7AC8\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(526, 'Order', 'updated', 'App\\Models\\Order', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"10000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"10000.00\",\"cost_total\":\"8850.00\",\"profit\":\"1150.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(527, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"975.000\"},\"old\":{\"current_stock\":\"976.000\"}}', '[]', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(528, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2478.000\"},\"old\":{\"current_stock\":\"2479.000\"}}', '[]', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(529, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1.500\"},\"old\":{\"current_stock\":\"1.600\"}}', '[]', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(530, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"21.000\"},\"old\":{\"current_stock\":\"22.000\"}}', '[]', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(531, 'Order', 'created', 'App\\Models\\Order', 48, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0021\",\"invoice_number\":\"CU-20260822-529FB0\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(532, 'Order', 'updated', 'App\\Models\\Order', 48, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"106000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"106000.00\",\"cost_total\":\"36050.00\",\"profit\":\"69950.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(533, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"973.000\"},\"old\":{\"current_stock\":\"975.000\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(534, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2476.000\"},\"old\":{\"current_stock\":\"2478.000\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(535, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"54.150\"},\"old\":{\"current_stock\":\"54.650\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(536, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1.300\"},\"old\":{\"current_stock\":\"1.500\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(537, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"25.500\"},\"old\":{\"current_stock\":\"26.500\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(538, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"42.000\"},\"old\":{\"current_stock\":\"44.000\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(539, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 30, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2.200\"},\"old\":{\"current_stock\":\"2.250\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(540, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 34, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"7.800\"},\"old\":{\"current_stock\":\"8.000\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(541, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"972.000\"},\"old\":{\"current_stock\":\"973.000\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(542, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2475.000\"},\"old\":{\"current_stock\":\"2476.000\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(543, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1.200\"},\"old\":{\"current_stock\":\"1.300\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(544, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"20.000\"},\"old\":{\"current_stock\":\"21.000\"}}', '[]', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(545, 'Order', 'created', 'App\\Models\\Order', 49, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0022\",\"invoice_number\":\"CU-20260822-04FE3D\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(546, 'Order', 'updated', 'App\\Models\\Order', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"36000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"36000.00\",\"cost_total\":\"29550.00\",\"profit\":\"6450.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(547, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"969.000\"},\"old\":{\"current_stock\":\"972.000\"}}', '[]', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(548, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2472.000\"},\"old\":{\"current_stock\":\"2475.000\"}}', '[]', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(549, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.900\"},\"old\":{\"current_stock\":\"1.200\"}}', '[]', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(550, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"17.000\"},\"old\":{\"current_stock\":\"20.000\"}}', '[]', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(551, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"40.000\"},\"old\":{\"current_stock\":\"42.000\"}}', '[]', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(552, 'Order', 'created', 'App\\Models\\Order', 50, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0023\",\"invoice_number\":\"CU-20260822-B8AD5E\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(553, 'Order', 'updated', 'App\\Models\\Order', 50, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"101000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"101000.00\",\"cost_total\":\"31550.00\",\"profit\":\"69450.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(554, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"967.000\"},\"old\":{\"current_stock\":\"969.000\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(555, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2470.000\"},\"old\":{\"current_stock\":\"2472.000\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(556, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"53.650\"},\"old\":{\"current_stock\":\"54.150\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(557, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.700\"},\"old\":{\"current_stock\":\"0.900\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(558, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"24.500\"},\"old\":{\"current_stock\":\"25.500\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(559, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"38.000\"},\"old\":{\"current_stock\":\"40.000\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(560, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 42, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.972\"},\"old\":{\"current_stock\":\"0.986\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(561, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"966.000\"},\"old\":{\"current_stock\":\"967.000\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(562, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2469.000\"},\"old\":{\"current_stock\":\"2470.000\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(563, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.600\"},\"old\":{\"current_stock\":\"0.700\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(564, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"16.000\"},\"old\":{\"current_stock\":\"17.000\"}}', '[]', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(565, 'Order', 'created', 'App\\Models\\Order', 51, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0024\",\"invoice_number\":\"CU-20260822-FB8EEE\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(566, 'Order', 'updated', 'App\\Models\\Order', 51, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"41000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"41000.00\",\"cost_total\":\"18850.00\",\"profit\":\"22150.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(567, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"36.000\"},\"old\":{\"current_stock\":\"38.000\"}}', '[]', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(568, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 42, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.958\"},\"old\":{\"current_stock\":\"0.972\"}}', '[]', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(569, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"965.000\"},\"old\":{\"current_stock\":\"966.000\"}}', '[]', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(570, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2468.000\"},\"old\":{\"current_stock\":\"2469.000\"}}', '[]', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(571, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.500\"},\"old\":{\"current_stock\":\"0.600\"}}', '[]', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(572, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"15.000\"},\"old\":{\"current_stock\":\"16.000\"}}', '[]', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(573, 'Order', 'created', 'App\\Models\\Order', 52, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260822-0025\",\"invoice_number\":\"CU-20260822-4A5DAC\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"card\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(574, 'Order', 'updated', 'App\\Models\\Order', 52, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"29000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"29000.00\",\"cost_total\":\"15550.00\",\"profit\":\"13450.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(575, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"33.000\"},\"old\":{\"current_stock\":\"36.000\"}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(576, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"964.000\"},\"old\":{\"current_stock\":\"965.000\"}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(577, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2467.000\"},\"old\":{\"current_stock\":\"2468.000\"}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(578, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.400\"},\"old\":{\"current_stock\":\"0.500\"}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(579, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 48, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"29.000\"},\"old\":{\"current_stock\":\"30.000\"}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(580, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4992.000\"},\"old\":{\"current_stock\":\"4993.000\"}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(581, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.440\"},\"old\":{\"current_stock\":\"3.455\"}}', '[]', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(582, 'Order', 'created', 'App\\Models\\Order', 53, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"order_number\":\"20260823-0001\",\"invoice_number\":\"CU-20260823-BBAF1D\",\"user_id\":1,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(583, 'Order', 'updated', 'App\\Models\\Order', 53, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"subtotal\":\"35000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"35000.00\",\"cost_total\":\"9100.00\",\"profit\":\"25900.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(584, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"2990.000\"},\"old\":{\"current_stock\":\"2991.000\"}}', '[]', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(585, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"53.350\"},\"old\":{\"current_stock\":\"53.650\"}}', '[]', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(586, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.305\"},\"old\":{\"current_stock\":\"3.320\"}}', '[]', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(587, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"current_stock\":\"3.800\"},\"old\":{\"current_stock\":\"3.850\"}}', '[]', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(588, 'Order', 'created', 'App\\Models\\Order', 54, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0002\",\"invoice_number\":\"CU-20260823-424988\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(589, 'Order', 'updated', 'App\\Models\\Order', 54, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"4850.00\",\"profit\":\"15150.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(590, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"963.000\"},\"old\":{\"current_stock\":\"964.000\"}}', '[]', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(591, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 11, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1994.000\"},\"old\":{\"current_stock\":\"1995.000\"}}', '[]', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(592, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"53.050\"},\"old\":{\"current_stock\":\"53.350\"}}', '[]', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(593, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.290\"},\"old\":{\"current_stock\":\"3.305\"}}', '[]', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(594, 'Order', 'created', 'App\\Models\\Order', 55, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0003\",\"invoice_number\":\"CU-20260823-EF21CF\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 06:14:22', '2026-08-23 06:14:22'),
(595, 'Order', 'updated', 'App\\Models\\Order', 55, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"48000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"48000.00\",\"cost_total\":\"21800.00\",\"profit\":\"26200.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(596, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4990.000\"},\"old\":{\"current_stock\":\"4992.000\"}}', '[]', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(597, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.410\"},\"old\":{\"current_stock\":\"3.440\"}}', '[]', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(598, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2822.000\"},\"old\":{\"current_stock\":\"2824.000\"}}', '[]', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(599, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 35, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.470\"},\"old\":{\"current_stock\":\"0.500\"}}', '[]', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(600, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"29.000\"},\"old\":{\"current_stock\":\"33.000\"}}', '[]', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(601, 'Order', 'created', 'App\\Models\\Order', 56, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0004\",\"invoice_number\":\"CU-20260823-A91DC4\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(602, 'Order', 'updated', 'App\\Models\\Order', 56, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"26000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"26000.00\",\"cost_total\":\"12400.00\",\"profit\":\"13600.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(603, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2820.000\"},\"old\":{\"current_stock\":\"2822.000\"}}', '[]', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(604, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 26, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"18.000\"},\"old\":{\"current_stock\":\"20.000\"}}', '[]', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(605, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"27.000\"},\"old\":{\"current_stock\":\"29.000\"}}', '[]', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(606, 'Order', 'created', 'App\\Models\\Order', 57, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0005\",\"invoice_number\":\"CU-20260823-BD4FA3\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(607, 'Order', 'updated', 'App\\Models\\Order', 57, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"116000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"116000.00\",\"cost_total\":\"53200.00\",\"profit\":\"62800.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(608, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"20.000\"},\"old\":{\"current_stock\":\"27.000\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(609, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"962.000\"},\"old\":{\"current_stock\":\"963.000\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(610, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2466.000\"},\"old\":{\"current_stock\":\"2467.000\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `attribute_changes`, `properties`, `created_at`, `updated_at`) VALUES
(611, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.300\"},\"old\":{\"current_stock\":\"0.400\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(612, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 19, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.750\"},\"old\":{\"current_stock\":\"1.000\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(613, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4987.000\"},\"old\":{\"current_stock\":\"4990.000\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(614, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.365\"},\"old\":{\"current_stock\":\"3.410\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(615, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2815.000\"},\"old\":{\"current_stock\":\"2820.000\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(616, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 35, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.395\"},\"old\":{\"current_stock\":\"0.470\"}}', '[]', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(617, 'Order', 'created', 'App\\Models\\Order', 58, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0006\",\"invoice_number\":\"CU-20260823-853082\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(618, 'Order', 'updated', 'App\\Models\\Order', 58, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"24000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"24000.00\",\"cost_total\":\"10900.00\",\"profit\":\"13100.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(619, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4986.000\"},\"old\":{\"current_stock\":\"4987.000\"}}', '[]', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(620, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.350\"},\"old\":{\"current_stock\":\"3.365\"}}', '[]', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(621, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2814.000\"},\"old\":{\"current_stock\":\"2815.000\"}}', '[]', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(622, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 35, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.380\"},\"old\":{\"current_stock\":\"0.395\"}}', '[]', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(623, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"18.000\"},\"old\":{\"current_stock\":\"20.000\"}}', '[]', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(624, 'Order', 'created', 'App\\Models\\Order', 59, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0007\",\"invoice_number\":\"CU-20260823-67D11F\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(625, 'Order', 'updated', 'App\\Models\\Order', 59, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"46000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"46000.00\",\"cost_total\":\"23300.00\",\"profit\":\"22700.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(626, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"14.000\"},\"old\":{\"current_stock\":\"18.000\"}}', '[]', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(627, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4985.000\"},\"old\":{\"current_stock\":\"4986.000\"}}', '[]', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(628, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.335\"},\"old\":{\"current_stock\":\"3.350\"}}', '[]', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(629, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2811.000\"},\"old\":{\"current_stock\":\"2814.000\"}}', '[]', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(630, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 35, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.335\"},\"old\":{\"current_stock\":\"0.380\"}}', '[]', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(631, 'Order', 'created', 'App\\Models\\Order', 60, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0008\",\"invoice_number\":\"CU-20260823-6CA0EE\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
(632, 'Order', 'updated', 'App\\Models\\Order', 60, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"64000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"64000.00\",\"cost_total\":\"37600.00\",\"profit\":\"26400.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
(633, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2803.000\"},\"old\":{\"current_stock\":\"2811.000\"}}', '[]', '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
(634, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 35, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.215\"},\"old\":{\"current_stock\":\"0.335\"}}', '[]', '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
(635, 'Order', 'created', 'App\\Models\\Order', 61, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0009\",\"invoice_number\":\"CU-20260823-7F106D\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 09:15:03', '2026-08-23 09:15:03'),
(636, 'Order', 'updated', 'App\\Models\\Order', 61, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"24000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"24000.00\",\"cost_total\":\"12000.00\",\"profit\":\"12000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 09:15:03', '2026-08-23 09:15:03'),
(637, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"6.000\"},\"old\":{\"current_stock\":\"14.000\"}}', '[]', '2026-08-23 09:15:04', '2026-08-23 09:15:04'),
(638, 'Order', 'created', 'App\\Models\\Order', 62, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0010\",\"invoice_number\":\"CU-20260823-4E6A8C\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(639, 'Order', 'updated', 'App\\Models\\Order', 62, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"39000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"39000.00\",\"cost_total\":\"14100.00\",\"profit\":\"24900.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(640, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.000\"},\"old\":{\"current_stock\":\"6.000\"}}', '[]', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(641, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4982.000\"},\"old\":{\"current_stock\":\"4985.000\"}}', '[]', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(642, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.290\"},\"old\":{\"current_stock\":\"3.335\"}}', '[]', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(643, 'Order', 'created', 'App\\Models\\Order', 63, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0011\",\"invoice_number\":\"CU-20260823-A90586\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(644, 'Order', 'updated', 'App\\Models\\Order', 63, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"39000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"39000.00\",\"cost_total\":\"18600.00\",\"profit\":\"20400.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(645, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2800.000\"},\"old\":{\"current_stock\":\"2803.000\"}}', '[]', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(646, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 26, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"15.000\"},\"old\":{\"current_stock\":\"18.000\"}}', '[]', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(647, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.000\"},\"old\":{\"current_stock\":\"3.000\"}}', '[]', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(648, 'Order', 'created', 'App\\Models\\Order', 64, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0012\",\"invoice_number\":\"CU-20260823-229937\",\"user_id\":2,\"shift_id\":null,\"table_id\":5,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
(649, 'Order', 'updated', 'App\\Models\\Order', 64, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"28000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"28000.00\",\"cost_total\":\"8500.00\",\"profit\":\"19500.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
(650, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.958\"},\"old\":{\"current_stock\":\"0.972\"}}', '[]', '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
(651, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"-1.000\"},\"old\":{\"current_stock\":\"0.000\"}}', '[]', '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
(652, 'Order', 'updated', 'App\\Models\\Order', 64, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"status\":\"delivered\",\"is_paid\":true,\"delivered_at\":\"2026-08-23T11:01:36.000000Z\"},\"old\":{\"status\":\"new\",\"is_paid\":false,\"delivered_at\":null}}', '[]', '2026-08-23 11:01:36', '2026-08-23 11:01:36'),
(653, 'Order', 'created', 'App\\Models\\Order', 65, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0013\",\"invoice_number\":\"CU-20260823-F5B02B\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(654, 'Order', 'updated', 'App\\Models\\Order', 65, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"28000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"28000.00\",\"cost_total\":\"8500.00\",\"profit\":\"19500.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(655, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.944\"},\"old\":{\"current_stock\":\"0.958\"}}', '[]', '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(656, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"-2.000\"},\"old\":{\"current_stock\":\"-1.000\"}}', '[]', '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(657, 'Order', 'created', 'App\\Models\\Order', 66, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0014\",\"invoice_number\":\"CU-20260823-19FB8A\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(658, 'Order', 'updated', 'App\\Models\\Order', 66, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"39000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"39000.00\",\"cost_total\":\"25400.00\",\"profit\":\"13600.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(659, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"-5.000\"},\"old\":{\"current_stock\":\"-2.000\"}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(660, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"960.000\"},\"old\":{\"current_stock\":\"962.000\"}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(661, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2464.000\"},\"old\":{\"current_stock\":\"2466.000\"}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(662, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.100\"},\"old\":{\"current_stock\":\"0.300\"}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(663, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"13.000\"},\"old\":{\"current_stock\":\"15.000\"}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(664, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4981.000\"},\"old\":{\"current_stock\":\"4982.000\"}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(665, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.275\"},\"old\":{\"current_stock\":\"3.290\"}}', '[]', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(666, 'Order', 'created', 'App\\Models\\Order', 67, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0015\",\"invoice_number\":\"CU-20260823-3CF4BE\",\"user_id\":2,\"shift_id\":null,\"table_id\":5,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":false,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 11:09:39', '2026-08-23 11:09:39'),
(667, 'Order', 'updated', 'App\\Models\\Order', 67, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"25000.00\",\"cost_total\":\"7000.00\",\"profit\":\"18000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 11:09:39', '2026-08-23 11:09:39'),
(668, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 44, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.944\"},\"old\":{\"current_stock\":\"0.958\"}}', '[]', '2026-08-23 11:09:39', '2026-08-23 11:09:39'),
(669, 'Order', 'updated', 'App\\Models\\Order', 67, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"status\":\"delivered\",\"is_paid\":true,\"delivered_at\":\"2026-08-23T11:09:53.000000Z\"},\"old\":{\"status\":\"new\",\"is_paid\":false,\"delivered_at\":null}}', '[]', '2026-08-23 11:09:53', '2026-08-23 11:09:53'),
(670, 'Order', 'created', 'App\\Models\\Order', 68, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0016\",\"invoice_number\":\"CU-20260823-B8F25D\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
(671, 'Order', 'updated', 'App\\Models\\Order', 68, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"8000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"8000.00\",\"cost_total\":\"4700.00\",\"profit\":\"3300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
(672, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2799.000\"},\"old\":{\"current_stock\":\"2800.000\"}}', '[]', '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
(673, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 35, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.200\"},\"old\":{\"current_stock\":\"0.215\"}}', '[]', '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
(674, 'Order', 'created', 'App\\Models\\Order', 69, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0017\",\"invoice_number\":\"CU-20260823-4CBA99\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(675, 'Order', 'updated', 'App\\Models\\Order', 69, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"28000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"28000.00\",\"cost_total\":\"8500.00\",\"profit\":\"19500.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(676, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.930\"},\"old\":{\"current_stock\":\"0.944\"}}', '[]', '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(677, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"-6.000\"},\"old\":{\"current_stock\":\"-5.000\"}}', '[]', '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(678, 'Order', 'created', 'App\\Models\\Order', 70, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260823-0018\",\"invoice_number\":\"CU-20260823-F8F054\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-23 11:24:15', '2026-08-23 11:24:15'),
(679, 'Order', 'updated', 'App\\Models\\Order', 70, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"25000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"25000.00\",\"cost_total\":\"7000.00\",\"profit\":\"18000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-23 11:24:15', '2026-08-23 11:24:15'),
(680, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.916\"},\"old\":{\"current_stock\":\"0.930\"}}', '[]', '2026-08-23 11:24:15', '2026-08-23 11:24:15'),
(681, 'Order', 'created', 'App\\Models\\Order', 71, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260824-0001\",\"invoice_number\":\"CU-20260824-0A4289\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(682, 'Order', 'updated', 'App\\Models\\Order', 71, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"33000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"33000.00\",\"cost_total\":\"9600.00\",\"profit\":\"23400.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(683, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 45, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.902\"},\"old\":{\"current_stock\":\"0.916\"}}', '[]', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(684, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2798.000\"},\"old\":{\"current_stock\":\"2799.000\"}}', '[]', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(685, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 29, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"699.000\"},\"old\":{\"current_stock\":\"700.000\"}}', '[]', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(686, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 34, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"7.780\"},\"old\":{\"current_stock\":\"7.800\"}}', '[]', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(687, 'Order', 'created', 'App\\Models\\Order', 72, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260824-0002\",\"invoice_number\":\"CU-20260824-5043B2\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-24 07:25:41', '2026-08-24 07:25:41'),
(688, 'Order', 'updated', 'App\\Models\\Order', 72, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"10000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"10000.00\",\"cost_total\":\"3000.00\",\"profit\":\"7000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-24 07:25:41', '2026-08-24 07:25:41'),
(689, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2797.000\"},\"old\":{\"current_stock\":\"2798.000\"}}', '[]', '2026-08-24 07:25:41', '2026-08-24 07:25:41'),
(690, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 28, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"29.000\"},\"old\":{\"current_stock\":\"30.000\"}}', '[]', '2026-08-24 07:25:41', '2026-08-24 07:25:41'),
(691, 'Order', 'created', 'App\\Models\\Order', 73, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260824-0003\",\"invoice_number\":\"CU-20260824-63306B\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-24 07:26:46', '2026-08-24 07:26:46'),
(692, 'Order', 'updated', 'App\\Models\\Order', 73, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"10000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"10000.00\",\"cost_total\":\"3000.00\",\"profit\":\"7000.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-24 07:26:46', '2026-08-24 07:26:46'),
(693, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2796.000\"},\"old\":{\"current_stock\":\"2797.000\"}}', '[]', '2026-08-24 07:26:46', '2026-08-24 07:26:46'),
(694, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 28, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"28.000\"},\"old\":{\"current_stock\":\"29.000\"}}', '[]', '2026-08-24 07:26:46', '2026-08-24 07:26:46'),
(695, 'Order', 'created', 'App\\Models\\Order', 74, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260824-0004\",\"invoice_number\":\"CU-20260824-B78158\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(696, 'Order', 'updated', 'App\\Models\\Order', 74, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"26000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"26000.00\",\"cost_total\":\"10900.00\",\"profit\":\"15100.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(697, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"-8.000\"},\"old\":{\"current_stock\":\"-6.000\"}}', '[]', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(698, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 12, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2795.000\"},\"old\":{\"current_stock\":\"2796.000\"}}', '[]', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(699, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 26, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"14.000\"},\"old\":{\"current_stock\":\"15.000\"}}', '[]', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(700, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 5, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"4980.000\"},\"old\":{\"current_stock\":\"4981.000\"}}', '[]', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(701, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 25, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.260\"},\"old\":{\"current_stock\":\"3.275\"}}', '[]', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(702, 'Order', 'created', 'App\\Models\\Order', 75, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260824-0005\",\"invoice_number\":\"CU-20260824-4BD6A0\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(703, 'Order', 'updated', 'App\\Models\\Order', 75, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"91000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"91000.00\",\"cost_total\":\"22700.00\",\"profit\":\"68300.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(704, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"-10.000\"},\"old\":{\"current_stock\":\"-8.000\"}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(705, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 43, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.972\"},\"old\":{\"current_stock\":\"0.986\"}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(706, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"958.000\"},\"old\":{\"current_stock\":\"960.000\"}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(707, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 10, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2462.000\"},\"old\":{\"current_stock\":\"2464.000\"}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(708, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"52.550\"},\"old\":{\"current_stock\":\"53.050\"}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(709, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 17, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"-0.100\"},\"old\":{\"current_stock\":\"0.100\"}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(710, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 21, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"23.500\"},\"old\":{\"current_stock\":\"24.500\"}}', '[]', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(711, 'Order', 'created', 'App\\Models\\Order', 76, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260825-0001\",\"invoice_number\":\"CU-20260825-A35BF0\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(712, 'Order', 'updated', 'App\\Models\\Order', 76, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"5100.00\",\"profit\":\"14900.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(713, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2989.000\"},\"old\":{\"current_stock\":\"2990.000\"}}', '[]', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(714, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"52.250\"},\"old\":{\"current_stock\":\"52.550\"}}', '[]', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(715, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.275\"},\"old\":{\"current_stock\":\"3.290\"}}', '[]', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(716, 'Order', 'created', 'App\\Models\\Order', 77, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260825-0002\",\"invoice_number\":\"CU-20260825-9297EF\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(717, 'Order', 'updated', 'App\\Models\\Order', 77, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"5100.00\",\"profit\":\"14900.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(718, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2988.000\"},\"old\":{\"current_stock\":\"2989.000\"}}', '[]', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(719, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"51.950\"},\"old\":{\"current_stock\":\"52.250\"}}', '[]', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(720, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.260\"},\"old\":{\"current_stock\":\"3.275\"}}', '[]', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(721, 'Order', 'created', 'App\\Models\\Order', 78, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260825-0003\",\"invoice_number\":\"CU-20260825-DEF5C0\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-25 06:13:17', '2026-08-25 06:13:17'),
(722, 'Order', 'updated', 'App\\Models\\Order', 78, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"4850.00\",\"profit\":\"15150.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-25 06:13:17', '2026-08-25 06:13:17'),
(723, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 6, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"957.000\"},\"old\":{\"current_stock\":\"958.000\"}}', '[]', '2026-08-25 06:13:17', '2026-08-25 06:13:17'),
(724, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 11, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"1993.000\"},\"old\":{\"current_stock\":\"1994.000\"}}', '[]', '2026-08-25 06:13:17', '2026-08-25 06:13:17'),
(725, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"51.650\"},\"old\":{\"current_stock\":\"51.950\"}}', '[]', '2026-08-25 06:13:17', '2026-08-25 06:13:17'),
(726, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.245\"},\"old\":{\"current_stock\":\"3.260\"}}', '[]', '2026-08-25 06:13:18', '2026-08-25 06:13:18'),
(727, 'Order', 'created', 'App\\Models\\Order', 79, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260825-0004\",\"invoice_number\":\"CU-20260825-FE27FE\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-25 06:31:11', '2026-08-25 06:31:11'),
(728, 'Order', 'updated', 'App\\Models\\Order', 79, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"1750.00\",\"profit\":\"-1750.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-25 06:31:11', '2026-08-25 06:31:11'),
(729, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 4, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2399.000\"},\"old\":{\"current_stock\":\"2400.000\"}}', '[]', '2026-08-25 06:31:11', '2026-08-25 06:31:11'),
(730, 'Order', 'created', 'App\\Models\\Order', 80, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260825-0005\",\"invoice_number\":\"CU-20260825-0840FC\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(731, 'Order', 'updated', 'App\\Models\\Order', 80, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"28000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"28000.00\",\"cost_total\":\"8500.00\",\"profit\":\"19500.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(732, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 47, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"-11.000\"},\"old\":{\"current_stock\":\"-10.000\"}}', '[]', '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(733, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 43, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"0.958\"},\"old\":{\"current_stock\":\"0.972\"}}', '[]', '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(734, 'Order', 'created', 'App\\Models\\Order', 81, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260826-0001\",\"invoice_number\":\"CU-20260826-0EA2E2\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(735, 'Order', 'updated', 'App\\Models\\Order', 81, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"20000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"20000.00\",\"cost_total\":\"5100.00\",\"profit\":\"14900.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-26 20:37:04', '2026-08-26 20:37:04');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `attribute_changes`, `properties`, `created_at`, `updated_at`) VALUES
(736, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2987.000\"},\"old\":{\"current_stock\":\"2988.000\"}}', '[]', '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(737, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"51.350\"},\"old\":{\"current_stock\":\"51.650\"}}', '[]', '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(738, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.230\"},\"old\":{\"current_stock\":\"3.245\"}}', '[]', '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(739, 'Order', 'created', 'App\\Models\\Order', 82, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260826-0002\",\"invoice_number\":\"CU-20260826-0C3693\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(740, 'Order', 'updated', 'App\\Models\\Order', 82, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"35000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"35000.00\",\"cost_total\":\"9100.00\",\"profit\":\"25900.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(741, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 8, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"2986.000\"},\"old\":{\"current_stock\":\"2987.000\"}}', '[]', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(742, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"51.050\"},\"old\":{\"current_stock\":\"51.350\"}}', '[]', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(743, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.215\"},\"old\":{\"current_stock\":\"3.230\"}}', '[]', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(744, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.750\"},\"old\":{\"current_stock\":\"3.800\"}}', '[]', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(745, 'Order', 'created', 'App\\Models\\Order', 83, 'created', 'App\\Models\\User', 2, '{\"attributes\":{\"order_number\":\"20260826-0003\",\"invoice_number\":\"CU-20260826-8F1817\",\"user_id\":2,\"shift_id\":null,\"table_id\":null,\"type\":\"dine_in\",\"status\":\"new\",\"customer_name\":null,\"subtotal\":\"0.00\",\"item_discount_total\":\"0.00\",\"discount_type\":null,\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"0.00\",\"cost_total\":\"0.00\",\"profit\":\"0.00\",\"payment_method\":\"cash\",\"is_paid\":true,\"notes\":null,\"prepared_at\":null,\"ready_at\":null,\"delivered_at\":null,\"cancelled_at\":null}}', '[]', '2026-08-26 20:45:28', '2026-08-26 20:45:28'),
(746, 'Order', 'updated', 'App\\Models\\Order', 83, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"subtotal\":\"35000.00\",\"item_discount_total\":\"0.00\",\"discount_value\":\"0.00\",\"order_discount_amount\":\"0.00\",\"discount_total\":\"0.00\",\"total\":\"35000.00\",\"cost_total\":\"8600.00\",\"profit\":\"26400.00\"},\"old\":{\"subtotal\":null,\"item_discount_total\":null,\"discount_value\":null,\"order_discount_amount\":null,\"discount_total\":null,\"total\":null,\"cost_total\":null,\"profit\":null}}', '[]', '2026-08-26 20:45:28', '2026-08-26 20:45:28'),
(747, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 9, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"747.000\"},\"old\":{\"current_stock\":\"748.000\"}}', '[]', '2026-08-26 20:45:29', '2026-08-26 20:45:29'),
(748, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 14, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"50.750\"},\"old\":{\"current_stock\":\"51.050\"}}', '[]', '2026-08-26 20:45:29', '2026-08-26 20:45:29'),
(749, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 16, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.200\"},\"old\":{\"current_stock\":\"3.215\"}}', '[]', '2026-08-26 20:45:29', '2026-08-26 20:45:29'),
(750, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 37, 'updated', 'App\\Models\\User', 2, '{\"attributes\":{\"current_stock\":\"3.700\"},\"old\":{\"current_stock\":\"3.750\"}}', '[]', '2026-08-26 20:45:29', '2026-08-26 20:45:29'),
(751, 'Order', 'updated', 'App\\Models\\Order', 30, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:56.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:56', '2026-08-29 23:03:56'),
(752, 'Order', 'updated', 'App\\Models\\Order', 31, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:57.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:57', '2026-08-29 23:03:57'),
(753, 'Order', 'updated', 'App\\Models\\Order', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:57.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:57', '2026-08-29 23:03:57'),
(754, 'Order', 'updated', 'App\\Models\\Order', 33, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:57.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:57', '2026-08-29 23:03:57'),
(755, 'Order', 'updated', 'App\\Models\\Order', 34, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:57.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:57', '2026-08-29 23:03:57'),
(756, 'Order', 'updated', 'App\\Models\\Order', 35, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:57.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:57', '2026-08-29 23:03:57'),
(757, 'Order', 'updated', 'App\\Models\\Order', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:57.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:57', '2026-08-29 23:03:57'),
(758, 'Order', 'updated', 'App\\Models\\Order', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:57.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:57', '2026-08-29 23:03:57'),
(759, 'Order', 'updated', 'App\\Models\\Order', 38, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:58.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:58', '2026-08-29 23:03:58'),
(760, 'Order', 'updated', 'App\\Models\\Order', 39, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:03:58.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:03:58', '2026-08-29 23:03:58'),
(761, 'Order', 'updated', 'App\\Models\\Order', 30, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:03:59.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:03:59', '2026-08-29 23:03:59'),
(762, 'Order', 'updated', 'App\\Models\\Order', 31, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:03:59.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:03:59', '2026-08-29 23:03:59'),
(763, 'Order', 'updated', 'App\\Models\\Order', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:03:59.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:03:59', '2026-08-29 23:03:59'),
(764, 'Order', 'updated', 'App\\Models\\Order', 33, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:03:59.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:00', '2026-08-29 23:04:00'),
(765, 'Order', 'updated', 'App\\Models\\Order', 34, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:00.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:00', '2026-08-29 23:04:00'),
(766, 'Order', 'updated', 'App\\Models\\Order', 35, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:00.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:00', '2026-08-29 23:04:00'),
(767, 'Order', 'updated', 'App\\Models\\Order', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:00.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:00', '2026-08-29 23:04:00'),
(768, 'Order', 'updated', 'App\\Models\\Order', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:00.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:00', '2026-08-29 23:04:00'),
(769, 'Order', 'updated', 'App\\Models\\Order', 38, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:00.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:00', '2026-08-29 23:04:00'),
(770, 'Order', 'updated', 'App\\Models\\Order', 30, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:01.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:01', '2026-08-29 23:04:01'),
(771, 'Order', 'updated', 'App\\Models\\Order', 31, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:02', '2026-08-29 23:04:02'),
(772, 'Order', 'updated', 'App\\Models\\Order', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:02', '2026-08-29 23:04:02'),
(773, 'Order', 'updated', 'App\\Models\\Order', 33, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:02', '2026-08-29 23:04:02'),
(774, 'Order', 'updated', 'App\\Models\\Order', 34, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:02', '2026-08-29 23:04:02'),
(775, 'Order', 'updated', 'App\\Models\\Order', 35, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:02', '2026-08-29 23:04:02'),
(776, 'Order', 'updated', 'App\\Models\\Order', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:02', '2026-08-29 23:04:02'),
(777, 'Order', 'updated', 'App\\Models\\Order', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:02', '2026-08-29 23:04:02'),
(778, 'Order', 'updated', 'App\\Models\\Order', 38, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:03.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:03', '2026-08-29 23:04:03'),
(779, 'Order', 'updated', 'App\\Models\\Order', 40, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:04.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:04', '2026-08-29 23:04:04'),
(780, 'Order', 'updated', 'App\\Models\\Order', 41, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:05.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:05', '2026-08-29 23:04:05'),
(781, 'Order', 'updated', 'App\\Models\\Order', 42, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:05.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:05', '2026-08-29 23:04:05'),
(782, 'Order', 'updated', 'App\\Models\\Order', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:05.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:05', '2026-08-29 23:04:05'),
(783, 'Order', 'updated', 'App\\Models\\Order', 44, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:05.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:05', '2026-08-29 23:04:05'),
(784, 'Order', 'updated', 'App\\Models\\Order', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:06.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:06', '2026-08-29 23:04:06'),
(785, 'Order', 'updated', 'App\\Models\\Order', 46, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:07.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:07', '2026-08-29 23:04:07'),
(786, 'Order', 'updated', 'App\\Models\\Order', 47, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:09.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:09', '2026-08-29 23:04:09'),
(787, 'Order', 'updated', 'App\\Models\\Order', 48, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:09.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:09', '2026-08-29 23:04:09'),
(788, 'Order', 'updated', 'App\\Models\\Order', 49, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:11.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:11', '2026-08-29 23:04:11'),
(789, 'Order', 'updated', 'App\\Models\\Order', 39, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:11.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:11', '2026-08-29 23:04:11'),
(790, 'Order', 'updated', 'App\\Models\\Order', 40, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:13.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:13', '2026-08-29 23:04:13'),
(791, 'Order', 'updated', 'App\\Models\\Order', 41, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:13.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:13', '2026-08-29 23:04:13'),
(792, 'Order', 'updated', 'App\\Models\\Order', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:15.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:15', '2026-08-29 23:04:15'),
(793, 'Order', 'updated', 'App\\Models\\Order', 42, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:15.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:15', '2026-08-29 23:04:15'),
(794, 'Order', 'updated', 'App\\Models\\Order', 44, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:16.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:16', '2026-08-29 23:04:16'),
(795, 'Order', 'updated', 'App\\Models\\Order', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:16.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:16', '2026-08-29 23:04:16'),
(796, 'Order', 'updated', 'App\\Models\\Order', 46, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:16.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:16', '2026-08-29 23:04:16'),
(797, 'Order', 'updated', 'App\\Models\\Order', 47, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:17.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:17', '2026-08-29 23:04:17'),
(798, 'Order', 'updated', 'App\\Models\\Order', 48, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:18.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:18', '2026-08-29 23:04:18'),
(799, 'Order', 'updated', 'App\\Models\\Order', 39, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:18.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:18', '2026-08-29 23:04:18'),
(800, 'Order', 'updated', 'App\\Models\\Order', 40, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:19.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:19', '2026-08-29 23:04:19'),
(801, 'Order', 'updated', 'App\\Models\\Order', 41, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:20.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:20', '2026-08-29 23:04:20'),
(802, 'Order', 'updated', 'App\\Models\\Order', 42, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:21.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:21', '2026-08-29 23:04:21'),
(803, 'Order', 'updated', 'App\\Models\\Order', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:21.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:21', '2026-08-29 23:04:21'),
(804, 'Order', 'updated', 'App\\Models\\Order', 44, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:21.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:21', '2026-08-29 23:04:21'),
(805, 'Order', 'updated', 'App\\Models\\Order', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:21.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:21', '2026-08-29 23:04:21'),
(806, 'Order', 'updated', 'App\\Models\\Order', 46, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:22.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:22', '2026-08-29 23:04:22'),
(807, 'Order', 'updated', 'App\\Models\\Order', 47, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:23.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:23', '2026-08-29 23:04:23'),
(808, 'Order', 'updated', 'App\\Models\\Order', 48, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:04:23.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:04:23', '2026-08-29 23:04:23'),
(809, 'Order', 'updated', 'App\\Models\\Order', 50, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:24.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:24', '2026-08-29 23:04:24'),
(810, 'Order', 'updated', 'App\\Models\\Order', 51, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:25.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:25', '2026-08-29 23:04:25'),
(811, 'Order', 'updated', 'App\\Models\\Order', 52, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:25.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:25', '2026-08-29 23:04:25'),
(812, 'Order', 'updated', 'App\\Models\\Order', 53, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:26.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:26', '2026-08-29 23:04:26'),
(813, 'Order', 'updated', 'App\\Models\\Order', 54, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:27.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:27', '2026-08-29 23:04:27'),
(814, 'Order', 'updated', 'App\\Models\\Order', 55, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:28.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:28', '2026-08-29 23:04:28'),
(815, 'Order', 'updated', 'App\\Models\\Order', 56, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:28.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:28', '2026-08-29 23:04:28'),
(816, 'Order', 'updated', 'App\\Models\\Order', 57, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:28.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:28', '2026-08-29 23:04:28'),
(817, 'Order', 'updated', 'App\\Models\\Order', 58, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:29.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:29', '2026-08-29 23:04:29'),
(818, 'Order', 'updated', 'App\\Models\\Order', 59, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:30.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:30', '2026-08-29 23:04:30'),
(819, 'Order', 'updated', 'App\\Models\\Order', 60, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:30.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:30', '2026-08-29 23:04:30'),
(820, 'Order', 'updated', 'App\\Models\\Order', 61, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:31.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:31', '2026-08-29 23:04:31'),
(821, 'Order', 'updated', 'App\\Models\\Order', 62, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:31.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:31', '2026-08-29 23:04:31'),
(822, 'Order', 'updated', 'App\\Models\\Order', 63, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:31.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:31', '2026-08-29 23:04:31'),
(823, 'Order', 'updated', 'App\\Models\\Order', 65, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:31.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:31', '2026-08-29 23:04:31'),
(824, 'Order', 'updated', 'App\\Models\\Order', 66, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:31.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:31', '2026-08-29 23:04:31'),
(825, 'Order', 'updated', 'App\\Models\\Order', 68, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:32.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:32', '2026-08-29 23:04:32'),
(826, 'Order', 'updated', 'App\\Models\\Order', 69, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:33.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:33', '2026-08-29 23:04:33'),
(827, 'Order', 'updated', 'App\\Models\\Order', 70, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:34.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:34', '2026-08-29 23:04:34'),
(828, 'Order', 'updated', 'App\\Models\\Order', 71, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:34.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:34', '2026-08-29 23:04:34'),
(829, 'Order', 'updated', 'App\\Models\\Order', 72, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:35.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:35', '2026-08-29 23:04:35'),
(830, 'Order', 'updated', 'App\\Models\\Order', 73, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:35.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:35', '2026-08-29 23:04:35'),
(831, 'Order', 'updated', 'App\\Models\\Order', 74, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:36.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:36', '2026-08-29 23:04:36'),
(832, 'Order', 'updated', 'App\\Models\\Order', 75, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:36.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:36', '2026-08-29 23:04:36'),
(833, 'Order', 'updated', 'App\\Models\\Order', 76, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:37.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:37', '2026-08-29 23:04:37'),
(834, 'Order', 'updated', 'App\\Models\\Order', 77, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:37.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:37', '2026-08-29 23:04:37'),
(835, 'Order', 'updated', 'App\\Models\\Order', 78, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:37.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:37', '2026-08-29 23:04:37'),
(836, 'Order', 'updated', 'App\\Models\\Order', 79, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:37.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:37', '2026-08-29 23:04:37'),
(837, 'Order', 'updated', 'App\\Models\\Order', 80, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:38.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:38', '2026-08-29 23:04:38'),
(838, 'Order', 'updated', 'App\\Models\\Order', 81, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:39.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:39', '2026-08-29 23:04:39'),
(839, 'Order', 'updated', 'App\\Models\\Order', 82, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:39.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:39', '2026-08-29 23:04:39'),
(840, 'Order', 'updated', 'App\\Models\\Order', 83, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"preparing\",\"prepared_at\":\"2026-08-29T23:04:41.000000Z\"},\"old\":{\"status\":\"new\",\"prepared_at\":null}}', '[]', '2026-08-29 23:04:41', '2026-08-29 23:04:41'),
(841, 'Order', 'updated', 'App\\Models\\Order', 49, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:41.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:41', '2026-08-29 23:04:41'),
(842, 'Order', 'updated', 'App\\Models\\Order', 50, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:42.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:42', '2026-08-29 23:04:42'),
(843, 'Order', 'updated', 'App\\Models\\Order', 51, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:42.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:42', '2026-08-29 23:04:42'),
(844, 'Order', 'updated', 'App\\Models\\Order', 52, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:43.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:43', '2026-08-29 23:04:43'),
(845, 'Order', 'updated', 'App\\Models\\Order', 53, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:44.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:44', '2026-08-29 23:04:44'),
(846, 'Order', 'updated', 'App\\Models\\Order', 54, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:44.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:44', '2026-08-29 23:04:44'),
(847, 'Order', 'updated', 'App\\Models\\Order', 55, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:45.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:45', '2026-08-29 23:04:45'),
(848, 'Order', 'updated', 'App\\Models\\Order', 56, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:45.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:45', '2026-08-29 23:04:45'),
(849, 'Order', 'updated', 'App\\Models\\Order', 57, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:46.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:46', '2026-08-29 23:04:46'),
(850, 'Order', 'updated', 'App\\Models\\Order', 58, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:47.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:47', '2026-08-29 23:04:47'),
(851, 'Order', 'updated', 'App\\Models\\Order', 59, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:47.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:47', '2026-08-29 23:04:47'),
(852, 'Order', 'updated', 'App\\Models\\Order', 60, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:47.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:47', '2026-08-29 23:04:47'),
(853, 'Order', 'updated', 'App\\Models\\Order', 61, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:48.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:48', '2026-08-29 23:04:48'),
(854, 'Order', 'updated', 'App\\Models\\Order', 62, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:49.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:49', '2026-08-29 23:04:49'),
(855, 'Order', 'updated', 'App\\Models\\Order', 63, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:49.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:49', '2026-08-29 23:04:49'),
(856, 'Order', 'updated', 'App\\Models\\Order', 65, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:49.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:49', '2026-08-29 23:04:49'),
(857, 'Order', 'updated', 'App\\Models\\Order', 66, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:50.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:50', '2026-08-29 23:04:50'),
(858, 'Order', 'updated', 'App\\Models\\Order', 68, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:50.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:50', '2026-08-29 23:04:50'),
(859, 'Order', 'updated', 'App\\Models\\Order', 69, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:51.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:51', '2026-08-29 23:04:51'),
(860, 'Order', 'updated', 'App\\Models\\Order', 70, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:52.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:52', '2026-08-29 23:04:52'),
(861, 'Order', 'updated', 'App\\Models\\Order', 71, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:52.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:52', '2026-08-29 23:04:52'),
(862, 'Order', 'updated', 'App\\Models\\Order', 72, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:54.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:54', '2026-08-29 23:04:54'),
(863, 'Order', 'updated', 'App\\Models\\Order', 73, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:55.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:55', '2026-08-29 23:04:55'),
(864, 'Order', 'updated', 'App\\Models\\Order', 74, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:55.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:55', '2026-08-29 23:04:55'),
(865, 'Order', 'updated', 'App\\Models\\Order', 75, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:55.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:55', '2026-08-29 23:04:55'),
(866, 'Order', 'updated', 'App\\Models\\Order', 76, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:57.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:57', '2026-08-29 23:04:57'),
(867, 'Order', 'updated', 'App\\Models\\Order', 77, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:57.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:57', '2026-08-29 23:04:57'),
(868, 'Order', 'updated', 'App\\Models\\Order', 78, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:57.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:57', '2026-08-29 23:04:57'),
(869, 'Order', 'updated', 'App\\Models\\Order', 79, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:57.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:57', '2026-08-29 23:04:57'),
(870, 'Order', 'updated', 'App\\Models\\Order', 80, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:58.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:58', '2026-08-29 23:04:58'),
(871, 'Order', 'updated', 'App\\Models\\Order', 81, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:58.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:58', '2026-08-29 23:04:58'),
(872, 'Order', 'updated', 'App\\Models\\Order', 82, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:59.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:59', '2026-08-29 23:04:59'),
(873, 'Order', 'updated', 'App\\Models\\Order', 83, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"ready\",\"ready_at\":\"2026-08-29T23:04:59.000000Z\"},\"old\":{\"status\":\"preparing\",\"ready_at\":null}}', '[]', '2026-08-29 23:04:59', '2026-08-29 23:04:59'),
(874, 'Order', 'updated', 'App\\Models\\Order', 49, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:00.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:00', '2026-08-29 23:05:00'),
(875, 'Order', 'updated', 'App\\Models\\Order', 50, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:00.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:00', '2026-08-29 23:05:00'),
(876, 'Order', 'updated', 'App\\Models\\Order', 51, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:01.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:01', '2026-08-29 23:05:01'),
(877, 'Order', 'updated', 'App\\Models\\Order', 52, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:01.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:01', '2026-08-29 23:05:01'),
(878, 'Order', 'updated', 'App\\Models\\Order', 53, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:02', '2026-08-29 23:05:02'),
(879, 'Order', 'updated', 'App\\Models\\Order', 54, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:02.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:02', '2026-08-29 23:05:02'),
(880, 'Order', 'updated', 'App\\Models\\Order', 55, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:03.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:03', '2026-08-29 23:05:03'),
(881, 'Order', 'updated', 'App\\Models\\Order', 56, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:03.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:03', '2026-08-29 23:05:03'),
(882, 'Order', 'updated', 'App\\Models\\Order', 57, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:05.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:05', '2026-08-29 23:05:05'),
(883, 'Order', 'updated', 'App\\Models\\Order', 58, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:05.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:05', '2026-08-29 23:05:05'),
(884, 'Order', 'updated', 'App\\Models\\Order', 59, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:06.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:06', '2026-08-29 23:05:06'),
(885, 'Order', 'updated', 'App\\Models\\Order', 60, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:06.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:06', '2026-08-29 23:05:06'),
(886, 'Order', 'updated', 'App\\Models\\Order', 61, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:07.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:07', '2026-08-29 23:05:07'),
(887, 'Order', 'updated', 'App\\Models\\Order', 62, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:07.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:07', '2026-08-29 23:05:07'),
(888, 'Order', 'updated', 'App\\Models\\Order', 63, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:07.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:07', '2026-08-29 23:05:07'),
(889, 'Order', 'updated', 'App\\Models\\Order', 65, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:07.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:07', '2026-08-29 23:05:07'),
(890, 'Order', 'updated', 'App\\Models\\Order', 66, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:08.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:08', '2026-08-29 23:05:08'),
(891, 'Order', 'updated', 'App\\Models\\Order', 68, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:09.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:09', '2026-08-29 23:05:09'),
(892, 'Order', 'updated', 'App\\Models\\Order', 69, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:09.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:09', '2026-08-29 23:05:09'),
(893, 'Order', 'updated', 'App\\Models\\Order', 70, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:09.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:09', '2026-08-29 23:05:09'),
(894, 'Order', 'updated', 'App\\Models\\Order', 71, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:09.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:09', '2026-08-29 23:05:09'),
(895, 'Order', 'updated', 'App\\Models\\Order', 72, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:09.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:09', '2026-08-29 23:05:09'),
(896, 'Order', 'updated', 'App\\Models\\Order', 73, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:10.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:10', '2026-08-29 23:05:10'),
(897, 'Order', 'updated', 'App\\Models\\Order', 74, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:12.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:12', '2026-08-29 23:05:12'),
(898, 'Order', 'updated', 'App\\Models\\Order', 75, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:12.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:12', '2026-08-29 23:05:12'),
(899, 'Order', 'updated', 'App\\Models\\Order', 76, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:13.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:13', '2026-08-29 23:05:13'),
(900, 'Order', 'updated', 'App\\Models\\Order', 77, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:13.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:13', '2026-08-29 23:05:13'),
(901, 'Order', 'updated', 'App\\Models\\Order', 78, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:13.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:13', '2026-08-29 23:05:13'),
(902, 'Order', 'updated', 'App\\Models\\Order', 79, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:13.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:13', '2026-08-29 23:05:13'),
(903, 'Order', 'updated', 'App\\Models\\Order', 80, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:15.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:15', '2026-08-29 23:05:15'),
(904, 'Order', 'updated', 'App\\Models\\Order', 81, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:16.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:16', '2026-08-29 23:05:16'),
(905, 'Order', 'updated', 'App\\Models\\Order', 82, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:16.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:16', '2026-08-29 23:05:16'),
(906, 'Order', 'updated', 'App\\Models\\Order', 83, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"delivered\",\"delivered_at\":\"2026-08-29T23:05:16.000000Z\"},\"old\":{\"status\":\"ready\",\"delivered_at\":null}}', '[]', '2026-08-29 23:05:16', '2026-08-29 23:05:16'),
(907, 'Category', 'created', 'App\\Models\\Category', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0648\\u0647\\u064a\\u062a\\u0648\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-08-29 23:46:41', '2026-08-29 23:46:41');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `attribute_changes`, `properties`, `created_at`, `updated_at`) VALUES
(908, 'Category', 'created', 'App\\Models\\Category', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0633\\u0644\\u0627\\u0634\",\"color\":\"#16a34a\",\"sort_order\":0,\"is_active\":true}}', '[]', '2026-08-29 23:46:47', '2026-08-29 23:46:47'),
(909, 'Ingredient', 'updated', 'App\\Models\\Ingredient', 49, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0628\\u0627\\u064a\\u0633\\u0648\\u0646 \\u0635\\u063a\\u064a\\u0631\"},\"old\":{\"name\":\"\\u0628\\u0627\\u064a\\u0633\\u0648\\u0646\"}}', '[]', '2026-08-30 00:14:22', '2026-08-30 00:14:22'),
(910, 'Item', 'updated', 'App\\Models\\Item', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"8000.00\"}}', '[]', '2026-08-30 00:19:57', '2026-08-30 00:19:57'),
(911, 'Item', 'updated', 'App\\Models\\Item', 46, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"12000.00\"},\"old\":{\"price\":\"10000.00\"}}', '[]', '2026-08-30 00:21:34', '2026-08-30 00:21:34'),
(912, 'Item', 'updated', 'App\\Models\\Item', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"35000.00\"},\"old\":{\"price\":\"30000.00\"}}', '[]', '2026-08-30 00:24:12', '2026-08-30 00:24:12'),
(913, 'Item', 'updated', 'App\\Models\\Item', 44, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"30000.00\"},\"old\":{\"price\":\"25000.00\"}}', '[]', '2026-08-30 00:26:51', '2026-08-30 00:26:51'),
(914, 'Item', 'updated', 'App\\Models\\Item', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":11},\"old\":{\"category_id\":6}}', '[]', '2026-08-30 00:28:25', '2026-08-30 00:28:25'),
(915, 'Ingredient', 'created', 'App\\Models\\Ingredient', 54, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0628\\u0627\\u064a\\u0633\\u0648\\u0646 \\u0643\\u0628\\u064a\\u0631\",\"unit_id\":2,\"current_stock\":\"20.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"8000.0000\",\"is_active\":true}}', '[]', '2026-08-30 00:30:26', '2026-08-30 00:30:26'),
(916, 'Item', 'created', 'App\\Models\\Item', 51, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0628\\u0627\\u064a\\u0633\\u0648\\u0646 \\u0643\\u0628\\u064a\\u0631\",\"sku\":null,\"price\":\"12000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u0627\\u064a\\u0633\\u0648\\u0646 \\u0643\\u0628\\u064a\\u0631\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-30 00:31:45', '2026-08-30 00:31:45'),
(917, 'Ingredient', 'created', 'App\\Models\\Ingredient', 55, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0633\\u0641\\u0646 \\u0627\\u0628\",\"unit_id\":2,\"current_stock\":\"20.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"4000.0000\",\"is_active\":true}}', '[]', '2026-08-30 00:32:28', '2026-08-30 00:32:28'),
(918, 'Ingredient', 'created', 'App\\Models\\Ingredient', 56, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0628\\u0628\\u0633\\u064a\",\"unit_id\":2,\"current_stock\":\"20.000\",\"reorder_level\":\"10.000\",\"cost_per_unit\":\"4000.0000\",\"is_active\":true}}', '[]', '2026-08-30 00:32:46', '2026-08-30 00:32:46'),
(919, 'Item', 'created', 'App\\Models\\Item', 52, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0633\\u0641\\u0646 \\u0623\\u0628\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0633\\u0641\\u0646 \\u0623\\u0628\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-30 00:33:56', '2026-08-30 00:33:56'),
(920, 'Item', 'created', 'App\\Models\\Item', 53, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":6,\"name\":\"\\u0628\\u064a\\u0628\\u0633\\u064a\",\"sku\":null,\"price\":\"10000.00\",\"manual_cost\":null,\"description\":\"\\u0628\\u064a\\u0628\\u0633\\u064a\",\"image\":null,\"prep_time_minutes\":5,\"track_inventory\":true,\"is_available\":true}}', '[]', '2026-08-30 00:34:40', '2026-08-30 00:34:40'),
(921, 'Item', 'updated', 'App\\Models\\Item', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"12000.00\"},\"old\":{\"price\":\"10000.00\"}}', '[]', '2026-08-30 00:37:30', '2026-08-30 00:37:30'),
(922, 'Item', 'updated', 'App\\Models\\Item', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"12000.00\"},\"old\":{\"price\":\"10000.00\"}}', '[]', '2026-08-30 00:39:16', '2026-08-30 00:39:16'),
(923, 'Item', 'updated', 'App\\Models\\Item', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"12000.00\"},\"old\":{\"price\":\"10000.00\"}}', '[]', '2026-08-30 00:39:56', '2026-08-30 00:39:56'),
(924, 'Item', 'updated', 'App\\Models\\Item', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"price\":\"10000.00\"},\"old\":{\"price\":\"8000.00\"}}', '[]', '2026-08-30 00:41:27', '2026-08-30 00:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('cu-cache-1b228ff761e0eba73b7931d236c5603c99d29e30', 'i:1;', 1787328014),
('cu-cache-1b228ff761e0eba73b7931d236c5603c99d29e30:timer', 'i:1787328014;', 1787328014),
('cu-cache-317b3cb36c584e0d1917397c652961316a8ac8fe', 'i:1;', 1791019022),
('cu-cache-317b3cb36c584e0d1917397c652961316a8ac8fe:timer', 'i:1791019022;', 1791019022),
('cu-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:3;', 1787464205),
('cu-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1787464205;', 1787464205),
('cu-cache-369016ce2994034cb8e5589b61dcb6ed1668d333', 'i:1;', 1787636366),
('cu-cache-369016ce2994034cb8e5589b61dcb6ed1668d333:timer', 'i:1787636366;', 1787636366),
('cu-cache-5ba52b4f2d1f34bb962f2325eb0fdfc2a7713ba9', 'i:2;', 1783606663),
('cu-cache-5ba52b4f2d1f34bb962f2325eb0fdfc2a7713ba9:timer', 'i:1783606663;', 1783606663),
('cu-cache-635c4381f07f88cb1c0e37189e3b2695f6b21ff6', 'i:1;', 1791678054),
('cu-cache-635c4381f07f88cb1c0e37189e3b2695f6b21ff6:timer', 'i:1791678054;', 1791678054),
('cu-cache-6ac0b39224f5822311a7b3e893e9d9c61fb225aa', 'i:3;', 1781486960),
('cu-cache-6ac0b39224f5822311a7b3e893e9d9c61fb225aa:timer', 'i:1781486960;', 1781486960),
('cu-cache-77de68daecd823babbb58edb1c8e14d7106e83bb', 'i:1;', 1787154580),
('cu-cache-77de68daecd823babbb58edb1c8e14d7106e83bb:timer', 'i:1787154580;', 1787154580),
('cu-cache-8fa77c036dc9587a15c73a1d65619548854a25e4', 'i:1;', 1787776675),
('cu-cache-8fa77c036dc9587a15c73a1d65619548854a25e4:timer', 'i:1787776675;', 1787776675),
('cu-cache-9e1c33cd907842b792d1d39d58f7d063e11b490b', 'i:1;', 1781906350),
('cu-cache-9e1c33cd907842b792d1d39d58f7d063e11b490b:timer', 'i:1781906350;', 1781906350),
('cu-cache-a3d4221606069efc73e9ae46062aa3e576589447', 'i:1;', 1789846411),
('cu-cache-a3d4221606069efc73e9ae46062aa3e576589447:timer', 'i:1789846411;', 1789846411),
('cu-cache-abcf8280cda96c9a9ce7fe06726f6d3af34146d8', 'i:1;', 1786886664),
('cu-cache-abcf8280cda96c9a9ce7fe06726f6d3af34146d8:timer', 'i:1786886664;', 1786886664),
('cu-cache-bbfe0797d1f4bb60682d316281614a507c9bc0e2', 'i:1;', 1787322791),
('cu-cache-bbfe0797d1f4bb60682d316281614a507c9bc0e2:timer', 'i:1787322791;', 1787322791),
('cu-cache-cbf05f1e8889f0b3984d30608a2dc1ce26d4b07c', 'i:1;', 1783682233),
('cu-cache-cbf05f1e8889f0b3984d30608a2dc1ce26d4b07c:timer', 'i:1783682233;', 1783682233),
('cu-cache-e33ffbffcbc1347d68cf556961635dc182c2df61', 'i:1;', 1783620007),
('cu-cache-e33ffbffcbc1347d68cf556961635dc182c2df61:timer', 'i:1783620007;', 1783620007),
('cu-cache-e56268b1133eb734ac4b0a64dbd3a34eea065833', 'i:1;', 1788044665),
('cu-cache-e56268b1133eb734ac4b0a64dbd3a34eea065833:timer', 'i:1788044665;', 1788044665),
('cu-cache-ef05cdcb8ae69fbf6cccd7669c8cde9a0aedc405', 'i:4;', 1781644946),
('cu-cache-ef05cdcb8ae69fbf6cccd7669c8cde9a0aedc405:timer', 'i:1781644946;', 1781644946),
('cu-cache-settings.all', 'a:6:{s:10:\"brand_name\";s:2:\"CU\";s:8:\"currency\";s:5:\"ل.س\";s:5:\"phone\";s:10:\"0993386301\";s:7:\"address\";s:64:\"القامشلي.شارع القوتلي جانب المحكمة\";s:14:\"invoice_footer\";s:27:\"(: we know you\'ll come back\";s:8:\"tax_rate\";i:0;}', 2102140988),
('cu-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:18:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:16:\"access dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:12:\"manage users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:12:\"manage roles\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:15:\"manage settings\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:15:\"view audit logs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:7:\"use pos\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:15:\"apply discounts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:13:\"manage shifts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:12:\"view kitchen\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:19:\"update order status\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:3;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:11:\"manage menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:16:\"manage inventory\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:16:\"manage suppliers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:16:\"manage purchases\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:5;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:17:\"manage accounting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:15:\"manage expenses\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:12:\"view reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:14:\"export reports\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}}s:5:\"roles\";a:5:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:8:\"مدير\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:10:\"محاسب\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"كاشير\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:8:\"مطبخ\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:23:\"مسؤول المخزن\";s:1:\"c\";s:3:\"web\";}}}', 1791764395);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(20) NOT NULL DEFAULT '#16a34a',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`, `sort_order`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', '#16a34a', 0, 1, '2026-07-10 10:57:58', '2026-07-10 11:17:38', '2026-07-10 11:17:38'),
(3, 'Re-born Conditioner1', '#16a34a', 0, 1, '2026-07-10 11:19:47', '2026-07-26 23:42:32', '2026-07-26 23:42:32'),
(4, 'برغر', '#16a34a', 0, 1, '2026-07-27 00:24:56', '2026-07-27 00:24:56', NULL),
(5, 'سلطات', '#16a34a', 0, 1, '2026-07-27 00:25:05', '2026-07-27 00:25:05', NULL),
(6, 'مشروبات باردة', '#16a34a', 0, 1, '2026-07-27 00:25:18', '2026-07-27 00:25:18', NULL),
(7, 'مشروبات ساخنة', '#16a34a', 0, 1, '2026-07-27 00:25:28', '2026-07-27 00:25:28', NULL),
(8, 'ميلك شيك', '#16a34a', 0, 1, '2026-07-27 00:25:36', '2026-07-27 00:25:36', NULL),
(9, 'اراكيل', '#16a34a', 0, 1, '2026-07-27 00:25:43', '2026-07-27 00:25:43', NULL),
(10, 'سفريات', '#16a34a', 0, 1, '2026-08-12 01:39:08', '2026-08-12 01:39:08', NULL),
(11, 'موهيتو', '#16a34a', 0, 1, '2026-08-29 23:46:41', '2026-08-29 23:46:41', NULL),
(12, 'سلاش', '#16a34a', 0, 1, '2026-08-29 23:46:47', '2026-08-29 23:46:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL DEFAULT 'cash',
  `spent_at` date NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'مشتريات', 1, '2026-08-16 22:41:40', '2026-08-16 22:41:40'),
(2, 'رواتب', 1, '2026-08-16 22:41:46', '2026-08-16 22:41:46'),
(3, 'اجار', 1, '2026-08-16 22:42:01', '2026-08-16 22:42:01'),
(4, 'أخرى', 1, '2026-08-16 22:44:03', '2026-08-16 22:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `current_stock` decimal(14,3) NOT NULL DEFAULT 0.000,
  `reorder_level` decimal(14,3) NOT NULL DEFAULT 0.000,
  `cost_per_unit` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit_id`, `current_stock`, `reorder_level`, `cost_per_unit`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 1, 0.000, 0.000, 11.0000, 0, '2026-07-10 11:13:26', '2026-08-17 23:54:14', '2026-08-17 23:54:14'),
(2, 'test', 1, 0.000, 0.003, 0.0000, 0, '2026-07-10 11:19:36', '2026-08-17 23:54:04', '2026-08-17 23:54:04'),
(3, 'حاملة كاسات ثنائية', 2, 3000.000, 500.000, 2400.0000, 1, '2026-07-26 23:50:46', '2026-08-11 00:26:43', NULL),
(4, 'حاملة كاسات احادية', 2, 2399.000, 1000.000, 1750.0000, 1, '2026-07-26 23:51:54', '2026-08-25 06:31:11', NULL),
(5, 'كاسة قهوة', 2, 4980.000, 1500.000, 1550.0000, 1, '2026-07-26 23:55:14', '2026-08-24 08:31:23', NULL),
(6, 'كاسة عصير', 2, 957.000, 500.000, 1800.0000, 1, '2026-07-26 23:57:49', '2026-08-25 06:13:17', NULL),
(7, 'علبة بركر', 2, 3000.000, 750.000, 2200.0000, 1, '2026-07-27 00:00:59', '2026-07-27 00:01:51', '2026-07-27 00:01:51'),
(8, 'علبة بركر', 2, 2986.000, 750.000, 2400.0000, 1, '2026-07-27 00:00:59', '2026-08-26 20:44:48', NULL),
(9, 'صحن سلطة', 2, 747.000, 500.000, 1900.0000, 1, '2026-07-27 00:04:01', '2026-08-26 20:45:29', NULL),
(10, 'شلمونة', 2, 2462.000, 750.000, 350.0000, 1, '2026-07-27 00:10:46', '2026-08-24 09:58:44', NULL),
(11, 'شوكة', 2, 1993.000, 750.000, 350.0000, 1, '2026-07-27 00:11:34', '2026-08-25 06:13:17', NULL),
(12, 'كاسة شاي', 2, 2795.000, 1000.000, 1700.0000, 1, '2026-07-27 00:15:52', '2026-08-24 08:31:23', NULL),
(13, 'كيس سيو سفري', 2, 2000.000, 1000.000, 3700.0000, 1, '2026-07-27 00:17:10', '2026-08-11 00:28:39', NULL),
(14, 'بطيخ', 3, 50.750, 4.000, 4000.0000, 1, '2026-08-11 21:58:31', '2026-08-26 20:45:29', NULL),
(15, 'جبن بلدي', 3, 21.870, 1.000, 60000.0000, 1, '2026-08-11 21:59:02', '2026-08-22 06:05:27', NULL),
(16, 'عسل', 3, 3.200, 1.000, 100000.0000, 1, '2026-08-11 22:01:33', '2026-08-26 20:45:29', NULL),
(17, 'ثلج', 3, -0.100, 2.000, 7000.0000, 1, '2026-08-11 22:02:25', '2026-08-24 09:58:44', NULL),
(18, 'سيروب بطيخ', 3, 1.000, 0.500, 90000.0000, 1, '2026-08-11 22:03:02', '2026-08-16 23:43:11', NULL),
(19, 'عصير برتقال', 6, 0.750, 1.500, 27000.0000, 1, '2026-08-11 22:04:15', '2026-08-23 07:28:27', NULL),
(20, 'عصير ليمون', 6, 1.500, 1.500, 67000.0000, 1, '2026-08-11 22:05:52', '2026-08-22 11:29:06', NULL),
(21, 'صودا ليمون', 2, 23.500, 10.000, 5000.0000, 1, '2026-08-11 22:06:23', '2026-08-24 09:58:44', NULL),
(22, 'موز', 3, 10.000, 3.000, 15000.0000, 1, '2026-08-11 22:06:48', '2026-08-16 23:45:53', NULL),
(23, 'حليب ظرف', 2, 5.000, 2.000, 15000.0000, 1, '2026-08-11 22:08:14', '2026-08-16 15:29:37', NULL),
(24, 'قهوة اسبرسو', 3, 0.955, 0.500, 180000.0000, 1, '2026-08-11 22:08:55', '2026-08-22 05:42:48', NULL),
(25, 'قهوة تركي', 3, 3.260, 0.500, 110000.0000, 1, '2026-08-11 22:09:31', '2026-08-24 08:31:23', NULL),
(26, 'كابتشينو ظرف', 2, 14.000, 10.000, 3000.0000, 1, '2026-08-11 22:11:36', '2026-08-24 08:31:23', NULL),
(27, 'ميلو', 3, 2.000, 0.500, 112500.0000, 1, '2026-08-11 22:17:07', '2026-08-16 23:46:37', NULL),
(28, 'شاي اخضر', 2, 28.000, 10.000, 1300.0000, 1, '2026-08-11 22:20:10', '2026-08-24 07:26:46', NULL),
(29, 'شاي ظرف', 2, 699.000, 10.000, 500.0000, 1, '2026-08-11 22:21:44', '2026-08-24 07:25:04', NULL),
(30, 'شاي هشام بالكيلو', 3, 2.200, 1.000, 150000.0000, 1, '2026-08-11 22:33:31', '2026-08-22 12:10:13', NULL),
(31, 'زنجبيل ظرف', 2, 20.000, 10.000, 1300.0000, 1, '2026-08-11 22:34:06', '2026-08-11 22:34:06', NULL),
(32, 'جبنة مشلل', 3, 5.000, 1.000, 65000.0000, 1, '2026-08-11 22:35:03', '2026-08-16 21:33:07', NULL),
(33, 'كابتشينو بالكيلو', 3, 0.500, 0.500, 70000.0000, 1, '2026-08-11 22:35:33', '2026-08-16 23:45:03', NULL),
(34, 'سكر', 3, 7.780, 1.000, 20000.0000, 1, '2026-08-11 22:36:18', '2026-08-24 07:25:04', NULL),
(35, 'نسكافيه بالكيلو', 3, 0.200, 0.500, 200000.0000, 1, '2026-08-11 22:37:52', '2026-08-23 11:11:39', NULL),
(36, 'حليب سائل', 6, 6.000, 1.000, 50000.0000, 1, '2026-08-11 22:40:07', '2026-08-16 23:42:28', NULL),
(37, 'جبنة حلوم', 3, 3.700, 1.000, 80000.0000, 1, '2026-08-14 23:32:33', '2026-08-26 20:45:29', NULL),
(38, 'كاكاو', 3, 0.980, 0.500, 200000.0000, 1, '2026-08-16 23:57:39', '2026-08-19 16:46:07', NULL),
(39, 'جزر', 3, 2.950, 1.000, 15000.0000, 1, '2026-08-17 23:26:00', '2026-08-21 17:26:26', NULL),
(40, 'معسل لوف', 3, 0.958, 0.250, 500000.0000, 1, '2026-08-17 23:35:57', '2026-08-19 16:54:58', NULL),
(41, 'معسل شكلس', 3, 1.000, 0.250, 500000.0000, 1, '2026-08-17 23:36:41', '2026-08-17 23:42:12', NULL),
(42, 'معسل بولو', 3, 0.958, 0.250, 500000.0000, 1, '2026-08-17 23:37:06', '2026-08-22 12:39:59', NULL),
(43, 'معسل تفاحتين - مزايا', 3, 0.958, 0.250, 500000.0000, 1, '2026-08-17 23:37:39', '2026-08-25 08:45:36', NULL),
(44, 'معسل تفاحتين - فاخر', 3, 0.944, 0.250, 500000.0000, 1, '2026-08-17 23:38:03', '2026-08-23 11:09:39', NULL),
(45, 'معسل تفاحتين - نخلة', 3, 0.902, 0.250, 500000.0000, 1, '2026-08-17 23:38:52', '2026-08-24 07:25:04', NULL),
(46, 'معسل علك ونعناع', 3, 1.000, 0.250, 500000.0000, 1, '2026-08-17 23:39:37', '2026-08-17 23:41:34', NULL),
(47, 'ماء', 2, -11.000, 10.000, 1500.0000, 1, '2026-08-18 00:08:11', '2026-08-25 08:45:36', NULL),
(48, 'صودا سادة', 2, 29.000, 12.000, 5000.0000, 1, '2026-08-18 10:06:51', '2026-08-22 14:04:36', NULL),
(49, 'بايسون صغير', 2, 13.000, 12.000, 6000.0000, 1, '2026-08-18 10:07:14', '2026-08-30 00:14:22', NULL),
(50, 'كمون وليمون ظرف', 2, 30.000, 10.000, 2500.0000, 1, '2026-08-18 10:07:41', '2026-08-18 10:07:41', NULL),
(51, 'زنجبيل وعسل ظرف', 2, 30.000, 12.000, 2500.0000, 1, '2026-08-18 10:08:43', '2026-08-18 10:08:43', NULL),
(52, 'زنجبيل وليمون ظرف', 2, 30.000, 12.000, 2500.0000, 1, '2026-08-18 10:09:08', '2026-08-18 10:09:08', NULL),
(53, 'زهورات ظرف', 2, 30.000, 12.000, 2500.0000, 1, '2026-08-18 10:09:30', '2026-08-18 10:09:30', NULL),
(54, 'بايسون كبير', 2, 20.000, 10.000, 8000.0000, 1, '2026-08-30 00:30:26', '2026-08-30 00:30:26', NULL),
(55, 'سفن اب', 2, 20.000, 10.000, 4000.0000, 1, '2026-08-30 00:32:28', '2026-08-30 00:32:28', NULL),
(56, 'ببسي', 2, 20.000, 10.000, 4000.0000, 1, '2026-08-30 00:32:46', '2026-08-30 00:32:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `manual_cost` decimal(12,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `prep_time_minutes` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `track_inventory` tinyint(1) NOT NULL DEFAULT 1,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `name`, `sku`, `price`, `manual_cost`, `description`, `image`, `prep_time_minutes`, `track_inventory`, `is_available`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 4, 'برغر بلدي بالعسل', NULL, 30000.00, NULL, 'بطيخ, جبنة بلدي, نعناع وعسل', NULL, 5, 1, 1, '2026-08-11 22:45:57', '2026-08-11 22:45:57', NULL),
(4, 4, 'برغر سادة', NULL, 20000.00, NULL, 'بطيخ, نعناع وعسل', NULL, 5, 1, 1, '2026-08-11 22:49:47', '2026-08-11 22:49:47', NULL),
(5, 5, 'سلطة بلدي', NULL, 30000.00, NULL, 'بطيخ, جبن بلدي, نعناع وعسل', NULL, 5, 1, 1, '2026-08-11 22:52:53', '2026-08-11 22:52:53', NULL),
(6, 5, 'سلطة مشلل', NULL, 30000.00, NULL, 'بطيخ, جبنة مشللة, نعناع وعسل', NULL, 5, 1, 1, '2026-08-11 22:56:15', '2026-08-11 22:56:15', NULL),
(7, 5, 'سادة عالسكين', NULL, 20000.00, NULL, 'بطيخ وعسل', NULL, 5, 1, 1, '2026-08-11 22:58:06', '2026-08-11 22:58:06', NULL),
(8, 6, 'عصير بطيخ', NULL, 25000.00, NULL, 'بطيخ وثلج', NULL, 5, 1, 1, '2026-08-11 23:04:47', '2026-08-16 22:58:40', NULL),
(9, 6, 'عصير برتقال', NULL, 25000.00, NULL, 'برتقال وثلج', NULL, 5, 1, 1, '2026-08-12 00:43:04', '2026-08-12 00:43:04', NULL),
(10, 11, 'موهيتو بطيخ', NULL, 30000.00, NULL, 'بطيخ, ليمون, مياه غازية, نعناع وثلج', NULL, 5, 1, 1, '2026-08-12 00:47:13', '2026-08-30 00:28:25', NULL),
(11, 6, 'كوكتيل موز وحليب', NULL, 35000.00, NULL, 'موز, حليب وثلج', NULL, 5, 1, 1, '2026-08-12 00:50:49', '2026-08-30 00:24:12', NULL),
(12, 6, 'ايس امريكانو', NULL, 25000.00, NULL, 'اسبرسو, ماء وثلج', NULL, 5, 1, 1, '2026-08-12 00:56:34', '2026-08-12 00:56:34', NULL),
(13, 6, 'ايس لاتيه', NULL, 35000.00, NULL, 'اسبرسو, حليب وثلج', NULL, 5, 1, 1, '2026-08-12 01:00:52', '2026-08-12 01:00:52', NULL),
(14, 7, 'قهوة تركية', NULL, 12000.00, NULL, 'بن مطحون', NULL, 5, 1, 1, '2026-08-12 01:04:02', '2026-08-30 00:39:16', NULL),
(15, 7, 'أسبرسو', NULL, 10000.00, NULL, 'قهوة اسبرسو', NULL, 5, 1, 1, '2026-08-12 01:06:03', '2026-08-14 23:25:29', NULL),
(16, 7, 'شاي', NULL, 8000.00, NULL, NULL, NULL, 5, 1, 1, '2026-08-12 01:09:59', '2026-08-14 23:23:34', NULL),
(17, 7, 'حليب', NULL, 10000.00, NULL, 'حليب ساخن', NULL, 5, 1, 1, '2026-08-12 01:15:45', '2026-08-12 01:15:45', NULL),
(18, 7, 'امريكانو', NULL, 12000.00, NULL, 'شوت اسبرسو وماء ساخن', NULL, 5, 1, 1, '2026-08-12 01:17:43', '2026-08-30 00:37:30', NULL),
(19, 7, 'شاي بحليب', NULL, 10000.00, NULL, 'شاي وحليب', NULL, 5, 1, 1, '2026-08-12 01:22:28', '2026-08-14 23:27:49', NULL),
(20, 7, 'شاي اخضر', NULL, 10000.00, NULL, 'شاي اخضر ساخن', NULL, 5, 1, 1, '2026-08-12 01:24:18', '2026-08-16 23:01:55', NULL),
(21, 7, 'كابتشينو', NULL, 10000.00, NULL, 'كابتشينو ساخن', NULL, 5, 1, 1, '2026-08-12 01:28:05', '2026-08-16 23:05:10', NULL),
(22, 7, 'نسكافيه', NULL, 10000.00, NULL, 'نسكافيه ساخن', NULL, 5, 1, 1, '2026-08-12 01:30:28', '2026-08-30 00:41:27', NULL),
(23, 7, 'ميلو', NULL, 10000.00, NULL, 'ميلو ساخن', NULL, 5, 1, 1, '2026-08-12 01:31:31', '2026-08-12 01:31:31', NULL),
(24, 7, 'قهوة بحليب', NULL, 15000.00, NULL, 'قهوة و حليب', NULL, 5, 1, 1, '2026-08-12 01:34:27', '2026-08-12 01:34:27', NULL),
(25, 7, 'كابتشينو ايطالي', NULL, 12000.00, NULL, 'كابتشينو ايطالي ساخن', NULL, 5, 1, 1, '2026-08-12 01:36:34', '2026-08-30 00:39:56', NULL),
(26, 7, 'زنجبيل', NULL, 10000.00, NULL, 'زنجبيل ساخن', NULL, 5, 1, 1, '2026-08-12 01:38:34', '2026-08-12 01:38:34', NULL),
(27, 10, 'حاملة كاسات ثنائية', NULL, 0.00, NULL, 'حاملة كاسات ثنائية', NULL, 5, 1, 1, '2026-08-12 01:40:11', '2026-08-12 01:40:11', NULL),
(28, 10, 'حاملة كاسات احادية', NULL, 0.00, NULL, 'حاملة كاسات احادية', NULL, 5, 1, 1, '2026-08-12 01:41:42', '2026-08-12 01:41:42', NULL),
(29, 10, 'كيس سيو سفري', NULL, 0.00, NULL, 'كيس سيو سفري', NULL, 5, 1, 1, '2026-08-12 01:43:20', '2026-08-12 01:43:20', NULL),
(30, 4, 'برغر حلوم بالعسل', NULL, 35000.00, NULL, 'بطيخ, جبنة حلوم, نعناع وعسل', NULL, 5, 1, 1, '2026-08-14 23:34:44', '2026-08-16 21:35:20', NULL),
(31, 5, 'سلطة حلوم', NULL, 35000.00, NULL, 'بطيخ, جبنة حلوم, نعناع وعسل', NULL, 5, 1, 1, '2026-08-14 23:36:46', '2026-08-16 21:52:18', NULL),
(32, 7, 'هوت جوكليت', NULL, 12000.00, NULL, 'شوكولا ساخنة', NULL, 5, 1, 1, '2026-08-16 23:59:03', '2026-08-16 23:59:03', NULL),
(33, 7, 'ابريق شاي', NULL, 30000.00, NULL, 'ابريق شاي', NULL, 5, 1, 1, '2026-08-17 23:45:15', '2026-08-17 23:45:15', NULL),
(34, 9, 'اركيلة لوف', NULL, 25000.00, NULL, 'بطعم لوف', NULL, 5, 1, 1, '2026-08-17 23:49:15', '2026-08-17 23:49:15', NULL),
(35, 9, 'اركيلة شكلس', NULL, 25000.00, NULL, 'بطعم علكة شكلس', NULL, 5, 1, 1, '2026-08-17 23:50:13', '2026-08-17 23:50:13', NULL),
(36, 9, 'اركيلة بولو', NULL, 25000.00, NULL, 'بطعم البولو', NULL, 5, 1, 1, '2026-08-17 23:50:44', '2026-08-17 23:50:44', NULL),
(37, 9, 'اركيلة تفاحتين - مزايا', NULL, 25000.00, NULL, 'بطعم تفاحتين مزايا', NULL, 5, 1, 1, '2026-08-17 23:52:02', '2026-08-17 23:52:02', NULL),
(38, 9, 'اركيلة تفاحتين - فاخر', NULL, 25000.00, NULL, 'بطعم تفاحتين فاخر', NULL, 5, 1, 1, '2026-08-17 23:52:28', '2026-08-17 23:52:28', NULL),
(39, 9, 'اركيلة تفاحتين - نخلة', NULL, 25000.00, NULL, 'بطعم تفاحتين نخلة', NULL, 5, 1, 1, '2026-08-17 23:53:09', '2026-08-17 23:53:09', NULL),
(40, 9, 'اركيلة علك ونعناع', NULL, 25000.00, NULL, 'بطعم علك ونعناع', NULL, 5, 1, 1, '2026-08-17 23:53:36', '2026-08-17 23:53:36', NULL),
(41, 6, 'ماء', NULL, 3000.00, NULL, 'ماء', NULL, 5, 1, 1, '2026-08-18 00:08:46', '2026-08-18 00:08:46', NULL),
(42, 6, 'بولو', NULL, 25000.00, NULL, 'ليمون ونعناع', NULL, 5, 1, 1, '2026-08-18 00:16:08', '2026-08-18 00:16:08', NULL),
(43, 6, 'بايسون', NULL, 10000.00, NULL, 'بايسون بارد', NULL, 5, 1, 1, '2026-08-18 10:11:32', '2026-08-18 10:11:32', NULL),
(44, 6, 'مكسيكي', NULL, 30000.00, NULL, 'مكسيكي', NULL, 5, 1, 1, '2026-08-18 10:13:18', '2026-08-30 00:26:51', NULL),
(45, 6, 'صودا سادة', NULL, 10000.00, NULL, 'صودا سادة', NULL, 5, 1, 1, '2026-08-18 10:17:33', '2026-08-30 00:19:57', NULL),
(46, 6, 'صودا ليمون', NULL, 12000.00, NULL, 'صودا ليمون', NULL, 5, 1, 1, '2026-08-18 10:19:58', '2026-08-30 00:21:34', NULL),
(47, 7, 'كمون وليمون', NULL, 10000.00, NULL, 'كمون وليمون', NULL, 5, 1, 1, '2026-08-18 13:40:13', '2026-08-18 13:40:13', NULL),
(48, 7, 'زنجبيل وعسل', NULL, 10000.00, NULL, 'زنجبيل وعسل', NULL, 5, 1, 1, '2026-08-18 13:40:56', '2026-08-18 13:40:56', NULL),
(49, 7, 'زنجبيل وليمون', NULL, 10000.00, NULL, 'زنجبيل وليمون', NULL, 5, 1, 1, '2026-08-18 13:41:51', '2026-08-18 13:41:51', NULL),
(50, 7, 'زهورات', NULL, 10000.00, NULL, 'زهورات', NULL, 5, 1, 1, '2026-08-18 13:42:50', '2026-08-18 13:42:50', NULL),
(51, 6, 'بايسون كبير', NULL, 12000.00, NULL, 'بايسون كبير', NULL, 5, 1, 1, '2026-08-30 00:31:45', '2026-08-30 00:31:45', NULL),
(52, 6, 'سفن أب', NULL, 10000.00, NULL, 'سفن أب', NULL, 5, 1, 1, '2026-08-30 00:33:56', '2026-08-30 00:33:56', NULL),
(53, 6, 'بيبسي', NULL, 10000.00, NULL, 'بيبسي', NULL, 5, 1, 1, '2026-08-30 00:34:40', '2026-08-30 00:34:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_05_28_225358_create_activity_log_table', 1),
(5, '2026_05_28_225358_create_permission_tables', 1),
(6, '2026_05_29_000001_create_settings_table', 1),
(7, '2026_05_29_000002_create_categories_table', 1),
(8, '2026_05_29_000003_create_units_table', 1),
(9, '2026_05_29_000004_create_suppliers_table', 1),
(10, '2026_05_29_000005_create_ingredients_table', 1),
(11, '2026_05_29_000006_create_items_table', 1),
(12, '2026_05_29_000007_create_recipe_items_table', 1),
(13, '2026_05_29_000008_create_purchases_table', 1),
(14, '2026_05_29_000009_create_purchase_items_table', 1),
(15, '2026_05_29_000010_create_stock_movements_table', 1),
(16, '2026_05_29_000011_create_shifts_table', 1),
(17, '2026_05_29_000012_create_orders_table', 1),
(18, '2026_05_29_000013_create_order_items_table', 1),
(19, '2026_05_29_000014_create_expense_categories_table', 1),
(20, '2026_05_29_000015_create_expenses_table', 1),
(21, '2026_05_29_000016_create_transactions_table', 1),
(22, '2026_05_29_000017_create_notifications_table', 1),
(23, '2026_06_14_000001_create_tables_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0a1138c4-e917-4d91-9f67-e3c54492c644', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 -2.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
('0a6d89f1-c947-453d-8cd4-3f1fa26063ac', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
('0d763384-b508-4772-a96d-c8d65d6cf8b7', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 6.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 10:44:05', '2026-08-23 10:44:05'),
('16e81d28-3434-45d2-b621-25156af4355b', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 2.000 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
('1a353b5f-fe47-4181-9a42-e416ca1d1ab4', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.500 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
('1b9701e0-d442-4f60-b8b0-61cc3b2af851', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 -8.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
('22469124-62b6-414e-bea4-a2507468ea6d', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.470 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
('232c148f-88b1-417d-8132-0a5ad835e4a7', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.600 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
('272cd8cf-a928-408c-92c0-e7797f83d77e', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 -5.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
('44d2a1ba-796a-4640-a13a-f1832329cd5e', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.380 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
('52d89f67-1426-4418-a243-09a89152b2e0', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.300 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
('5570816e-87d8-4950-8770-7f3e3f0ef95f', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 -6.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
('55a8cff6-d08d-497e-b149-ba5425c1ccb6', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.395 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
('582c9a84-d0bc-4a37-9c8c-34feffc37169', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.400 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
('5f98f8df-d560-4b86-b481-4376f87ba6e9', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 1.800 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
('5fbe1a80-694f-44f0-a12c-cbea7ecf1a01', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.335 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
('6b51a207-6094-403c-8df4-7873feb26687', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.500 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
('9d5ac471-86f6-4367-9f41-ff6da8da1755', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 1.500 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
('9e88e448-e0c9-48dd-b90e-67867c730797', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 1.200 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
('a1b3c508-bd98-4438-9046-6577f94de8ec', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.100 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
('a66f3fc2-dcd7-40d6-bca8-ab438dcf9ad0', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 -1.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
('b64ade0c-314e-43e9-a8b2-3cab235e82fd', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 -10.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
('bd7484d8-56aa-4a4a-8fe4-0e25cd2542ba', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0645\\u0627\\u0621\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 3.000 \\u0642\\u0637\\u0639\\u0629.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
('cbe5758e-783e-4d54-a882-c20858b9bf8e', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.900 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
('e28351e7-358a-4dd9-94ca-3bba6974e066', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0646\\u0633\\u0643\\u0627\\u0641\\u064a\\u0647 \\u0628\\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 0.215 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
('e7c4f314-9d69-44a3-8842-96065cee4987', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0639\\u0635\\u064a\\u0631 \\u0628\\u0631\\u062a\\u0642\\u0627\\u0644\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 1.500 \\u0644\\u062a\\u0631.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
('e98facb8-9771-4ae0-9d65-7dc6c8f9df88', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u062b\\u0644\\u062c\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 1.600 \\u0643\\u064a\\u0644\\u0648.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
('f38a83ad-6825-41b7-a5b8-eb2611d670b2', 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 1, '{\"title\":\"\\u062a\\u0646\\u0628\\u064a\\u0647: \\u0645\\u062e\\u0632\\u0648\\u0646 \\u0645\\u0646\\u062e\\u0641\\u0636\",\"message\":\"\\u0627\\u0644\\u0645\\u0643\\u0648\\u0651\\u0646 \\u00ab\\u0639\\u0635\\u064a\\u0631 \\u0628\\u0631\\u062a\\u0642\\u0627\\u0644\\u00bb \\u0648\\u0635\\u0644 \\u0625\\u0644\\u0649 1.000 \\u0644\\u062a\\u0631.\",\"type\":\"warning\",\"url\":\"https:\\/\\/aliceblue-crane-922209.hostingersite.com\\/ingredients\",\"icon\":\"box\"}', NULL, '2026-08-23 07:28:27', '2026-08-23 07:28:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'dine_in',
  `status` varchar(255) NOT NULL DEFAULT 'new',
  `customer_name` varchar(255) DEFAULT NULL,
  `subtotal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `item_discount_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` decimal(14,2) NOT NULL DEFAULT 0.00,
  `order_discount_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `discount_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cost_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `profit` decimal(14,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(255) NOT NULL DEFAULT 'cash',
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `prepared_at` timestamp NULL DEFAULT NULL,
  `ready_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `invoice_number`, `user_id`, `shift_id`, `table_id`, `type`, `status`, `customer_name`, `subtotal`, `item_discount_total`, `discount_type`, `discount_value`, `order_discount_amount`, `discount_total`, `total`, `cost_total`, `profit`, `payment_method`, `is_paid`, `notes`, `prepared_at`, `ready_at`, `delivered_at`, `cancelled_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(25, '20260821-0001', 'CU-20260821-8138D2', 1, NULL, 7, 'dine_in', 'delivered', NULL, 135000.00, 0.00, NULL, 0.00, 0.00, 0.00, 135000.00, 39100.00, 95900.00, 'cash', 1, NULL, NULL, NULL, '2026-08-21 17:34:23', NULL, '2026-08-21 17:25:44', '2026-08-21 17:34:23', NULL),
(26, '20260821-0002', 'CU-20260821-A676D1', 1, NULL, 11, 'dine_in', 'delivered', NULL, 40000.00, 0.00, NULL, 0.00, 0.00, 0.00, 40000.00, 10200.00, 29800.00, 'cash', 1, NULL, NULL, NULL, '2026-08-21 17:35:01', NULL, '2026-08-21 17:26:02', '2026-08-21 17:35:01', NULL),
(27, '20260821-0003', 'CU-20260821-9EB17D', 1, NULL, 16, 'dine_in', 'cancelled', NULL, 75000.00, 0.00, NULL, 0.00, 0.00, 0.00, 75000.00, 21000.00, 54000.00, 'cash', 0, NULL, NULL, NULL, '2026-08-21 17:35:43', '2026-08-21 17:36:11', '2026-08-21 17:28:25', '2026-08-21 17:36:11', NULL),
(28, '20260822-0001', 'CU-20260822-8A4A75', 2, NULL, 6, 'dine_in', 'delivered', NULL, 10000.00, 0.00, NULL, 0.00, 0.00, 0.00, 10000.00, 4250.00, 5750.00, 'cash', 1, NULL, NULL, NULL, '2026-08-22 05:52:49', NULL, '2026-08-22 05:42:48', '2026-08-22 05:52:49', NULL),
(29, '20260822-0002', 'CU-20260822-100EAA', 2, NULL, NULL, 'dine_in', 'cancelled', NULL, 30000.00, 0.00, NULL, 0.00, 0.00, 0.00, 30000.00, 8100.00, 21900.00, 'cash', 0, NULL, NULL, NULL, NULL, '2026-08-22 06:05:27', '2026-08-22 05:53:05', '2026-08-22 06:05:27', NULL),
(30, '20260822-0003', 'CU-20260822-09E49E', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 5100.00, 14900.00, 'cash', 1, NULL, '2026-08-29 23:03:56', '2026-08-29 23:03:59', '2026-08-29 23:04:01', NULL, '2026-08-22 06:29:52', '2026-08-29 23:04:01', NULL),
(31, '20260822-0004', 'CU-20260822-1A34DD', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 4850.00, 15150.00, 'cash', 1, NULL, '2026-08-29 23:03:57', '2026-08-29 23:03:59', '2026-08-29 23:04:02', NULL, '2026-08-22 06:30:41', '2026-08-29 23:04:02', NULL),
(32, '20260822-0005', 'CU-20260822-9D5D60', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 4850.00, 15150.00, 'cash', 1, NULL, '2026-08-29 23:03:57', '2026-08-29 23:03:59', '2026-08-29 23:04:02', NULL, '2026-08-22 08:13:45', '2026-08-29 23:04:02', NULL),
(33, '20260822-0006', 'CU-20260822-3C68C5', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 30000.00, 0.00, NULL, 0.00, 0.00, 0.00, 30000.00, 9600.00, 20400.00, 'cash', 1, NULL, '2026-08-29 23:03:57', '2026-08-29 23:03:59', '2026-08-29 23:04:02', NULL, '2026-08-22 09:19:47', '2026-08-29 23:04:02', NULL),
(34, '20260822-0007', 'CU-20260822-715E95', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 25000.00, 0.00, NULL, 0.00, 0.00, 0.00, 25000.00, 7000.00, 18000.00, 'cash', 1, NULL, '2026-08-29 23:03:57', '2026-08-29 23:04:00', '2026-08-29 23:04:02', NULL, '2026-08-22 09:46:47', '2026-08-29 23:04:02', NULL),
(35, '20260822-0008', 'CU-20260822-90D73A', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 25000.00, 0.00, 'percent', 5.00, 1250.00, 1250.00, 23750.00, 7000.00, 16750.00, 'cash', 1, NULL, '2026-08-29 23:03:57', '2026-08-29 23:04:00', '2026-08-29 23:04:02', NULL, '2026-08-22 09:48:57', '2026-08-29 23:04:02', NULL),
(36, '20260822-0009', 'CU-20260822-B0B227', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 50000.00, 0.00, 'percent', 100.00, 50000.00, 50000.00, 0.00, 14000.00, -14000.00, 'cash', 1, NULL, '2026-08-29 23:03:57', '2026-08-29 23:04:00', '2026-08-29 23:04:02', NULL, '2026-08-22 09:50:03', '2026-08-29 23:04:02', NULL),
(37, '20260822-0010', 'CU-20260822-B8B17E', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 25000.00, 0.00, 'percent', 100.00, 25000.00, 25000.00, 0.00, 7000.00, -7000.00, 'cash', 1, NULL, '2026-08-29 23:03:57', '2026-08-29 23:04:00', '2026-08-29 23:04:02', NULL, '2026-08-22 09:50:35', '2026-08-29 23:04:02', NULL),
(38, '20260822-0011', 'CU-20260822-0A3F8F', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 25000.00, 0.00, 'percent', 100.00, 25000.00, 25000.00, 0.00, 7000.00, -7000.00, 'cash', 1, NULL, '2026-08-29 23:03:58', '2026-08-29 23:04:00', '2026-08-29 23:04:03', NULL, '2026-08-22 09:51:12', '2026-08-29 23:04:03', NULL),
(39, '20260822-0012', 'CU-20260822-D4611A', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 50000.00, 0.00, NULL, 0.00, 0.00, 0.00, 50000.00, 19200.00, 30800.00, 'cash', 1, NULL, '2026-08-29 23:03:58', '2026-08-29 23:04:11', '2026-08-29 23:04:18', NULL, '2026-08-22 10:25:33', '2026-08-29 23:04:18', NULL),
(40, '20260822-0013', 'CU-20260822-2B1C3D', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 60000.00, 0.00, NULL, 0.00, 0.00, 0.00, 60000.00, 49450.00, 10550.00, 'cash', 0, NULL, '2026-08-29 23:04:04', '2026-08-29 23:04:13', '2026-08-29 23:04:19', NULL, '2026-08-22 11:29:06', '2026-08-29 23:04:19', NULL),
(41, '20260822-0014', 'CU-20260822-CCEC65', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 17700.00, 2300.00, 'cash', 0, NULL, '2026-08-29 23:04:05', '2026-08-29 23:04:13', '2026-08-29 23:04:20', NULL, '2026-08-22 11:29:16', '2026-08-29 23:04:20', NULL),
(42, '20260822-0015', 'CU-20260822-106521', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 17700.00, 2300.00, 'cash', 0, NULL, '2026-08-29 23:04:05', '2026-08-29 23:04:15', '2026-08-29 23:04:21', NULL, '2026-08-22 11:29:37', '2026-08-29 23:04:21', NULL),
(43, '20260822-0016', 'CU-20260822-B2F027', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 17700.00, 2300.00, 'cash', 1, NULL, '2026-08-29 23:04:05', '2026-08-29 23:04:15', '2026-08-29 23:04:21', NULL, '2026-08-22 11:30:19', '2026-08-29 23:04:21', NULL),
(44, '20260822-0017', 'CU-20260822-050FF9', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 50000.00, 0.00, NULL, 0.00, 0.00, 0.00, 50000.00, 19200.00, 30800.00, 'cash', 1, NULL, '2026-08-29 23:04:05', '2026-08-29 23:04:16', '2026-08-29 23:04:21', NULL, '2026-08-22 11:31:28', '2026-08-29 23:04:21', NULL),
(45, '20260822-0018', 'CU-20260822-637EA7', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 66000.00, 0.00, NULL, 0.00, 0.00, 0.00, 66000.00, 15700.00, 50300.00, 'cash', 1, NULL, '2026-08-29 23:04:06', '2026-08-29 23:04:16', '2026-08-29 23:04:21', NULL, '2026-08-22 11:34:14', '2026-08-29 23:04:21', NULL),
(46, '20260822-0019', 'CU-20260822-0F0AA0', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 91000.00, 0.00, NULL, 0.00, 0.00, 0.00, 91000.00, 22700.00, 68300.00, 'cash', 1, NULL, '2026-08-29 23:04:07', '2026-08-29 23:04:16', '2026-08-29 23:04:22', NULL, '2026-08-22 11:48:00', '2026-08-29 23:04:22', NULL),
(47, '20260822-0020', 'CU-20260822-6C7AC8', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 10000.00, 0.00, NULL, 0.00, 0.00, 0.00, 10000.00, 8850.00, 1150.00, 'cash', 1, NULL, '2026-08-29 23:04:09', '2026-08-29 23:04:17', '2026-08-29 23:04:23', NULL, '2026-08-22 12:07:50', '2026-08-29 23:04:23', NULL),
(48, '20260822-0021', 'CU-20260822-529FB0', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 106000.00, 0.00, NULL, 0.00, 0.00, 0.00, 106000.00, 36050.00, 69950.00, 'cash', 1, NULL, '2026-08-29 23:04:09', '2026-08-29 23:04:18', '2026-08-29 23:04:23', NULL, '2026-08-22 12:10:13', '2026-08-29 23:04:23', NULL),
(49, '20260822-0022', 'CU-20260822-04FE3D', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 36000.00, 0.00, NULL, 0.00, 0.00, 0.00, 36000.00, 29550.00, 6450.00, 'cash', 1, NULL, '2026-08-29 23:04:11', '2026-08-29 23:04:41', '2026-08-29 23:05:00', NULL, '2026-08-22 12:26:08', '2026-08-29 23:05:00', NULL),
(50, '20260822-0023', 'CU-20260822-B8AD5E', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 101000.00, 0.00, NULL, 0.00, 0.00, 0.00, 101000.00, 31550.00, 69450.00, 'cash', 1, NULL, '2026-08-29 23:04:24', '2026-08-29 23:04:42', '2026-08-29 23:05:00', NULL, '2026-08-22 12:38:35', '2026-08-29 23:05:00', NULL),
(51, '20260822-0024', 'CU-20260822-FB8EEE', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 41000.00, 0.00, NULL, 0.00, 0.00, 0.00, 41000.00, 18850.00, 22150.00, 'cash', 1, NULL, '2026-08-29 23:04:25', '2026-08-29 23:04:42', '2026-08-29 23:05:01', NULL, '2026-08-22 12:39:59', '2026-08-29 23:05:01', NULL),
(52, '20260822-0025', 'CU-20260822-4A5DAC', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 29000.00, 0.00, NULL, 0.00, 0.00, 0.00, 29000.00, 15550.00, 13450.00, 'card', 1, NULL, '2026-08-29 23:04:25', '2026-08-29 23:04:43', '2026-08-29 23:05:01', NULL, '2026-08-22 14:04:36', '2026-08-29 23:05:01', NULL),
(53, '20260823-0001', 'CU-20260823-BBAF1D', 1, NULL, NULL, 'dine_in', 'delivered', NULL, 35000.00, 0.00, NULL, 0.00, 0.00, 0.00, 35000.00, 9100.00, 25900.00, 'cash', 1, NULL, '2026-08-29 23:04:26', '2026-08-29 23:04:44', '2026-08-29 23:05:02', NULL, '2026-08-23 05:49:31', '2026-08-29 23:05:02', NULL),
(54, '20260823-0002', 'CU-20260823-424988', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 4850.00, 15150.00, 'cash', 1, NULL, '2026-08-29 23:04:27', '2026-08-29 23:04:44', '2026-08-29 23:05:02', NULL, '2026-08-23 05:56:52', '2026-08-29 23:05:02', NULL),
(55, '20260823-0003', 'CU-20260823-EF21CF', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 48000.00, 0.00, NULL, 0.00, 0.00, 0.00, 48000.00, 21800.00, 26200.00, 'cash', 1, NULL, '2026-08-29 23:04:28', '2026-08-29 23:04:45', '2026-08-29 23:05:03', NULL, '2026-08-23 06:14:22', '2026-08-29 23:05:03', NULL),
(56, '20260823-0004', 'CU-20260823-A91DC4', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 26000.00, 0.00, NULL, 0.00, 0.00, 0.00, 26000.00, 12400.00, 13600.00, 'cash', 1, NULL, '2026-08-29 23:04:28', '2026-08-29 23:04:45', '2026-08-29 23:05:03', NULL, '2026-08-23 07:11:54', '2026-08-29 23:05:03', NULL),
(57, '20260823-0005', 'CU-20260823-BD4FA3', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 116000.00, 0.00, NULL, 0.00, 0.00, 0.00, 116000.00, 53200.00, 62800.00, 'cash', 1, NULL, '2026-08-29 23:04:28', '2026-08-29 23:04:46', '2026-08-29 23:05:05', NULL, '2026-08-23 07:28:27', '2026-08-29 23:05:05', NULL),
(58, '20260823-0006', 'CU-20260823-853082', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 24000.00, 0.00, NULL, 0.00, 0.00, 0.00, 24000.00, 10900.00, 13100.00, 'cash', 1, NULL, '2026-08-29 23:04:29', '2026-08-29 23:04:47', '2026-08-29 23:05:05', NULL, '2026-08-23 07:53:44', '2026-08-29 23:05:05', NULL),
(59, '20260823-0007', 'CU-20260823-67D11F', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 46000.00, 0.00, NULL, 0.00, 0.00, 0.00, 46000.00, 23300.00, 22700.00, 'cash', 1, NULL, '2026-08-29 23:04:30', '2026-08-29 23:04:47', '2026-08-29 23:05:06', NULL, '2026-08-23 08:27:18', '2026-08-29 23:05:06', NULL),
(60, '20260823-0008', 'CU-20260823-6CA0EE', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 64000.00, 0.00, NULL, 0.00, 0.00, 0.00, 64000.00, 37600.00, 26400.00, 'cash', 1, NULL, '2026-08-29 23:04:30', '2026-08-29 23:04:47', '2026-08-29 23:05:06', NULL, '2026-08-23 09:13:26', '2026-08-29 23:05:06', NULL),
(61, '20260823-0009', 'CU-20260823-7F106D', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 24000.00, 0.00, NULL, 0.00, 0.00, 0.00, 24000.00, 12000.00, 12000.00, 'cash', 1, NULL, '2026-08-29 23:04:31', '2026-08-29 23:04:48', '2026-08-29 23:05:07', NULL, '2026-08-23 09:15:03', '2026-08-29 23:05:07', NULL),
(62, '20260823-0010', 'CU-20260823-4E6A8C', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 39000.00, 0.00, NULL, 0.00, 0.00, 0.00, 39000.00, 14100.00, 24900.00, 'cash', 1, NULL, '2026-08-29 23:04:31', '2026-08-29 23:04:49', '2026-08-29 23:05:07', NULL, '2026-08-23 10:44:04', '2026-08-29 23:05:07', NULL),
(63, '20260823-0011', 'CU-20260823-A90586', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 39000.00, 0.00, NULL, 0.00, 0.00, 0.00, 39000.00, 18600.00, 20400.00, 'cash', 1, NULL, '2026-08-29 23:04:31', '2026-08-29 23:04:49', '2026-08-29 23:05:07', NULL, '2026-08-23 10:49:30', '2026-08-29 23:05:07', NULL),
(64, '20260823-0012', 'CU-20260823-229937', 2, NULL, 5, 'dine_in', 'delivered', NULL, 28000.00, 0.00, NULL, 0.00, 0.00, 0.00, 28000.00, 8500.00, 19500.00, 'cash', 1, NULL, NULL, NULL, '2026-08-23 11:01:36', NULL, '2026-08-23 11:01:22', '2026-08-23 11:01:36', NULL),
(65, '20260823-0013', 'CU-20260823-F5B02B', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 28000.00, 0.00, NULL, 0.00, 0.00, 0.00, 28000.00, 8500.00, 19500.00, 'cash', 1, NULL, '2026-08-29 23:04:31', '2026-08-29 23:04:49', '2026-08-29 23:05:07', NULL, '2026-08-23 11:02:07', '2026-08-29 23:05:07', NULL),
(66, '20260823-0014', 'CU-20260823-19FB8A', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 39000.00, 0.00, NULL, 0.00, 0.00, 0.00, 39000.00, 25400.00, 13600.00, 'cash', 1, NULL, '2026-08-29 23:04:31', '2026-08-29 23:04:50', '2026-08-29 23:05:08', NULL, '2026-08-23 11:06:41', '2026-08-29 23:05:08', NULL),
(67, '20260823-0015', 'CU-20260823-3CF4BE', 2, NULL, 5, 'dine_in', 'delivered', NULL, 25000.00, 0.00, NULL, 0.00, 0.00, 0.00, 25000.00, 7000.00, 18000.00, 'cash', 1, NULL, NULL, NULL, '2026-08-23 11:09:53', NULL, '2026-08-23 11:09:39', '2026-08-23 11:09:53', NULL),
(68, '20260823-0016', 'CU-20260823-B8F25D', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 8000.00, 0.00, NULL, 0.00, 0.00, 0.00, 8000.00, 4700.00, 3300.00, 'cash', 1, NULL, '2026-08-29 23:04:32', '2026-08-29 23:04:50', '2026-08-29 23:05:09', NULL, '2026-08-23 11:11:39', '2026-08-29 23:05:09', NULL),
(69, '20260823-0017', 'CU-20260823-4CBA99', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 28000.00, 0.00, NULL, 0.00, 0.00, 0.00, 28000.00, 8500.00, 19500.00, 'cash', 1, NULL, '2026-08-29 23:04:33', '2026-08-29 23:04:51', '2026-08-29 23:05:09', NULL, '2026-08-23 11:13:40', '2026-08-29 23:05:09', NULL),
(70, '20260823-0018', 'CU-20260823-F8F054', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 25000.00, 0.00, NULL, 0.00, 0.00, 0.00, 25000.00, 7000.00, 18000.00, 'cash', 1, NULL, '2026-08-29 23:04:34', '2026-08-29 23:04:52', '2026-08-29 23:05:09', NULL, '2026-08-23 11:24:15', '2026-08-29 23:05:09', NULL),
(71, '20260824-0001', 'CU-20260824-0A4289', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 33000.00, 0.00, NULL, 0.00, 0.00, 0.00, 33000.00, 9600.00, 23400.00, 'cash', 1, NULL, '2026-08-29 23:04:34', '2026-08-29 23:04:52', '2026-08-29 23:05:09', NULL, '2026-08-24 07:25:04', '2026-08-29 23:05:09', NULL),
(72, '20260824-0002', 'CU-20260824-5043B2', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 10000.00, 0.00, NULL, 0.00, 0.00, 0.00, 10000.00, 3000.00, 7000.00, 'cash', 1, NULL, '2026-08-29 23:04:35', '2026-08-29 23:04:54', '2026-08-29 23:05:09', NULL, '2026-08-24 07:25:41', '2026-08-29 23:05:09', NULL),
(73, '20260824-0003', 'CU-20260824-63306B', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 10000.00, 0.00, NULL, 0.00, 0.00, 0.00, 10000.00, 3000.00, 7000.00, 'cash', 1, NULL, '2026-08-29 23:04:35', '2026-08-29 23:04:55', '2026-08-29 23:05:10', NULL, '2026-08-24 07:26:46', '2026-08-29 23:05:10', NULL),
(74, '20260824-0004', 'CU-20260824-B78158', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 26000.00, 0.00, NULL, 0.00, 0.00, 0.00, 26000.00, 10900.00, 15100.00, 'cash', 1, NULL, '2026-08-29 23:04:36', '2026-08-29 23:04:55', '2026-08-29 23:05:12', NULL, '2026-08-24 08:31:23', '2026-08-29 23:05:12', NULL),
(75, '20260824-0005', 'CU-20260824-4BD6A0', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 91000.00, 0.00, NULL, 0.00, 0.00, 0.00, 91000.00, 22700.00, 68300.00, 'cash', 1, NULL, '2026-08-29 23:04:36', '2026-08-29 23:04:55', '2026-08-29 23:05:12', NULL, '2026-08-24 09:58:44', '2026-08-29 23:05:12', NULL),
(76, '20260825-0001', 'CU-20260825-A35BF0', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 5100.00, 14900.00, 'cash', 1, NULL, '2026-08-29 23:04:37', '2026-08-29 23:04:57', '2026-08-29 23:05:13', NULL, '2026-08-25 05:38:34', '2026-08-29 23:05:13', NULL),
(77, '20260825-0002', 'CU-20260825-9297EF', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 5100.00, 14900.00, 'cash', 1, NULL, '2026-08-29 23:04:37', '2026-08-29 23:04:57', '2026-08-29 23:05:13', NULL, '2026-08-25 06:12:41', '2026-08-29 23:05:13', NULL),
(78, '20260825-0003', 'CU-20260825-DEF5C0', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 4850.00, 15150.00, 'cash', 1, NULL, '2026-08-29 23:04:37', '2026-08-29 23:04:57', '2026-08-29 23:05:13', NULL, '2026-08-25 06:13:17', '2026-08-29 23:05:13', NULL),
(79, '20260825-0004', 'CU-20260825-FE27FE', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 1750.00, -1750.00, 'cash', 1, NULL, '2026-08-29 23:04:37', '2026-08-29 23:04:57', '2026-08-29 23:05:13', NULL, '2026-08-25 06:31:11', '2026-08-29 23:05:13', NULL),
(80, '20260825-0005', 'CU-20260825-0840FC', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 28000.00, 0.00, NULL, 0.00, 0.00, 0.00, 28000.00, 8500.00, 19500.00, 'cash', 1, NULL, '2026-08-29 23:04:38', '2026-08-29 23:04:58', '2026-08-29 23:05:15', NULL, '2026-08-25 08:45:36', '2026-08-29 23:05:15', NULL),
(81, '20260826-0001', 'CU-20260826-0EA2E2', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 20000.00, 0.00, NULL, 0.00, 0.00, 0.00, 20000.00, 5100.00, 14900.00, 'cash', 1, NULL, '2026-08-29 23:04:39', '2026-08-29 23:04:58', '2026-08-29 23:05:16', NULL, '2026-08-26 20:37:04', '2026-08-29 23:05:16', NULL),
(82, '20260826-0002', 'CU-20260826-0C3693', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 35000.00, 0.00, NULL, 0.00, 0.00, 0.00, 35000.00, 9100.00, 25900.00, 'cash', 1, NULL, '2026-08-29 23:04:39', '2026-08-29 23:04:59', '2026-08-29 23:05:16', NULL, '2026-08-26 20:44:48', '2026-08-29 23:05:16', NULL),
(83, '20260826-0003', 'CU-20260826-8F1817', 2, NULL, NULL, 'dine_in', 'delivered', NULL, 35000.00, 0.00, NULL, 0.00, 0.00, 0.00, 35000.00, 8600.00, 26400.00, 'cash', 1, NULL, '2026-08-29 23:04:41', '2026-08-29 23:04:59', '2026-08-29 23:05:16', NULL, '2026-08-26 20:45:28', '2026-08-29 23:05:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `unit_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `line_subtotal` decimal(14,2) NOT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` decimal(12,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `net_total` decimal(14,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `name`, `unit_price`, `unit_cost`, `quantity`, `line_subtotal`, `discount_type`, `discount_value`, `discount_amount`, `net_total`, `notes`, `created_at`, `updated_at`) VALUES
(29, 25, 30, 'برغر حلوم بالعسل', 35000.00, 9100.00, 2, 70000.00, NULL, 0.00, 0.00, 70000.00, NULL, '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(30, 26, 4, 'برغر سادة', 20000.00, 5100.00, 2, 40000.00, NULL, 0.00, 0.00, 40000.00, NULL, '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(31, 25, 44, 'مكسيكي', 25000.00, 10300.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(32, 25, 10, 'موهيتو بطيخ', 30000.00, 6350.00, 1, 30000.00, NULL, 0.00, 0.00, 30000.00, NULL, '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(33, 25, 15, 'أسبرسو', 10000.00, 4250.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(34, 27, 39, 'اركيلة تفاحتين - نخلة', 25000.00, 7000.00, 2, 50000.00, NULL, 0.00, 0.00, 50000.00, NULL, '2026-08-21 17:28:25', '2026-08-21 17:28:25'),
(35, 27, 37, 'اركيلة تفاحتين - مزايا', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-21 17:28:32', '2026-08-21 17:28:32'),
(36, 28, 15, 'أسبرسو', 10000.00, 4250.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-22 05:42:48', '2026-08-22 05:42:48'),
(37, 29, 3, 'برغر بلدي بالعسل', 30000.00, 8100.00, 1, 30000.00, NULL, 0.00, 0.00, 30000.00, NULL, '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(38, 30, 4, 'برغر سادة', 20000.00, 5100.00, 1, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(39, 31, 7, 'سادة عالسكين', 20000.00, 4850.00, 1, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(40, 32, 7, 'سادة عالسكين', 20000.00, 4850.00, 1, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(41, 33, 14, 'قهوة تركية', 10000.00, 3200.00, 3, 30000.00, NULL, 0.00, 0.00, 30000.00, NULL, '2026-08-22 09:19:47', '2026-08-22 09:19:47'),
(42, 34, 37, 'اركيلة تفاحتين - مزايا', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-22 09:46:47', '2026-08-22 09:46:47'),
(43, 35, 38, 'اركيلة تفاحتين - فاخر', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-22 09:48:57', '2026-08-22 09:48:57'),
(44, 36, 39, 'اركيلة تفاحتين - نخلة', 25000.00, 7000.00, 2, 50000.00, NULL, 0.00, 0.00, 50000.00, NULL, '2026-08-22 09:50:03', '2026-08-22 09:50:03'),
(45, 37, 38, 'اركيلة تفاحتين - فاخر', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-22 09:50:35', '2026-08-22 09:50:35'),
(46, 38, 38, 'اركيلة تفاحتين - فاخر', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-22 09:51:12', '2026-08-22 09:51:12'),
(47, 39, 9, 'عصير برتقال', 25000.00, 9600.00, 2, 50000.00, NULL, 0.00, 0.00, 50000.00, NULL, '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(48, 40, 42, 'بولو', 25000.00, 20300.00, 2, 50000.00, NULL, 0.00, 0.00, 50000.00, NULL, '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(49, 40, 43, 'بايسون', 10000.00, 8850.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(50, 41, 43, 'بايسون', 10000.00, 8850.00, 2, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(51, 42, 43, 'بايسون', 10000.00, 8850.00, 2, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(52, 43, 43, 'بايسون', 10000.00, 8850.00, 2, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(53, 44, 9, 'عصير برتقال', 25000.00, 9600.00, 2, 50000.00, NULL, 0.00, 0.00, 50000.00, NULL, '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(54, 45, 10, 'موهيتو بطيخ', 30000.00, 6350.00, 2, 60000.00, NULL, 0.00, 0.00, 60000.00, NULL, '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(55, 45, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(56, 46, 10, 'موهيتو بطيخ', 30000.00, 6350.00, 2, 60000.00, NULL, 0.00, 0.00, 60000.00, NULL, '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(57, 46, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(58, 46, 36, 'اركيلة بولو', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(59, 47, 43, 'بايسون', 10000.00, 8850.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(60, 48, 10, 'موهيتو بطيخ', 30000.00, 6350.00, 2, 60000.00, NULL, 0.00, 0.00, 60000.00, NULL, '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(61, 48, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(62, 48, 33, 'ابريق شاي', 30000.00, 11500.00, 1, 30000.00, NULL, 0.00, 0.00, 30000.00, NULL, '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(63, 48, 43, 'بايسون', 10000.00, 8850.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(64, 49, 43, 'بايسون', 10000.00, 8850.00, 3, 30000.00, NULL, 0.00, 0.00, 30000.00, NULL, '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(65, 49, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(66, 50, 10, 'موهيتو بطيخ', 30000.00, 6350.00, 2, 60000.00, NULL, 0.00, 0.00, 60000.00, NULL, '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(67, 50, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(68, 50, 36, 'اركيلة بولو', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(69, 50, 43, 'بايسون', 10000.00, 8850.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(70, 51, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(71, 51, 36, 'اركيلة بولو', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(72, 51, 43, 'بايسون', 10000.00, 8850.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(73, 52, 41, 'ماء', 3000.00, 1500.00, 3, 9000.00, NULL, 0.00, 0.00, 9000.00, NULL, '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(74, 52, 46, 'صودا ليمون', 10000.00, 7850.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(75, 52, 14, 'قهوة تركية', 10000.00, 3200.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(76, 53, 30, 'برغر حلوم بالعسل', 35000.00, 9100.00, 1, 35000.00, NULL, 0.00, 0.00, 35000.00, NULL, '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(77, 54, 7, 'سادة عالسكين', 20000.00, 4850.00, 1, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(78, 55, 14, 'قهوة تركية', 10000.00, 3200.00, 2, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(79, 55, 22, 'نسكافيه', 8000.00, 4700.00, 2, 16000.00, NULL, 0.00, 0.00, 16000.00, NULL, '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(80, 55, 41, 'ماء', 3000.00, 1500.00, 4, 12000.00, NULL, 0.00, 0.00, 12000.00, NULL, '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(81, 56, 25, 'كابتشينو ايطالي', 10000.00, 4700.00, 2, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(82, 56, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(83, 57, 41, 'ماء', 3000.00, 1500.00, 7, 21000.00, NULL, 0.00, 0.00, 21000.00, NULL, '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(84, 57, 9, 'عصير برتقال', 25000.00, 9600.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(85, 57, 14, 'قهوة تركية', 10000.00, 3200.00, 3, 30000.00, NULL, 0.00, 0.00, 30000.00, NULL, '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(86, 57, 22, 'نسكافيه', 8000.00, 4700.00, 5, 40000.00, NULL, 0.00, 0.00, 40000.00, NULL, '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(87, 58, 14, 'قهوة تركية', 10000.00, 3200.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(88, 58, 22, 'نسكافيه', 8000.00, 4700.00, 1, 8000.00, NULL, 0.00, 0.00, 8000.00, NULL, '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(89, 58, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(90, 59, 41, 'ماء', 3000.00, 1500.00, 4, 12000.00, NULL, 0.00, 0.00, 12000.00, NULL, '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(91, 59, 14, 'قهوة تركية', 10000.00, 3200.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(92, 59, 22, 'نسكافيه', 8000.00, 4700.00, 3, 24000.00, NULL, 0.00, 0.00, 24000.00, NULL, '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(93, 60, 22, 'نسكافيه', 8000.00, 4700.00, 8, 64000.00, NULL, 0.00, 0.00, 64000.00, NULL, '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
(94, 61, 41, 'ماء', 3000.00, 1500.00, 8, 24000.00, NULL, 0.00, 0.00, 24000.00, NULL, '2026-08-23 09:15:03', '2026-08-23 09:15:03'),
(95, 62, 41, 'ماء', 3000.00, 1500.00, 3, 9000.00, NULL, 0.00, 0.00, 9000.00, NULL, '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(96, 62, 14, 'قهوة تركية', 10000.00, 3200.00, 3, 30000.00, NULL, 0.00, 0.00, 30000.00, NULL, '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(97, 63, 25, 'كابتشينو ايطالي', 10000.00, 4700.00, 3, 30000.00, NULL, 0.00, 0.00, 30000.00, NULL, '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(98, 63, 41, 'ماء', 3000.00, 1500.00, 3, 9000.00, NULL, 0.00, 0.00, 9000.00, NULL, '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(99, 64, 39, 'اركيلة تفاحتين - نخلة', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
(100, 64, 41, 'ماء', 3000.00, 1500.00, 1, 3000.00, NULL, 0.00, 0.00, 3000.00, NULL, '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
(101, 65, 39, 'اركيلة تفاحتين - نخلة', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(102, 65, 41, 'ماء', 3000.00, 1500.00, 1, 3000.00, NULL, 0.00, 0.00, 3000.00, NULL, '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(103, 66, 41, 'ماء', 3000.00, 1500.00, 3, 9000.00, NULL, 0.00, 0.00, 9000.00, NULL, '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(104, 66, 43, 'بايسون', 10000.00, 8850.00, 2, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(105, 66, 14, 'قهوة تركية', 10000.00, 3200.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(106, 67, 38, 'اركيلة تفاحتين - فاخر', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-23 11:09:39', '2026-08-23 11:09:39'),
(107, 68, 22, 'نسكافيه', 8000.00, 4700.00, 1, 8000.00, NULL, 0.00, 0.00, 8000.00, NULL, '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
(108, 69, 39, 'اركيلة تفاحتين - نخلة', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(109, 69, 41, 'ماء', 3000.00, 1500.00, 1, 3000.00, NULL, 0.00, 0.00, 3000.00, NULL, '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(110, 70, 39, 'اركيلة تفاحتين - نخلة', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-23 11:24:15', '2026-08-23 11:24:15'),
(111, 71, 39, 'اركيلة تفاحتين - نخلة', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(112, 71, 16, 'شاي', 8000.00, 2600.00, 1, 8000.00, NULL, 0.00, 0.00, 8000.00, NULL, '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(113, 72, 20, 'شاي اخضر', 10000.00, 3000.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-24 07:25:41', '2026-08-24 07:25:41'),
(114, 73, 20, 'شاي اخضر', 10000.00, 3000.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-24 07:26:46', '2026-08-24 07:26:46'),
(115, 74, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(116, 74, 25, 'كابتشينو ايطالي', 10000.00, 4700.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(117, 74, 14, 'قهوة تركية', 10000.00, 3200.00, 1, 10000.00, NULL, 0.00, 0.00, 10000.00, NULL, '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(118, 75, 41, 'ماء', 3000.00, 1500.00, 2, 6000.00, NULL, 0.00, 0.00, 6000.00, NULL, '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(119, 75, 37, 'اركيلة تفاحتين - مزايا', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(120, 75, 10, 'موهيتو بطيخ', 30000.00, 6350.00, 2, 60000.00, NULL, 0.00, 0.00, 60000.00, NULL, '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(121, 76, 4, 'برغر سادة', 20000.00, 5100.00, 1, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(122, 77, 4, 'برغر سادة', 20000.00, 5100.00, 1, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(123, 78, 7, 'سادة عالسكين', 20000.00, 4850.00, 1, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-25 06:13:17', '2026-08-25 06:13:17'),
(124, 79, 28, 'حاملة كاسات احادية', 0.00, 1750.00, 1, 0.00, NULL, 0.00, 0.00, 0.00, NULL, '2026-08-25 06:31:11', '2026-08-25 06:31:11'),
(125, 80, 41, 'ماء', 3000.00, 1500.00, 1, 3000.00, NULL, 0.00, 0.00, 3000.00, NULL, '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(126, 80, 37, 'اركيلة تفاحتين - مزايا', 25000.00, 7000.00, 1, 25000.00, NULL, 0.00, 0.00, 25000.00, NULL, '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(127, 81, 4, 'برغر سادة', 20000.00, 5100.00, 1, 20000.00, NULL, 0.00, 0.00, 20000.00, NULL, '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(128, 82, 30, 'برغر حلوم بالعسل', 35000.00, 9100.00, 1, 35000.00, NULL, 0.00, 0.00, 35000.00, NULL, '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(129, 83, 31, 'سلطة حلوم', 35000.00, 8600.00, 1, 35000.00, NULL, 0.00, 0.00, 35000.00, NULL, '2026-08-26 20:45:28', '2026-08-26 20:45:28');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'access dashboard', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(2, 'manage users', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(3, 'manage roles', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(4, 'manage settings', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(5, 'view audit logs', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(6, 'use pos', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(7, 'apply discounts', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(8, 'manage shifts', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(9, 'view kitchen', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(10, 'update order status', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(11, 'manage menu', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(12, 'manage inventory', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(13, 'manage suppliers', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(14, 'manage purchases', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(15, 'manage accounting', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(16, 'manage expenses', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(17, 'view reports', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(18, 'export reports', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `purchased_at` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `ingredient_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(14,3) NOT NULL,
  `unit_cost` decimal(14,4) NOT NULL,
  `total` decimal(14,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_items`
--

CREATE TABLE `recipe_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `ingredient_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(14,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_items`
--

INSERT INTO `recipe_items` (`id`, `item_id`, `ingredient_id`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 3, 8, 1.000, '2026-08-11 22:45:57', '2026-08-11 22:45:57'),
(4, 3, 14, 0.300, '2026-08-11 22:45:57', '2026-08-11 22:45:57'),
(5, 3, 15, 0.050, '2026-08-11 22:45:57', '2026-08-11 22:45:57'),
(6, 3, 16, 0.015, '2026-08-11 22:45:57', '2026-08-11 22:45:57'),
(7, 4, 14, 0.300, '2026-08-11 22:49:47', '2026-08-11 22:49:47'),
(8, 4, 16, 0.015, '2026-08-11 22:49:47', '2026-08-11 22:49:47'),
(9, 4, 8, 1.000, '2026-08-11 22:49:47', '2026-08-11 22:49:47'),
(10, 5, 9, 1.000, '2026-08-11 22:52:53', '2026-08-11 22:52:53'),
(11, 5, 11, 1.000, '2026-08-11 22:52:53', '2026-08-11 22:52:53'),
(12, 5, 14, 0.300, '2026-08-11 22:52:53', '2026-08-11 22:52:53'),
(13, 5, 15, 0.030, '2026-08-11 22:52:53', '2026-08-11 22:52:53'),
(14, 5, 16, 0.015, '2026-08-11 22:52:53', '2026-08-11 22:52:53'),
(15, 6, 9, 1.000, '2026-08-11 22:56:15', '2026-08-11 22:56:15'),
(16, 6, 11, 1.000, '2026-08-11 22:56:15', '2026-08-11 22:56:15'),
(17, 6, 14, 0.300, '2026-08-11 22:56:15', '2026-08-11 22:56:15'),
(18, 6, 32, 0.050, '2026-08-11 22:56:15', '2026-08-11 22:56:15'),
(19, 6, 16, 0.015, '2026-08-11 22:56:15', '2026-08-11 22:56:15'),
(20, 7, 6, 1.000, '2026-08-11 22:58:06', '2026-08-11 22:58:06'),
(21, 7, 11, 1.000, '2026-08-11 22:58:06', '2026-08-11 22:58:06'),
(22, 7, 14, 0.300, '2026-08-11 22:58:06', '2026-08-11 22:58:06'),
(23, 7, 16, 0.015, '2026-08-11 22:58:06', '2026-08-11 22:58:06'),
(34, 9, 19, 0.250, '2026-08-12 00:43:04', '2026-08-12 00:43:04'),
(35, 9, 6, 1.000, '2026-08-12 00:43:04', '2026-08-12 00:43:04'),
(36, 9, 10, 1.000, '2026-08-12 00:43:04', '2026-08-12 00:43:04'),
(37, 9, 17, 0.100, '2026-08-12 00:43:04', '2026-08-12 00:43:04'),
(49, 12, 6, 1.000, '2026-08-12 00:56:34', '2026-08-12 00:56:34'),
(50, 12, 10, 1.000, '2026-08-12 00:56:34', '2026-08-12 00:56:34'),
(51, 12, 24, 0.030, '2026-08-12 00:56:34', '2026-08-12 00:56:34'),
(52, 12, 17, 0.100, '2026-08-12 00:56:34', '2026-08-12 00:56:34'),
(53, 13, 6, 1.000, '2026-08-12 01:00:52', '2026-08-12 01:00:52'),
(54, 13, 10, 1.000, '2026-08-12 01:00:52', '2026-08-12 01:00:52'),
(55, 13, 24, 0.030, '2026-08-12 01:00:52', '2026-08-12 01:00:52'),
(56, 13, 36, 0.250, '2026-08-12 01:00:52', '2026-08-12 01:00:52'),
(57, 13, 17, 0.100, '2026-08-12 01:00:52', '2026-08-12 01:00:52'),
(67, 17, 23, 0.200, '2026-08-12 01:15:45', '2026-08-12 01:15:45'),
(68, 17, 12, 1.000, '2026-08-12 01:15:45', '2026-08-12 01:15:45'),
(69, 17, 34, 0.015, '2026-08-12 01:15:45', '2026-08-12 01:15:45'),
(85, 23, 12, 1.000, '2026-08-12 01:31:31', '2026-08-12 01:31:31'),
(86, 23, 27, 0.020, '2026-08-12 01:31:31', '2026-08-12 01:31:31'),
(87, 24, 12, 1.000, '2026-08-12 01:34:27', '2026-08-12 01:34:27'),
(88, 24, 25, 0.015, '2026-08-12 01:34:27', '2026-08-12 01:34:27'),
(89, 24, 23, 0.200, '2026-08-12 01:34:27', '2026-08-12 01:34:27'),
(92, 26, 31, 1.000, '2026-08-12 01:38:34', '2026-08-12 01:38:34'),
(93, 26, 12, 1.000, '2026-08-12 01:38:34', '2026-08-12 01:38:34'),
(94, 26, 34, 0.015, '2026-08-12 01:38:34', '2026-08-12 01:38:34'),
(95, 27, 3, 1.000, '2026-08-12 01:40:11', '2026-08-12 01:40:11'),
(96, 28, 4, 1.000, '2026-08-12 01:41:42', '2026-08-12 01:41:42'),
(97, 29, 13, 1.000, '2026-08-12 01:43:20', '2026-08-12 01:43:20'),
(98, 16, 12, 1.000, '2026-08-14 23:23:34', '2026-08-14 23:23:34'),
(99, 16, 29, 1.000, '2026-08-14 23:23:34', '2026-08-14 23:23:34'),
(100, 16, 34, 0.020, '2026-08-14 23:23:34', '2026-08-14 23:23:34'),
(103, 15, 5, 1.000, '2026-08-14 23:25:29', '2026-08-14 23:25:29'),
(104, 15, 24, 0.015, '2026-08-14 23:25:29', '2026-08-14 23:25:29'),
(107, 19, 12, 1.000, '2026-08-14 23:27:49', '2026-08-14 23:27:49'),
(108, 19, 23, 0.200, '2026-08-14 23:27:49', '2026-08-14 23:27:49'),
(109, 19, 29, 1.000, '2026-08-14 23:27:49', '2026-08-14 23:27:49'),
(129, 30, 8, 1.000, '2026-08-16 21:43:24', '2026-08-16 21:43:24'),
(130, 30, 14, 0.300, '2026-08-16 21:43:24', '2026-08-16 21:43:24'),
(131, 30, 16, 0.015, '2026-08-16 21:43:24', '2026-08-16 21:43:24'),
(132, 30, 37, 0.050, '2026-08-16 21:43:24', '2026-08-16 21:43:24'),
(133, 31, 9, 1.000, '2026-08-16 21:52:18', '2026-08-16 21:52:18'),
(134, 31, 14, 0.300, '2026-08-16 21:52:18', '2026-08-16 21:52:18'),
(135, 31, 16, 0.015, '2026-08-16 21:52:18', '2026-08-16 21:52:18'),
(136, 31, 37, 0.050, '2026-08-16 21:52:18', '2026-08-16 21:52:18'),
(137, 8, 6, 1.000, '2026-08-16 22:58:40', '2026-08-16 22:58:40'),
(138, 8, 10, 1.000, '2026-08-16 22:58:40', '2026-08-16 22:58:40'),
(139, 8, 14, 0.300, '2026-08-16 22:58:40', '2026-08-16 22:58:40'),
(140, 8, 17, 0.100, '2026-08-16 22:58:40', '2026-08-16 22:58:40'),
(141, 8, 18, 0.010, '2026-08-16 22:58:40', '2026-08-16 22:58:40'),
(148, 20, 12, 1.000, '2026-08-16 23:01:55', '2026-08-16 23:01:55'),
(149, 20, 28, 1.000, '2026-08-16 23:01:55', '2026-08-16 23:01:55'),
(150, 21, 12, 1.000, '2026-08-16 23:05:10', '2026-08-16 23:05:10'),
(151, 21, 33, 0.020, '2026-08-16 23:05:10', '2026-08-16 23:05:10'),
(152, 21, 34, 0.010, '2026-08-16 23:05:10', '2026-08-16 23:05:10'),
(155, 32, 12, 1.000, '2026-08-16 23:59:03', '2026-08-16 23:59:03'),
(156, 32, 38, 0.020, '2026-08-16 23:59:03', '2026-08-16 23:59:03'),
(157, 33, 30, 0.050, '2026-08-17 23:45:15', '2026-08-17 23:45:15'),
(158, 33, 34, 0.200, '2026-08-17 23:45:15', '2026-08-17 23:45:15'),
(159, 34, 40, 0.014, '2026-08-17 23:49:15', '2026-08-17 23:49:15'),
(160, 35, 41, 0.014, '2026-08-17 23:50:13', '2026-08-17 23:50:13'),
(161, 36, 42, 0.014, '2026-08-17 23:50:44', '2026-08-17 23:50:44'),
(162, 37, 43, 0.014, '2026-08-17 23:52:02', '2026-08-17 23:52:02'),
(163, 38, 44, 0.014, '2026-08-17 23:52:28', '2026-08-17 23:52:28'),
(164, 39, 45, 0.014, '2026-08-17 23:53:09', '2026-08-17 23:53:09'),
(165, 40, 46, 0.014, '2026-08-17 23:53:36', '2026-08-17 23:53:36'),
(166, 41, 47, 1.000, '2026-08-18 00:08:46', '2026-08-18 00:08:46'),
(178, 42, 6, 1.000, '2026-08-18 10:14:19', '2026-08-18 10:14:19'),
(179, 42, 20, 0.250, '2026-08-18 10:14:19', '2026-08-18 10:14:19'),
(180, 42, 17, 0.200, '2026-08-18 10:14:19', '2026-08-18 10:14:19'),
(181, 42, 10, 1.000, '2026-08-18 10:14:19', '2026-08-18 10:14:19'),
(182, 43, 6, 1.000, '2026-08-18 10:15:25', '2026-08-18 10:15:25'),
(183, 43, 17, 0.100, '2026-08-18 10:15:25', '2026-08-18 10:15:25'),
(184, 43, 49, 1.000, '2026-08-18 10:15:25', '2026-08-18 10:15:25'),
(185, 43, 10, 1.000, '2026-08-18 10:15:25', '2026-08-18 10:15:25'),
(197, 47, 12, 1.000, '2026-08-18 13:40:13', '2026-08-18 13:40:13'),
(198, 47, 50, 1.000, '2026-08-18 13:40:13', '2026-08-18 13:40:13'),
(199, 48, 12, 1.000, '2026-08-18 13:40:56', '2026-08-18 13:40:56'),
(200, 48, 51, 1.000, '2026-08-18 13:40:56', '2026-08-18 13:40:56'),
(201, 49, 12, 1.000, '2026-08-18 13:41:51', '2026-08-18 13:41:51'),
(202, 49, 52, 1.000, '2026-08-18 13:41:51', '2026-08-18 13:41:51'),
(204, 50, 12, 1.000, '2026-08-18 13:43:40', '2026-08-18 13:43:40'),
(205, 50, 53, 1.000, '2026-08-18 13:43:40', '2026-08-18 13:43:40'),
(206, 45, 6, 1.000, '2026-08-30 00:19:57', '2026-08-30 00:19:57'),
(207, 45, 10, 1.000, '2026-08-30 00:19:57', '2026-08-30 00:19:57'),
(208, 45, 17, 0.100, '2026-08-30 00:19:57', '2026-08-30 00:19:57'),
(209, 45, 48, 1.000, '2026-08-30 00:19:57', '2026-08-30 00:19:57'),
(210, 46, 12, 1.000, '2026-08-30 00:21:34', '2026-08-30 00:21:34'),
(211, 46, 10, 1.000, '2026-08-30 00:21:34', '2026-08-30 00:21:34'),
(212, 46, 17, 0.100, '2026-08-30 00:21:34', '2026-08-30 00:21:34'),
(213, 46, 21, 1.000, '2026-08-30 00:21:34', '2026-08-30 00:21:34'),
(214, 11, 6, 1.000, '2026-08-30 00:24:12', '2026-08-30 00:24:12'),
(215, 11, 10, 1.000, '2026-08-30 00:24:12', '2026-08-30 00:24:12'),
(216, 11, 17, 0.100, '2026-08-30 00:24:12', '2026-08-30 00:24:12'),
(217, 11, 22, 0.165, '2026-08-30 00:24:12', '2026-08-30 00:24:12'),
(218, 11, 34, 0.015, '2026-08-30 00:24:12', '2026-08-30 00:24:12'),
(219, 11, 36, 0.250, '2026-08-30 00:24:12', '2026-08-30 00:24:12'),
(220, 44, 6, 1.000, '2026-08-30 00:26:51', '2026-08-30 00:26:51'),
(221, 44, 10, 1.000, '2026-08-30 00:26:51', '2026-08-30 00:26:51'),
(222, 44, 17, 0.200, '2026-08-30 00:26:51', '2026-08-30 00:26:51'),
(223, 44, 39, 0.050, '2026-08-30 00:26:51', '2026-08-30 00:26:51'),
(224, 44, 49, 1.000, '2026-08-30 00:26:51', '2026-08-30 00:26:51'),
(225, 10, 6, 1.000, '2026-08-30 00:28:25', '2026-08-30 00:28:25'),
(226, 10, 10, 1.000, '2026-08-30 00:28:25', '2026-08-30 00:28:25'),
(227, 10, 14, 0.250, '2026-08-30 00:28:25', '2026-08-30 00:28:25'),
(228, 10, 17, 0.100, '2026-08-30 00:28:25', '2026-08-30 00:28:25'),
(229, 10, 21, 0.500, '2026-08-30 00:28:25', '2026-08-30 00:28:25'),
(230, 51, 6, 1.000, '2026-08-30 00:31:45', '2026-08-30 00:31:45'),
(231, 51, 10, 1.000, '2026-08-30 00:31:45', '2026-08-30 00:31:45'),
(232, 51, 17, 0.100, '2026-08-30 00:31:45', '2026-08-30 00:31:45'),
(233, 51, 54, 1.000, '2026-08-30 00:31:45', '2026-08-30 00:31:45'),
(234, 52, 10, 1.000, '2026-08-30 00:33:56', '2026-08-30 00:33:56'),
(235, 52, 6, 1.000, '2026-08-30 00:33:56', '2026-08-30 00:33:56'),
(236, 52, 55, 1.000, '2026-08-30 00:33:56', '2026-08-30 00:33:56'),
(237, 52, 17, 0.100, '2026-08-30 00:33:56', '2026-08-30 00:33:56'),
(238, 53, 6, 1.000, '2026-08-30 00:34:40', '2026-08-30 00:34:40'),
(239, 53, 10, 1.000, '2026-08-30 00:34:40', '2026-08-30 00:34:40'),
(240, 53, 56, 1.000, '2026-08-30 00:34:40', '2026-08-30 00:34:40'),
(241, 53, 17, 0.100, '2026-08-30 00:34:40', '2026-08-30 00:34:40'),
(242, 18, 5, 1.000, '2026-08-30 00:37:30', '2026-08-30 00:37:30'),
(243, 18, 24, 0.015, '2026-08-30 00:37:30', '2026-08-30 00:37:30'),
(244, 14, 5, 1.000, '2026-08-30 00:39:16', '2026-08-30 00:39:16'),
(245, 14, 25, 0.015, '2026-08-30 00:39:16', '2026-08-30 00:39:16'),
(246, 25, 12, 1.000, '2026-08-30 00:39:56', '2026-08-30 00:39:56'),
(247, 25, 26, 1.000, '2026-08-30 00:39:56', '2026-08-30 00:39:56'),
(248, 22, 5, 1.000, '2026-08-30 00:41:27', '2026-08-30 00:41:27'),
(249, 22, 35, 0.015, '2026-08-30 00:41:27', '2026-08-30 00:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'مدير', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(2, 'كاشير', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(3, 'مطبخ', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(4, 'محاسب', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38'),
(5, 'مسؤول المخزن', 'web', '2026-05-28 20:25:38', '2026-05-28 20:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(9, 3),
(10, 3),
(1, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(12, 5),
(13, 5),
(14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8xdF9HcA5MeiB42tqNwnFOJpCtjXfjmrfqxzMyD0', NULL, '46.17.174.173', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'eyJfdG9rZW4iOiJWNlZMbmdxbDI5dzJhdXp0YjY4a2c2SVJhUHRuM2dVN01ub2VCS1doIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYW5keWJyb3duLW9zdHJpY2gtODEzMDUxLmhvc3RpbmdlcnNpdGUuY29tIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1791232945),
('cbeX9l7xeBPa5pgEW1E23p6q2ZAxD4tdfTJjoSJ0', 2, '205.209.89.237', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', 'eyJfdG9rZW4iOiJNSDJQelIyZWs5N21HWVI0c1JUS0IzOEQzbzI3MFluSTBGY0NsNDhEIiwidXJsIjpbXSwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9hbGljZWJsdWUtY3JhbmUtOTIyMjA5Lmhvc3RpbmdlcnNpdGUuY29tXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6Mn0=', 1791018962),
('fleaCmXHfzJVkPUPDkwbteJ39hEH8JcuN5ddmWv0', NULL, '2a02:4780:a:c0de::fac4', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 HostingerSelfie/3', 'eyJfdG9rZW4iOiJSaGtNNXVOZnBmUUlTUE4wa3lZSVcxQTNGN0F5YVZSd1RaNnpSSFFLIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYW5keWJyb3duLW9zdHJpY2gtODEzMDUxLmhvc3RpbmdlcnNpdGUuY29tXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1791453977),
('fyiv5gtizOO55vHv8mftsjs4SWo8Yts61YGpWsv0', NULL, '46.17.174.173', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'eyJfdG9rZW4iOiJlVjhCbDE4bHVUS25vVmh2UGdISFJJSlRnTlRtY2pyaGxpb0drWEdqIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYW5keWJyb3duLW9zdHJpY2gtODEzMDUxLmhvc3RpbmdlcnNpdGUuY29tXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1790584374),
('i5knhw2lzodRBVhipcJTXCaQUIY7WCtGfTtvuMSf', NULL, '46.17.174.172', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'eyJfdG9rZW4iOiJLcXB4c1U4YXYyQWlFU29MNlkzVDVlUm9KSzdRelM5RDA5bG82UWc4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9hbGljZWJsdWUtY3JhbmUtOTIyMjA5Lmhvc3RpbmdlcnNpdGUuY29tIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1790391981),
('ieQgwcJH6t7sMO1sCJzOM4wPA4LMyUj0k95bRBav', NULL, '46.17.174.173', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'eyJfdG9rZW4iOiJVNkJiNEZaa3RnNzF3YXg2TWFlTjYzeW9sUXk4UlN0OVhONVZlZ0g4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYW5keWJyb3duLW9zdHJpY2gtODEzMDUxLmhvc3RpbmdlcnNpdGUuY29tIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1790584374),
('LR1OCv8mpjTlTrsI2MSqvjFXFQ5GUEcBWQXufhY7', NULL, '2a02:4780:a:c0de::fac5', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 HostingerSelfie/3', 'eyJfdG9rZW4iOiJJZEh1VUd2Um51YU5YNkxYWE55VzZFRnZpdUh2WWZkYVFVZEFnbHJjIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9hbGljZWJsdWUtY3JhbmUtOTIyMjA5Lmhvc3RpbmdlcnNpdGUuY29tIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1791453978),
('Qe9uhWdVS8vgpF0jpri6GxWXWkHpPfi1QSV117xu', NULL, '2a02:4780:a:c0de::fac4', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 HostingerSelfie/3', 'eyJfdG9rZW4iOiJwWlZvQ1VSSFlDODJ3MGdHdTBsNDdWVlhocEJEdktRc1BDRzhSa1N2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYW5keWJyb3duLW9zdHJpY2gtODEzMDUxLmhvc3RpbmdlcnNpdGUuY29tIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1791453977),
('QOf6bXdYpcmnqBGmaroRzPjFsup5mPKv3CqVENzu', NULL, '46.17.174.172', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'eyJfdG9rZW4iOiI2QUJtMjRGZ0FGajRvT2RVdmc5SUo1Z1dnWVZ1WldiVnNHZFVpWHhhIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9hbGljZWJsdWUtY3JhbmUtOTIyMjA5Lmhvc3RpbmdlcnNpdGUuY29tXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1790391981),
('R7AfGSfgJSBfw9TkeJ6LTxFCqYaXooV8iwFTBEP3', NULL, '46.17.174.173', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'eyJfdG9rZW4iOiJSbnZnSjJhcDN3ejRVT0NwNTh4R1JCTkpYYk5wbHZGQ0FlVkQwMWpHIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9zYW5keWJyb3duLW9zdHJpY2gtODEzMDUxLmhvc3RpbmdlcnNpdGUuY29tXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1791232946),
('V7hICQtiK8U9dOSvsuagJG6yfVVBkxyBSufHRMz5', NULL, '46.17.174.172', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'eyJfdG9rZW4iOiJPNzkxRlRMNE9TOEJ2QXZ4aTVuUFU1MkpVYURFNWxOWnhyV3JROXFCIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9hbGljZWJsdWUtY3JhbmUtOTIyMjA5Lmhvc3RpbmdlcnNpdGUuY29tXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1789923751),
('vgXMGfLBfm2UMHliq6ObhHvqRA8eJQkMc7LUUGLA', NULL, '46.17.174.172', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0', 'eyJfdG9rZW4iOiJOc2pqNjdGcWN0MUFQTU5oRXg2amNCRk1kWFdIYlRFa01GaFhYNm03IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9hbGljZWJsdWUtY3JhbmUtOTIyMjA5Lmhvc3RpbmdlcnNpdGUuY29tIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1789923751),
('voWWPz6MNx6VHkXP49TuFnebD1aB8kr8U7YpKc70', 1, '86.105.147.99', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJiY29oQkZmVDhIRHFVY3FGYTZsVG1sUEpDV1Nxc2Y0Vk0xYUtQY3pEIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9hbGljZWJsdWUtY3JhbmUtOTIyMjA5Lmhvc3RpbmdlcnNpdGUuY29tXC9kYXNoYm9hcmQiLCJyb3V0ZSI6ImRhc2hib2FyZCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxfQ==', 1791677995),
('wR0d5VX9mwEFbWFJeHvDC9GbMfeKDNYf1xkd8F9t', NULL, '2a02:4780:a:c0de::fac5', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 HostingerSelfie/3', 'eyJfdG9rZW4iOiJ0N2tlOVFKeGVOUXJqeWswbHZPdVNKaUFZSWxWSXBhM0FYQnhZdDNiIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHBzOlwvXC9hbGljZWJsdWUtY3JhbmUtOTIyMjA5Lmhvc3RpbmdlcnNpdGUuY29tXC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1791453978);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `group` varchar(255) NOT NULL DEFAULT 'general',
  `type` varchar(255) NOT NULL DEFAULT 'string',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `group`, `type`, `created_at`, `updated_at`) VALUES
(1, 'brand_name', 'CU', 'general', 'string', '2026-05-28 20:25:39', '2026-05-28 20:25:39'),
(2, 'currency', 'ل.س', 'general', 'string', '2026-05-28 20:25:39', '2026-05-28 20:44:41'),
(3, 'phone', '0993386301', 'general', 'string', '2026-05-28 20:25:39', '2026-08-15 08:03:06'),
(4, 'address', 'القامشلي.شارع القوتلي جانب المحكمة', 'general', 'string', '2026-05-28 20:25:39', '2026-05-29 21:43:17'),
(5, 'invoice_footer', '(: we know you\'ll come back', 'general', 'string', '2026-05-28 20:25:39', '2026-05-29 21:40:01'),
(6, 'tax_rate', '0', 'general', 'integer', '2026-05-28 20:25:39', '2026-05-28 20:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `opened_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `closed_at` timestamp NULL DEFAULT NULL,
  `opening_cash` decimal(14,2) NOT NULL DEFAULT 0.00,
  `closing_cash` decimal(14,2) DEFAULT NULL,
  `expected_cash` decimal(14,2) DEFAULT NULL,
  `difference` decimal(14,2) DEFAULT NULL,
  `total_sales` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_orders` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL DEFAULT 'open',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `user_id`, `opened_at`, `closed_at`, `opening_cash`, `closing_cash`, `expected_cash`, `difference`, `total_sales`, `total_orders`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(2, 2, '2026-08-22 06:07:46', '2026-08-22 06:07:46', 127.00, 35000000.00, 127.00, 34999873.00, 0.00, 0, 'closed', NULL, '2026-08-22 05:55:46', '2026-08-22 06:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ingredient_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `quantity` decimal(14,3) NOT NULL,
  `unit_cost` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `balance_after` decimal(14,3) NOT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_movements`
--

INSERT INTO `stock_movements` (`id`, `ingredient_id`, `type`, `quantity`, `unit_cost`, `balance_after`, `reference_type`, `reference_id`, `user_id`, `notes`, `created_at`, `updated_at`) VALUES
(9, 14, 'adjustment', 13.000, 3000.0000, 17.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-15 07:57:13', '2026-08-15 07:57:13'),
(10, 8, 'sale', -1.000, 2400.0000, 2999.000, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(11, 14, 'sale', -0.300, 3000.0000, 16.700, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(12, 16, 'sale', -0.015, 100000.0000, 2.985, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(13, 37, 'sale', -0.050, 64000.0000, 3.950, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(14, 5, 'sale', -1.000, 1550.0000, 4999.000, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(15, 24, 'sale', -0.015, 180000.0000, 1.985, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(16, 9, 'sale', -1.000, 1900.0000, 749.000, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(17, 11, 'sale', -1.000, 350.0000, 1999.000, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(18, 14, 'sale', -0.300, 3000.0000, 16.400, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(19, 15, 'sale', -0.030, 60000.0000, 49.970, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(20, 16, 'sale', -0.015, 100000.0000, 2.970, 'App\\Models\\Order', 13, 1, 'بيع طلب #20260815-0001', '2026-08-15 08:16:22', '2026-08-15 08:16:22'),
(21, 14, 'adjustment', 27.600, 3000.0000, 44.000, NULL, NULL, 1, '3 جبسات يوم السبت', '2026-08-15 14:01:19', '2026-08-15 14:01:19'),
(22, 14, 'adjustment', -28.000, 3000.0000, 16.000, NULL, NULL, 1, 'سابق موجود', '2026-08-15 14:02:38', '2026-08-15 14:02:38'),
(23, 14, 'adjustment', 44.000, 3000.0000, 60.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-15 14:17:39', '2026-08-15 14:17:39'),
(24, 17, 'adjustment', -6.000, 7000.0000, 4.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-15 14:24:32', '2026-08-15 14:24:32'),
(25, 15, 'adjustment', -27.970, 60000.0000, 22.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 07:22:06', '2026-08-16 07:22:06'),
(26, 16, 'adjustment', 2.030, 100000.0000, 5.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:17:10', '2026-08-16 15:17:10'),
(27, 16, 'adjustment', 0.000, 100000.0000, 5.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:17:11', '2026-08-16 15:17:11'),
(28, 16, 'adjustment', -1.500, 100000.0000, 3.500, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:18:58', '2026-08-16 15:18:58'),
(29, 16, 'adjustment', 0.000, 100000.0000, 3.500, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:18:58', '2026-08-16 15:18:58'),
(30, 29, 'adjustment', -23.000, 500.0000, 7.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:21:31', '2026-08-16 15:21:31'),
(31, 29, 'adjustment', 693.000, 500.0000, 700.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:23:30', '2026-08-16 15:23:30'),
(32, 25, 'adjustment', 1.500, 110000.0000, 3.500, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:24:20', '2026-08-16 15:24:20'),
(33, 30, 'adjustment', -2.750, 150000.0000, 2.250, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:25:57', '2026-08-16 15:25:57'),
(34, 27, 'adjustment', -1.000, 112500.0000, 2.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:27:23', '2026-08-16 15:27:23'),
(35, 23, 'adjustment', -3.500, 15000.0000, 1.500, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:28:52', '2026-08-16 15:28:52'),
(36, 23, 'adjustment', 3.500, 15000.0000, 5.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:29:37', '2026-08-16 15:29:37'),
(37, 35, 'adjustment', -1.500, 200000.0000, 0.500, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:32:03', '2026-08-16 15:32:03'),
(38, 19, 'adjustment', -1.000, 27000.0000, 2.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 15:34:28', '2026-08-16 15:34:28'),
(39, 37, 'adjustment', -3.950, 64000.0000, 0.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 16:01:48', '2026-08-16 16:01:48'),
(40, 34, 'adjustment', 6.000, 20000.0000, 8.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 16:02:32', '2026-08-16 16:02:32'),
(41, 32, 'adjustment', -2.500, 65000.0000, 0.500, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 16:03:27', '2026-08-16 16:03:27'),
(42, 24, 'adjustment', 698.015, 180000.0000, 700.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 16:25:37', '2026-08-16 16:25:37'),
(43, 24, 'adjustment', -699.000, 180000.0000, 1.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 16:27:51', '2026-08-16 16:27:51'),
(44, 18, 'adjustment', -2.000, 90000.0000, 1.000, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 16:37:40', '2026-08-16 16:37:40'),
(45, 33, 'adjustment', -1.500, 70000.0000, 0.500, NULL, NULL, 1, 'تسوية يدوية للمخزون', '2026-08-16 17:04:19', '2026-08-16 17:04:19'),
(46, 8, 'sale', -1.000, 2400.0000, 2998.000, 'App\\Models\\Order', 14, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(47, 14, 'sale', -0.300, 3000.0000, 59.700, 'App\\Models\\Order', 14, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(48, 15, 'sale', -0.050, 60000.0000, 21.950, 'App\\Models\\Order', 14, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(49, 16, 'sale', -0.015, 100000.0000, 3.485, 'App\\Models\\Order', 14, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:10:36', '2026-08-16 22:10:36'),
(50, 1, 'purchase', 111.000, 11.0000, 111.000, 'App\\Models\\Purchase', 1, 1, 'فاتورة شراء', '2026-08-16 22:14:12', '2026-08-16 22:14:12'),
(51, 8, 'sale', -1.000, 2400.0000, 2997.000, 'App\\Models\\Order', 15, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(52, 14, 'sale', -0.300, 3000.0000, 59.400, 'App\\Models\\Order', 15, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(53, 16, 'sale', -0.015, 100000.0000, 3.470, 'App\\Models\\Order', 15, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(54, 37, 'sale', -0.050, 80000.0000, 3.950, 'App\\Models\\Order', 15, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(55, 6, 'sale', -1.000, 1800.0000, 999.000, 'App\\Models\\Order', 15, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(56, 11, 'sale', -1.000, 350.0000, 1998.000, 'App\\Models\\Order', 15, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(57, 14, 'sale', -0.300, 3000.0000, 59.100, 'App\\Models\\Order', 15, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(58, 16, 'sale', -0.015, 100000.0000, 3.455, 'App\\Models\\Order', 15, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:38:16', '2026-08-16 22:38:16'),
(59, 8, 'sale', -1.000, 2400.0000, 2996.000, 'App\\Models\\Order', 16, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(60, 14, 'sale', -0.300, 3000.0000, 58.800, 'App\\Models\\Order', 16, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(61, 15, 'sale', -0.050, 60000.0000, 21.900, 'App\\Models\\Order', 16, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(62, 16, 'sale', -0.015, 100000.0000, 3.440, 'App\\Models\\Order', 16, 1, 'بيع طلب #20260816-0001', '2026-08-16 22:45:49', '2026-08-16 22:45:49'),
(63, 9, 'sale', -1.000, 1900.0000, 748.000, 'App\\Models\\Order', 17, 2, 'بيع طلب #20260819-0001', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(64, 11, 'sale', -1.000, 350.0000, 1997.000, 'App\\Models\\Order', 17, 2, 'بيع طلب #20260819-0001', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(65, 14, 'sale', -0.300, 4000.0000, 58.500, 'App\\Models\\Order', 17, 2, 'بيع طلب #20260819-0001', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(66, 15, 'sale', -0.030, 60000.0000, 21.870, 'App\\Models\\Order', 17, 2, 'بيع طلب #20260819-0001', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(67, 16, 'sale', -0.015, 100000.0000, 3.425, 'App\\Models\\Order', 17, 2, 'بيع طلب #20260819-0001', '2026-08-19 15:23:31', '2026-08-19 15:23:31'),
(68, 40, 'sale', -0.014, 500000.0000, 0.986, 'App\\Models\\Order', 18, 2, 'بيع طلب #20260819-0002', '2026-08-19 16:15:27', '2026-08-19 16:15:27'),
(69, 40, 'sale', -0.014, 500000.0000, 0.972, 'App\\Models\\Order', 19, 2, 'بيع طلب #20260819-0003', '2026-08-19 16:20:01', '2026-08-19 16:20:01'),
(70, 6, 'sale', -1.000, 1800.0000, 998.000, 'App\\Models\\Order', 20, 2, 'بيع طلب #20260819-0004', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(71, 10, 'sale', -1.000, 350.0000, 2499.000, 'App\\Models\\Order', 20, 2, 'بيع طلب #20260819-0004', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(72, 14, 'sale', -0.250, 4000.0000, 58.250, 'App\\Models\\Order', 20, 2, 'بيع طلب #20260819-0004', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(73, 17, 'sale', -0.100, 7000.0000, 3.900, 'App\\Models\\Order', 20, 2, 'بيع طلب #20260819-0004', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(74, 21, 'sale', -0.500, 5000.0000, 29.500, 'App\\Models\\Order', 20, 2, 'بيع طلب #20260819-0004', '2026-08-19 16:21:25', '2026-08-19 16:21:25'),
(75, 6, 'sale', -1.000, 1800.0000, 997.000, 'App\\Models\\Order', 21, 2, 'بيع طلب #20260819-0005', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(76, 10, 'sale', -1.000, 350.0000, 2498.000, 'App\\Models\\Order', 21, 2, 'بيع طلب #20260819-0005', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(77, 14, 'sale', -0.250, 4000.0000, 58.000, 'App\\Models\\Order', 21, 2, 'بيع طلب #20260819-0005', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(78, 17, 'sale', -0.100, 7000.0000, 3.800, 'App\\Models\\Order', 21, 2, 'بيع طلب #20260819-0005', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(79, 21, 'sale', -0.500, 5000.0000, 29.000, 'App\\Models\\Order', 21, 2, 'بيع طلب #20260819-0005', '2026-08-19 16:21:44', '2026-08-19 16:21:44'),
(80, 12, 'sale', -1.000, 1700.0000, 2824.000, 'App\\Models\\Order', 22, 2, 'بيع طلب #20260819-0006', '2026-08-19 16:46:07', '2026-08-19 16:46:07'),
(81, 38, 'sale', -0.020, 200000.0000, 0.980, 'App\\Models\\Order', 22, 2, 'بيع طلب #20260819-0006', '2026-08-19 16:46:07', '2026-08-19 16:46:07'),
(82, 40, 'sale', -0.014, 500000.0000, 0.958, 'App\\Models\\Order', 23, 2, 'بيع طلب #20260819-0007', '2026-08-19 16:54:58', '2026-08-19 16:54:58'),
(83, 47, 'sale', -2.000, 1500.0000, 48.000, 'App\\Models\\Order', 24, 1, 'بيع طلب #20260821-0001', '2026-08-21 15:03:15', '2026-08-21 15:03:15'),
(84, 5, 'sale', -1.000, 1550.0000, 4998.000, 'App\\Models\\Order', 24, 1, 'بيع طلب #20260821-0001', '2026-08-21 15:03:15', '2026-08-21 15:03:15'),
(85, 24, 'sale', -0.015, 180000.0000, 0.985, 'App\\Models\\Order', 24, 1, 'بيع طلب #20260821-0001', '2026-08-21 15:03:15', '2026-08-21 15:03:15'),
(86, 8, 'sale', -2.000, 2400.0000, 2994.000, 'App\\Models\\Order', 25, 1, 'بيع طلب #20260821-0001', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(87, 14, 'sale', -0.600, 4000.0000, 57.400, 'App\\Models\\Order', 25, 1, 'بيع طلب #20260821-0001', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(88, 16, 'sale', -0.030, 100000.0000, 3.395, 'App\\Models\\Order', 25, 1, 'بيع طلب #20260821-0001', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(89, 37, 'sale', -0.100, 80000.0000, 3.850, 'App\\Models\\Order', 25, 1, 'بيع طلب #20260821-0001', '2026-08-21 17:25:44', '2026-08-21 17:25:44'),
(90, 8, 'sale', -2.000, 2400.0000, 2992.000, 'App\\Models\\Order', 26, 1, 'بيع طلب #20260821-0002', '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(91, 14, 'sale', -0.600, 4000.0000, 56.800, 'App\\Models\\Order', 26, 1, 'بيع طلب #20260821-0002', '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(92, 16, 'sale', -0.030, 100000.0000, 3.365, 'App\\Models\\Order', 26, 1, 'بيع طلب #20260821-0002', '2026-08-21 17:26:02', '2026-08-21 17:26:02'),
(93, 6, 'sale', -1.000, 1800.0000, 996.000, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(94, 10, 'sale', -1.000, 350.0000, 2497.000, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(95, 17, 'sale', -0.200, 7000.0000, 3.600, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(96, 39, 'sale', -0.050, 15000.0000, 2.950, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(97, 49, 'sale', -1.000, 6000.0000, 29.000, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(98, 6, 'sale', -1.000, 1800.0000, 995.000, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(99, 10, 'sale', -1.000, 350.0000, 2496.000, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(100, 14, 'sale', -0.250, 4000.0000, 56.550, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(101, 17, 'sale', -0.100, 7000.0000, 3.500, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(102, 21, 'sale', -0.500, 5000.0000, 28.500, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(103, 5, 'sale', -1.000, 1550.0000, 4997.000, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(104, 24, 'sale', -0.015, 180000.0000, 0.970, 'App\\Models\\Order', 25, 1, 'إضافة للطلب #20260821-0001', '2026-08-21 17:26:26', '2026-08-21 17:26:26'),
(105, 45, 'sale', -0.028, 500000.0000, 0.972, 'App\\Models\\Order', 27, 1, 'بيع طلب #20260821-0003', '2026-08-21 17:28:25', '2026-08-21 17:28:25'),
(106, 43, 'sale', -0.014, 500000.0000, 0.986, 'App\\Models\\Order', 27, 1, 'إضافة للطلب #20260821-0003', '2026-08-21 17:28:32', '2026-08-21 17:28:32'),
(107, 45, 'adjustment', 0.028, 500000.0000, 1.000, 'App\\Models\\Order', 27, 1, 'إلغاء طلب #20260821-0003 — إرجاع للمخزون', '2026-08-21 17:36:11', '2026-08-21 17:36:11'),
(108, 43, 'adjustment', 0.014, 500000.0000, 1.000, 'App\\Models\\Order', 27, 1, 'إلغاء طلب #20260821-0003 — إرجاع للمخزون', '2026-08-21 17:36:11', '2026-08-21 17:36:11'),
(109, 5, 'sale', -1.000, 1550.0000, 4996.000, 'App\\Models\\Order', 28, 2, 'بيع طلب #20260822-0001', '2026-08-22 05:42:48', '2026-08-22 05:42:48'),
(110, 24, 'sale', -0.015, 180000.0000, 0.955, 'App\\Models\\Order', 28, 2, 'بيع طلب #20260822-0001', '2026-08-22 05:42:48', '2026-08-22 05:42:48'),
(111, 8, 'sale', -1.000, 2400.0000, 2991.000, 'App\\Models\\Order', 29, 2, 'بيع طلب #20260822-0002', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(112, 14, 'sale', -0.300, 4000.0000, 56.250, 'App\\Models\\Order', 29, 2, 'بيع طلب #20260822-0002', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(113, 15, 'sale', -0.050, 60000.0000, 21.820, 'App\\Models\\Order', 29, 2, 'بيع طلب #20260822-0002', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(114, 16, 'sale', -0.015, 100000.0000, 3.350, 'App\\Models\\Order', 29, 2, 'بيع طلب #20260822-0002', '2026-08-22 05:53:05', '2026-08-22 05:53:05'),
(115, 8, 'adjustment', 1.000, 2400.0000, 2992.000, 'App\\Models\\Order', 29, 2, 'إلغاء طلب #20260822-0002 — إرجاع للمخزون', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(116, 14, 'adjustment', 0.300, 4000.0000, 56.550, 'App\\Models\\Order', 29, 2, 'إلغاء طلب #20260822-0002 — إرجاع للمخزون', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(117, 15, 'adjustment', 0.050, 60000.0000, 21.870, 'App\\Models\\Order', 29, 2, 'إلغاء طلب #20260822-0002 — إرجاع للمخزون', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(118, 16, 'adjustment', 0.015, 100000.0000, 3.365, 'App\\Models\\Order', 29, 2, 'إلغاء طلب #20260822-0002 — إرجاع للمخزون', '2026-08-22 06:05:27', '2026-08-22 06:05:27'),
(119, 8, 'sale', -1.000, 2400.0000, 2991.000, 'App\\Models\\Order', 30, 2, 'بيع طلب #20260822-0003', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(120, 14, 'sale', -0.300, 4000.0000, 56.250, 'App\\Models\\Order', 30, 2, 'بيع طلب #20260822-0003', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(121, 16, 'sale', -0.015, 100000.0000, 3.350, 'App\\Models\\Order', 30, 2, 'بيع طلب #20260822-0003', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(122, 6, 'sale', -1.000, 1800.0000, 994.000, 'App\\Models\\Order', 31, 2, 'بيع طلب #20260822-0004', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(123, 11, 'sale', -1.000, 350.0000, 1996.000, 'App\\Models\\Order', 31, 2, 'بيع طلب #20260822-0004', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(124, 14, 'sale', -0.300, 4000.0000, 55.950, 'App\\Models\\Order', 31, 2, 'بيع طلب #20260822-0004', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(125, 16, 'sale', -0.015, 100000.0000, 3.335, 'App\\Models\\Order', 31, 2, 'بيع طلب #20260822-0004', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(126, 6, 'sale', -1.000, 1800.0000, 993.000, 'App\\Models\\Order', 32, 2, 'بيع طلب #20260822-0005', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(127, 11, 'sale', -1.000, 350.0000, 1995.000, 'App\\Models\\Order', 32, 2, 'بيع طلب #20260822-0005', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(128, 14, 'sale', -0.300, 4000.0000, 55.650, 'App\\Models\\Order', 32, 2, 'بيع طلب #20260822-0005', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(129, 16, 'sale', -0.015, 100000.0000, 3.320, 'App\\Models\\Order', 32, 2, 'بيع طلب #20260822-0005', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(130, 5, 'sale', -3.000, 1550.0000, 4993.000, 'App\\Models\\Order', 33, 2, 'بيع طلب #20260822-0006', '2026-08-22 09:19:47', '2026-08-22 09:19:47'),
(131, 25, 'sale', -0.045, 110000.0000, 3.455, 'App\\Models\\Order', 33, 2, 'بيع طلب #20260822-0006', '2026-08-22 09:19:47', '2026-08-22 09:19:47'),
(132, 43, 'sale', -0.014, 500000.0000, 0.986, 'App\\Models\\Order', 34, 2, 'بيع طلب #20260822-0007', '2026-08-22 09:46:47', '2026-08-22 09:46:47'),
(133, 44, 'sale', -0.014, 500000.0000, 0.986, 'App\\Models\\Order', 35, 2, 'بيع طلب #20260822-0008', '2026-08-22 09:48:57', '2026-08-22 09:48:57'),
(134, 45, 'sale', -0.028, 500000.0000, 0.972, 'App\\Models\\Order', 36, 2, 'بيع طلب #20260822-0009', '2026-08-22 09:50:03', '2026-08-22 09:50:03'),
(135, 44, 'sale', -0.014, 500000.0000, 0.972, 'App\\Models\\Order', 37, 2, 'بيع طلب #20260822-0010', '2026-08-22 09:50:35', '2026-08-22 09:50:35'),
(136, 44, 'sale', -0.014, 500000.0000, 0.958, 'App\\Models\\Order', 38, 2, 'بيع طلب #20260822-0011', '2026-08-22 09:51:12', '2026-08-22 09:51:12'),
(137, 6, 'sale', -2.000, 1800.0000, 991.000, 'App\\Models\\Order', 39, 2, 'بيع طلب #20260822-0012', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(138, 10, 'sale', -2.000, 350.0000, 2494.000, 'App\\Models\\Order', 39, 2, 'بيع طلب #20260822-0012', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(139, 17, 'sale', -0.200, 7000.0000, 3.300, 'App\\Models\\Order', 39, 2, 'بيع طلب #20260822-0012', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(140, 19, 'sale', -0.500, 27000.0000, 1.500, 'App\\Models\\Order', 39, 2, 'بيع طلب #20260822-0012', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(141, 6, 'sale', -2.000, 1800.0000, 989.000, 'App\\Models\\Order', 40, 2, 'بيع طلب #20260822-0013', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(142, 10, 'sale', -2.000, 350.0000, 2492.000, 'App\\Models\\Order', 40, 2, 'بيع طلب #20260822-0013', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(143, 17, 'sale', -0.400, 7000.0000, 2.900, 'App\\Models\\Order', 40, 2, 'بيع طلب #20260822-0013', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(144, 20, 'sale', -0.500, 67000.0000, 1.500, 'App\\Models\\Order', 40, 2, 'بيع طلب #20260822-0013', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(145, 6, 'sale', -1.000, 1800.0000, 988.000, 'App\\Models\\Order', 40, 2, 'بيع طلب #20260822-0013', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(146, 10, 'sale', -1.000, 350.0000, 2491.000, 'App\\Models\\Order', 40, 2, 'بيع طلب #20260822-0013', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(147, 17, 'sale', -0.100, 7000.0000, 2.800, 'App\\Models\\Order', 40, 2, 'بيع طلب #20260822-0013', '2026-08-22 11:29:06', '2026-08-22 11:29:06'),
(148, 49, 'sale', -1.000, 6000.0000, 28.000, 'App\\Models\\Order', 40, 2, 'بيع طلب #20260822-0013', '2026-08-22 11:29:07', '2026-08-22 11:29:07'),
(149, 6, 'sale', -2.000, 1800.0000, 986.000, 'App\\Models\\Order', 41, 2, 'بيع طلب #20260822-0014', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(150, 10, 'sale', -2.000, 350.0000, 2489.000, 'App\\Models\\Order', 41, 2, 'بيع طلب #20260822-0014', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(151, 17, 'sale', -0.200, 7000.0000, 2.600, 'App\\Models\\Order', 41, 2, 'بيع طلب #20260822-0014', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(152, 49, 'sale', -2.000, 6000.0000, 26.000, 'App\\Models\\Order', 41, 2, 'بيع طلب #20260822-0014', '2026-08-22 11:29:16', '2026-08-22 11:29:16'),
(153, 6, 'sale', -2.000, 1800.0000, 984.000, 'App\\Models\\Order', 42, 2, 'بيع طلب #20260822-0015', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(154, 10, 'sale', -2.000, 350.0000, 2487.000, 'App\\Models\\Order', 42, 2, 'بيع طلب #20260822-0015', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(155, 17, 'sale', -0.200, 7000.0000, 2.400, 'App\\Models\\Order', 42, 2, 'بيع طلب #20260822-0015', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(156, 49, 'sale', -2.000, 6000.0000, 24.000, 'App\\Models\\Order', 42, 2, 'بيع طلب #20260822-0015', '2026-08-22 11:29:37', '2026-08-22 11:29:37'),
(157, 6, 'sale', -2.000, 1800.0000, 982.000, 'App\\Models\\Order', 43, 2, 'بيع طلب #20260822-0016', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(158, 10, 'sale', -2.000, 350.0000, 2485.000, 'App\\Models\\Order', 43, 2, 'بيع طلب #20260822-0016', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(159, 17, 'sale', -0.200, 7000.0000, 2.200, 'App\\Models\\Order', 43, 2, 'بيع طلب #20260822-0016', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(160, 49, 'sale', -2.000, 6000.0000, 22.000, 'App\\Models\\Order', 43, 2, 'بيع طلب #20260822-0016', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(161, 6, 'sale', -2.000, 1800.0000, 980.000, 'App\\Models\\Order', 44, 2, 'بيع طلب #20260822-0017', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(162, 10, 'sale', -2.000, 350.0000, 2483.000, 'App\\Models\\Order', 44, 2, 'بيع طلب #20260822-0017', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(163, 17, 'sale', -0.200, 7000.0000, 2.000, 'App\\Models\\Order', 44, 2, 'بيع طلب #20260822-0017', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(164, 19, 'sale', -0.500, 27000.0000, 1.000, 'App\\Models\\Order', 44, 2, 'بيع طلب #20260822-0017', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(165, 6, 'sale', -2.000, 1800.0000, 978.000, 'App\\Models\\Order', 45, 2, 'بيع طلب #20260822-0018', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(166, 10, 'sale', -2.000, 350.0000, 2481.000, 'App\\Models\\Order', 45, 2, 'بيع طلب #20260822-0018', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(167, 14, 'sale', -0.500, 4000.0000, 55.150, 'App\\Models\\Order', 45, 2, 'بيع طلب #20260822-0018', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(168, 17, 'sale', -0.200, 7000.0000, 1.800, 'App\\Models\\Order', 45, 2, 'بيع طلب #20260822-0018', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(169, 21, 'sale', -1.000, 5000.0000, 27.500, 'App\\Models\\Order', 45, 2, 'بيع طلب #20260822-0018', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(170, 47, 'sale', -2.000, 1500.0000, 46.000, 'App\\Models\\Order', 45, 2, 'بيع طلب #20260822-0018', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(171, 6, 'sale', -2.000, 1800.0000, 976.000, 'App\\Models\\Order', 46, 2, 'بيع طلب #20260822-0019', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(172, 10, 'sale', -2.000, 350.0000, 2479.000, 'App\\Models\\Order', 46, 2, 'بيع طلب #20260822-0019', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(173, 14, 'sale', -0.500, 4000.0000, 54.650, 'App\\Models\\Order', 46, 2, 'بيع طلب #20260822-0019', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(174, 17, 'sale', -0.200, 7000.0000, 1.600, 'App\\Models\\Order', 46, 2, 'بيع طلب #20260822-0019', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(175, 21, 'sale', -1.000, 5000.0000, 26.500, 'App\\Models\\Order', 46, 2, 'بيع طلب #20260822-0019', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(176, 47, 'sale', -2.000, 1500.0000, 44.000, 'App\\Models\\Order', 46, 2, 'بيع طلب #20260822-0019', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(177, 42, 'sale', -0.014, 500000.0000, 0.986, 'App\\Models\\Order', 46, 2, 'بيع طلب #20260822-0019', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(178, 6, 'sale', -1.000, 1800.0000, 975.000, 'App\\Models\\Order', 47, 2, 'بيع طلب #20260822-0020', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(179, 10, 'sale', -1.000, 350.0000, 2478.000, 'App\\Models\\Order', 47, 2, 'بيع طلب #20260822-0020', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(180, 17, 'sale', -0.100, 7000.0000, 1.500, 'App\\Models\\Order', 47, 2, 'بيع طلب #20260822-0020', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(181, 49, 'sale', -1.000, 6000.0000, 21.000, 'App\\Models\\Order', 47, 2, 'بيع طلب #20260822-0020', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(182, 6, 'sale', -2.000, 1800.0000, 973.000, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(183, 10, 'sale', -2.000, 350.0000, 2476.000, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(184, 14, 'sale', -0.500, 4000.0000, 54.150, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(185, 17, 'sale', -0.200, 7000.0000, 1.300, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(186, 21, 'sale', -1.000, 5000.0000, 25.500, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(187, 47, 'sale', -2.000, 1500.0000, 42.000, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(188, 30, 'sale', -0.050, 150000.0000, 2.200, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(189, 34, 'sale', -0.200, 20000.0000, 7.800, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(190, 6, 'sale', -1.000, 1800.0000, 972.000, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(191, 10, 'sale', -1.000, 350.0000, 2475.000, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(192, 17, 'sale', -0.100, 7000.0000, 1.200, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(193, 49, 'sale', -1.000, 6000.0000, 20.000, 'App\\Models\\Order', 48, 2, 'بيع طلب #20260822-0021', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(194, 6, 'sale', -3.000, 1800.0000, 969.000, 'App\\Models\\Order', 49, 2, 'بيع طلب #20260822-0022', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(195, 10, 'sale', -3.000, 350.0000, 2472.000, 'App\\Models\\Order', 49, 2, 'بيع طلب #20260822-0022', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(196, 17, 'sale', -0.300, 7000.0000, 0.900, 'App\\Models\\Order', 49, 2, 'بيع طلب #20260822-0022', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(197, 49, 'sale', -3.000, 6000.0000, 17.000, 'App\\Models\\Order', 49, 2, 'بيع طلب #20260822-0022', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(198, 47, 'sale', -2.000, 1500.0000, 40.000, 'App\\Models\\Order', 49, 2, 'بيع طلب #20260822-0022', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(199, 6, 'sale', -2.000, 1800.0000, 967.000, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(200, 10, 'sale', -2.000, 350.0000, 2470.000, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(201, 14, 'sale', -0.500, 4000.0000, 53.650, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(202, 17, 'sale', -0.200, 7000.0000, 0.700, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(203, 21, 'sale', -1.000, 5000.0000, 24.500, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(204, 47, 'sale', -2.000, 1500.0000, 38.000, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(205, 42, 'sale', -0.014, 500000.0000, 0.972, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(206, 6, 'sale', -1.000, 1800.0000, 966.000, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(207, 10, 'sale', -1.000, 350.0000, 2469.000, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(208, 17, 'sale', -0.100, 7000.0000, 0.600, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(209, 49, 'sale', -1.000, 6000.0000, 16.000, 'App\\Models\\Order', 50, 2, 'بيع طلب #20260822-0023', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(210, 47, 'sale', -2.000, 1500.0000, 36.000, 'App\\Models\\Order', 51, 2, 'بيع طلب #20260822-0024', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(211, 42, 'sale', -0.014, 500000.0000, 0.958, 'App\\Models\\Order', 51, 2, 'بيع طلب #20260822-0024', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(212, 6, 'sale', -1.000, 1800.0000, 965.000, 'App\\Models\\Order', 51, 2, 'بيع طلب #20260822-0024', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(213, 10, 'sale', -1.000, 350.0000, 2468.000, 'App\\Models\\Order', 51, 2, 'بيع طلب #20260822-0024', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(214, 17, 'sale', -0.100, 7000.0000, 0.500, 'App\\Models\\Order', 51, 2, 'بيع طلب #20260822-0024', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(215, 49, 'sale', -1.000, 6000.0000, 15.000, 'App\\Models\\Order', 51, 2, 'بيع طلب #20260822-0024', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(216, 47, 'sale', -3.000, 1500.0000, 33.000, 'App\\Models\\Order', 52, 2, 'بيع طلب #20260822-0025', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(217, 6, 'sale', -1.000, 1800.0000, 964.000, 'App\\Models\\Order', 52, 2, 'بيع طلب #20260822-0025', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(218, 10, 'sale', -1.000, 350.0000, 2467.000, 'App\\Models\\Order', 52, 2, 'بيع طلب #20260822-0025', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(219, 17, 'sale', -0.100, 7000.0000, 0.400, 'App\\Models\\Order', 52, 2, 'بيع طلب #20260822-0025', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(220, 48, 'sale', -1.000, 5000.0000, 29.000, 'App\\Models\\Order', 52, 2, 'بيع طلب #20260822-0025', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(221, 5, 'sale', -1.000, 1550.0000, 4992.000, 'App\\Models\\Order', 52, 2, 'بيع طلب #20260822-0025', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(222, 25, 'sale', -0.015, 110000.0000, 3.440, 'App\\Models\\Order', 52, 2, 'بيع طلب #20260822-0025', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(223, 8, 'sale', -1.000, 2400.0000, 2990.000, 'App\\Models\\Order', 53, 1, 'بيع طلب #20260823-0001', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(224, 14, 'sale', -0.300, 4000.0000, 53.350, 'App\\Models\\Order', 53, 1, 'بيع طلب #20260823-0001', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(225, 16, 'sale', -0.015, 100000.0000, 3.305, 'App\\Models\\Order', 53, 1, 'بيع طلب #20260823-0001', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(226, 37, 'sale', -0.050, 80000.0000, 3.800, 'App\\Models\\Order', 53, 1, 'بيع طلب #20260823-0001', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(227, 6, 'sale', -1.000, 1800.0000, 963.000, 'App\\Models\\Order', 54, 2, 'بيع طلب #20260823-0002', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(228, 11, 'sale', -1.000, 350.0000, 1994.000, 'App\\Models\\Order', 54, 2, 'بيع طلب #20260823-0002', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(229, 14, 'sale', -0.300, 4000.0000, 53.050, 'App\\Models\\Order', 54, 2, 'بيع طلب #20260823-0002', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(230, 16, 'sale', -0.015, 100000.0000, 3.290, 'App\\Models\\Order', 54, 2, 'بيع طلب #20260823-0002', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(231, 5, 'sale', -2.000, 1550.0000, 4990.000, 'App\\Models\\Order', 55, 2, 'بيع طلب #20260823-0003', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(232, 25, 'sale', -0.030, 110000.0000, 3.410, 'App\\Models\\Order', 55, 2, 'بيع طلب #20260823-0003', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(233, 12, 'sale', -2.000, 1700.0000, 2822.000, 'App\\Models\\Order', 55, 2, 'بيع طلب #20260823-0003', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(234, 35, 'sale', -0.030, 200000.0000, 0.470, 'App\\Models\\Order', 55, 2, 'بيع طلب #20260823-0003', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(235, 47, 'sale', -4.000, 1500.0000, 29.000, 'App\\Models\\Order', 55, 2, 'بيع طلب #20260823-0003', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(236, 12, 'sale', -2.000, 1700.0000, 2820.000, 'App\\Models\\Order', 56, 2, 'بيع طلب #20260823-0004', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(237, 26, 'sale', -2.000, 3000.0000, 18.000, 'App\\Models\\Order', 56, 2, 'بيع طلب #20260823-0004', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(238, 47, 'sale', -2.000, 1500.0000, 27.000, 'App\\Models\\Order', 56, 2, 'بيع طلب #20260823-0004', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(239, 47, 'sale', -7.000, 1500.0000, 20.000, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(240, 6, 'sale', -1.000, 1800.0000, 962.000, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(241, 10, 'sale', -1.000, 350.0000, 2466.000, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(242, 17, 'sale', -0.100, 7000.0000, 0.300, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(243, 19, 'sale', -0.250, 27000.0000, 0.750, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(244, 5, 'sale', -3.000, 1550.0000, 4987.000, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(245, 25, 'sale', -0.045, 110000.0000, 3.365, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(246, 12, 'sale', -5.000, 1700.0000, 2815.000, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(247, 35, 'sale', -0.075, 200000.0000, 0.395, 'App\\Models\\Order', 57, 2, 'بيع طلب #20260823-0005', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(248, 5, 'sale', -1.000, 1550.0000, 4986.000, 'App\\Models\\Order', 58, 2, 'بيع طلب #20260823-0006', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(249, 25, 'sale', -0.015, 110000.0000, 3.350, 'App\\Models\\Order', 58, 2, 'بيع طلب #20260823-0006', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(250, 12, 'sale', -1.000, 1700.0000, 2814.000, 'App\\Models\\Order', 58, 2, 'بيع طلب #20260823-0006', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(251, 35, 'sale', -0.015, 200000.0000, 0.380, 'App\\Models\\Order', 58, 2, 'بيع طلب #20260823-0006', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(252, 47, 'sale', -2.000, 1500.0000, 18.000, 'App\\Models\\Order', 58, 2, 'بيع طلب #20260823-0006', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(253, 47, 'sale', -4.000, 1500.0000, 14.000, 'App\\Models\\Order', 59, 2, 'بيع طلب #20260823-0007', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(254, 5, 'sale', -1.000, 1550.0000, 4985.000, 'App\\Models\\Order', 59, 2, 'بيع طلب #20260823-0007', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(255, 25, 'sale', -0.015, 110000.0000, 3.335, 'App\\Models\\Order', 59, 2, 'بيع طلب #20260823-0007', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(256, 12, 'sale', -3.000, 1700.0000, 2811.000, 'App\\Models\\Order', 59, 2, 'بيع طلب #20260823-0007', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(257, 35, 'sale', -0.045, 200000.0000, 0.335, 'App\\Models\\Order', 59, 2, 'بيع طلب #20260823-0007', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(258, 12, 'sale', -8.000, 1700.0000, 2803.000, 'App\\Models\\Order', 60, 2, 'بيع طلب #20260823-0008', '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
(259, 35, 'sale', -0.120, 200000.0000, 0.215, 'App\\Models\\Order', 60, 2, 'بيع طلب #20260823-0008', '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
(260, 47, 'sale', -8.000, 1500.0000, 6.000, 'App\\Models\\Order', 61, 2, 'بيع طلب #20260823-0009', '2026-08-23 09:15:04', '2026-08-23 09:15:04'),
(261, 47, 'sale', -3.000, 1500.0000, 3.000, 'App\\Models\\Order', 62, 2, 'بيع طلب #20260823-0010', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(262, 5, 'sale', -3.000, 1550.0000, 4982.000, 'App\\Models\\Order', 62, 2, 'بيع طلب #20260823-0010', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(263, 25, 'sale', -0.045, 110000.0000, 3.290, 'App\\Models\\Order', 62, 2, 'بيع طلب #20260823-0010', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(264, 12, 'sale', -3.000, 1700.0000, 2800.000, 'App\\Models\\Order', 63, 2, 'بيع طلب #20260823-0011', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(265, 26, 'sale', -3.000, 3000.0000, 15.000, 'App\\Models\\Order', 63, 2, 'بيع طلب #20260823-0011', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(266, 47, 'sale', -3.000, 1500.0000, 0.000, 'App\\Models\\Order', 63, 2, 'بيع طلب #20260823-0011', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(267, 45, 'sale', -0.014, 500000.0000, 0.958, 'App\\Models\\Order', 64, 2, 'بيع طلب #20260823-0012', '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
(268, 47, 'sale', -1.000, 1500.0000, -1.000, 'App\\Models\\Order', 64, 2, 'بيع طلب #20260823-0012', '2026-08-23 11:01:22', '2026-08-23 11:01:22'),
(269, 45, 'sale', -0.014, 500000.0000, 0.944, 'App\\Models\\Order', 65, 2, 'بيع طلب #20260823-0013', '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(270, 47, 'sale', -1.000, 1500.0000, -2.000, 'App\\Models\\Order', 65, 2, 'بيع طلب #20260823-0013', '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(271, 47, 'sale', -3.000, 1500.0000, -5.000, 'App\\Models\\Order', 66, 2, 'بيع طلب #20260823-0014', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(272, 6, 'sale', -2.000, 1800.0000, 960.000, 'App\\Models\\Order', 66, 2, 'بيع طلب #20260823-0014', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(273, 10, 'sale', -2.000, 350.0000, 2464.000, 'App\\Models\\Order', 66, 2, 'بيع طلب #20260823-0014', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(274, 17, 'sale', -0.200, 7000.0000, 0.100, 'App\\Models\\Order', 66, 2, 'بيع طلب #20260823-0014', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(275, 49, 'sale', -2.000, 6000.0000, 13.000, 'App\\Models\\Order', 66, 2, 'بيع طلب #20260823-0014', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(276, 5, 'sale', -1.000, 1550.0000, 4981.000, 'App\\Models\\Order', 66, 2, 'بيع طلب #20260823-0014', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(277, 25, 'sale', -0.015, 110000.0000, 3.275, 'App\\Models\\Order', 66, 2, 'بيع طلب #20260823-0014', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(278, 44, 'sale', -0.014, 500000.0000, 0.944, 'App\\Models\\Order', 67, 2, 'بيع طلب #20260823-0015', '2026-08-23 11:09:39', '2026-08-23 11:09:39'),
(279, 12, 'sale', -1.000, 1700.0000, 2799.000, 'App\\Models\\Order', 68, 2, 'بيع طلب #20260823-0016', '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
(280, 35, 'sale', -0.015, 200000.0000, 0.200, 'App\\Models\\Order', 68, 2, 'بيع طلب #20260823-0016', '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
(281, 45, 'sale', -0.014, 500000.0000, 0.930, 'App\\Models\\Order', 69, 2, 'بيع طلب #20260823-0017', '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(282, 47, 'sale', -1.000, 1500.0000, -6.000, 'App\\Models\\Order', 69, 2, 'بيع طلب #20260823-0017', '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(283, 45, 'sale', -0.014, 500000.0000, 0.916, 'App\\Models\\Order', 70, 2, 'بيع طلب #20260823-0018', '2026-08-23 11:24:15', '2026-08-23 11:24:15'),
(284, 45, 'sale', -0.014, 500000.0000, 0.902, 'App\\Models\\Order', 71, 2, 'بيع طلب #20260824-0001', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(285, 12, 'sale', -1.000, 1700.0000, 2798.000, 'App\\Models\\Order', 71, 2, 'بيع طلب #20260824-0001', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(286, 29, 'sale', -1.000, 500.0000, 699.000, 'App\\Models\\Order', 71, 2, 'بيع طلب #20260824-0001', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(287, 34, 'sale', -0.020, 20000.0000, 7.780, 'App\\Models\\Order', 71, 2, 'بيع طلب #20260824-0001', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(288, 12, 'sale', -1.000, 1700.0000, 2797.000, 'App\\Models\\Order', 72, 2, 'بيع طلب #20260824-0002', '2026-08-24 07:25:41', '2026-08-24 07:25:41'),
(289, 28, 'sale', -1.000, 1300.0000, 29.000, 'App\\Models\\Order', 72, 2, 'بيع طلب #20260824-0002', '2026-08-24 07:25:41', '2026-08-24 07:25:41'),
(290, 12, 'sale', -1.000, 1700.0000, 2796.000, 'App\\Models\\Order', 73, 2, 'بيع طلب #20260824-0003', '2026-08-24 07:26:46', '2026-08-24 07:26:46'),
(291, 28, 'sale', -1.000, 1300.0000, 28.000, 'App\\Models\\Order', 73, 2, 'بيع طلب #20260824-0003', '2026-08-24 07:26:46', '2026-08-24 07:26:46'),
(292, 47, 'sale', -2.000, 1500.0000, -8.000, 'App\\Models\\Order', 74, 2, 'بيع طلب #20260824-0004', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(293, 12, 'sale', -1.000, 1700.0000, 2795.000, 'App\\Models\\Order', 74, 2, 'بيع طلب #20260824-0004', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(294, 26, 'sale', -1.000, 3000.0000, 14.000, 'App\\Models\\Order', 74, 2, 'بيع طلب #20260824-0004', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(295, 5, 'sale', -1.000, 1550.0000, 4980.000, 'App\\Models\\Order', 74, 2, 'بيع طلب #20260824-0004', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(296, 25, 'sale', -0.015, 110000.0000, 3.260, 'App\\Models\\Order', 74, 2, 'بيع طلب #20260824-0004', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(297, 47, 'sale', -2.000, 1500.0000, -10.000, 'App\\Models\\Order', 75, 2, 'بيع طلب #20260824-0005', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(298, 43, 'sale', -0.014, 500000.0000, 0.972, 'App\\Models\\Order', 75, 2, 'بيع طلب #20260824-0005', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(299, 6, 'sale', -2.000, 1800.0000, 958.000, 'App\\Models\\Order', 75, 2, 'بيع طلب #20260824-0005', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(300, 10, 'sale', -2.000, 350.0000, 2462.000, 'App\\Models\\Order', 75, 2, 'بيع طلب #20260824-0005', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(301, 14, 'sale', -0.500, 4000.0000, 52.550, 'App\\Models\\Order', 75, 2, 'بيع طلب #20260824-0005', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(302, 17, 'sale', -0.200, 7000.0000, -0.100, 'App\\Models\\Order', 75, 2, 'بيع طلب #20260824-0005', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(303, 21, 'sale', -1.000, 5000.0000, 23.500, 'App\\Models\\Order', 75, 2, 'بيع طلب #20260824-0005', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(304, 8, 'sale', -1.000, 2400.0000, 2989.000, 'App\\Models\\Order', 76, 2, 'بيع طلب #20260825-0001', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(305, 14, 'sale', -0.300, 4000.0000, 52.250, 'App\\Models\\Order', 76, 2, 'بيع طلب #20260825-0001', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(306, 16, 'sale', -0.015, 100000.0000, 3.275, 'App\\Models\\Order', 76, 2, 'بيع طلب #20260825-0001', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(307, 8, 'sale', -1.000, 2400.0000, 2988.000, 'App\\Models\\Order', 77, 2, 'بيع طلب #20260825-0002', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(308, 14, 'sale', -0.300, 4000.0000, 51.950, 'App\\Models\\Order', 77, 2, 'بيع طلب #20260825-0002', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(309, 16, 'sale', -0.015, 100000.0000, 3.260, 'App\\Models\\Order', 77, 2, 'بيع طلب #20260825-0002', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(310, 6, 'sale', -1.000, 1800.0000, 957.000, 'App\\Models\\Order', 78, 2, 'بيع طلب #20260825-0003', '2026-08-25 06:13:17', '2026-08-25 06:13:17'),
(311, 11, 'sale', -1.000, 350.0000, 1993.000, 'App\\Models\\Order', 78, 2, 'بيع طلب #20260825-0003', '2026-08-25 06:13:17', '2026-08-25 06:13:17'),
(312, 14, 'sale', -0.300, 4000.0000, 51.650, 'App\\Models\\Order', 78, 2, 'بيع طلب #20260825-0003', '2026-08-25 06:13:18', '2026-08-25 06:13:18'),
(313, 16, 'sale', -0.015, 100000.0000, 3.245, 'App\\Models\\Order', 78, 2, 'بيع طلب #20260825-0003', '2026-08-25 06:13:18', '2026-08-25 06:13:18'),
(314, 4, 'sale', -1.000, 1750.0000, 2399.000, 'App\\Models\\Order', 79, 2, 'بيع طلب #20260825-0004', '2026-08-25 06:31:11', '2026-08-25 06:31:11'),
(315, 47, 'sale', -1.000, 1500.0000, -11.000, 'App\\Models\\Order', 80, 2, 'بيع طلب #20260825-0005', '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(316, 43, 'sale', -0.014, 500000.0000, 0.958, 'App\\Models\\Order', 80, 2, 'بيع طلب #20260825-0005', '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(317, 8, 'sale', -1.000, 2400.0000, 2987.000, 'App\\Models\\Order', 81, 2, 'بيع طلب #20260826-0001', '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(318, 14, 'sale', -0.300, 4000.0000, 51.350, 'App\\Models\\Order', 81, 2, 'بيع طلب #20260826-0001', '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(319, 16, 'sale', -0.015, 100000.0000, 3.230, 'App\\Models\\Order', 81, 2, 'بيع طلب #20260826-0001', '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(320, 8, 'sale', -1.000, 2400.0000, 2986.000, 'App\\Models\\Order', 82, 2, 'بيع طلب #20260826-0002', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(321, 14, 'sale', -0.300, 4000.0000, 51.050, 'App\\Models\\Order', 82, 2, 'بيع طلب #20260826-0002', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(322, 16, 'sale', -0.015, 100000.0000, 3.215, 'App\\Models\\Order', 82, 2, 'بيع طلب #20260826-0002', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(323, 37, 'sale', -0.050, 80000.0000, 3.750, 'App\\Models\\Order', 82, 2, 'بيع طلب #20260826-0002', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(324, 9, 'sale', -1.000, 1900.0000, 747.000, 'App\\Models\\Order', 83, 2, 'بيع طلب #20260826-0003', '2026-08-26 20:45:29', '2026-08-26 20:45:29'),
(325, 14, 'sale', -0.300, 4000.0000, 50.750, 'App\\Models\\Order', 83, 2, 'بيع طلب #20260826-0003', '2026-08-26 20:45:29', '2026-08-26 20:45:29'),
(326, 16, 'sale', -0.015, 100000.0000, 3.200, 'App\\Models\\Order', 83, 2, 'بيع طلب #20260826-0003', '2026-08-26 20:45:29', '2026-08-26 20:45:29'),
(327, 37, 'sale', -0.050, 80000.0000, 3.700, 'App\\Models\\Order', 83, 2, 'بيع طلب #20260826-0003', '2026-08-26 20:45:29', '2026-08-26 20:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL DEFAULT 4,
  `status` varchar(255) NOT NULL DEFAULT 'available',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `capacity`, `status`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(5, '#1', 4, 'available', 0, 1, '2026-08-16 22:31:14', '2026-08-23 11:09:53'),
(6, '#2', 4, 'available', 0, 1, '2026-08-16 22:31:42', '2026-08-22 05:52:49'),
(7, '#3', 4, 'available', 0, 1, '2026-08-16 22:31:47', '2026-08-21 17:34:23'),
(8, '#4', 4, 'available', 0, 1, '2026-08-16 22:31:56', '2026-08-16 22:31:56'),
(9, '#5', 4, 'available', 0, 1, '2026-08-16 22:32:03', '2026-08-16 22:32:03'),
(10, '#6', 4, 'available', 0, 1, '2026-08-16 22:32:08', '2026-08-16 22:39:48'),
(11, '#7', 4, 'available', 0, 1, '2026-08-16 22:32:18', '2026-08-21 17:35:01'),
(12, '#8', 4, 'available', 0, 1, '2026-08-16 22:32:31', '2026-08-16 22:32:31'),
(13, '#9', 4, 'available', 0, 1, '2026-08-16 22:33:20', '2026-08-16 22:33:20'),
(14, '#10', 4, 'available', 0, 1, '2026-08-16 22:33:27', '2026-08-21 15:19:22'),
(15, '#11', 4, 'available', 0, 1, '2026-08-16 22:33:32', '2026-08-16 22:33:32'),
(16, '#12', 4, 'available', 0, 1, '2026-08-16 22:33:39', '2026-08-21 17:35:43'),
(17, '#13', 4, 'available', 0, 1, '2026-08-16 22:33:44', '2026-08-16 22:33:44'),
(18, '#14', 4, 'available', 0, 1, '2026-08-16 22:33:49', '2026-08-16 22:33:49'),
(19, '#15', 4, 'available', 0, 1, '2026-08-16 22:34:00', '2026-08-16 22:34:00'),
(20, '#16', 4, 'available', 0, 1, '2026-08-16 22:34:07', '2026-08-16 22:34:07'),
(21, '#17', 4, 'available', 0, 1, '2026-08-16 22:34:12', '2026-08-16 22:34:12'),
(22, '#18', 4, 'available', 0, 1, '2026-08-16 22:34:20', '2026-08-16 22:34:20'),
(23, '#19', 4, 'available', 0, 1, '2026-08-16 22:34:26', '2026-08-16 22:34:26'),
(24, '#20', 4, 'available', 0, 1, '2026-08-16 22:34:52', '2026-08-16 22:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `amount` decimal(14,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `source_type` varchar(255) DEFAULT NULL,
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `occurred_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `category`, `amount`, `description`, `source_type`, `source_id`, `user_id`, `occurred_at`, `created_at`, `updated_at`) VALUES
(23, 'income', 'sales', 135000.00, 'مبيعات طلب #20260821-0001', 'App\\Models\\Order', 25, 1, '2026-08-21 17:25:44', '2026-08-21 17:34:23', '2026-08-21 17:34:23'),
(24, 'income', 'sales', 40000.00, 'مبيعات طلب #20260821-0002', 'App\\Models\\Order', 26, 1, '2026-08-21 17:26:02', '2026-08-21 17:35:01', '2026-08-21 17:35:01'),
(26, 'income', 'sales', 10000.00, 'مبيعات طلب #20260822-0001', 'App\\Models\\Order', 28, 2, '2026-08-22 05:42:48', '2026-08-22 05:52:49', '2026-08-22 05:52:49'),
(28, 'income', 'sales', 20000.00, 'مبيعات طلب #20260822-0003', 'App\\Models\\Order', 30, 2, '2026-08-22 06:29:52', '2026-08-22 06:29:52', '2026-08-22 06:29:52'),
(29, 'income', 'sales', 20000.00, 'مبيعات طلب #20260822-0004', 'App\\Models\\Order', 31, 2, '2026-08-22 06:30:41', '2026-08-22 06:30:41', '2026-08-22 06:30:41'),
(30, 'income', 'sales', 20000.00, 'مبيعات طلب #20260822-0005', 'App\\Models\\Order', 32, 2, '2026-08-22 08:13:45', '2026-08-22 08:13:45', '2026-08-22 08:13:45'),
(31, 'income', 'sales', 30000.00, 'مبيعات طلب #20260822-0006', 'App\\Models\\Order', 33, 2, '2026-08-22 09:19:47', '2026-08-22 09:19:47', '2026-08-22 09:19:47'),
(32, 'income', 'sales', 25000.00, 'مبيعات طلب #20260822-0007', 'App\\Models\\Order', 34, 2, '2026-08-22 09:46:47', '2026-08-22 09:46:47', '2026-08-22 09:46:47'),
(33, 'income', 'sales', 23750.00, 'مبيعات طلب #20260822-0008', 'App\\Models\\Order', 35, 2, '2026-08-22 09:48:57', '2026-08-22 09:48:57', '2026-08-22 09:48:57'),
(34, 'income', 'sales', 0.00, 'مبيعات طلب #20260822-0009', 'App\\Models\\Order', 36, 2, '2026-08-22 09:50:03', '2026-08-22 09:50:03', '2026-08-22 09:50:03'),
(35, 'income', 'sales', 0.00, 'مبيعات طلب #20260822-0010', 'App\\Models\\Order', 37, 2, '2026-08-22 09:50:35', '2026-08-22 09:50:35', '2026-08-22 09:50:35'),
(36, 'income', 'sales', 0.00, 'مبيعات طلب #20260822-0011', 'App\\Models\\Order', 38, 2, '2026-08-22 09:51:12', '2026-08-22 09:51:12', '2026-08-22 09:51:12'),
(37, 'income', 'sales', 50000.00, 'مبيعات طلب #20260822-0012', 'App\\Models\\Order', 39, 2, '2026-08-22 10:25:33', '2026-08-22 10:25:33', '2026-08-22 10:25:33'),
(38, 'income', 'sales', 20000.00, 'مبيعات طلب #20260822-0016', 'App\\Models\\Order', 43, 2, '2026-08-22 11:30:19', '2026-08-22 11:30:19', '2026-08-22 11:30:19'),
(39, 'income', 'sales', 50000.00, 'مبيعات طلب #20260822-0017', 'App\\Models\\Order', 44, 2, '2026-08-22 11:31:28', '2026-08-22 11:31:28', '2026-08-22 11:31:28'),
(40, 'income', 'sales', 66000.00, 'مبيعات طلب #20260822-0018', 'App\\Models\\Order', 45, 2, '2026-08-22 11:34:14', '2026-08-22 11:34:14', '2026-08-22 11:34:14'),
(41, 'income', 'sales', 91000.00, 'مبيعات طلب #20260822-0019', 'App\\Models\\Order', 46, 2, '2026-08-22 11:48:00', '2026-08-22 11:48:01', '2026-08-22 11:48:01'),
(42, 'income', 'sales', 10000.00, 'مبيعات طلب #20260822-0020', 'App\\Models\\Order', 47, 2, '2026-08-22 12:07:50', '2026-08-22 12:07:50', '2026-08-22 12:07:50'),
(43, 'income', 'sales', 106000.00, 'مبيعات طلب #20260822-0021', 'App\\Models\\Order', 48, 2, '2026-08-22 12:10:13', '2026-08-22 12:10:13', '2026-08-22 12:10:13'),
(44, 'income', 'sales', 36000.00, 'مبيعات طلب #20260822-0022', 'App\\Models\\Order', 49, 2, '2026-08-22 12:26:08', '2026-08-22 12:26:08', '2026-08-22 12:26:08'),
(45, 'income', 'sales', 101000.00, 'مبيعات طلب #20260822-0023', 'App\\Models\\Order', 50, 2, '2026-08-22 12:38:35', '2026-08-22 12:38:35', '2026-08-22 12:38:35'),
(46, 'income', 'sales', 41000.00, 'مبيعات طلب #20260822-0024', 'App\\Models\\Order', 51, 2, '2026-08-22 12:39:59', '2026-08-22 12:39:59', '2026-08-22 12:39:59'),
(47, 'income', 'sales', 29000.00, 'مبيعات طلب #20260822-0025', 'App\\Models\\Order', 52, 2, '2026-08-22 14:04:36', '2026-08-22 14:04:36', '2026-08-22 14:04:36'),
(48, 'income', 'sales', 35000.00, 'مبيعات طلب #20260823-0001', 'App\\Models\\Order', 53, 1, '2026-08-23 05:49:31', '2026-08-23 05:49:31', '2026-08-23 05:49:31'),
(49, 'income', 'sales', 20000.00, 'مبيعات طلب #20260823-0002', 'App\\Models\\Order', 54, 2, '2026-08-23 05:56:52', '2026-08-23 05:56:52', '2026-08-23 05:56:52'),
(50, 'income', 'sales', 48000.00, 'مبيعات طلب #20260823-0003', 'App\\Models\\Order', 55, 2, '2026-08-23 06:14:22', '2026-08-23 06:14:23', '2026-08-23 06:14:23'),
(51, 'income', 'sales', 26000.00, 'مبيعات طلب #20260823-0004', 'App\\Models\\Order', 56, 2, '2026-08-23 07:11:54', '2026-08-23 07:11:54', '2026-08-23 07:11:54'),
(52, 'income', 'sales', 116000.00, 'مبيعات طلب #20260823-0005', 'App\\Models\\Order', 57, 2, '2026-08-23 07:28:27', '2026-08-23 07:28:27', '2026-08-23 07:28:27'),
(53, 'income', 'sales', 24000.00, 'مبيعات طلب #20260823-0006', 'App\\Models\\Order', 58, 2, '2026-08-23 07:53:44', '2026-08-23 07:53:44', '2026-08-23 07:53:44'),
(54, 'income', 'sales', 46000.00, 'مبيعات طلب #20260823-0007', 'App\\Models\\Order', 59, 2, '2026-08-23 08:27:18', '2026-08-23 08:27:18', '2026-08-23 08:27:18'),
(55, 'income', 'sales', 64000.00, 'مبيعات طلب #20260823-0008', 'App\\Models\\Order', 60, 2, '2026-08-23 09:13:26', '2026-08-23 09:13:26', '2026-08-23 09:13:26'),
(56, 'income', 'sales', 24000.00, 'مبيعات طلب #20260823-0009', 'App\\Models\\Order', 61, 2, '2026-08-23 09:15:03', '2026-08-23 09:15:04', '2026-08-23 09:15:04'),
(57, 'income', 'sales', 39000.00, 'مبيعات طلب #20260823-0010', 'App\\Models\\Order', 62, 2, '2026-08-23 10:44:04', '2026-08-23 10:44:04', '2026-08-23 10:44:04'),
(58, 'income', 'sales', 39000.00, 'مبيعات طلب #20260823-0011', 'App\\Models\\Order', 63, 2, '2026-08-23 10:49:30', '2026-08-23 10:49:30', '2026-08-23 10:49:30'),
(59, 'income', 'sales', 28000.00, 'مبيعات طلب #20260823-0012', 'App\\Models\\Order', 64, 2, '2026-08-23 11:01:22', '2026-08-23 11:01:36', '2026-08-23 11:01:36'),
(60, 'income', 'sales', 28000.00, 'مبيعات طلب #20260823-0013', 'App\\Models\\Order', 65, 2, '2026-08-23 11:02:07', '2026-08-23 11:02:07', '2026-08-23 11:02:07'),
(61, 'income', 'sales', 39000.00, 'مبيعات طلب #20260823-0014', 'App\\Models\\Order', 66, 2, '2026-08-23 11:06:41', '2026-08-23 11:06:41', '2026-08-23 11:06:41'),
(62, 'income', 'sales', 25000.00, 'مبيعات طلب #20260823-0015', 'App\\Models\\Order', 67, 2, '2026-08-23 11:09:39', '2026-08-23 11:09:53', '2026-08-23 11:09:53'),
(63, 'income', 'sales', 8000.00, 'مبيعات طلب #20260823-0016', 'App\\Models\\Order', 68, 2, '2026-08-23 11:11:39', '2026-08-23 11:11:39', '2026-08-23 11:11:39'),
(64, 'income', 'sales', 28000.00, 'مبيعات طلب #20260823-0017', 'App\\Models\\Order', 69, 2, '2026-08-23 11:13:40', '2026-08-23 11:13:40', '2026-08-23 11:13:40'),
(65, 'income', 'sales', 25000.00, 'مبيعات طلب #20260823-0018', 'App\\Models\\Order', 70, 2, '2026-08-23 11:24:15', '2026-08-23 11:24:15', '2026-08-23 11:24:15'),
(66, 'income', 'sales', 33000.00, 'مبيعات طلب #20260824-0001', 'App\\Models\\Order', 71, 2, '2026-08-24 07:25:04', '2026-08-24 07:25:04', '2026-08-24 07:25:04'),
(67, 'income', 'sales', 10000.00, 'مبيعات طلب #20260824-0002', 'App\\Models\\Order', 72, 2, '2026-08-24 07:25:41', '2026-08-24 07:25:41', '2026-08-24 07:25:41'),
(68, 'income', 'sales', 10000.00, 'مبيعات طلب #20260824-0003', 'App\\Models\\Order', 73, 2, '2026-08-24 07:26:46', '2026-08-24 07:26:46', '2026-08-24 07:26:46'),
(69, 'income', 'sales', 26000.00, 'مبيعات طلب #20260824-0004', 'App\\Models\\Order', 74, 2, '2026-08-24 08:31:23', '2026-08-24 08:31:23', '2026-08-24 08:31:23'),
(70, 'income', 'sales', 91000.00, 'مبيعات طلب #20260824-0005', 'App\\Models\\Order', 75, 2, '2026-08-24 09:58:44', '2026-08-24 09:58:44', '2026-08-24 09:58:44'),
(71, 'income', 'sales', 20000.00, 'مبيعات طلب #20260825-0001', 'App\\Models\\Order', 76, 2, '2026-08-25 05:38:34', '2026-08-25 05:38:34', '2026-08-25 05:38:34'),
(72, 'income', 'sales', 20000.00, 'مبيعات طلب #20260825-0002', 'App\\Models\\Order', 77, 2, '2026-08-25 06:12:41', '2026-08-25 06:12:41', '2026-08-25 06:12:41'),
(73, 'income', 'sales', 20000.00, 'مبيعات طلب #20260825-0003', 'App\\Models\\Order', 78, 2, '2026-08-25 06:13:17', '2026-08-25 06:13:18', '2026-08-25 06:13:18'),
(74, 'income', 'sales', 0.00, 'مبيعات طلب #20260825-0004', 'App\\Models\\Order', 79, 2, '2026-08-25 06:31:11', '2026-08-25 06:31:11', '2026-08-25 06:31:11'),
(75, 'income', 'sales', 28000.00, 'مبيعات طلب #20260825-0005', 'App\\Models\\Order', 80, 2, '2026-08-25 08:45:36', '2026-08-25 08:45:36', '2026-08-25 08:45:36'),
(76, 'income', 'sales', 20000.00, 'مبيعات طلب #20260826-0001', 'App\\Models\\Order', 81, 2, '2026-08-26 20:37:04', '2026-08-26 20:37:04', '2026-08-26 20:37:04'),
(77, 'income', 'sales', 35000.00, 'مبيعات طلب #20260826-0002', 'App\\Models\\Order', 82, 2, '2026-08-26 20:44:48', '2026-08-26 20:44:48', '2026-08-26 20:44:48'),
(78, 'income', 'sales', 35000.00, 'مبيعات طلب #20260826-0003', 'App\\Models\\Order', 83, 2, '2026-08-26 20:45:28', '2026-08-26 20:45:29', '2026-08-26 20:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `abbreviation`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', '2026-07-10 11:12:38', '2026-07-26 23:45:50'),
(2, 'قطعة', 'قطعة', '2026-07-26 23:47:01', '2026-07-26 23:47:01'),
(3, 'كيلو', 'كيلو', '2026-07-27 00:18:05', '2026-07-27 00:18:05'),
(4, 'غرام', 'غرام', '2026-07-27 00:18:13', '2026-07-27 00:18:13'),
(5, 'مل', 'مل', '2026-07-27 00:18:22', '2026-07-27 00:18:22'),
(6, 'لتر', 'لتر', '2026-07-27 00:18:31', '2026-07-27 00:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `is_active`, `last_login_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'مدير النظام', 'manager@cu.local', NULL, NULL, '$2y$12$ZVPK7oukfzzEq1qlmRPlI.6W/O.YZvB1RuPhv18JcBt/3T4hjxkNO', 1, '2026-10-11 00:19:54', 'vd6WPIyQnFVus9oammv8kM8CPW0Ju8nclUtAeMpfis9bgG6Qk3oedELHw5yr', '2026-05-28 20:25:38', '2026-10-11 00:19:54', NULL),
(2, 'كاشير الفرع', 'cashier@cu.local', NULL, NULL, '$2y$12$x9oqSF.xDqLQ8N17Pnb3beiOP6me0lvACsHIE2lLPbZka/ATnfO5y', 1, '2026-10-03 09:16:02', NULL, '2026-05-28 20:25:39', '2026-10-03 09:16:02', NULL),
(3, 'شيف المطبخ', 'chef@cu.local', NULL, NULL, '$2y$12$abCp1nJe4uvJO7YJJhSGBORTSK8MKaIFh9e5lYn1ikkG4PeQMv4hu', 1, '2026-08-19 15:48:41', 'wjD2iSZsD3zbpRuA03gzDtbM0kusZnXx6D6DedZrxJChD8rEvUpzYnJF5lHY', '2026-05-28 20:25:39', '2026-08-19 15:48:41', NULL),
(4, 'المحاسب', 'accountant@cu.local', NULL, NULL, '$2y$12$CxnK17fxcs6/lGTf8DN5fuU5jYqcVn8sK83J0aYHljhGU/PFJf5n2', 1, '2026-06-14 20:11:52', NULL, '2026-05-28 20:25:39', '2026-08-14 23:53:43', '2026-08-14 23:53:43'),
(5, 'مسؤول المخزن', 'storage@cu.local', NULL, NULL, '$2y$12$rcDRi2jxdKxi5zcj9BCLx.N7eCp8Cbqsgj7lz8nuZqSqtt.e7/03O', 1, '2026-05-31 19:38:15', NULL, '2026-05-28 20:25:39', '2026-08-14 23:53:40', '2026-08-14 23:53:40'),
(6, 'dani', 'dani@cu.com', '07511452694', NULL, '$2y$12$Qro1vEXojBMr2nMfWX8TAOhPOyaWALAXmiMaSS5YvoNpckq.HNo1G', 1, '2026-05-29 21:37:55', NULL, '2026-05-29 21:37:47', '2026-07-09 14:13:02', '2026-07-09 14:13:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`),
  ADD KEY `expenses_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `expenses_spent_at_index` (`spent_at`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredients_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_sku_unique` (`sku`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD UNIQUE KEY `orders_invoice_number_unique` (`invoice_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_status_created_at_index` (`status`,`created_at`),
  ADD KEY `orders_shift_id_index` (`shift_id`),
  ADD KEY `orders_table_id_foreign` (`table_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_reference_unique` (`reference`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_items_ingredient_id_foreign` (`ingredient_id`);

--
-- Indexes for table `recipe_items`
--
ALTER TABLE `recipe_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recipe_items_item_id_ingredient_id_unique` (`item_id`,`ingredient_id`),
  ADD KEY `recipe_items_ingredient_id_foreign` (`ingredient_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shifts_user_id_status_index` (`user_id`,`status`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_movements_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `stock_movements_user_id_foreign` (`user_id`),
  ADD KEY `stock_movements_ingredient_id_type_index` (`ingredient_id`,`type`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_source_type_source_id_index` (`source_type`,`source_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_type_occurred_at_index` (`type`,`occurred_at`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=925;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipe_items`
--
ALTER TABLE `recipe_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`),
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_items`
--
ALTER TABLE `recipe_items`
  ADD CONSTRAINT `recipe_items_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `recipe_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `stock_movements_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_movements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
