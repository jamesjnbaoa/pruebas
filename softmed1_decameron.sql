-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-11-2021 a las 09:52:26
-- Versión del servidor: 10.5.12-MariaDB-cll-lve
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `softmed1_decameron`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acomodaciones`
--

CREATE TABLE `acomodaciones` (
  `aco_id` int(11) NOT NULL,
  `aco_name` varchar(10) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `acomodaciones`
--

INSERT INTO `acomodaciones` (`aco_id`, `aco_name`) VALUES
(1, 'SENCILLA'),
(2, 'DOBLE'),
(3, 'TRIPLE'),
(4, 'CUADRUPLE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `hab_id` int(11) NOT NULL,
  `sucursal_id` int(11) NOT NULL,
  `hab_tipo` int(10) NOT NULL,
  `hab_acomodacion` int(10) NOT NULL,
  `hab_numero` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`hab_id`, `sucursal_id`, `hab_tipo`, `hab_acomodacion`, `hab_numero`, `created_at`) VALUES
(8, 2, 2, 1, 4, '2021-11-24 04:22:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `sucursal_id` int(11) NOT NULL,
  `suc_nit` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `suc_name` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `suc_dir` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `suc_hab` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`sucursal_id`, `suc_nit`, `suc_name`, `suc_dir`, `suc_hab`, `created_at`, `updated_at`) VALUES
(2, '3333', 'De cameron 1', 'calle 1', 3, '2021-11-24 06:07:40', '2021-11-24 06:07:40'),
(4, '2222', 'hotels 2', 'calle 1', 3, '2021-11-20 02:56:48', '2021-11-20 02:56:48'),
(5, '3333', 'hotels 2', 'calle 1', 3, '2021-11-20 16:46:43', '2021-11-20 16:46:43'),
(6, '4444', 'hotel 4', 'ca', 2, '2021-11-24 01:04:36', '2021-11-24 01:04:36'),
(7, '2223', 'JEMES NAVARRO', 'ca', 2, '2021-11-24 01:12:15', '2021-11-24 01:12:16'),
(8, '2224', 'JEMES NAVARRO', 'ca', 2, '2021-11-24 02:43:45', '2021-11-24 02:43:45'),
(9, '6665', 'JEMES NAVARRO', '3', 3, '2021-11-24 02:57:12', '2021-11-24 02:57:12'),
(10, '34324', 'TEST JAMES', 'aaa', 2, '2021-11-24 03:00:19', '2021-11-24 03:00:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `tipo_id` int(11) NOT NULL,
  `tipo_name` varchar(10) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`tipo_id`, `tipo_name`) VALUES
(1, 'STANDAR'),
(2, 'JUNIOR'),
(3, 'SUITE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acomodaciones`
--
ALTER TABLE `acomodaciones`
  ADD PRIMARY KEY (`aco_id`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`hab_id`),
  ADD KEY `sucursal` (`sucursal_id`),
  ADD KEY `hab_acomodacion` (`hab_acomodacion`),
  ADD KEY `hab_tipo` (`hab_tipo`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`sucursal_id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`tipo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acomodaciones`
--
ALTER TABLE `acomodaciones`
  MODIFY `aco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `hab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `sucursal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `tipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`sucursal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `habitaciones_ibfk_2` FOREIGN KEY (`hab_tipo`) REFERENCES `tipos` (`tipo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `habitaciones_ibfk_3` FOREIGN KEY (`hab_acomodacion`) REFERENCES `acomodaciones` (`aco_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
