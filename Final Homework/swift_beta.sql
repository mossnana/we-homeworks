-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2018 at 05:15 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swift_beta`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` tinyint(11) NOT NULL,
  `category_name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'อาหารเช้า'),
(2, 'อาหารกลางวัน'),
(3, 'อาหารเย็น'),
(4, 'ของหวาน');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `invoice_customer` text COLLATE utf8_unicode_ci NOT NULL,
  `invoice_phone` int(11) NOT NULL,
  `invoice_address` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_date`, `member_id`, `invoice_customer`, `invoice_phone`, `invoice_address`) VALUES
(3, '2018-12-10 10:40:31', 0, 'xxx', 806775134, '98/1 ซอย 4'),
(4, '2018-12-10 10:55:02', 0, 'xxx', 806775134, '98/1 ซอย 4'),
(5, '2018-12-10 10:55:22', 0, 'sd', 806775134, 'ssfdfsdf'),
(6, '2018-12-10 10:56:08', 0, 'sd', 806775134, 'ssfdfsdf'),
(7, '2018-12-10 15:22:22', 1, 'เพิ่มพูน เชาวนพูนผล', 806775134, '98/1 เชียงใหม่ 50300'),
(8, '2018-12-10 15:22:36', 1, 'asdasd', 806775134, 'asdasdasd'),
(9, '2018-12-10 15:26:06', 1, 'เพิ่มพูน เชาวนพูนผล', 806775134, '98/1 เชียงใหม่ 50300'),
(10, '2018-12-10 15:26:34', 1, 'เพิ่มพูน เชาวนพูนผล', 806775134, '98/1 เชียงใหม่ 50300'),
(11, '2018-12-10 15:30:10', 1, '', 0, ''),
(12, '2018-12-10 15:31:24', 1, 'test', 806775134, 'wow'),
(13, '2018-12-10 15:32:03', 1, 'test', 806775134, 'wow'),
(14, '2018-12-10 15:32:54', 1, 'test', 806775134, 'wow'),
(15, '2018-12-10 15:34:44', 1, 'testsadsad', 806775134, 'wowdsadsad'),
(16, '2018-12-11 07:59:25', 33, 'mai eiei', 865977548, '988/1124 ไทย 55'),
(17, '2018-12-11 08:25:34', 1, 'เพิ่มพูน เชาวนพูนผล', 806775134, '98/1 เชียงใหม่ 50300'),
(18, '2018-12-12 08:16:26', 1, 'เพิ่มพูน เชาวนพูนผล', 806775134, '98/1 เชียงใหม่ 50300'),
(19, '2018-12-12 08:19:40', 1, 'เพิ่มพูน เชาวนพูนผล', 806775134, '98/1 เชียงใหม่ 50300'),
(20, '2018-12-12 08:21:37', 1, 'เพิ่มพูน เชาวนพูนผล', 806775134, '98/1 เชียงใหม่ 50300'),
(21, '2018-12-13 04:11:45', 32, 'test user', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `level_name` tinytext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_name`) VALUES
(1, 'administrator'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `member_username` varchar(21) COLLATE utf8_unicode_ci NOT NULL,
  `member_password` text COLLATE utf8_unicode_ci NOT NULL,
  `member_name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `member_phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `member_email` text COLLATE utf8_unicode_ci NOT NULL,
  `member_address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `member_username`, `member_password`, `member_name`, `member_phone`, `member_email`, `member_address`, `level_id`) VALUES
