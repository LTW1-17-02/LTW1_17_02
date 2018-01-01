-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo:Th12 28, 2017 lúc 06:46 PM
-- Phiên bản máy phục vụ: 10.1.28-MariaDB
-- Phiên bản PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ban_hang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id_donhang` int(10) NOT NULL,
  `id_sanpham` int(10) NOT NULL,
  `soluong` int(11) NOT NULL COMMENT 'số lượng',
  `giaban` double NOT NULL,
  `giatien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_nguoidung` int(11) DEFAULT NULL,
  `tongsp` int(11) DEFAULT NULL COMMENT 'tổng số sản phẩm',
  `tongtien` int(11) DEFAULT NULL COMMENT 'tổng giá trị',
  `trangthai` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` int(11) NOT NULL,
  `id_nguoidung` int(11) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_san_pham`
--

CREATE TABLE `loai_san_pham` (
  `id` int(11) NOT NULL,
  `ten` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_san_pham`
--

INSERT INTO `loai_san_pham` (`id`, `ten`) VALUES
(1, 'Sam'),
(2, 'Op'),
(3, 'Apple');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nha_san_xuat`
--

CREATE TABLE `nha_san_xuat` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten` varchar(50) CHARACTER SET utf8 NOT NULL,
  `diachi` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` text CHARACTER SET utf8,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nha_san_xuat`
--

INSERT INTO `nha_san_xuat` (`id`, `ten`, `diachi`, `email`, `phone`) VALUES
(1, 'Sam Sung', 'China', 'SamSung@gmail', '01231456789'),
(2, 'Oppo', 'China', 'Oppo@gmail', '01231456788'),
(3, 'Apple', 'Usa', 'Apple@gmail', '01231456787');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id` int(10) UNSIGNED NOT NULL,
  `tensp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loai` int(10) UNSIGNED DEFAULT NULL,
  `id_nsx` int(10) UNSIGNED DEFAULT NULL,
  `gia` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xuatsu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `luotxem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id`, `tensp`, `loai`, `id_nsx`, `gia`, `soluong`, `mota`, `image`, `xuatsu`, `created_at`, `luotxem`) VALUES
(1, 'Điện thoại 1', 1, 1, 1000, 100, '', 'images/1.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(2, 'Điện thoại 2', 1, 1, 2000, 100, '', 'images/2.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(3, 'Điện thoại 3', 1, 1, 3000, 100, '', 'images/3.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(4, 'Điện thoại 4', 1, 1, 4000, 100, '', 'images/4.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(5, 'Điện thoại 5', 1, 1, 5000, 100, '', 'images/5.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(6, 'Điện thoại 6', 1, 1, 6000, 100, '', 'images/6.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(7, 'Điện thoại 7', 1, 1, 7000, 100, '', 'images/7.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(8, 'Điện thoại 8', 1, 1, 8000, 100, '', 'images/8.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(9, 'Điện thoại 9', 1, 1, 9000, 100, '', 'images/9.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(10, 'Điện thoại 10', 1, 1, 10000, 100, '', 'images/10.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(11, 'Điện thoại 11', 2, 2, 11000, 100, '', 'images/11.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(12, 'Điện thoại 12', 2, 2, 12000, 100, '', 'images/12.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(13, 'Điện thoại 13', 2, 2, 13000, 100, '', 'images/13.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(14, 'Điện thoại 14', 2, 2, 14000, 100, '', 'images/14.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(15, 'Điện thoại 15', 2, 2, 15000, 100, '', 'images/15.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(16, 'Điện thoại 16', 3, 3, 16000, 100, '', 'images/16.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(17, 'Điện thoại 17', 3, 3, 17000, 100, '', 'images/17.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(18, 'Điện thoại 18', 3, 3, 18000, 100, '', 'images/18.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(19, 'Điện thoại 19', 3, 3, 19000, 100, '', 'images/19.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(20, 'Điện thoại 20', 3, 3, 20000, 200, '', 'images/20.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(21, 'Điện thoại 21', 3, 3, 21000, 100, '', 'images/21.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(22, 'Điện thoại 22', 3, 3, 22000, 100, '', 'images/22.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(23, 'Điện thoại 23', 3, 3, 23000, 100, '', 'images/23.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(24, 'Điện thoại 24', 3, 3, 24000, 200, '', 'images/24.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(25, 'Điện thoại 25', 3, 3, 25000, 100, '', 'images/25.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(26, 'Điện thoại 26', 3, 3, 26000, 200, '', 'images/26.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(27, 'Điện thoại 27', 3, 3, 27000, 200, '', 'images/27.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(28, 'Điện thoại 28', 3, 3, 28000, 200, '', 'images/28.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(29, 'Điện thoại 29', 3, 3, 29000, 200, '', 'images/29.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234),
(30, 'Điện thoại 30', 3, 3, 20000, 200, '', 'images/30.jpg', 'Việt Nam', '2017-12-26 17:00:00', 1234);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `type`) VALUES
(1, 'Huỳnh anh khoa', 'yumiling1001@gmail.com', '123123123', 1),
(2, 'admin', 'admin@gmail.com', 'admin', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id_donhang`,`id_sanpham`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loai_san_pham`
--
ALTER TABLE `loai_san_pham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nha_san_xuat`
--
ALTER TABLE `nha_san_xuat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nha_san_xuat`
--
ALTER TABLE `nha_san_xuat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
