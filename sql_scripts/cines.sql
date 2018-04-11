-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-04-2018 a las 12:43:41
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cines`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `ACTORS` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `movie`
--

INSERT INTO `movie` (`ID`, `NAME`, `ACTORS`) VALUES
(1, 'The Matrix', 'Keanu Reeves, Laurence Fishburne, Carrie-Ann Moss'),
(2, 'The Lord of The Rings', 'Elijah Wood, Ian Mckellen, Viggo Mortensen'),
(3, 'Inception', 'Leonardo DiCaprio'),
(4, 'The Shining', 'Jack Nicholson, Shelley Duvall'),
(5, 'Mission Impossible', 'Tom Cruise, Jeremy Renner'),
(6, 'Terminator', 'Arnold Schwarzenegger, Linda Hamilton'),
(7, 'Titanic', 'Leonardo DiCaprio, Kate Winslet'),
(8, 'Iron Man', 'Robert Downey Jr, Gwyneth Paltrow, Terrence Howard'),
(9, 'Inglorious Bastards', 'Brad Pitt, Diane Kruger'),
(10, 'Million Dollar Baby', 'Hillary Swank, Client Eastwood'),
(11, 'Kill Bill', 'Uma Thurman'),
(12, 'The Hunger Games', 'Jennifer Lawrence'),
(13, 'The Hangover', 'Bradley Cooper, Zach Galifianakis'),
(14, 'Toy Story', 'Tom Hanks, Michael Keaton'),
(15, 'Harry Potter', 'Daniel Radcliffe, Emma Watson'),
(16, 'Avatar', 'Sam Worthington, Sigourney Weaver'),
(17, 'Slumdog Millionaire', 'Anil Kapoor, Dev Patel, Freida Pinto'),
(18, 'The Curious Case of Benjamin Button', 'Brad Pitt, Cate Blanchett'),
(19, 'The Bourne Ultimatum', 'Matt Damon, Julia Stiles'),
(20, 'The Pink Panther', 'Steve Martin, Kevin Kline');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `points`
--

CREATE TABLE IF NOT EXISTS `points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POINTS` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `show_timing`
--

CREATE TABLE IF NOT EXISTS `show_timing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DAY` int(11) NOT NULL,
  `THEATER_ID` int(11) NOT NULL,
  `MOVIE_ID` int(11) NOT NULL,
  `TIMING_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHOW_THEATER_FK` (`THEATER_ID`),
  KEY `SHOW_MOVIE_FK` (`MOVIE_ID`),
  KEY `TIMESLOT_FK` (`TIMING_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `show_timing`
--

INSERT INTO `show_timing` (`ID`, `DAY`, `THEATER_ID`, `MOVIE_ID`, `TIMING_ID`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 2, 2),
(3, 1, 1, 3, 3),
(4, 1, 1, 4, 4),
(5, 1, 1, 5, 5),
(6, 1, 2, 6, 1),
(7, 1, 2, 7, 2),
(8, 1, 2, 8, 3),
(9, 1, 2, 9, 4),
(10, 1, 2, 10, 5),
(11, 1, 3, 11, 1),
(12, 1, 3, 12, 2),
(13, 1, 3, 13, 3),
(14, 1, 3, 14, 4),
(15, 1, 3, 15, 5),
(16, 1, 4, 16, 1),
(17, 1, 4, 17, 2),
(18, 1, 4, 18, 3),
(19, 1, 4, 19, 4),
(20, 1, 4, 20, 5),
(21, 1, 5, 1, 1),
(22, 1, 5, 2, 2),
(23, 1, 5, 3, 3),
(24, 1, 5, 4, 4),
(25, 1, 5, 5, 5),
(26, 1, 6, 6, 1),
(27, 1, 6, 7, 2),
(28, 1, 6, 8, 3),
(29, 1, 6, 9, 4),
(30, 1, 6, 10, 5),
(31, 1, 7, 11, 1),
(32, 1, 7, 12, 2),
(33, 1, 7, 13, 3),
(34, 1, 7, 14, 4),
(35, 1, 7, 15, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `theater`
--

CREATE TABLE IF NOT EXISTS `theater` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAPACITY` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `theater`
--

INSERT INTO `theater` (`ID`, `CAPACITY`) VALUES
(1, 50),
(2, 70),
(3, 70),
(4, 60),
(5, 120),
(6, 100),
(7, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timeslot`
--

CREATE TABLE IF NOT EXISTS `timeslot` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `START_TIME` varchar(5) NOT NULL,
  `END_TIME` varchar(5) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `timeslot`
--

INSERT INTO `timeslot` (`ID`, `START_TIME`, `END_TIME`) VALUES
(1, '10:00', '11:45'),
(2, '12:00', '01:45'),
(3, '02:00', '03:45'),
(4, '04:00', '05:45'),
(5, '06:00', '07:45');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `SHOW_TIMING_ID_FK` FOREIGN KEY (`ID`) REFERENCES `show_timing` (`ID`);

--
-- Filtros para la tabla `show_timing`
--
ALTER TABLE `show_timing`
  ADD CONSTRAINT `SHOW_MOVIE_FK` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`ID`),
  ADD CONSTRAINT `SHOW_THEATER_FK` FOREIGN KEY (`THEATER_ID`) REFERENCES `theater` (`ID`),
  ADD CONSTRAINT `TIMESLOT_FK` FOREIGN KEY (`TIMING_ID`) REFERENCES `timeslot` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
