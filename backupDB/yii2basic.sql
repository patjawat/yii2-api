-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: mariaDB
-- Generation Time: 19 เม.ย. 2020 เมื่อ 11:46 AM
-- เวอร์ชันของเซิร์ฟเวอร์: 10.4.10-MariaDB-1:10.4.10+maria~bionic
-- PHP Version: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2basic`
--

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `properties` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- dump ตาราง `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('nurse', '8', 1536819196),
('nurse', '3', 1536819296),
('doctor', '5', 1536819309),
('doctor', '6', 1536819326),
('doctor', '2', 1536819339),
('vital_sign_screening_nurse', '4', 1549734183),
('Q-Manages', '9', 1549734396),
('dm_nures_manage', '10', 1549734485),
('Exit Nurse', '11', 1549734594),
('nurse', '7', 1557158514),
('doctor', '24', 1557158673),
('admin', '24', 1557158673),
('doctor', '25', 1565024466),
('doctor', '26', 1565024496),
('doctor', '27', 1565024607),
('doctor', '28', 1565065190),
('doctor', '29', 1565066968),
('foot', '30', 1565148560),
('admin', '31', 1565149391),
('doctor', '34', 1565172470),
('dr_eye', '34', 1565172470),
('doctor', '32', 1565172485),
('dr_confirmBP', '32', 1565172485),
('nurse', '36', 1565345273),
('nurse', '37', 1565345309),
('hd', '39', 1565345414),
('hbot', '38', 1565345434),
('dietitian', '41', 1566816293),
('doctor', '42', 1568355864),
('dr_confirmBP', '42', 1568355864),
('doctor', '43', 1568691883),
('doctor', '40', 1568691899),
('doctor', '44', 1569316167),
('dr_eye', '44', 1569316167),
('dm-nurse', '45', 1570786510),
('admin', '46', 1573636480),
('risk_score', '46', 1573636480),
('nurse', '33', 1573703931),
('pharmacist', '35', 1579580330),
('phama_edit', '35', 1579580330),
('doctor', '49', 1580478006),
('doctor', '50', 1580478502),
('doctor', '1', 1586232531),
('chiefcomplaint', '1', 1586232531),
('admin', '1', 1586232531);

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- dump ตาราง `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'สำหรับผู้ดูแลระบบ', NULL, NULL, 1557158656, 1573636242),
('/usermanager/*', 2, NULL, NULL, NULL, 1557741797, 1557741797),
('/admin/*', 2, NULL, NULL, NULL, 1557741860, 1557741860),
('/user/*', 2, NULL, NULL, NULL, 1557741869, 1557741869),
('/debug/*', 2, NULL, NULL, NULL, 1557741938, 1557741938),
('/settings/*', 2, NULL, NULL, NULL, 1557741992, 1557741992),
('/document/*', 2, NULL, NULL, NULL, 1557742026, 1557742026),
('/doctorworkbench/doctor-free-items/*', 2, NULL, NULL, NULL, 1557742123, 1557742123),
('/site/*', 2, NULL, NULL, NULL, 1557745006, 1557745006),
('/opdvisit/*', 2, NULL, NULL, NULL, 1557745055, 1557745055),
('/doctorworkbench/doctor-free/*', 2, NULL, NULL, NULL, 1557755655, 1557755655),
('/doctorworkbench/df-charge/*', 2, NULL, NULL, NULL, 1557756570, 1557756570),
('/doctorworkbench/df-charge/*', 2, NULL, NULL, NULL, 1557756601, 1557756601),
('/doctorworkbench/df-charge-doctor-type/*', 2, NULL, NULL, NULL, 1557756637, 1557756637),
('/doctorworkbench/df-receipt/*', 2, NULL, NULL, NULL, 1557759804, 1557759804),
('/doctorworkbench/default/index', 2, NULL, NULL, NULL, 1557761771, 1557761771),
('/doctorworkbench/diagnosis/create', 2, NULL, NULL, NULL, 1557761957, 1557761957),
('/doctorworkbench/diagnosis', 2, NULL, NULL, NULL, 1557762027, 1557762027),
('/chiefcomplaint/chiefcomplaint/doctor-view', 2, NULL, NULL, NULL, 1557762057, 1557762057),
('/doctorworkbench/medication/index', 2, NULL, NULL, NULL, 1557762069, 1557762069),
('/doctorworkbench/medication/create', 2, NULL, NULL, NULL, 1557762081, 1557762081),
('/doctorworkbench/diagnosis/*', 2, NULL, NULL, NULL, 1557762154, 1557762154),
('/doctorworkbench/medication/check-nomed-status', 2, NULL, NULL, NULL, 1557762198, 1557762198),
('/chiefcomplaint/*', 2, NULL, NULL, NULL, 1557762663, 1557762663),
('/doctorworkbench/default/check-out', 2, NULL, NULL, NULL, 1557763635, 1557763635),
('/doctorworkbench/medication/drug-items-list', 2, NULL, NULL, NULL, 1557763769, 1557763769),
('/doctorworkbench/medication/editable', 2, NULL, NULL, NULL, 1557763838, 1557763838),
('/doctorworkbench/df-receipt-doctor/*', 2, NULL, NULL, NULL, 1557807527, 1557807527),
('/lab/default/lab-result', 2, NULL, NULL, NULL, 1557900302, 1557900302),
('/med/arrange/*', 2, NULL, NULL, NULL, 1579579883, 1579579883),
('/med/dispense/*', 2, NULL, NULL, NULL, 1579579905, 1579579905),
('/med/manage/*', 2, NULL, NULL, NULL, 1579579929, 1579579929),
('/med/recheck/*', 2, NULL, NULL, NULL, 1579579948, 1579579948),
('/med/screen', 2, NULL, NULL, NULL, 1579579961, 1579579961),
('/med/default/index', 2, NULL, NULL, NULL, 1579580010, 1579580010),
('/med/default/med-cancel', 2, NULL, NULL, NULL, 1579580029, 1579580029),
('/*', 2, NULL, NULL, NULL, 1584789646, 1584789646);

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- dump ตาราง `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('nurse', 'lab'),
('doctor', 'emr'),
('nurse', 'chiefcomplaint'),
('nurse', 'emr'),
('admin', '/usermanager/*'),
('admin', '/admin/*'),
('admin', '/user/*'),
('admin', '/debug/*'),
('admin', '/settings/*'),
('admin', '/document/*'),
('admin', '/doctorworkbench/doctor-free-items/*'),
('admin', 'nurse'),
('admin', '/site/index'),
('nurse', '/site/*'),
('nurse', '/opdvisit/*'),
('admin', '/doctorworkbench/doctor-free/*'),
('admin', '/doctorworkbench/df-charge/*'),
('admin', '/doctorworkbench/df-charge-doctor-type/*'),
('admin', '/doctorworkbench/df-receipt/*'),
('doctor', '/doctorworkbench/default/index'),
('doctor', '/chiefcomplaint/chiefcomplaint/doctor-view'),
('doctor', '/doctorworkbench/medication/index'),
('doctor', '/doctorworkbench/medication/create'),
('doctor', '/doctorworkbench/diagnosis/*'),
('doctor', '/doctorworkbench/medication/check-nomed-status'),
('doctor', '/chiefcomplaint/*'),
('doctor', '/doctorworkbench/default/check-out'),
('doctor', '/doctorworkbench/medication/drug-items-list'),
('doctor', '/doctorworkbench/medication/editable'),
('admin', '/doctorworkbench/df-receipt-doctor/*'),
('doctor', '/lab/default/lab-result'),
('nurse', 'pacs'),
('dietitian', 'nurse'),
('foot', 'nurse'),
('hd', 'nurse'),
('hbot', 'nurse'),
('dm-nurse', 'dmindicator'),
('dr_confirmBP', 'doctor'),
('dr_eye', 'doctor'),
('pharmacist', 'med'),
('admin', 'dietitian'),
('admin', 'foot'),
('admin', 'hd'),
('admin', 'hbot'),
('admin', 'pharmacist'),
('admin', 'dm-nurse'),
('doctor', 'dmindicator'),
('doctor', 'lab'),
('doctor', 'pacs'),
('pharmacist', 'nurse'),
('dm-nurse', 'emr'),
('dm-nurse', 'lab'),
('dm-nurse', 'pacs'),
('nurse', 'dmindicator'),
('admin', 'risk_score'),
('nurse', 'risk_score'),
('doctor', 'risk_score'),
('phama_edit', '/med/default/med-cancel'),
('phama_edit', '/med/default/index'),
('admin', '/*');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` longtext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- dump ตาราง `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(1, '4m3JYwE_aHLavHnvPJspwGyJK1QcVSMp', 1536588091, 0),
(2, 'N2kymKNbNGiHrPb25847dKM-JV58g4th', 1536589096, 0),
(3, '2f74if5M0qmXWx1UG7sb8LS6F_zPryLd', 1536589140, 0),
(5, 'oeYesvnCZp7knSFgpnnrAICCbqby6ccB', 1536806652, 0),
(6, 'vT539geLI3UmSA8SI4BqiFMQEjbXSUE8', 1536806687, 0),
(7, 'TrJV_5PcL_2BggfZhQ0--wbQkqezXur-', 1536806723, 0),
(8, 'hTMlixlpPpQzF0rZCdUqDjClhOT6RYYg', 1536806748, 0),
(15, 'kiwerHVI2Rn9hedTufwzs5RCrEQEZgV_', 1122334433, 0),
(13, 'FSWxa3uHyYYL2Q3WD86YkkL6vYsiFI2e', 1554801550, 0);

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `last_login_at` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `pname` varchar(20) DEFAULT NULL COMMENT 'คำนำหน้า',
  `fullname` varchar(255) DEFAULT NULL COMMENT 'ชื่อ-สกุล',
  `role` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- dump ตาราง `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`, `status`, `password_reset_token`, `pname`, `fullname`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$13$Vx/ZKWw1VncJktpi1Ny93uSpafqD2tjPuufAL0TdHtoHEuoUX5AHi', 'E91fe3GZnto9i-qnNMR0vK5yniMZBnuF', NULL, NULL, NULL, '::1', 1536588090, 1586232531, NULL, 1587290216, 10, NULL, NULL, 'ปัจวัฒน์ ศรีบุญเรือง', '10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
