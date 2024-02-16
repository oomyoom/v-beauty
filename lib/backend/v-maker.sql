-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 04:04 AM
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
-- Database: `v-maker`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(1000) NOT NULL,
  `Password` varchar(1000) NOT NULL,
  `Email` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`UserID`, `UserName`, `Password`, `Email`) VALUES
(1, 'exampleUser', 'examplePassword', 'example@example.com'),
(2, 'exampleUser', 'examplePassword', 'example@example.com'),
(3, 'Hello', '1234', 'Hello@gmail.com'),
(4, 'Hello', '$2b$10$nZbmczXLWYykGwLCDsc1qe.E1iKQ0da/yqqQgxR9/iNw2Vqa.Qigm', 'Hello@gmail.com'),
(5, 'Hello', '$2b$10$NNDk5QmTZnufSKoAnZf.fuY14tvBeJOxeddU/8dGQoCipM5/gVji.', 'Hello@gmail.com'),
(6, 'Hello', '$2b$10$/Q0guIG9MUScdx2Ye/xmrOg4zDA85lt2OuJ76Y8xSjdyDNbhGPS2u', 'Hello@gmail.com'),
(7, 'Hello', '$2b$10$YOCfROAVi7IBno7zSd0UEuXus5mEFr5p3g5l.8kel5HPbqOmYgn6y', 'Hello@gmail.com'),
(8, 'Hello', '$2b$10$Iaakmu5xEHaLg9mYTFtoOOQrlFIjfBA7O9ltr6nfK/.rcmFrzcOa2', 'Hello123@gmail.com'),
(9, 'Third', '$2b$10$vtAtoFYUqDhEASiScK8LCu3E0IpOjKxq7J9kP.z9WemuTBREzNIf2', 'Third123@gmail.com'),
(10, 'Third', '$2b$10$vfX8Wc96veHQcBrNIrWJOO.Ip0Rg/H6gtSLW0LZmzeZ5uA5PJQBt6', 'Third123@gmail.com'),
(11, 'Third', '$2b$10$Y3k8W0XvcqnNZZhhn9cWCOV3n9T.mR/RbmOCTWGxE.VeiG6ns09ha', 'Third123@gmail.com'),
(12, 'AAA', '$2b$10$IpaPXtXdSx3RVgpzse.GCO9Wyjx7Il2IWlxgCLMtuQ52yN5C68rdC', 'A123@gmail.com'),
(13, 'AAA', '$2b$10$Ukc.BjgKe3hofcgaodpQu.Q380EpxcJFBjwSY5IJIeiB5frJ6tdRu', 'A123@gmail.com'),
(14, 'AAA', '$2b$10$PRGTjojQXUQNgdXrXtoaeuWTK55pMCo1VEbRVnTxvoxkbBu9.qGjS', 'A123@gmail.com'),
(15, 'AAA', '$2b$10$Sr5DyNRo054JwTtE6gAAGe8uZwDJTvc3nf3Xnd8Mtt0iZDUrypRQ.', 'A123@gmail.com'),
(16, 'AAA', '$2b$10$EIKTtH4iWygG4rwCbS/9E.L/AhudnMPIEjT1QnIMEL9yRFuX.TVjy', 'A123@gmail.com'),
(17, 'BAA', '$2b$10$cmc3i.8UZX3zlTlgY9lXL.NtEN.gR0KAzHURe.tsJvS4ZpBSdVsFu', 'A123@gmail.com'),
(18, 'Loyson', '$2b$10$gM.sB9vklxKwswoNa.Ev/e3RA/GSFsCWiZvrunPmgoCAxO.kmENEW', 'loyson@gmail.com'),
(19, 'LoysonShop', '$2b$10$G15bFChZKOPYMtzG8Hu7AuTVKI55wiLxQ/D2Lltxpg.VPDpMDlynW', 'loyson@gmail.com'),
(20, 'LoysonShop', '$2b$10$jJA07UfgPA7SVY/vZH95L.Xkfpzvsy5cm4IAplTCefFrK1yTgma6q', 'loyson1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `app_user_groups`
--

CREATE TABLE `app_user_groups` (
  `UserGroupID` int(11) NOT NULL,
  `UseGroupName` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_user_groups`
--

INSERT INTO `app_user_groups` (`UserGroupID`, `UseGroupName`) VALUES
(1, 'Customer'),
(2, 'Store'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `app_user_roles`
--

CREATE TABLE `app_user_roles` (
  `UserGroupID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_user_roles`
--

INSERT INTO `app_user_roles` (`UserGroupID`, `UserID`) VALUES
(1, 8),
(3, 9),
(3, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(3, 19),
(3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`) VALUES
(1, 'Face Makeup'),
(2, 'Eye Makeup'),
(3, 'Lip Makeup'),
(4, 'Skincare Makeup'),
(5, 'Men\'s Makeup');

-- --------------------------------------------------------

--
-- Table structure for table `item_orders`
--

CREATE TABLE `item_orders` (
  `ProductID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_order_form_shoppers`
--

CREATE TABLE `item_order_form_shoppers` (
  `OrderID` int(11) NOT NULL,
  `ShopperID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `Status` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CreatedAt` date NOT NULL,
  `PaymentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_lines`
--

CREATE TABLE `order_lines` (
  `OrderLineID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `PaymentMethodID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentmedthod`
--

CREATE TABLE `paymentmedthod` (
  `PaymentMedthodID` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(1000) NOT NULL,
  `Price` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `R` int(11) NOT NULL,
  `G` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  `O` double NOT NULL,
  `Image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Price`, `CategoryID`, `R`, `G`, `B`, `O`, `Image`) VALUES
(1, 'MILLE รองพื้นเซรั่ม', 699, 1, 244, 143, 177, 1, 'https://cl.lnwfile.com/_/cl/_raw/fy/v0/y4.jpg'),
(2, 'โอดีบีโอ ซิกเนเจอร์', 199, 2, 244, 143, 177, 1, 'https://image.makewebeasy.net/makeweb/m_1920x0/pyuHEt3NP/FES/LINE_ALBUM_%E0%B8%A0%E0%B8%B2%E0%B8%9E%E0%B8%AA%E0%B8%A7%E0%B8%A2%E0%B8%AB%E0%B8%A5%E0%B8%B2%E0%B8%A2%E0%B8%AA%E0%B8%B4%E0%B8%99%E0%B8%84%E0%B9%89%E0%B8%B2__2_%E0%B9%92%E0%B9%93%E0%B9%90%E0%B9%96%E0%B9%92%E0%B9%97.jpg'),
(3, 'LE ROUGE DUO ULTRA TENUE', 1650, 3, 244, 143, 177, 1, 'https://images.pexels.com/photos/1625037/pexels-photo-1625037.jpeg'),
(4, 'Perfecting Cushion Airy', 2250, 4, 244, 143, 177, 1, 'https://inwfile.com/s-cp/6xy2tt.jpg'),
(5, 'OBGE Natural Cover', 1100, 5, 244, 143, 177, 1, 'https://cosmenet-in-th.s3-bkk.nipa.cloud/upload/webboard/newImages/vQmD/1659196246359.jpg'),
(6, 'Test Lip1', 100, 3, 244, 143, 177, 1, 'https://www.shiseido.co.th/dw/image/v2/BCSK_PRD/on/demandware.static/-/Sites-itemmaster_shiseido/default/dwaf1fa16c/images/products/18047/18047_S_01.jpg?sw=1000&sh=1000&sm=fit'),
(7, 'Test Lip2', 300, 3, 244, 143, 177, 1, 'https://www.reneecosmetics.in/cdn/shop/files/renee-stunner-matte-lipstick-4gm-renee-cosmetics-6.jpg?v=1691477163'),
(8, 'Test FaceMakeup1', 500, 1, 244, 143, 177, 1, 'https://www.central.co.th/adobe/dynamicmedia/deliver/dm-aid--f81fddb4-f93d-452b-ba13-7f9af3badc0d/nars-narsblushorgasmx-cds24535748-1.jpg?preferwebp=true&quality=60&width=550'),
(9, 'Test FaceMake2', 800, 1, 244, 123, 155, 1, 'https://inwfile.com/s-dw/cge8p9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Comment` varchar(1000) NOT NULL,
  `PostDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shoppers`
--

CREATE TABLE `shoppers` (
  `ShopperID` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `Email` varchar(1000) NOT NULL,
  `Phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `app_user_groups`
--
ALTER TABLE `app_user_groups`
  ADD PRIMARY KEY (`UserGroupID`);

--
-- Indexes for table `app_user_roles`
--
ALTER TABLE `app_user_roles`
  ADD KEY `group_id` (`UserGroupID`),
  ADD KEY `user_id` (`UserID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `item_orders`
--
ALTER TABLE `item_orders`
  ADD KEY `product_orders_id` (`ProductID`),
  ADD KEY `orders_shoppers_id` (`OrderID`);

--
-- Indexes for table `item_order_form_shoppers`
--
ALTER TABLE `item_order_form_shoppers`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `shoppers_id` (`ShopperID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `user_id_order` (`UserID`),
  ADD KEY `payment_id` (`PaymentID`);

--
-- Indexes for table `order_lines`
--
ALTER TABLE `order_lines`
  ADD PRIMARY KEY (`OrderLineID`),
  ADD KEY `order_id` (`OrderID`),
  ADD KEY `product_id_order` (`ProductID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `paymentmedthod` (`PaymentMethodID`);

--
-- Indexes for table `paymentmedthod`
--
ALTER TABLE `paymentmedthod`
  ADD PRIMARY KEY (`PaymentMedthodID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `product_category` (`CategoryID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `reviews_product` (`ProductID`),
  ADD KEY `reviews_user` (`UserID`);

--
-- Indexes for table `shoppers`
--
ALTER TABLE `shoppers`
  ADD PRIMARY KEY (`ShopperID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `app_user_groups`
--
ALTER TABLE `app_user_groups`
  MODIFY `UserGroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item_order_form_shoppers`
--
ALTER TABLE `item_order_form_shoppers`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_lines`
--
ALTER TABLE `order_lines`
  MODIFY `OrderLineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentmedthod`
--
ALTER TABLE `paymentmedthod`
  MODIFY `PaymentMedthodID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shoppers`
--
ALTER TABLE `shoppers`
  MODIFY `ShopperID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_user_roles`
--
ALTER TABLE `app_user_roles`
  ADD CONSTRAINT `group_id` FOREIGN KEY (`UserGroupID`) REFERENCES `app_user_groups` (`UserGroupID`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`UserID`) REFERENCES `app_users` (`UserID`);

--
-- Constraints for table `item_orders`
--
ALTER TABLE `item_orders`
  ADD CONSTRAINT `orders_shoppers_id` FOREIGN KEY (`OrderID`) REFERENCES `item_order_form_shoppers` (`OrderID`),
  ADD CONSTRAINT `product_orders_id` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `item_order_form_shoppers`
--
ALTER TABLE `item_order_form_shoppers`
  ADD CONSTRAINT `shoppers_id` FOREIGN KEY (`ShopperID`) REFERENCES `shoppers` (`ShopperID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `payment_id` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`),
  ADD CONSTRAINT `user_id_order` FOREIGN KEY (`UserID`) REFERENCES `app_users` (`UserID`);

--
-- Constraints for table `order_lines`
--
ALTER TABLE `order_lines`
  ADD CONSTRAINT `order_id` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `product_id_order` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `paymentmedthod` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmedthod` (`PaymentMedthodID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_category` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `reviews_user` FOREIGN KEY (`UserID`) REFERENCES `app_users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
