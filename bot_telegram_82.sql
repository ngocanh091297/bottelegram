-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 04:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bot_telegram_82`
--

-- --------------------------------------------------------

--
-- Table structure for table `bonhotam`
--

CREATE TABLE `bonhotam` (
  `id` int(11) NOT NULL,
  `issuenumber` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL,
  `data` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chienluoc_vngo`
--

CREATE TABLE `chienluoc_vngo` (
  `id` int(11) NOT NULL,
  `data` text NOT NULL,
  `tele_id` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lichsu_ma_group`
--

CREATE TABLE `lichsu_ma_group` (
  `id` int(11) NOT NULL,
  `issuenumber` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL,
  `dudoan` varchar(256) NOT NULL,
  `group_id` varchar(256) NOT NULL,
  `ketqua` varchar(256) NOT NULL,
  `dk_trung` varchar(265) NOT NULL,
  `xoso` varchar(256) NOT NULL,
  `chienluocvon_index` int(11) NOT NULL,
  `betcount` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `session` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lichsu_tong_hop`
--

CREATE TABLE `lichsu_tong_hop` (
  `id` int(11) NOT NULL,
  `group_id` varchar(256) NOT NULL,
  `sophien` int(11) NOT NULL,
  `lo` int(11) NOT NULL,
  `lai` int(11) NOT NULL,
  `session` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL,
  `currentTime` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan_bdg`
--

CREATE TABLE `taikhoan_bdg` (
  `id` int(11) NOT NULL,
  `username` varchar(256) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `UserId` varchar(256) NOT NULL,
  `NickName` varchar(256) NOT NULL,
  `token` text NOT NULL,
  `refreshToken` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan_he_thong`
--

CREATE TABLE `taikhoan_he_thong` (
  `id` int(11) NOT NULL,
  `username` varchar(256) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `token` text NOT NULL,
  `refreshToken` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_telegram_vngo`
--

CREATE TABLE `users_telegram_vngo` (
  `id` int(11) NOT NULL,
  `tele_id` varchar(256) NOT NULL,
  `usersname` varchar(256) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `data` text NOT NULL,
  `Sign` text NOT NULL,
  `UserId` varchar(256) NOT NULL,
  `NickName` varchar(256) NOT NULL,
  `chienluoc` text NOT NULL,
  `lodung` int(11) NOT NULL DEFAULT 0,
  `loidung` int(11) NOT NULL DEFAULT 0,
  `doigay` varchar(256) NOT NULL DEFAULT 'off',
  `cainguoc` varchar(256) NOT NULL DEFAULT 'off',
  `caidca` varchar(256) NOT NULL DEFAULT 'thua',
  `coppy` varchar(256) NOT NULL DEFAULT 'off',
  `chienluoc_id` int(11) DEFAULT 0,
  `tele_name` varchar(256) NOT NULL,
  `chienluocdata` text NOT NULL,
  `chienluocdata_goc` text NOT NULL,
  `loinhuan` varchar(256) NOT NULL,
  `mucloihientai` varchar(256) NOT NULL DEFAULT 'NONE',
  `status` int(11) NOT NULL DEFAULT 1,
  `status_trade` int(11) NOT NULL DEFAULT 0,
  `bet_index` int(11) NOT NULL DEFAULT 0,
  `vngo1` int(11) NOT NULL DEFAULT 0,
  `vngo3` int(11) NOT NULL DEFAULT 0,
  `vngo5` int(11) NOT NULL DEFAULT 0,
  `vngo10` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `5dgo1` int(11) NOT NULL DEFAULT 0,
  `5dgo3` int(11) NOT NULL DEFAULT 0,
  `5dgo5` int(11) NOT NULL DEFAULT 0,
  `5dgo10` int(11) NOT NULL DEFAULT 0,
  `k3go1` int(11) NOT NULL DEFAULT 0,
  `k3go3` int(11) NOT NULL DEFAULT 0,
  `k3go5` int(11) NOT NULL DEFAULT 0,
  `k3go10` int(11) NOT NULL DEFAULT 0,
  `trxhash1` int(11) NOT NULL DEFAULT 0,
  `activeacc` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bonhotam`
--
ALTER TABLE `bonhotam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chienluoc_vngo`
--
ALTER TABLE `chienluoc_vngo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lichsu_ma_group`
--
ALTER TABLE `lichsu_ma_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lichsu_tong_hop`
--
ALTER TABLE `lichsu_tong_hop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taikhoan_bdg`
--
ALTER TABLE `taikhoan_bdg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taikhoan_he_thong`
--
ALTER TABLE `taikhoan_he_thong`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_telegram_vngo`
--
ALTER TABLE `users_telegram_vngo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bonhotam`
--
ALTER TABLE `bonhotam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chienluoc_vngo`
--
ALTER TABLE `chienluoc_vngo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lichsu_ma_group`
--
ALTER TABLE `lichsu_ma_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lichsu_tong_hop`
--
ALTER TABLE `lichsu_tong_hop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taikhoan_bdg`
--
ALTER TABLE `taikhoan_bdg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taikhoan_he_thong`
--
ALTER TABLE `taikhoan_he_thong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_telegram_vngo`
--
ALTER TABLE `users_telegram_vngo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
