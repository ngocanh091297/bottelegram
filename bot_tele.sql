-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 14, 2023 lúc 03:45 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bot_telegram`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bonhotam`
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
-- Cấu trúc bảng cho bảng `chienluoc_d5go`
--

CREATE TABLE `taikhoan_bdg` (
  `id` int(11) NOT NULL,
  `username`  varchar(256) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `UserId` varchar(256) NOT NULL,
  -- `chatid`  varchar(256) NOT NULL,
  `NickName`  varchar(256) NOT NULL, 
  `token` text NOT NULL,
  `refreshToken` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `taikhoan_he_thong` (
  `id` int(11) NOT NULL,
  `username`  varchar(256) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `token` text NOT NULL,
   `refreshToken` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `chienluoc_d5go` (
  `id` int(11) NOT NULL,
  `data` text NOT NULL,
  `tele_id` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chienluoc_d5go`
--

INSERT INTO `chienluoc_d5go` (`id`, `data`, `tele_id`, `status`, `created_at`) VALUES
(1, '[\"1N_N\",\"1L_L\"]', '1', 1, '2023-12-13 11:31:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chienluoc_k3go`
--

CREATE TABLE `chienluoc_k3go` (
  `id` int(11) NOT NULL,
  `data` text NOT NULL,
  `tele_id` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chienluoc_trxhash`
--

CREATE TABLE `chienluoc_trxhash` (
  `id` int(11) NOT NULL,
  `data` text NOT NULL,
  `tele_id` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chienluoc_vngo`
--

CREATE TABLE `chienluoc_vngo` (
  `id` int(11) NOT NULL,
  `data` text NOT NULL,
  `tele_id` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `tai_khoan_da_active` (
  `id` int(11) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `group_id_ql` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `copytinhieu_d5go`
--

CREATE TABLE `copytinhieu_d5go` (
  `id` int(11) NOT NULL,
  `id_group` varchar(256) NOT NULL,
  `chatid` varchar(256) NOT NULL,
  `chienlucvon` varchar(256) NOT NULL DEFAULT 'NONE',
  `thongke` int(11) NOT NULL DEFAULT 50,
  `datatext` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `chienluocdata` text NOT NULL,
  `chienluocdata_goc` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `type` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `copytinhieu_d5go`
--

INSERT INTO `copytinhieu_d5go` (`id`, `id_group`, `chatid`, `chienlucvon`, `thongke`, `datatext`, `chienluocdata`, `chienluocdata_goc`, `status`, `start`, `type`) VALUES
(7, '-1001924738366', '-1002043847040', '[\"1\",\"2\",\"4\",\"8\",\"17\",\"35\",\"75\"]', 50, '/setup_bot -1001924738366 1\nTín hiệu:\n1n_n\n1l_l\n3l_n\n3n_l\n\n|Quản lý vốn: 1-2-4-8-17-35-75\n|Số lượng phiên thống kê: 50\n|Tin nhắn chào mừng: ????????À???? ????Ừ???????? ????Ạ???? ĐẾ???? ????Ớ???? ???????????????? ???????????? ???????????????? ???????????????? ????????????\n|Tin nhắn hô đánh: ????‍♀️ \n|Tin nhắn chờ kết quả: ⏳ Chờ kết quả...\n|Thông báo kết quả: ???? \n|Thông báo liệt kê phiên (trước):  ❇️ ????????ố???????? ????ê ???????? ????????????ê???? ????ầ???? ????????ấ????  ....\n\n|Thông báo liệt kê phiên (sau):\n- ????í???? ????????ệ???? ???? ????ệ???????? \n- ????ọ???? ????????ắ???? ????ắ???? ???????????? ????ò???????? ????????ê???? ????ệ @Boss_Ngoc_82vn', '[\"N_N\",\"L_L\",\"LLL_N\",\"NNN_L\"]', '[\"1N_N\",\"1L_L\",\"3L_N\",\"3N_L\"]', 0, 1, '1'),
(8, '-1002043847040', '-1002043847040', '[\"1\",\"2\",\"4\",\"8\",\"17\",\"35\",\"75\"]', 50, '/setup_bot -1002043847040 1\nTín hiệu:\n1n_n\n1l_l\n3l_n\n3n_l\n\n|Quản lý vốn: 1-2-4-8-17-35-75\n|Số lượng phiên thống kê: 50\n|Tin nhắn chào mừng: ????????À???? ????Ừ???????? ????Ạ???? ĐẾ???? ????Ớ???? ???????????????? ???????????? ???????????????? ???????????????? ????????????\n|Tin nhắn hô đánh: ????‍♀️ \n|Tin nhắn chờ kết quả: ⏳ Chờ kết quả...\n|Thông báo kết quả: ???? \n|Thông báo liệt kê phiên (trước):  ❇️ ????????ố???????? ????ê ???????? ????????????ê???? ????ầ???? ????????ấ????  ....\n\n|Thông báo liệt kê phiên (sau):\n- ????í???? ????????ệ???? ???? ????ệ???????? \n- ????ọ???? ????????ắ???? ????ắ???? ???????????? ????ò???????? ????????ê???? ????ệ @Boss_Ngoc_82vn', '[\"N_N\",\"L_L\",\"LLL_N\",\"NNN_L\"]', '[\"1N_N\",\"1L_L\",\"3L_N\",\"3N_L\"]', 0, 1, '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `copytinhieu_k3go`
--

CREATE TABLE `copytinhieu_k3g88` (
  `id` int(11) NOT NULL,
  `id_group` varchar(256) NOT NULL,
  `chatid` varchar(256) NOT NULL,
  `chienlucvon` varchar(256) NOT NULL DEFAULT 'NONE',
  `thongke` int(11) NOT NULL DEFAULT 50,
  `chienluocdata_1` text NOT NULL,
  `chienluocdata_goc_1` text NOT NULL,
  `chienluocdata_2` text NOT NULL,
  `chienluocdata_goc_2` text NOT NULL,
   `chienluocdata_3` text NOT NULL,
  `chienluocdata_goc_3` text NOT NULL,
   `chienluocdata_4` text NOT NULL,
  `chienluocdata_goc_4` text NOT NULL,
   `chienluocdata_5` text NOT NULL,
  `chienluocdata_goc_5` text NOT NULL,
   `chienluocdata_6` text NOT NULL,
  `chienluocdata_goc_6` text NOT NULL,
  `chienluocdata_7` text NOT NULL,
  `chienluocdata_goc_7` text NOT NULL,
   `chienluocdata_8` text NOT NULL,
  `chienluocdata_goc_8` text NOT NULL,
   `chienluocdata_9` text NOT NULL,
  `chienluocdata_goc_9` text NOT NULL,
  `chienluocdata_10` text NOT NULL,
  `chienluocdata_goc_10` text NOT NULL,
  `chienluoc_hientai`  int(11) NOT NULL DEFAULT 0,
   `timechay`  varchar(256) NOT NULL,
   `timengung`  varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `type` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `copytinhieu_trxhash`
--

CREATE TABLE `copytinhieu_trxhash` (
  `id` int(11) NOT NULL,
  `id_group` varchar(256) NOT NULL,
  `chatid` varchar(256) NOT NULL,
  `chienlucvon` varchar(256) NOT NULL DEFAULT 'NONE',
  `thongke` int(11) NOT NULL DEFAULT 50,
  `datatext` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `chienluocdata` text NOT NULL,
  `chienluocdata_goc` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `type` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `copytinhieu_vngo`
--

CREATE TABLE `moi_chienluoc_d5go` (
  `id` int(11) NOT NULL,
  `data` text NOT NULL,
  `tele_id` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `type`  int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `moi_copytinhieu_trxhash` (
  `id` int(11) NOT NULL,
  `id_group` varchar(256) NOT NULL,
  `chatid` varchar(256) NOT NULL,
  `chienlucvon` varchar(256) NOT NULL DEFAULT 'NONE',
  `thongke` int(11) NOT NULL DEFAULT 50,
  `datatext` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `chienluocdata` text NOT NULL,
  `chienluocdata_goc` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `type` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `moi_copytinhieu_d5go` (
  `id` int(11) NOT NULL,
  `id_group` varchar(256) NOT NULL,
  `chatid` varchar(256) NOT NULL,
  `chienlucvon` varchar(256) NOT NULL DEFAULT 'NONE',
  `thongke` int(11) NOT NULL DEFAULT 50,
  `datatext` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `chienluocdata` text NOT NULL,
  `chienluocdata_goc` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `type` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `moi_copytinhieu_k3go` (
  `id` int(11) NOT NULL,
  `id_group` varchar(256) NOT NULL,
  `chatid` varchar(256) NOT NULL,
  `chienlucvon` varchar(256) NOT NULL DEFAULT 'NONE',
  `thongke` int(11) NOT NULL DEFAULT 50,
  `datatext` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `chienluocdata` text NOT NULL,
  `chienluocdata_goc` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `type` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- --------------------------------------------------------
ALTER TABLE `moi_chienluoc_vngo`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `moi_chienluoc_vngo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Cấu trúc bảng cho bảng `lichsu_ma`
--

CREATE TABLE `lichsu_ma` (
  `id` int(11) NOT NULL,
  `uid` varchar(256) NOT NULL,
  `usersid` int(11) NOT NULL,
  `gametype` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `amount` varchar(256) NOT NULL,
  `betcount` varchar(256) NOT NULL,
  `issuenumber` varchar(256) NOT NULL,
  `ketqua` varchar(256) NOT NULL,
  `selecttype` varchar(256) NOT NULL,
  `session` int(11) NOT NULL,
  `thang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsu_ma_group`
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

--
-- Đang đổ dữ liệu cho bảng `lichsu_ma_group`
--

INSERT INTO `lichsu_ma_group` (`id`, `issuenumber`, `type`, `dudoan`, `group_id`, `ketqua`, `dk_trung`, `xoso`, `chienluocvon_index`, `betcount`, `name`, `session`, `status`) VALUES
(262, '20231213051189', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'nimjFRHWCOWT', 1),
(263, '20231213051190', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 1, 2, '5dgo', 'nimjFRHWCOWT', 1),
(264, '20231213051191', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 2, 4, '5dgo', 'nimjFRHWCOWT', 1),
(265, '20231213051192', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'CfoKcnRAQyTQ', 1),
(266, '20231213051193', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'qcPTuqoNUakm', 1),
(267, '20231213051193', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'OSqHIUogJmlx', 1),
(268, '20231213051194', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'BFIBJaYIuzBJ', 1),
(269, '20231213051195', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'iqFqOAIhiLIE', 1),
(270, '20231213051196', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'YgyPmsTnOTgr', 1),
(271, '20231213051197', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 1, 2, '5dgo', 'YgyPmsTnOTgr', 1),
(272, '20231213051198', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'IWUqHPuGEkoL', 1),
(273, '20231213051199', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 1, 2, '5dgo', 'IWUqHPuGEkoL', 1),
(274, '20231213051200', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 2, 4, '5dgo', 'IWUqHPuGEkoL', 1),
(275, '20231213051201', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'rzTKExMVhJYW', 1),
(276, '20231213051202', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'kKBlSdiidvtw', 1),
(277, '20231213051203', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'gMNAzAhxgMdl', 1),
(278, '20231213051204', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 1, 2, '5dgo', 'gMNAzAhxgMdl', 1),
(279, '20231213051205', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 2, 4, '5dgo', 'gMNAzAhxgMdl', 1),
(280, '20231213051206', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 3, 8, '5dgo', 'gMNAzAhxgMdl', 1),
(281, '20231213051207', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 4, 17, '5dgo', 'gMNAzAhxgMdl', 1),
(282, '20231213051208', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'kFWEyhCKNdOF', 1),
(283, '20231213051209', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 1, 2, '5dgo', 'kFWEyhCKNdOF', 1),
(284, '20231213051210', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'DPfCIyaSaTVz', 1),
(285, '20231213051211', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 1, 2, '5dgo', 'DPfCIyaSaTVz', 1),
(286, '20231213051212', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 2, 4, '5dgo', 'DPfCIyaSaTVz', 1),
(287, '20231213051213', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'cZEsKTFttPJs', 1),
(288, '20231213051214', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 1, 2, '5dgo', 'cZEsKTFttPJs', 1),
(289, '20231213051215', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'YkcSrVIKaTyt', 1),
(290, '20231213051216', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'VGSFkBYZRriJ', 1),
(291, '20231213051217', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'EbJNEMSxySty', 1),
(292, '20231213051218', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'fssaJnqDPMSs', 1),
(293, '20231213051218', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'ztpBQoftxOVV', 1),
(294, '20231213051219', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'JZyDpalSEKDR', 1),
(295, '20231213051219', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'yuFgkQgYcpiR', 1),
(296, '20231213051220', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'pgHpjXnXvrjr', 1),
(297, '20231213051220', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'iwkaENhuMMvw', 1),
(298, '20231213051221', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'QBSDIFUzDsmN', 1),
(299, '20231213051221', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'hwSxZOKXwDqU', 1),
(300, '20231213051222', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'DSTKXTRnKKtc', 1),
(301, '20231213051222', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'CqBqtCUqvHUh', 1),
(302, '20231213051223', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'CJRwSBHTpcIv', 1),
(303, '20231213051223', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'IFOxvaLyyZHd', 1),
(304, '20231213051224', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'nlaVqJZXVuLr', 1),
(305, '20231213051224', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 0, 1, '5dgo', 'mUgGClMOzgcs', 1),
(306, '20231213051225', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 1, 2, '5dgo', 'nlaVqJZXVuLr', 1),
(307, '20231213051225', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 1, 2, '5dgo', 'mUgGClMOzgcs', 1),
(308, '20231213051226', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 2, 4, '5dgo', 'nlaVqJZXVuLr', 1),
(309, '20231213051226', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 2, 4, '5dgo', 'mUgGClMOzgcs', 1),
(310, '20231213051227', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 3, 8, '5dgo', 'nlaVqJZXVuLr', 1),
(311, '20231213051227', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 3, 8, '5dgo', 'mUgGClMOzgcs', 1),
(312, '20231213051228', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 4, 17, '5dgo', 'nlaVqJZXVuLr', 1),
(313, '20231213051228', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 4, 17, '5dgo', 'mUgGClMOzgcs', 1),
(314, '20231213051229', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 5, 35, '5dgo', 'nlaVqJZXVuLr', 1),
(315, '20231213051229', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 5, 35, '5dgo', 'mUgGClMOzgcs', 1),
(316, '20231213051230', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'CmuRryNYZAnj', 1),
(317, '20231213051230', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 0, 1, '5dgo', 'GkcBhWxXswxP', 1),
(318, '20231213051231', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 1, 2, '5dgo', 'CmuRryNYZAnj', 1),
(319, '20231213051231', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 1, 2, '5dgo', 'GkcBhWxXswxP', 1),
(320, '20231213051232', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 2, 4, '5dgo', 'CmuRryNYZAnj', 1),
(321, '20231213051232', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 2, 4, '5dgo', 'GkcBhWxXswxP', 1),
(322, '20231213051233', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 3, 8, '5dgo', 'CmuRryNYZAnj', 1),
(323, '20231213051233', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 3, 8, '5dgo', 'GkcBhWxXswxP', 1),
(324, '20231213051234', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'XDDeydsOPqye', 1),
(325, '20231213051234', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'ArPCyuvvkbYB', 1),
(326, '20231213051235', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'mzPAmQCiePCo', 1),
(327, '20231213051235', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 0, 1, '5dgo', 'kVEiJfcYLFor', 1),
(328, '20231213051236', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 1, 2, '5dgo', 'mzPAmQCiePCo', 1),
(329, '20231213051236', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 1, 2, '5dgo', 'kVEiJfcYLFor', 1),
(330, '20231213051237', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 2, 4, '5dgo', 'mzPAmQCiePCo', 1),
(331, '20231213051237', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 2, 4, '5dgo', 'kVEiJfcYLFor', 1),
(332, '20231213051238', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'WqxXPIWhklsS', 1),
(333, '20231213051238', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 0, 1, '5dgo', 'BapGCxMzFmps', 1),
(334, '20231213051239', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 1, 2, '5dgo', 'WqxXPIWhklsS', 1),
(335, '20231213051239', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 1, 2, '5dgo', 'BapGCxMzFmps', 1),
(336, '20231213051240', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 2, 4, '5dgo', 'WqxXPIWhklsS', 1),
(337, '20231213051240', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 2, 4, '5dgo', 'BapGCxMzFmps', 1),
(338, '20231213051241', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 3, 8, '5dgo', 'WqxXPIWhklsS', 1),
(339, '20231213051241', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 3, 8, '5dgo', 'BapGCxMzFmps', 1),
(340, '20231213051242', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'ZrmamKJAjbNt', 1),
(341, '20231213051242', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'ifYHcFdaiviS', 1),
(342, '20231213051243', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'ffFUuUwRbVdb', 1),
(343, '20231213051243', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'AUALiIkqKzUK', 1),
(344, '20231213051244', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'RSxRczPlUZuW', 1),
(345, '20231213051244', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'kyyRuYYaUtST', 1),
(346, '20231213051245', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'rMrKXZHfFPcb', 1),
(347, '20231213051245', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'WbgrFMtSeDst', 1),
(348, '20231213051246', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'FJPIKYEjnHFa', 1),
(349, '20231213051246', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'BrsXtBFkTceX', 1),
(350, '20231213051247', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'bMNAjqLUDzTt', 1),
(351, '20231213051247', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 0, 1, '5dgo', 'yXLtfROWRtqA', 1),
(352, '20231213051248', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 1, 2, '5dgo', 'bMNAjqLUDzTt', 1),
(353, '20231213051248', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 1, 2, '5dgo', 'yXLtfROWRtqA', 1),
(354, '20231213051249', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 2, 4, '5dgo', 'bMNAjqLUDzTt', 1),
(355, '20231213051249', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 2, 4, '5dgo', 'yXLtfROWRtqA', 1),
(356, '20231213051250', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'mGyeSsKTwBnH', 1),
(357, '20231213051250', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 0, 1, '5dgo', 'WSejTEBfDuJu', 1),
(358, '20231213051251', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 1, 2, '5dgo', 'mGyeSsKTwBnH', 1),
(359, '20231213051251', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 1, 2, '5dgo', 'WSejTEBfDuJu', 1),
(360, '20231213051252', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'RNIBdPMtUEaj', 1),
(361, '20231213051252', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 0, 1, '5dgo', 'tByUxGGQNBXS', 1),
(362, '20231213051253', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 1, 2, '5dgo', 'RNIBdPMtUEaj', 1),
(363, '20231213051253', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 1, 2, '5dgo', 'tByUxGGQNBXS', 1),
(364, '20231213051254', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 2, 4, '5dgo', 'RNIBdPMtUEaj', 1),
(365, '20231213051254', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 2, 4, '5dgo', 'tByUxGGQNBXS', 1),
(366, '20231213051255', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 3, 8, '5dgo', 'RNIBdPMtUEaj', 1),
(367, '20231213051255', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 3, 8, '5dgo', 'tByUxGGQNBXS', 1),
(368, '20231213051256', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'VnqoGKVRelzE', 1),
(369, '20231213051256', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 0, 1, '5dgo', 'AEoWAxOKsuRA', 1),
(370, '20231213051257', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 1, 2, '5dgo', 'VnqoGKVRelzE', 1),
(371, '20231213051257', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 1, 2, '5dgo', 'AEoWAxOKsuRA', 1),
(372, '20231213051258', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 2, 4, '5dgo', 'VnqoGKVRelzE', 1),
(373, '20231213051258', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 2, 4, '5dgo', 'AEoWAxOKsuRA', 1),
(374, '20231213051259', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'WspAiuMfPZfI', 1),
(375, '20231213051259', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 0, 1, '5dgo', 'WDnokjagEfjp', 1),
(376, '20231213051260', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 1, 2, '5dgo', 'WspAiuMfPZfI', 1),
(377, '20231213051260', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 1, 2, '5dgo', 'WDnokjagEfjp', 1),
(378, '20231213051261', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 2, 4, '5dgo', 'WspAiuMfPZfI', 1),
(379, '20231213051261', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 2, 4, '5dgo', 'WDnokjagEfjp', 1),
(380, '20231213051262', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'jNQXzkMBVsVA', 1),
(381, '20231213051262', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'YNTVLgMVozcJ', 1),
(382, '20231213051263', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'GvVcMNYFgSUv', 1),
(383, '20231213051263', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 0, 1, '5dgo', 'uNWZEuTcQAsj', 1),
(384, '20231213051264', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 1, 2, '5dgo', 'GvVcMNYFgSUv', 1),
(385, '20231213051264', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 1, 2, '5dgo', 'uNWZEuTcQAsj', 1),
(386, '20231213051265', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'WYEopKUGvbcv', 1),
(387, '20231213051265', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'qDuQZdfmSvkI', 1),
(388, '20231213051266', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 0, 1, '5dgo', 'zItCNVvyFSgZ', 1),
(389, '20231213051266', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 0, 1, '5dgo', 'PAoqnGuRcHqA', 1),
(390, '20231213051267', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'iLTHAVfwPnVW', 1),
(391, '20231213051267', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 0, 1, '5dgo', 'QrZlYrmgzMsA', 1),
(392, '20231213051268', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 1, 2, '5dgo', 'iLTHAVfwPnVW', 1),
(393, '20231213051268', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 1, 2, '5dgo', 'QrZlYrmgzMsA', 1),
(394, '20231213051269', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'xlesNXOssNwf', 1),
(395, '20231213051269', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 0, 1, '5dgo', 'RFObGIIxifmj', 1),
(396, '20231213051270', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 1, 2, '5dgo', 'xlesNXOssNwf', 1),
(397, '20231213051270', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 1, 2, '5dgo', 'RFObGIIxifmj', 1),
(398, '20231213051271', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'mPlfYuMixegj', 1),
(399, '20231213051271', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 0, 1, '5dgo', 'fOWlohaqHLCK', 1),
(400, '20231213051272', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 1, 2, '5dgo', 'mPlfYuMixegj', 1),
(401, '20231213051272', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 1, 2, '5dgo', 'fOWlohaqHLCK', 1),
(402, '20231213051273', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 2, 4, '5dgo', 'mPlfYuMixegj', 1),
(403, '20231213051273', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 2, 4, '5dgo', 'fOWlohaqHLCK', 1),
(404, '20231213051274', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'UIyYAhkorzMI', 1),
(405, '20231213051274', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 0, 1, '5dgo', 'lVeNveGOzNZw', 1),
(406, '20231213051275', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 1, 2, '5dgo', 'UIyYAhkorzMI', 1),
(407, '20231213051275', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 1, 2, '5dgo', 'lVeNveGOzNZw', 1),
(408, '20231213051276', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'ruBANCaMbHPn', 1),
(409, '20231213051276', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'ARGRLkhYanfx', 1),
(410, '20231213051277', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'gmyZCrcuUJpO', 1),
(411, '20231213051277', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'NZAWipKUGXPW', 1),
(412, '20231213051278', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'H', 0, 1, '5dgo', 'TQGIaluUxuRH', 1),
(413, '20231213051278', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'H', 0, 1, '5dgo', 'eulnkjxlzAXK', 1),
(414, '20231213051279', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'H', 1, 2, '5dgo', 'TQGIaluUxuRH', 1),
(415, '20231213051279', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'H', 1, 2, '5dgo', 'eulnkjxlzAXK', 1),
(416, '20231213051280', '1phut', 'H', '-1001924738366', 'NONE', 'L', 'L', 0, 1, '5dgo', 'uiiDlWqPTizC', 1),
(417, '20231213051280', '1phut', 'H', '-1002043847040', 'NONE', 'L', 'L', 0, 1, '5dgo', 'zkjqhjfhaVAw', 1),
(418, '20231213051281', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 1, 2, '5dgo', 'uiiDlWqPTizC', 1),
(419, '20231213051281', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 1, 2, '5dgo', 'zkjqhjfhaVAw', 1),
(420, '20231213051282', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'L', 0, 1, '5dgo', 'CflEbatlxlCS', 1),
(421, '20231213051282', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'L', 0, 1, '5dgo', 'XaeRSPlgWqZZ', 1),
(422, '20231213051283', '1phut', 'L', '-1001924738366', 'NONE', 'N', 'NONE', 0, 1, '5dgo', 'qxFBZIbhDlBK', 0),
(423, '20231213051283', '1phut', 'L', '-1002043847040', 'NONE', 'N', 'NONE', 0, 1, '5dgo', 'ygQzSgxrPogo', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsu_tong_hop`
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

CREATE TABLE `tai_khoan_da_active` (
  `id` int(11) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `bot_type`  varchar(256) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Đang đổ dữ liệu cho bảng `lichsu_tong_hop`
--

INSERT INTO `lichsu_tong_hop` (`id`, `group_id`, `sophien`, `lo`, `lai`, `session`, `type`, `currentTime`) VALUES
(131, '-1001924738366', 3, 3, 4, 'nimjFRHWCOWT', '5dgo1', '19:50'),
(132, '-1001924738366', 1, 0, 1, 'CfoKcnRAQyTQ', '5dgo1', '19:51'),
(133, '-1001924738366', 1, 0, 1, 'qcPTuqoNUakm', '5dgo1', '19:52'),
(134, '-1001924738366', 1, 0, 1, 'BFIBJaYIuzBJ', '5dgo1', '19:53'),
(135, '-1001924738366', 1, 0, 1, 'iqFqOAIhiLIE', '5dgo1', '19:54'),
(136, '-1001924738366', 2, 1, 2, 'YgyPmsTnOTgr', '5dgo1', '19:56'),
(137, '-1001924738366', 3, 3, 4, 'IWUqHPuGEkoL', '5dgo1', '19:59'),
(138, '-1001924738366', 1, 0, 1, 'rzTKExMVhJYW', '5dgo1', '20:00'),
(139, '-1001924738366', 5, 15, 17, 'gMNAzAhxgMdl', '5dgo1', '20:06'),
(140, '-1001924738366', 2, 1, 2, 'kFWEyhCKNdOF', '5dgo1', '20:08'),
(141, '-1001924738366', 3, 3, 4, 'DPfCIyaSaTVz', '5dgo1', '20:11'),
(142, '-1001924738366', 2, 1, 2, 'cZEsKTFttPJs', '5dgo1', '20:13'),
(143, '-1001924738366', 1, 0, 1, 'YkcSrVIKaTyt', '5dgo1', '20:14'),
(144, '-1001924738366', 1, 0, 1, 'VGSFkBYZRriJ', '5dgo1', '20:15'),
(145, '-1001924738366', 1, 0, 1, 'EbJNEMSxySty', '5dgo1', '20:16'),
(146, '-1001924738366', 1, 0, 1, 'fssaJnqDPMSs', '5dgo1', '20:17'),
(147, '-1002043847040', 1, 0, 1, 'ztpBQoftxOVV', '5dgo1', '20:17'),
(148, '-1001924738366', 1, 0, 1, 'JZyDpalSEKDR', '5dgo1', '20:18'),
(149, '-1002043847040', 1, 0, 1, 'yuFgkQgYcpiR', '5dgo1', '20:18'),
(150, '-1001924738366', 1, 0, 1, 'pgHpjXnXvrjr', '5dgo1', '20:19'),
(151, '-1002043847040', 1, 0, 1, 'iwkaENhuMMvw', '5dgo1', '20:19'),
(152, '-1001924738366', 1, 0, 1, 'QBSDIFUzDsmN', '5dgo1', '20:20'),
(153, '-1002043847040', 1, 0, 1, 'hwSxZOKXwDqU', '5dgo1', '20:20'),
(154, '-1001924738366', 1, 0, 1, 'DSTKXTRnKKtc', '5dgo1', '20:21'),
(155, '-1002043847040', 1, 0, 1, 'CqBqtCUqvHUh', '5dgo1', '20:21'),
(156, '-1001924738366', 1, 0, 1, 'CJRwSBHTpcIv', '5dgo1', '20:22'),
(157, '-1002043847040', 1, 0, 1, 'IFOxvaLyyZHd', '5dgo1', '20:22'),
(158, '-1001924738366', 6, 32, 35, 'nlaVqJZXVuLr', '5dgo1', '20:28'),
(159, '-1002043847040', 6, 32, 35, 'mUgGClMOzgcs', '5dgo1', '20:28'),
(160, '-1001924738366', 4, 7, 8, 'CmuRryNYZAnj', '5dgo1', '20:32'),
(161, '-1002043847040', 4, 7, 8, 'GkcBhWxXswxP', '5dgo1', '20:32'),
(162, '-1001924738366', 1, 0, 1, 'XDDeydsOPqye', '5dgo1', '20:33'),
(163, '-1002043847040', 1, 0, 1, 'ArPCyuvvkbYB', '5dgo1', '20:33'),
(164, '-1001924738366', 3, 3, 4, 'mzPAmQCiePCo', '5dgo1', '20:36'),
(165, '-1002043847040', 3, 3, 4, 'kVEiJfcYLFor', '5dgo1', '20:36'),
(166, '-1001924738366', 4, 7, 8, 'WqxXPIWhklsS', '5dgo1', '20:40'),
(167, '-1002043847040', 4, 7, 8, 'BapGCxMzFmps', '5dgo1', '20:40'),
(168, '-1001924738366', 1, 0, 1, 'ZrmamKJAjbNt', '5dgo1', '20:41'),
(169, '-1002043847040', 1, 0, 1, 'ifYHcFdaiviS', '5dgo1', '20:41'),
(170, '-1001924738366', 1, 0, 1, 'ffFUuUwRbVdb', '5dgo1', '20:42'),
(171, '-1002043847040', 1, 0, 1, 'AUALiIkqKzUK', '5dgo1', '20:42'),
(172, '-1001924738366', 1, 0, 1, 'RSxRczPlUZuW', '5dgo1', '20:43'),
(173, '-1002043847040', 1, 0, 1, 'kyyRuYYaUtST', '5dgo1', '20:43'),
(174, '-1001924738366', 1, 0, 1, 'rMrKXZHfFPcb', '5dgo1', '20:44'),
(175, '-1002043847040', 1, 0, 1, 'WbgrFMtSeDst', '5dgo1', '20:44'),
(176, '-1001924738366', 1, 0, 1, 'FJPIKYEjnHFa', '5dgo1', '20:45'),
(177, '-1002043847040', 1, 0, 1, 'BrsXtBFkTceX', '5dgo1', '20:45'),
(178, '-1001924738366', 3, 3, 4, 'bMNAjqLUDzTt', '5dgo1', '20:48'),
(179, '-1002043847040', 3, 3, 4, 'yXLtfROWRtqA', '5dgo1', '20:48'),
(180, '-1001924738366', 2, 1, 2, 'mGyeSsKTwBnH', '5dgo1', '20:50'),
(181, '-1002043847040', 2, 1, 2, 'WSejTEBfDuJu', '5dgo1', '20:50'),
(182, '-1001924738366', 4, 7, 8, 'RNIBdPMtUEaj', '5dgo1', '20:54'),
(183, '-1002043847040', 4, 7, 8, 'tByUxGGQNBXS', '5dgo1', '20:54'),
(184, '-1001924738366', 3, 3, 4, 'VnqoGKVRelzE', '5dgo1', '20:57'),
(185, '-1002043847040', 3, 3, 4, 'AEoWAxOKsuRA', '5dgo1', '20:57'),
(186, '-1001924738366', 3, 3, 4, 'WspAiuMfPZfI', '5dgo1', '21:00'),
(187, '-1002043847040', 3, 3, 4, 'WDnokjagEfjp', '5dgo1', '21:00'),
(188, '-1001924738366', 1, 0, 1, 'jNQXzkMBVsVA', '5dgo1', '21:01'),
(189, '-1002043847040', 1, 0, 1, 'YNTVLgMVozcJ', '5dgo1', '21:01'),
(190, '-1001924738366', 2, 1, 2, 'GvVcMNYFgSUv', '5dgo1', '21:03'),
(191, '-1002043847040', 2, 1, 2, 'uNWZEuTcQAsj', '5dgo1', '21:03'),
(192, '-1001924738366', 1, 0, 1, 'WYEopKUGvbcv', '5dgo1', '21:04'),
(193, '-1002043847040', 1, 0, 1, 'qDuQZdfmSvkI', '5dgo1', '21:04'),
(194, '-1001924738366', 1, 0, 1, 'zItCNVvyFSgZ', '5dgo1', '21:05'),
(195, '-1002043847040', 1, 0, 1, 'PAoqnGuRcHqA', '5dgo1', '21:05'),
(196, '-1001924738366', 2, 1, 2, 'iLTHAVfwPnVW', '5dgo1', '21:07'),
(197, '-1002043847040', 2, 1, 2, 'QrZlYrmgzMsA', '5dgo1', '21:07'),
(198, '-1001924738366', 2, 1, 2, 'xlesNXOssNwf', '5dgo1', '21:09'),
(199, '-1002043847040', 2, 1, 2, 'RFObGIIxifmj', '5dgo1', '21:09'),
(200, '-1001924738366', 3, 3, 4, 'mPlfYuMixegj', '5dgo1', '21:12'),
(201, '-1002043847040', 3, 3, 4, 'fOWlohaqHLCK', '5dgo1', '21:12'),
(202, '-1001924738366', 2, 1, 2, 'UIyYAhkorzMI', '5dgo1', '21:14'),
(203, '-1002043847040', 2, 1, 2, 'lVeNveGOzNZw', '5dgo1', '21:14'),
(204, '-1001924738366', 1, 0, 1, 'ruBANCaMbHPn', '5dgo1', '21:15'),
(205, '-1002043847040', 1, 0, 1, 'ARGRLkhYanfx', '5dgo1', '21:15'),
(206, '-1001924738366', 1, 0, 1, 'gmyZCrcuUJpO', '5dgo1', '21:16'),
(207, '-1002043847040', 1, 0, 1, 'NZAWipKUGXPW', '5dgo1', '21:16'),
(208, '-1001924738366', 2, 1, 2, 'TQGIaluUxuRH', '5dgo1', '21:18'),
(209, '-1002043847040', 2, 1, 2, 'eulnkjxlzAXK', '5dgo1', '21:18'),
(210, '-1001924738366', 2, 1, 2, 'uiiDlWqPTizC', '5dgo1', '21:20'),
(211, '-1002043847040', 2, 1, 2, 'zkjqhjfhaVAw', '5dgo1', '21:20'),
(212, '-1001924738366', 1, 0, 1, 'CflEbatlxlCS', '5dgo1', '21:21'),
(213, '-1002043847040', 1, 0, 1, 'XaeRSPlgWqZZ', '5dgo1', '21:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tonghopphien`
--

CREATE TABLE `tonghopphien` (
  `id` int(11) NOT NULL,
  `data` text NOT NULL,
  `lai` varchar(256) NOT NULL,
  `lo` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `tinhieu` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL,
  `gay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_telegram_d5go`
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
-- moi_phuongphap_congthuc  1 là măc định bt. 2 là random , 3 là tuần hoàn
-- moi_phuongphap_quanlyvon 1 là victory 1 , 2 là victory 2 , 3 là victory 3 , 4 fibo , 5 đa tầng 6 la dca thang 7 la dca thua
update  users_telegram_d5go set moi_chienluoc="NONE",moi_chienluocdata="NONE",moi_chienluocdata_goc="NONE";
ALTER TABLE users_telegram_trxhash ADD COLUMN update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
 ALTER TABLE copytinhieu_d5go ADD COLUMN update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE users
ADD COLUMN `upgrade_time` varchar(256) NOT NULL DEFAULT 'off';
ADD COLUMN `moi_typechienluoc` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_phuongphap_quanlyvon` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_phuongphap_congthuc` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_5dgo5` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_5dgo10` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_k3go1` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_k3go3` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_k3go5` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_k3go10` int(11) NOT NULL DEFAULT 0,
ADD COLUMN `moi_trxhash1` int(11) NOT NULL DEFAULT 0,
ADD COLUMN  `moi_chienluoc` text NOT NULL,
ADD COLUMN  `moi_lodung` int(11) NOT NULL DEFAULT 0,
ADD COLUMN  `moi_loidung` int(11) NOT NULL DEFAULT 0,
ADD COLUMN  `moi_doigay` varchar(256) NOT NULL DEFAULT 'off',
ADD COLUMN  `moi_cainguoc` varchar(256) NOT NULL DEFAULT 'off',
ADD COLUMN  `moi_caidca` varchar(256) NOT NULL DEFAULT 'thua',
ADD COLUMN  `moi_coppy` varchar(256) NOT NULL DEFAULT 'off',
ADD COLUMN  `moi_chienluoc_id` int(11) DEFAULT 0,
ADD COLUMN  `moi_chienluocdata` text NOT NULL,
ADD COLUMN  `moi_chienluocdata_goc` text NOT NULL,
ADD COLUMN  `moi_loinhuan` varchar(256) NOT NULL,
ADD COLUMN  `moi_mucloihientai` varchar(256) NOT NULL DEFAULT 'NONE',
ADD COLUMN  `moi_status` int(11) NOT NULL DEFAULT 1,
ADD COLUMN  `moi_status_trade` int(11) NOT NULL DEFAULT 0,
ADD COLUMN  `moi_bet_index` int(11) NOT NULL DEFAULT 0,
ADD COLUMN  `moi_vngo1` int(11) NOT NULL DEFAULT 0,
ADD COLUMN  `moi_vngo3` int(11) NOT NULL DEFAULT 0,
ADD COLUMN  `moi_vngo5` int(11) NOT NULL DEFAULT 0,
ADD COLUMN  `moi_vngo10` int(11) NOT NULL DEFAULT 0;

ALTER TABLE users_telegram_k3go
ADD COLUMN `moi_5dgo1` int(11) NOT NULL DEFAULT 0;
ADD COLUMN `moi_phuongphap_quanlyvon` int(11) NOT NULL DEFAULT 0;
ADD COLUMN `moi_phuongphap_congthuc` int(11) NOT NULL DEFAULT 0;

--
-- Đang đổ dữ liệu cho bảng `users_telegram_d5go`
--

INSERT INTO `users_telegram_d5go` (`id`, `tele_id`, `usersname`, `pass`, `data`, `Sign`, `UserId`, `NickName`, `chienluoc`, `lodung`, `loidung`, `doigay`, `cainguoc`, `caidca`, `coppy`, `chienluoc_id`, `tele_name`, `chienluocdata`, `chienluocdata_goc`, `loinhuan`, `mucloihientai`, `status`, `status_trade`, `bet_index`, `vngo1`, `vngo3`, `vngo5`, `vngo10`, `created_at`, `5dgo1`, `5dgo3`, `5dgo5`, `5dgo10`, `k3go1`, `k3go3`, `k3go5`, `k3go10`, `trxhash1`, `activeacc`) VALUES
(1, '1036111895', '147323', '123456', '{\"Sign\":\"2526125F195C666B60E3B5929D35418E9838E86FEAE3A81571FC96BB1EB67A64\",\"UserId\":41763,\"UserPhoto\":\"https://api.lightspacecdn.com/img/avatar.cfa8dd9d.svg\",\"UserName\":\"147323\",\"NickName\":\"MemberNNGJB01F\",\"Amount\":61632420,\"KeyCode\":54,\"Token\":null,\"Isvalidator\":0,\"Integral\":356242,\"Lv\":\"8\",\"IsOpenJackpotReward\":0}', '2526125F195C666B60E3B5929D35418E9838E86FEAE3A81571FC96BB1EB67A64', '41763', 'MemberNNGJB01F', '1000,3000,8000,24000,72000,216000,648000', 10000000, 10000000, 'off', 'off', 'thua', 'off', 1, '???? ʙᴏss ʟᴀɴ ʙᴅɢ ????', '[\"N_N\",\"L_L\"]', '[\"1N_N\",\"1L_L\"]', '', 'NONE', 2, 0, 0, 0, 1, 0, 0, '2023-12-13 11:30:58', 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
(6, '1036111895', '0349435076', 'hoanganh123', '{\"Sign\":\"C9C96239CA5D9142868D4E4F9B12B8FCB88CD2F62F37637E7826BC93B1792037\",\"UserId\":1171,\"UserPhoto\":\"https://api.lightspacecdn.com/img/avatar.cfa8dd9d.svg\",\"UserName\":\"84349435076\",\"NickName\":\"MemberNNGQQQTP\",\"Amount\":3335.82,\"KeyCode\":18,\"Token\":null,\"Isvalidator\":0,\"Integral\":59,\"Lv\":\"0\",\"IsOpenJackpotReward\":0}', 'C9C96239CA5D9142868D4E4F9B12B8FCB88CD2F62F37637E7826BC93B1792037', '1171', 'MemberNNGQQQTP', '', 0, 0, 'off', 'off', 'thua', 'off', 0, 'Danghung', '', '', '', 'NONE', 1, 0, 0, 0, 0, 0, 0, '2023-12-13 14:46:24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_telegram_k3go`
--

CREATE TABLE `users_telegram_k3go` (
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_telegram_trxhash`
--

CREATE TABLE `users_telegram_trxhash` (
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
  `activeacc` int(11) NOT NULL DEFAULT 0,
  `trxhash3` int(11) NOT NULL DEFAULT 0,
  `trxhash5` int(11) NOT NULL DEFAULT 0,
  `trxhash10` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_telegram_vngo`
--

CREATE TABLE `users_telegram_vngo_xanhdo` (
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
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bonhotam`
--
ALTER TABLE `bonhotam`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chienluoc_d5go`
--
ALTER TABLE `chienluoc_d5go`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chienluoc_k3go`
--
ALTER TABLE `chienluoc_k3go`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chienluoc_trxhash`
--
ALTER TABLE `chienluoc_trxhash`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chienluoc_vngo`
--
ALTER TABLE `moi_chienluoc_vngo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `copytinhieu_d5go`
--
ALTER TABLE `moi_chienluoc_k3go`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `copytinhieu_k3go`
--
ALTER TABLE `copytinhieu_k3go`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `copytinhieu_trxhash`
--
ALTER TABLE `taikhoan_bdg`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `copytinhieu_vngo`
--
ALTER TABLE `copytinhieu_vngo_xanhdo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lichsu_ma`
--
ALTER TABLE `lichsu_ma`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lichsu_ma_group`
--
ALTER TABLE `lichsu_ma_group`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lichsu_tong_hop`
--
ALTER TABLE `moi_chienluoc_d5go`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `moi_chienluoc_d5go`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Chỉ mục cho bảng `tonghopphien`
--
ALTER TABLE `tonghopphien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users_telegram_d5go`
--
ALTER TABLE `users_telegram_d5go`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users_telegram_k3go`
--
ALTER TABLE `users_telegram_k3go`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users_telegram_trxhash`
--
ALTER TABLE `users_telegram_trxhash`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users_telegram_vngo`
--
ALTER TABLE `taikhoan_he_thong`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bonhotam`
--
ALTER TABLE `taikhoan_bdg`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `bonhotam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE `taikhoan_bdg`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `taikhoan_bdg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
moi_copytinhieu_
--
-- AUTO_INCREMENT cho bảng `chienluoc_d5go`
--
ALTER TABLE `taikhoan_he_thong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `chienluoc_k3go`
--
ALTER TABLE `tai_khoan_da_active`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chienluoc_trxhash`
--


--
-- AUTO_INCREMENT cho bảng `chienluoc_vngo`
--
ALTER TABLE `chienluoc_vngo_xanhdo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `copytinhieu_d5go`
--
ALTER TABLE `copytinhieu_d5go`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `copytinhieu_k3go`
--
ALTER TABLE `copytinhieu_k3go`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `copytinhieu_trxhash`
--
ALTER TABLE `copytinhieu_trxhash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `copytinhieu_vngo`
--
ALTER TABLE `copytinhieu_vngo_xanhdo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lichsu_ma`
--
ALTER TABLE `lichsu_ma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lichsu_ma_group`
--
ALTER TABLE `lichsu_ma_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT cho bảng `lichsu_tong_hop`
--
ALTER TABLE `lichsu_tong_hop_xd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT cho bảng `tonghopphien`
--
  ALTER TABLE `tonghopphien`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

  --
  -- AUTO_INCREMENT cho bảng `users_telegram_d5go`
  --
  ALTER TABLE `users_telegram_d5go`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

  --
  -- AUTO_INCREMENT cho bảng `users_telegram_k3go`
  --
  ALTER TABLE `users_telegram_k3go`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

  --
  -- AUTO_INCREMENT cho bảng `users_telegram_trxhash`
  --
  ALTER TABLE `users_telegram_trxhash`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

  --
  -- AUTO_INCREMENT cho bảng `users_telegram_vngo`
  --
  ALTER TABLE `users_telegram_vngo_xanhdo`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
