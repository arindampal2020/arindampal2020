CREATE DATABASE nyse;

USE nyse;

CREATE TABLE `stock_eod` (
  `stockticker` varchar(10) NOT NULL DEFAULT '',
  `tradedate` varchar(30) NOT NULL DEFAULT '',
  `openprice` decimal(10,2) DEFAULT NULL,
  `highprice` decimal(10,2) DEFAULT NULL,
  `lowprice` decimal(10,2) DEFAULT NULL,
  `closeprice` decimal(10,2) DEFAULT NULL,
  `volume` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`stockticker`,`tradedate`)
);
SHOW TABLES;
DESC stock_eod;
