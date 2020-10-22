SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


DROP TABLE IF EXISTS `USERS`;

CREATE TABLE `USERS`(
    `ID` mediumint(9) NOT NULL,
    `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `password` varchar(72) COLLATE utf8_unicode_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `USERS`
  ADD PRIMARY KEY (`ID`);
  
ALTER TABLE USERS
    MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
    
DROP TABLE IF EXISTS INVENTORY;

CREATE TABLE INVENTORY (
  `itemId` mediumint(9) NOT NULL,
  `seller` mediumint(9) NOT NULL,
  `itemlink` varchar(40000) COLLATE utf8_unicode_ci NOT NULL,
  `itemname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `stock` mediumint(9) NOT NULL,
  `price` float(6,2) NOT NULL,
  `desc` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE INVENTORY
  ADD PRIMARY KEY (`itemId`);

ALTER TABLE INVENTORY
  MODIFY `itemId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
DROP TABLE IF EXISTS INVENTORY;

CREATE TABLE CART (
  `cartId` mediumint(9) NOT NULL,
  `itemId` mediumint(9) NOT NULL,
  `quanitity` mediumint(9) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE CART
  ADD PRIMARY KEY (`cartId`);

ALTER TABLE CART
  MODIFY `cartId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
  
  
  
INSERT INTO `items` (`itemId`, `seller`, `itemlink`, `itemname`, `category`, `stock`, `price`, `desc`) VALUES
(1, 2, 'https://store.sabaton.net/wp-content/uploads/2015/11/wings-of-glory-tshirt-back-sabaton-T15003.png', 'shirt', 'shirts', 10, 15.99, 'Nice looking shirt made out of quality material.'),
(2, 2, 'https://target.scene7.com/is/image/Target/GUEST_657addf4-97db-485e-b4b1-954ca50de598?wid=325&hei=325&qlt=80&fmt=webp', 'designed shirt', 'shirts', 10, 15.99, 'Nice shirt with a design on it.'),
(3, 1, 'https://www.theoutnet.com/variants/images/4854206262892787/F/w1020_q80.jpg', 'sweeter', 'sweeters', 10, 20.99, "Nice blue sweeter made out of cotton."),
(4, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR-b1lGUm5SDosggEK1HGhkExTCzjuO_9qveQ&usqp=CAU', 'sweeter', 'sweeters', 10, 25.99, 'Nice looking sweeter.'),
(5, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRzRuV5lGCi0QT5-O-PCEGt8GcGrwUpukDNrA&usqp=CAU', 'pants', 'pants', 10, 12.99, 'Black pansts, made for comfort.');