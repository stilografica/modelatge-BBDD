-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-07-2020 a las 19:20:19
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Cul_Ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Adreça`
--

CREATE TABLE `Adreça` (
  `id_adreça` int(10) NOT NULL,
  `carrer` text NOT NULL,
  `número` int(4) NOT NULL,
  `pis` int(30) NOT NULL,
  `porta` varchar(50) NOT NULL,
  `codi postal` int(4) NOT NULL,
  `país` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Adreça`
--

INSERT INTO `Adreça` (`id_adreça`, `carrer`, `número`, `pis`, `porta`, `codi postal`, `país`) VALUES
(1, 'Manzano', 2, 2, 'B', 8019, 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Client`
--

CREATE TABLE `Client` (
  `id_client` int(10) NOT NULL,
  `nom` text NOT NULL,
  `adreça` varchar(50) NOT NULL,
  `tel` int(9) NOT NULL,
  `email` varchar(50) NOT NULL,
  `data registre` date NOT NULL,
  `id_client_recomanat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Client`
--

INSERT INTO `Client` (`id_client`, `nom`, `adreça`, `tel`, `email`, `data registre`, `id_client_recomanat`) VALUES
(1, 'Juan Pérez', 'Gran via, 333 3 A', 999999999, 'juanperez@micorreo.com', '2020-07-16', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleat`
--

CREATE TABLE `Empleat` (
  `id_empleat` int(10) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Empleat`
--

INSERT INTO `Empleat` (`id_empleat`, `nom`) VALUES
(1, 'Manolito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura`
--

CREATE TABLE `Factura` (
  `id_factura` int(50) NOT NULL,
  `empleat_id` int(10) NOT NULL,
  `client_id` int(10) NOT NULL,
  `ulleres_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Factura`
--

INSERT INTO `Factura` (`id_factura`, `empleat_id`, `client_id`, `ulleres_id`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marca`
--

CREATE TABLE `Marca` (
  `id_Marca` int(10) NOT NULL,
  `nif_proveïdor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Marca`
--

INSERT INTO `Marca` (`id_Marca`, `nif_proveïdor`) VALUES
(1, '123456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveïdor`
--

CREATE TABLE `Proveïdor` (
  `adreça_id` int(10) NOT NULL,
  `telf` int(9) NOT NULL,
  `fax` int(9) NOT NULL,
  `nif` varchar(50) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Proveïdor`
--

INSERT INTO `Proveïdor` (`adreça_id`, `telf`, `fax`, `nif`, `nom`) VALUES
(1, 933333333, 933333333, '123456789', 'Gafotas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipus Muntura`
--

CREATE TABLE `Tipus Muntura` (
  `id_muntura` int(10) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Tipus Muntura`
--

INSERT INTO `Tipus Muntura` (`id_muntura`, `nom`) VALUES
(1, 'Flotant'),
(2, 'Pasta'),
(3, 'Metàl·lica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ulleres`
--

CREATE TABLE `Ulleres` (
  `id_ulleres` int(10) NOT NULL,
  `Marca_id` int(10) NOT NULL,
  `graduació` int(4) NOT NULL,
  `Muntura_id` int(10) NOT NULL,
  `Color muntura` text NOT NULL,
  `Color vidre` text NOT NULL,
  `Preu` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Ulleres`
--

INSERT INTO `Ulleres` (`id_ulleres`, `Marca_id`, `graduació`, `Muntura_id`, `Color muntura`, `Color vidre`, `Preu`) VALUES
(1, 1, 1, 1, 'Blau', 'transparent', 150.34);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Adreça`
--
ALTER TABLE `Adreça`
  ADD PRIMARY KEY (`id_adreça`);

--
-- Indices de la tabla `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `Empleat`
--
ALTER TABLE `Empleat`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `empleat_id` (`empleat_id`,`client_id`,`ulleres_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `ulleres_id` (`ulleres_id`);

--
-- Indices de la tabla `Marca`
--
ALTER TABLE `Marca`
  ADD PRIMARY KEY (`id_Marca`),
  ADD KEY `nif_proveïdor` (`nif_proveïdor`);

--
-- Indices de la tabla `Proveïdor`
--
ALTER TABLE `Proveïdor`
  ADD PRIMARY KEY (`nif`),
  ADD KEY `adreça_id` (`adreça_id`);

--
-- Indices de la tabla `Tipus Muntura`
--
ALTER TABLE `Tipus Muntura`
  ADD PRIMARY KEY (`id_muntura`);

--
-- Indices de la tabla `Ulleres`
--
ALTER TABLE `Ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `Marca_id` (`Marca_id`,`Muntura_id`),
  ADD KEY `Muntura_id` (`Muntura_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Adreça`
--
ALTER TABLE `Adreça`
  MODIFY `id_adreça` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Client`
--
ALTER TABLE `Client`
  MODIFY `id_client` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Empleat`
--
ALTER TABLE `Empleat`
  MODIFY `id_empleat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Factura`
--
ALTER TABLE `Factura`
  MODIFY `id_factura` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Marca`
--
ALTER TABLE `Marca`
  MODIFY `id_Marca` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Tipus Muntura`
--
ALTER TABLE `Tipus Muntura`
  MODIFY `id_muntura` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Factura_ibfk_2` FOREIGN KEY (`empleat_id`) REFERENCES `Empleat` (`id_empleat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Factura_ibfk_3` FOREIGN KEY (`ulleres_id`) REFERENCES `Ulleres` (`id_ulleres`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Marca`
--
ALTER TABLE `Marca`
  ADD CONSTRAINT `Marca_ibfk_1` FOREIGN KEY (`nif_proveïdor`) REFERENCES `Proveïdor` (`nif`);

--
-- Filtros para la tabla `Proveïdor`
--
ALTER TABLE `Proveïdor`
  ADD CONSTRAINT `Proveïdor_ibfk_1` FOREIGN KEY (`adreça_id`) REFERENCES `Adreça` (`id_adreça`);

--
-- Filtros para la tabla `Ulleres`
--
ALTER TABLE `Ulleres`
  ADD CONSTRAINT `Ulleres_ibfk_2` FOREIGN KEY (`Marca_id`) REFERENCES `Marca` (`id_Marca`),
  ADD CONSTRAINT `Ulleres_ibfk_3` FOREIGN KEY (`Muntura_id`) REFERENCES `Tipus Muntura` (`id_muntura`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
