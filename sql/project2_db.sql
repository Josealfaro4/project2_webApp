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
    
DROP TABLE IF EXISTS `POSTS`;

CREATE TABLE `POSTS` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `orderID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `purchaseDate` DATE,                                                                                                             
  `itemName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `cost` DOUBLE NOT NULL,
  `data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
