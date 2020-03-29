-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 29 Mar 2020, 20:03
-- Wersja serwera: 5.7.29-0ubuntu0.18.04.1
-- Wersja PHP: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shopper`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addresses`
--

CREATE TABLE `addresses` (
  `Adr_Id` int(10) UNSIGNED NOT NULL,
  `Adr_Country` varchar(60) NOT NULL,
  `Adr_State` varchar(100) NOT NULL,
  `Adr_City` varchar(100) NOT NULL,
  `Adr_PostalCode` varchar(25) NOT NULL,
  `Adr_Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `addresses`
--

INSERT INTO `addresses` (`Adr_Id`, `Adr_Country`, `Adr_State`, `Adr_City`, `Adr_PostalCode`, `Adr_Address`) VALUES
(13, 'Polska', 'małopolskie', 'Rudka', '33-122', '99'),
(14, 'Polska', 'małopolskie', 'Tarnów', '33-100', 'ul. Szpitalna 39/9'),
(15, 'Polska', 'mazowieckie', 'Warszawa', '00-001', 'ul. Jakuba Błaszczykowskiego 3/103'),
(16, 'Polska', 'małopolskie', 'Wierzchosławice', '33-122', '556');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `companies`
--

CREATE TABLE `companies` (
  `Com_Id` int(10) UNSIGNED NOT NULL,
  `Com_AdrId` int(10) UNSIGNED NOT NULL,
  `Com_CpTId` int(10) UNSIGNED NOT NULL,
  `Com_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `companies`
--

INSERT INTO `companies` (`Com_Id`, `Com_AdrId`, `Com_CpTId`, `Com_Name`) VALUES
(1, 13, 8, 'Chuj w dupie '),
(2, 13, 9, 'Dwa chuje w dupie sp. cywilna'),
(3, 15, 14, 'Trzy chuje w dupie sp. z o.o.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `companytypes`
--

CREATE TABLE `companytypes` (
  `CpT_Id` int(10) UNSIGNED NOT NULL,
  `CpT_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `companytypes`
--

INSERT INTO `companytypes` (`CpT_Id`, `CpT_Name`) VALUES
(8, 'jednoosobowa działalność gospodarcza'),
(9, 'spółka cywilna'),
(10, 'spółka jawna'),
(11, 'spółka partnerska'),
(12, 'spółka komandytowa'),
(13, 'spółka komandytowo-akcyjna'),
(14, 'spółka z ograniczoną odpowiedzialnością'),
(15, 'spółka akcyjna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `currencies`
--

CREATE TABLE `currencies` (
  `Cur_Id` int(10) UNSIGNED NOT NULL,
  `Cur_ISO` varchar(3) NOT NULL,
  `Cur_Name` varchar(30) NOT NULL,
  `Cur_Country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `currencies`
--

INSERT INTO `currencies` (`Cur_Id`, `Cur_ISO`, `Cur_Name`, `Cur_Country`) VALUES
(1, 'PLN', 'Złotówka', 'Polska'),
(2, 'GBP', 'Funt szterling', 'Wielka Brytania'),
(3, 'USD', 'Dolar amerykański', 'Stany Zjednoczone'),
(4, 'RUB', 'Rubel rosyjski', 'Rosja');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documentcontents`
--

CREATE TABLE `documentcontents` (
  `DcC_Id` int(10) UNSIGNED NOT NULL,
  `DcC_DcHId` int(10) UNSIGNED NOT NULL,
  `DcC_PrdId` int(10) UNSIGNED NOT NULL,
  `DcC_LotId` int(10) UNSIGNED NOT NULL,
  `DcC_CurId` int(10) UNSIGNED NOT NULL,
  `DcC_ProductDesignation` varchar(150) DEFAULT NULL,
  `DcC_UnitPrice` mediumint(8) UNSIGNED DEFAULT NULL,
  `DcC_ProductAmount` int(10) UNSIGNED DEFAULT NULL,
  `DcC_ProductDemand` int(10) UNSIGNED DEFAULT NULL,
  `DcC_ProductValue` int(10) UNSIGNED DEFAULT NULL,
  `DcC_TaxRate` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documentheaders`
--

CREATE TABLE `documentheaders` (
  `DcH_Id` int(10) UNSIGNED NOT NULL,
  `DcH_DcTId` int(10) UNSIGNED NOT NULL,
  `DcH_DocumentIssuer` int(10) UNSIGNED NOT NULL,
  `DcH_Contractor` int(10) UNSIGNED NOT NULL,
  `DcH_RemovalPlace` int(10) UNSIGNED NOT NULL,
  `DcH_DeliveryPlace` int(10) UNSIGNED NOT NULL,
  `DcH_RelatedDocument` int(10) UNSIGNED NOT NULL,
  `DcH_CostRespDept` int(10) UNSIGNED NOT NULL,
  `DcH_DocSeries` varchar(5) NOT NULL,
  `DcH_OrdinalNumber` int(10) UNSIGNED NOT NULL,
  `DcH_AdmissionDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documenttypes`
--

CREATE TABLE `documenttypes` (
  `DcT_Id` int(10) UNSIGNED NOT NULL,
  `DcT_DocType` varchar(10) NOT NULL,
  `DcT_Description` varchar(100) NOT NULL,
  `DcT_DocSeries` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `documenttypes`
--

INSERT INTO `documenttypes` (`DcT_Id`, `DcT_DocType`, `DcT_Description`, `DcT_DocSeries`) VALUES
(25, 'BO', 'Wprowadzanie bilansu otwarcia. ', 'BO'),
(26, 'PW', 'Przychód wewnętrzny.', 'PW'),
(27, 'RW', 'Rozchód wewnętrzny.', 'RW'),
(28, 'MM-', 'Przesunięcie międzymagazynowe na minus.', 'MMM'),
(29, 'MM+', 'Przesunięcie międzymagazynowe na plus.', 'MMP'),
(30, 'PZ', 'Przyjęcie towaru.', 'PZ'),
(31, 'RR', 'Przyjęcie towaru stwierdzone fakturą RR.', 'RR'),
(32, 'WZ', 'Wydanie zewnętrzne. ', 'WZ'),
(33, 'FA', 'Faktura usługowa.', 'FA'),
(34, 'KPZ', 'Korekta PZ.', 'KPZ'),
(35, 'KRR', 'Korekta RR.', 'KRR'),
(36, 'KWZ', 'Korekta WZ.', 'KWZ'),
(37, 'KFA', 'Korekta FA.', 'KFA'),
(38, 'FV', 'Faktura sprzedaży (VAT).', 'FV'),
(39, 'FVK', 'Korekta FV.', 'FVK'),
(40, 'FZ', 'Faktura zakupu.', 'FZ'),
(41, 'FZK', 'Korekta faktury zakupu.', 'FZK'),
(42, 'FW', 'Walutowa sprzedaży walutowa.', 'FW'),
(43, 'FWK', 'Waluta sprzedaży walutowa korekta.', 'FWK'),
(44, 'RZ', 'Rachunek zwykły.', 'RZ'),
(45, 'PR', 'Paragon', 'PR'),
(46, 'PRK', 'Paragon korekta.', 'PRK'),
(47, 'DRS', 'Dzienny raport sprzedaży dla kas fiskalnych.', 'DRS');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employees`
--

CREATE TABLE `employees` (
  `Emp_Id` int(10) UNSIGNED NOT NULL,
  `Emp_PrsId` int(10) UNSIGNED NOT NULL,
  `Emp_ComId` int(10) UNSIGNED NOT NULL,
  `Emp_Position` varchar(255) DEFAULT NULL,
  `Emp_Department` varchar(100) DEFAULT NULL,
  `Emp_NationalIdNum` varchar(30) DEFAULT NULL,
  `Emp_GrossSalary` mediumint(8) UNSIGNED NOT NULL,
  `Emp_HireDate` date NOT NULL,
  `Emp_ContractType` enum('UoP na okres próbny','UoP na okres wykonywania określonej pracy','UoP na czas określony','UoP na czas nieokreślony','B2B','Zlecenie','Dzieło') NOT NULL,
  `Emp_ContractDuration` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `employees`
--

INSERT INTO `employees` (`Emp_Id`, `Emp_PrsId`, `Emp_ComId`, `Emp_Position`, `Emp_Department`, `Emp_NationalIdNum`, `Emp_GrossSalary`, `Emp_HireDate`, `Emp_ContractType`, `Emp_ContractDuration`) VALUES
(1, 1, 1, 'CEO & CHUJ', 'Piwnica', '92983817727', 4100, '2020-03-01', 'UoP na okres próbny', '2020-03-18');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lotnumbers`
--

CREATE TABLE `lotnumbers` (
  `Lot_Id` int(10) UNSIGNED NOT NULL,
  `Lot_PrdId` int(10) UNSIGNED NOT NULL,
  `Lot_Number` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `loyality`
--

CREATE TABLE `loyality` (
  `Loy_Id` int(10) UNSIGNED NOT NULL,
  `Loy_PrsId` int(10) UNSIGNED NOT NULL,
  `Loy_ComId` int(10) UNSIGNED NOT NULL,
  `Loy_Balance` int(11) NOT NULL,
  `Loy_JoinDate` date NOT NULL,
  `Loy_ExpiryDate` date NOT NULL,
  `Loy_Expired` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `persons`
--

CREATE TABLE `persons` (
  `Prs_Id` int(10) UNSIGNED NOT NULL,
  `Prs_AdrId` int(10) UNSIGNED NOT NULL,
  `Prs_FirstName` varchar(30) NOT NULL,
  `Prs_SecondName` varchar(30) DEFAULT NULL,
  `Prs_LastName` varchar(50) NOT NULL,
  `Prs_BirthDate` date NOT NULL,
  `Prs_PhoneNumber` varchar(30) DEFAULT NULL,
  `Prs_EmailAddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `persons`
--

INSERT INTO `persons` (`Prs_Id`, `Prs_AdrId`, `Prs_FirstName`, `Prs_SecondName`, `Prs_LastName`, `Prs_BirthDate`, `Prs_PhoneNumber`, `Prs_EmailAddress`) VALUES
(1, 14, 'Adam', 'Janusz', 'Mickiewicz', '2017-10-17', '777 888 333', 'adam.mickiewicz@example.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `Prd_Id` int(10) UNSIGNED NOT NULL,
  `Prd_BatchDeterm` enum('FIFO','LIFO') DEFAULT NULL,
  `Prd_EAN` varchar(13) NOT NULL,
  `Prd_SKU` varchar(255) NOT NULL,
  `Prd_Name` varchar(150) NOT NULL,
  `Prd_Description` varchar(255) NOT NULL,
  `Prd_Amount` int(10) UNSIGNED NOT NULL,
  `Prd_MarketAmount` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `warehouses`
--

CREATE TABLE `warehouses` (
  `Whs_Id` int(10) UNSIGNED NOT NULL,
  `Whs_Acronym` varchar(15) NOT NULL,
  `Whs_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`Adr_Id`);

--
-- Indeksy dla tabeli `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`Com_Id`),
  ADD KEY `Com_AdrId` (`Com_AdrId`),
  ADD KEY `Com_CpTId` (`Com_CpTId`);

--
-- Indeksy dla tabeli `companytypes`
--
ALTER TABLE `companytypes`
  ADD PRIMARY KEY (`CpT_Id`);

--
-- Indeksy dla tabeli `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`Cur_Id`),
  ADD UNIQUE KEY `Cur_ISO` (`Cur_ISO`);

--
-- Indeksy dla tabeli `documentcontents`
--
ALTER TABLE `documentcontents`
  ADD PRIMARY KEY (`DcC_Id`),
  ADD KEY `DcC_DcHId` (`DcC_DcHId`),
  ADD KEY `DcC_PrdId` (`DcC_PrdId`),
  ADD KEY `DcC_LotId` (`DcC_LotId`),
  ADD KEY `DcC_CurId` (`DcC_CurId`);

--
-- Indeksy dla tabeli `documentheaders`
--
ALTER TABLE `documentheaders`
  ADD PRIMARY KEY (`DcH_Id`),
  ADD KEY `DcH_DcTId` (`DcH_DcTId`),
  ADD KEY `DcH_DocumentIssuer` (`DcH_DocumentIssuer`),
  ADD KEY `DcH_Contractor` (`DcH_Contractor`),
  ADD KEY `DcH_RelatedDocument` (`DcH_RelatedDocument`),
  ADD KEY `DcH_RemovalPlace` (`DcH_RemovalPlace`),
  ADD KEY `DcH_DeliveryPlace` (`DcH_DeliveryPlace`);

--
-- Indeksy dla tabeli `documenttypes`
--
ALTER TABLE `documenttypes`
  ADD PRIMARY KEY (`DcT_Id`),
  ADD UNIQUE KEY `DcT_DocType` (`DcT_DocType`),
  ADD UNIQUE KEY `DcT_DocSeries` (`DcT_DocSeries`);

--
-- Indeksy dla tabeli `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`Emp_Id`),
  ADD KEY `Emp_PrsId` (`Emp_PrsId`),
  ADD KEY `Emp_ComId` (`Emp_ComId`);

--
-- Indeksy dla tabeli `lotnumbers`
--
ALTER TABLE `lotnumbers`
  ADD PRIMARY KEY (`Lot_Id`),
  ADD KEY `Lot_PrdId` (`Lot_PrdId`);

--
-- Indeksy dla tabeli `loyality`
--
ALTER TABLE `loyality`
  ADD PRIMARY KEY (`Loy_Id`);

--
-- Indeksy dla tabeli `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`Prs_Id`),
  ADD UNIQUE KEY `Prs_EmailAddress` (`Prs_EmailAddress`),
  ADD KEY `Prs_AdrId` (`Prs_AdrId`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Prd_Id`),
  ADD UNIQUE KEY `Prd_EAN` (`Prd_EAN`);

--
-- Indeksy dla tabeli `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`Whs_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `addresses`
--
ALTER TABLE `addresses`
  MODIFY `Adr_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `companies`
--
ALTER TABLE `companies`
  MODIFY `Com_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `companytypes`
--
ALTER TABLE `companytypes`
  MODIFY `CpT_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `currencies`
--
ALTER TABLE `currencies`
  MODIFY `Cur_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `documentcontents`
--
ALTER TABLE `documentcontents`
  MODIFY `DcC_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `documentheaders`
--
ALTER TABLE `documentheaders`
  MODIFY `DcH_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `documenttypes`
--
ALTER TABLE `documenttypes`
  MODIFY `DcT_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT dla tabeli `employees`
--
ALTER TABLE `employees`
  MODIFY `Emp_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `lotnumbers`
--
ALTER TABLE `lotnumbers`
  MODIFY `Lot_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `loyality`
--
ALTER TABLE `loyality`
  MODIFY `Loy_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `persons`
--
ALTER TABLE `persons`
  MODIFY `Prs_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `Prd_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `Whs_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`Com_AdrId`) REFERENCES `addresses` (`Adr_Id`),
  ADD CONSTRAINT `companies_ibfk_2` FOREIGN KEY (`Com_CpTId`) REFERENCES `companytypes` (`CpT_Id`),
  ADD CONSTRAINT `companies_ibfk_3` FOREIGN KEY (`Com_AdrId`) REFERENCES `addresses` (`Adr_Id`),
  ADD CONSTRAINT `companies_ibfk_4` FOREIGN KEY (`Com_CpTId`) REFERENCES `companytypes` (`CpT_Id`);

--
-- Ograniczenia dla tabeli `documentcontents`
--
ALTER TABLE `documentcontents`
  ADD CONSTRAINT `documentcontents_ibfk_1` FOREIGN KEY (`DcC_DcHId`) REFERENCES `documentheaders` (`DcH_Id`),
  ADD CONSTRAINT `documentcontents_ibfk_2` FOREIGN KEY (`DcC_PrdId`) REFERENCES `products` (`Prd_Id`),
  ADD CONSTRAINT `documentcontents_ibfk_3` FOREIGN KEY (`DcC_LotId`) REFERENCES `lotnumbers` (`Lot_Id`),
  ADD CONSTRAINT `documentcontents_ibfk_4` FOREIGN KEY (`DcC_CurId`) REFERENCES `currencies` (`Cur_Id`);

--
-- Ograniczenia dla tabeli `documentheaders`
--
ALTER TABLE `documentheaders`
  ADD CONSTRAINT `documentheaders_ibfk_1` FOREIGN KEY (`DcH_DcTId`) REFERENCES `documenttypes` (`DcT_Id`),
  ADD CONSTRAINT `documentheaders_ibfk_2` FOREIGN KEY (`DcH_DocumentIssuer`) REFERENCES `companies` (`Com_Id`),
  ADD CONSTRAINT `documentheaders_ibfk_3` FOREIGN KEY (`DcH_DcTId`) REFERENCES `documenttypes` (`DcT_Id`),
  ADD CONSTRAINT `documentheaders_ibfk_4` FOREIGN KEY (`DcH_DocumentIssuer`) REFERENCES `companies` (`Com_Id`),
  ADD CONSTRAINT `documentheaders_ibfk_5` FOREIGN KEY (`DcH_Contractor`) REFERENCES `companies` (`Com_Id`),
  ADD CONSTRAINT `documentheaders_ibfk_6` FOREIGN KEY (`DcH_RelatedDocument`) REFERENCES `documentheaders` (`DcH_Id`),
  ADD CONSTRAINT `documentheaders_ibfk_7` FOREIGN KEY (`DcH_RemovalPlace`) REFERENCES `warehouses` (`Whs_Id`),
  ADD CONSTRAINT `documentheaders_ibfk_8` FOREIGN KEY (`DcH_DeliveryPlace`) REFERENCES `warehouses` (`Whs_Id`);

--
-- Ograniczenia dla tabeli `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`Emp_PrsId`) REFERENCES `persons` (`Prs_Id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`Emp_ComId`) REFERENCES `companies` (`Com_Id`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`Emp_PrsId`) REFERENCES `persons` (`Prs_Id`),
  ADD CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`Emp_ComId`) REFERENCES `companies` (`Com_Id`);

--
-- Ograniczenia dla tabeli `lotnumbers`
--
ALTER TABLE `lotnumbers`
  ADD CONSTRAINT `lotnumbers_ibfk_1` FOREIGN KEY (`Lot_PrdId`) REFERENCES `products` (`Prd_Id`);

--
-- Ograniczenia dla tabeli `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`Prs_AdrId`) REFERENCES `addresses` (`Adr_Id`),
  ADD CONSTRAINT `persons_ibfk_2` FOREIGN KEY (`Prs_AdrId`) REFERENCES `addresses` (`Adr_Id`),
  ADD CONSTRAINT `persons_ibfk_3` FOREIGN KEY (`Prs_AdrId`) REFERENCES `addresses` (`Adr_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
