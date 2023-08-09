-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-08-2023 a las 00:40:43
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarPelicula` (IN `_IdPelicula` INT, IN `_Nombre` VARCHAR(30), IN `_Genero` VARCHAR(20))  BEGIN
    UPDATE pelicula
    SET
        Nombre = _Nombre,
        Genero = _Genero
    WHERE
        IdPelicula = _IdPelicula;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spAgregarPelicula` (IN `_Nombre` VARCHAR(30), IN `_Genero` VARCHAR(20))  BEGIN
    INSERT INTO pelicula (Nombre, Genero)
    VALUES (_Nombre, _Genero);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spBuscarPelicula` (IN `_IdPelicula` INT)  BEGIN
    SELECT Nombre, Genero
    FROM pelicula
    WHERE IdPelicula = _IdPelicula;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarPelicula` (IN `_IdPelicula` INT)  BEGIN
    DELETE FROM pelicula
    WHERE IdPelicula = _IdPelicula;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spMostrarPeliculas` ()  BEGIN
    SELECT IdPelicula, Nombre, Genero
    FROM pelicula;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `IdPelicula` int(5) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Genero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`IdPelicula`, `Nombre`, `Genero`) VALUES
(1, 'Avengers: End Game', 'Acción'),
(2, 'Ken', 'Ciencia ficción');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`IdPelicula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `IdPelicula` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
