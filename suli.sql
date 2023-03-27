-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 27. 10:26
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `suli`
--
CREATE DATABASE IF NOT EXISTS `suli` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `suli`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `iskola`
--

DROP TABLE IF EXISTS `iskola`;
CREATE TABLE IF NOT EXISTS `iskola` (
  `iskolaAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(30) NOT NULL,
  `varosAzon` int(11) NOT NULL,
  `kep` varchar(20) NOT NULL,
  PRIMARY KEY (`iskolaAzon`),
  KEY `varosAzon` (`varosAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `iskola`
--

INSERT INTO `iskola` (`iskolaAzon`, `nev`, `varosAzon`, `kep`) VALUES
(1, 'Alma Iskola', 2, 'alma.jpg'),
(2, 'Palacsinta Iskola', 1, 'palacsinta.jpg'),
(3, 'Uborka Iskola', 2, 'uborka.jpg'),
(4, 'Káposzta Iskola', 3, 'kaposzta.jpg'),
(5, 'Burgonya Iskola', 3, 'burgonya.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szak`
--

DROP TABLE IF EXISTS `szak`;
CREATE TABLE IF NOT EXISTS `szak` (
  `szakAzon` int(11) NOT NULL AUTO_INCREMENT,
  `iskolaAzon` int(11) NOT NULL,
  `nev` varchar(20) NOT NULL,
  PRIMARY KEY (`szakAzon`),
  UNIQUE KEY `szakAzon` (`szakAzon`),
  KEY `iskolaAzon` (`iskolaAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `szak`
--

INSERT INTO `szak` (`szakAzon`, `iskolaAzon`, `nev`) VALUES
(1, 1, 'Asztalos'),
(2, 2, 'Kertész mérnök'),
(3, 3, 'Vízvezeték szerelő'),
(4, 4, 'Tanár'),
(5, 5, 'Mikrobiológus');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `varos`
--

DROP TABLE IF EXISTS `varos`;
CREATE TABLE IF NOT EXISTS `varos` (
  `varosAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(20) NOT NULL,
  `kep` varchar(20) NOT NULL,
  PRIMARY KEY (`varosAzon`),
  UNIQUE KEY `varosAzon` (`varosAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `varos`
--

INSERT INTO `varos` (`varosAzon`, `nev`, `kep`) VALUES
(1, 'Pécs', 'pecs.jpg'),
(2, 'Veszprém', 'veszprem.jpg'),
(3, 'Budapest', 'budapest.jpg');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `iskola`
--
ALTER TABLE `iskola`
  ADD CONSTRAINT `iskola_ibfk_1` FOREIGN KEY (`varosAzon`) REFERENCES `varos` (`varosAzon`);

--
-- Megkötések a táblához `szak`
--
ALTER TABLE `szak`
  ADD CONSTRAINT `szak_ibfk_1` FOREIGN KEY (`iskolaAzon`) REFERENCES `iskola` (`iskolaAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
