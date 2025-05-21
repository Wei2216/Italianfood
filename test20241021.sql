-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-04-07 11:05:51
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `test20241021`
--

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `ID` int(11) NOT NULL COMMENT '編號',
  `Username` varchar(32) NOT NULL COMMENT '會員帳號',
  `Password` varchar(255) NOT NULL COMMENT '會員密碼',
  `Email` varchar(32) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`ID`, `Username`, `Password`, `Email`, `Created_at`) VALUES
(9, '111', '$2y$10$GqIMc1LGmC5OyO41RosYSeYmdUg.ecGEWu/palpk3ZvYMA8p9jCdi', '111111', '2024-12-30 08:12:04'),
(10, '222', '$2y$10$j0c/jcab5PCjQp7Ffcrpa.sHK1Aaht/sW3Dk78b8PQRYaxkKi9jlq', '222222', '2024-12-30 08:12:16'),
(11, '444', '$2y$10$Ke0Hu6B5tGt/xESTkpgpEeMIdjnicy7BOLoNaZ7TZQP3l3V1hgOs.', '44444444', '2025-01-02 15:47:44');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Product` varchar(32) NOT NULL COMMENT '產品名稱',
  `Price` int(11) NOT NULL COMMENT '產品價格',
  `Ice` varchar(32) NOT NULL COMMENT '冰度',
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '建檔時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`ID`, `Product`, `Price`, `Ice`, `Created_at`) VALUES
(51, '咖啡紅茶', 40, '1/3冰', '2024-10-21 07:56:54'),
(89, '紅茶拿鐵', 50, '全冰', '2024-11-11 00:38:29'),
(91, '珍珠奶茶', 20, '1/2冰', '2024-11-11 05:47:07'),
(93, '珍珠奶茶', 40, '去冰', '2024-11-11 06:21:04'),
(96, '咖啡紅茶', 50, '1/2冰', '2024-11-11 07:38:14'),
(97, '紅茶拿鐵', 90, '全冰', '2024-11-11 07:38:34'),
(102, '珍珠奶茶', 90, '全冰', '2024-11-11 07:49:40'),
(106, '珍珠紅茶', 50, '1/3冰', '2024-11-11 08:00:22'),
(107, '珍珠奶茶', 50, '1/3冰', '2024-11-11 08:00:41');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '編號', AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
