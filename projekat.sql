-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 03, 2014 at 03:05 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projekat`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE IF NOT EXISTS `korisnici` (
  `idKorisnika` int(11) NOT NULL,
  `Ime` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Prezime` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `KorisnickoIme` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Password2` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Adresa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Telefon` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `akcija` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `nivo` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KorisnickoIme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`idKorisnika`, `Ime`, `Prezime`, `KorisnickoIme`, `Password`, `Password2`, `Adresa`, `Telefon`, `email`, `status`, `akcija`, `nivo`) VALUES
(4, 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', '123456789', 'admin', '1', '', '1'),
(5, 'Zeljko', 'sad', 'asdadasd', 'zixmix', 'zixmix', 'asdasda', '065546646', 'znikolicnrt@gmail.com', '1', '', '2'),
(1, 'Zeljko', 'asdasdasdasd', 'asdas', 'zixmixs', 'zixmixs', 'asdasdasd', '0655645621', 'znikolicnrt@gmail.com', '1', '', '1'),
(2, 'seflab', 'seflab', 'seflab', 'seflab', 'seflab', 'seflab', '0665456456', 'znikolicnrt@gmail.cpm', '0', '', '2'),
(3, 'sefmagacina', 'sefmagacina', 'sefmagacina', 'sefmagacina', 'sefmagacina', 'sefmagacina', '064565465', 'znikolicnrt@gmail.cpm', '0', '', '3');

-- --------------------------------------------------------

--
-- Table structure for table `labaratorije`
--

CREATE TABLE IF NOT EXISTS `labaratorije` (
  `idLabaratorije` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Naziv` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Kvadratura` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `BrojRadnihMesta` varchar(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `labaratorije`
--

INSERT INTO `labaratorije` (`idLabaratorije`, `Naziv`, `Kvadratura`, `BrojRadnihMesta`) VALUES
('1', '109', '40', '3'),
('2', '144', '54', '2');

-- --------------------------------------------------------

--
-- Table structure for table `osnovnaoprema`
--

CREATE TABLE IF NOT EXISTS `osnovnaoprema` (
  `Naziv` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Modle` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `GrantniRok` date NOT NULL,
  `Proizvodjac` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DatumNabavke` date NOT NULL,
  `Cena` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Labaratorija` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pomocnaoprema`
--

CREATE TABLE IF NOT EXISTS `pomocnaoprema` (
  `Naziv` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Model` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `GarantniRok` date NOT NULL,
  `Proizvodjac` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `RokTrajanja` date NOT NULL,
  `Cena` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Labaratorija` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pomocnaoprema`
--

INSERT INTO `pomocnaoprema` (`Naziv`, `Model`, `ID`, `GarantniRok`, `Proizvodjac`, `RokTrajanja`, `Cena`, `Labaratorija`, `Status`) VALUES
('Tastatura', 'LJDH 3', '1', '2014-02-28', 'Logitek', '2014-01-08', '10', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `proizvodjac`
--

CREATE TABLE IF NOT EXISTS `proizvodjac` (
  `ID` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `Naziv` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Adresa` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Telefon` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Kontakt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Spisak` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `proizvodjac`
--

INSERT INTO `proizvodjac` (`ID`, `Naziv`, `Adresa`, `Telefon`, `Email`, `Kontakt`, `Spisak`) VALUES
('1', 'Logitek', 'Zivaniceva', '064551515', 'zixmix', 'zixmix', 'zximix');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