(1, 'mossnana', '81dc9bdb52d04dc20036dbd8313ed055', 'เพิ่มพูน เชาวนพูนผล', '0806775134', 'samurai.hanso@gmail.com', '98/1 เชียงใหม่ 50300', 1),
(2, 'jamal', '81dc9bdb52d04dc20036dbd8313ed055', 'Jamal Mcneil', '088244787', 'jamal.mcneil@gmail.com', '98/1 เชียง', 2),
(3, 'abel', '81dc9bdb52d04dc20036dbd8313ed055', 'Abel Waters', '083140352', 'abel.waters@gmail.com', '98/1 เชียง', 2),
(4, 'rayne', '81dc9bdb52d04dc20036dbd8313ed055', 'Rayne Figueroa', '083239758', 'rayne.figueroa@gmail.com', '98/1 เชียง', 2),
(5, 'camden', '81dc9bdb52d04dc20036dbd8313ed055', 'Camden Wu', '082149362', 'camden.wu@gmail.com', '98/1 เชียง', 2),
(6, 'kayla', '81dc9bdb52d04dc20036dbd8313ed055', 'Kayla Hunt', '082295722', 'kayla.hunt@gmail.com', '98/1 เชียง', 2),
(7, 'nayeli', '81dc9bdb52d04dc20036dbd8313ed055', 'Nayeli Morrow', '82066640', 'nayeli.morrow@gmail.com', '98/1 เชียง', 2),
(8, 'salma', '81dc9bdb52d04dc20036dbd8313ed055', 'Salma Solis', '85136447', 'salma.solis@gmail.com', '98/1 เชียง', 2),
(9, 'zaniyah', '81dc9bdb52d04dc20036dbd8313ed055', 'Zaniyah Keller', '88063172', 'zaniyah.keller@gmail.com', '98/1 เชียง', 2),
(10, 'keira', '81dc9bdb52d04dc20036dbd8313ed055', 'Keira Mcfarland', '89994387', 'keira.mcfarland@gmail.com', '98/1 เชียง', 2),
(11, 'adeline', '81dc9bdb52d04dc20036dbd8313ed055', 'Adeline Snow', '89490639', 'adeline.snow@gmail.com', '98/1 เชียง', 2),
(12, 'adison', '81dc9bdb52d04dc20036dbd8313ed055', 'Adison Powers', '89843890', 'adison.powers@gmail.com', '98/1 เชียง', 2),
(13, 'taylor', '81dc9bdb52d04dc20036dbd8313ed055', 'Taylor Shaw', '85632079', 'taylor.shaw@gmail.com', '98/1 เชียง', 2),
(14, 'luna', '81dc9bdb52d04dc20036dbd8313ed055', 'Luna Le', '84534614', 'luna.le@gmail.com', '98/1 เชียง', 2),
(15, 'warren', '81dc9bdb52d04dc20036dbd8313ed055', 'Warren Ochoa', '81708449', 'warren.ochoa@gmail.com', '98/1 เชียง', 2),
(16, 'emely', '81dc9bdb52d04dc20036dbd8313ed055', 'Emely Carlson', '82395448', 'emely.carlson@gmail.com', '98/1 เชียง', 2),
(17, 'lane', '81dc9bdb52d04dc20036dbd8313ed055', 'Lane Yu', '89628963', 'lane.yu@gmail.com', '98/1 เชียง', 2),
(18, 'tyshawn', '81dc9bdb52d04dc20036dbd8313ed055', 'Tyshawn Bell', '86527135', 'tyshawn.bell@gmail.com', '98/1 เชียง', 2),
(19, 'jaxson', '81dc9bdb52d04dc20036dbd8313ed055', 'Jaxson Howe', '82742209', 'jaxson.howe@gmail.com', '98/1 เชียง', 2),
(20, 'jamie', '81dc9bdb52d04dc20036dbd8313ed055', 'Jamie Forbes', '84967570', 'jamie.forbes@gmail.com', '98/1 เชียง', 2),
(21, 'jeffery', '81dc9bdb52d04dc20036dbd8313ed055', 'Jeffery Oconnor', '88424085', 'jeffery.oconnor@gmail.com', '98/1 เชียง', 2),
(22, 'marcel', '81dc9bdb52d04dc20036dbd8313ed055', 'Marcel Li', '82973271', 'marcel.li@gmail.com', '98/1 เชียง', 2),
(23, 'ben', '81dc9bdb52d04dc20036dbd8313ed055', 'Ben Suarez', '87851084', 'ben.suarez@gmail.com', '98/1 เชียง', 2),
(24, 'niko', '81dc9bdb52d04dc20036dbd8313ed055', 'Niko Branch', '89783068', 'niko.branch@gmail.com', '98/1 เชียง', 2),
(25, 'alani', '81dc9bdb52d04dc20036dbd8313ed055', 'Alani Joyce', '87879313', 'alani.joyce@gmail.com', '98/1 เชียง', 2),
(26, 'aurora', '81dc9bdb52d04dc20036dbd8313ed055', 'Aurora Berry', '84236872', 'aurora.berry@gmail.com', '98/1 เชียง', 2),
(27, 'keaton', '81dc9bdb52d04dc20036dbd8313ed055', 'Keaton Nichols', '81996412', 'keaton.nichols@gmail.com', '98/1 เชียง', 2),
(28, 'cooper', '81dc9bdb52d04dc20036dbd8313ed055', 'Cooper Pollard', '89833895', 'cooper.pollard@gmail.com', '98/1 เชียง', 2),
(29, 'ivan', '81dc9bdb52d04dc20036dbd8313ed055', 'Ivan Hale', '89726341', 'ivan.hale@gmail.com', '98/1 เชียง', 2),
(30, 'harrison', '81dc9bdb52d04dc20036dbd8313ed055', 'Harrison Reeves', '88798273', 'harrison.reeves@gmail.com', '98/1 เชียง', 2),
(31, 'gwendolyn', '81dc9bdb52d04dc20036dbd8313ed055', 'Gwendolyn Hayden', '86672272', 'gwendolyn.hayden@gmail.com', '98/1 เชียง', 2),
(32, 'xxx', '81dc9bdb52d04dc20036dbd8313ed055', 'test user', '', 'xxx@xxx.com', '', 2),
(33, 'wowow', '9996535e07258a7bbfd8b132435c5962', 'mai eiei', '0865977548', 'dexk@mai.com', '988/1124 ไทย 55', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` text COLLATE utf8_unicode_ci NOT NULL,
  `product_desp` text COLLATE utf8_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_stock` int(11) NOT NULL,
  `category_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_desp`, `product_price`, `product_stock`, `category_id`) VALUES
(1, 'ข้าวต้มกุ้งพิโรธ', 'อร่อยเกินห้ามใจ', 120, 1000, 1),
(2, 'ข้าวต้มทะเล', '', 250, 1000, 1),
(3, 'ข้าวต้มปลาเก๋า', '', 300, 1000, 1),
(4, 'ข้าวต้มกระดูกหมู', '', 213, 1000, 1),
(5, 'โจ๊กหมู', '', 193, 997, 1),
(6, 'ต้มเลือดหมู', '', 166, 1000, 2),
(7, 'ไข่กระทะ', '', 275, 994, 2),
(8, 'ข้าวเหนียวหมูปิ้ง', '', 125, 1000, 2),
(9, 'ข้าวเหนียวหมูฝอย', '', 269, 1000, 2),
(10, 'ข้าวไข่เจียว', '', 111, 1000, 2),
(11, 'ข้าวเหนียวไก่ทอด', '', 267, 1000, 2),
(12, 'ซาลาเปาหมูสับ', '', 261, 1000, 2),
(13, 'ขนมจีบกุ้ง', '', 211, 1000, 3),
(14, 'ขนมจีบหมู', '', 243, 995, 3),
(15, 'แซนด์วิชแฮมชีส', '', 275, 997, 3),
(16, 'แซนด์วิชไส้ปูอัด', '', 194, 1000, 3),
(17, 'เบอร์เกอร์ข้าวเหนียวลาบหมู', '', 286, 1000, 3),
(18, 'ขนมครก', '', 175, 992, 4),
(19, 'ข้าวหลามลูกมะพร้าว', '', 200, 994, 4),
(20, 'ขนมชั้นช็อกโกแลต', '', 150, 1000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `shopping`
--

CREATE TABLE `shopping` (
  `shopping_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `shopping_amount` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `shopping_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shopping`
--

INSERT INTO `shopping` (`shopping_id`, `product_id`, `shopping_amount`, `member_id`, `invoice_id`, `shopping_time`) VALUES
(1, 6, 3, 1, 7, '2018-12-10 15:22:22'),
(2, 7, 3, 1, 15, '2018-12-10 15:34:44'),
(3, 20, 2, 1, 15, '2018-12-10 15:34:44'),
(4, 7, 5, 33, 16, '2018-12-11 07:59:25'),
(5, 19, 8, 33, 16, '2018-12-11 07:59:25'),
(6, 1, 3, 1, 17, '2018-12-11 08:25:34'),
(7, 19, 4, 1, 17, '2018-12-11 08:25:34'),
(8, 18, 8, 1, 18, '2018-12-12 08:16:26'),
(9, 14, 5, 1, 18, '2018-12-12 08:16:26'),
(10, 18, 8, 1, 19, '2018-12-12 08:19:40'),
(11, 14, 5, 1, 19, '2018-12-12 08:19:40'),
(12, 7, 5, 1, 19, '2018-12-12 08:19:40'),
(13, 18, 8, 1, 20, '2018-12-12 08:21:37'),
(14, 14, 5, 1, 20, '2018-12-12 08:21:38'),
(15, 7, 5, 1, 20, '2018-12-12 08:21:38'),
(16, 19, 6, 32, 21, '2018-12-13 04:11:46'),
(17, 5, 3, 32, 21, '2018-12-13 04:11:46'),
(18, 7, 1, 32, 21, '2018-12-13 04:11:46'),
(19, 15, 3, 32, 21, '2018-12-13 04:11:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `r_level_member` (`level_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `shopping`
--
ALTER TABLE `shopping`
  ADD PRIMARY KEY (`shopping_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shopping`
--
ALTER TABLE `shopping`
  MODIFY `shopping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `r_level_member` FOREIGN KEY (`level_id`) REFERENCES `level` (`level_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `shopping`
--
ALTER TABLE `shopping`
  ADD CONSTRAINT `r_member_shopping` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `shopping_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `shopping_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
