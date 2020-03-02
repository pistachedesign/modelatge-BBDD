-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-03-2020 a las 13:33:42
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `opticalDb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `recommendation_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `adress` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `registry` date NOT NULL,
  `customer_rank_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id_customer`, `recommendation_id`, `name`, `adress`, `phone`, `email`, `registry`, `customer_rank_id`) VALUES
(1, 1, 'ernesto terret', 'corcega 120, 4º 3ª barcelona 08024', 657746352, 'eres@tet.com', '2020-03-01', 1),
(2, 2, 'aldara lopez', 'corcega 24, 6º 1ª Vigo 08004', 657456382, 'test@yah.eso', '2020-03-01', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_rank`
--

CREATE TABLE `customer_rank` (
  `id_customer_rank` int(11) NOT NULL,
  `customer` text NOT NULL,
  `focus` int(11) NOT NULL,
  `diopter` decimal(11,2) NOT NULL,
  `od_id` int(11) NOT NULL,
  `os_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `customer_rank`
--

INSERT INTO `customer_rank` (`id_customer_rank`, `customer`, `focus`, `diopter`, `od_id`, `os_id`) VALUES
(1, 'ernesto terret', 32, '1.25', 1, 1),
(2, 'aldara lopez', 23, '-1.25', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id_employee`, `name`) VALUES
(1, 'wanda leila'),
(2, 'jose pentelo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glass`
--

CREATE TABLE `glass` (
  `id_glass` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `frame_type` enum('floating glass frame','pasta glass frame','metal glass frame','') NOT NULL,
  `frame_color` tinytext NOT NULL,
  `glass_color` tinytext NOT NULL,
  `price` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `glass`
--

INSERT INTO `glass` (`id_glass`, `customer_id`, `employee_id`, `model_id`, `frame_type`, `frame_color`, `glass_color`, `price`) VALUES
(1, 1, 2, 2, 'metal glass frame', 'white', 'black', '435.25'),
(2, 2, 1, 1, 'floating glass frame', 'black', 'green', '645.35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glass_model`
--

CREATE TABLE `glass_model` (
  `id_model` int(11) NOT NULL,
  `model` varchar(25) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `glass_model`
--

INSERT INTO `glass_model` (`id_model`, `model`, `supplier_id`) VALUES
(1, 'fast & fourius', 1),
(2, 'technic state', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `od`
--

CREATE TABLE `od` (
  `id_od` int(11) NOT NULL,
  `sphere` decimal(11,2) NOT NULL,
  `cyl` decimal(11,2) NOT NULL,
  `axis` decimal(11,2) NOT NULL,
  `prism` decimal(11,2) NOT NULL,
  `base` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `od`
--

INSERT INTO `od` (`id_od`, `sphere`, `cyl`, `axis`, `prism`, `base`) VALUES
(1, '-3.25', '-1.00', '90.00', '0.50', 'up'),
(2, '-2.20', '-1.25', '80.00', '0.20', 'down');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `os`
--

CREATE TABLE `os` (
  `id_os` int(11) NOT NULL,
  `sphere` decimal(11,2) NOT NULL,
  `cil` decimal(11,2) NOT NULL,
  `axis` decimal(11,2) NOT NULL,
  `prism` decimal(11,2) NOT NULL,
  `base` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `os`
--

INSERT INTO `os` (`id_os`, `sphere`, `cil`, `axis`, `prism`, `base`) VALUES
(1, '-4.00', '-1.00', '90.00', '0.50', 'up'),
(2, '-3.75', '-1.25', '80.00', '0.30', 'down');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recommendation`
--

CREATE TABLE `recommendation` (
  `id_recommendation` int(11) NOT NULL,
  `action` enum('yes','no') NOT NULL,
  `customer_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recommendation`
--

INSERT INTO `recommendation` (`id_recommendation`, `action`, `customer_name`) VALUES
(1, 'no', 'no name'),
(2, 'yes', 'ernesto terret');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `supplier_name` text NOT NULL,
  `adress_id` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `NIF` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `supplier_name`, `adress_id`, `phone`, `fax`, `NIF`) VALUES
(1, 'oakley s.l', 1, '93 280 07 13', '93 280 07 14', '40830723J'),
(2, 'ray ban s.l', 2, '934567483', '934567484', '64783920T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier_adress`
--

CREATE TABLE `supplier_adress` (
  `id_adress` int(11) NOT NULL,
  `supplier` text NOT NULL,
  `street` varchar(50) NOT NULL,
  `street_number` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `door` text NOT NULL,
  `postal_code` varchar(15) NOT NULL,
  `city` text NOT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `supplier_adress`
--

INSERT INTO `supplier_adress` (`id_adress`, `supplier`, `street`, `street_number`, `floor`, `door`, `postal_code`, `city`, `country`) VALUES
(1, 'oakley s.l', 'Paseo de gracia', 11, 2, 'B', '08021', 'barcelona', 'españa'),
(2, 'ray ban s.l', 'diagonal', 22, 5, 'C', '08024', 'barcelona', 'españa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `recommendation_id` (`recommendation_id`),
  ADD KEY `customer_rank_id` (`customer_rank_id`);

--
-- Indices de la tabla `customer_rank`
--
ALTER TABLE `customer_rank`
  ADD PRIMARY KEY (`id_customer_rank`),
  ADD KEY `os_id` (`os_id`),
  ADD KEY `od_id` (`od_id`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indices de la tabla `glass`
--
ALTER TABLE `glass`
  ADD PRIMARY KEY (`id_glass`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indices de la tabla `glass_model`
--
ALTER TABLE `glass_model`
  ADD PRIMARY KEY (`id_model`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indices de la tabla `od`
--
ALTER TABLE `od`
  ADD PRIMARY KEY (`id_od`);

--
-- Indices de la tabla `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id_os`);

--
-- Indices de la tabla `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`id_recommendation`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD KEY `adress_id` (`adress_id`);

--
-- Indices de la tabla `supplier_adress`
--
ALTER TABLE `supplier_adress`
  ADD PRIMARY KEY (`id_adress`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `customer_rank`
--
ALTER TABLE `customer_rank`
  MODIFY `id_customer_rank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `glass`
--
ALTER TABLE `glass`
  MODIFY `id_glass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `glass_model`
--
ALTER TABLE `glass_model`
  MODIFY `id_model` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `od`
--
ALTER TABLE `od`
  MODIFY `id_od` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `os`
--
ALTER TABLE `os`
  MODIFY `id_os` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `id_recommendation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `supplier_adress`
--
ALTER TABLE `supplier_adress`
  MODIFY `id_adress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`recommendation_id`) REFERENCES `recommendation` (`id_recommendation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`customer_rank_id`) REFERENCES `customer_rank` (`id_customer_rank`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `customer_rank`
--
ALTER TABLE `customer_rank`
  ADD CONSTRAINT `customer_rank_ibfk_1` FOREIGN KEY (`od_id`) REFERENCES `od` (`id_od`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `customer_rank_ibfk_2` FOREIGN KEY (`os_id`) REFERENCES `os` (`id_os`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glass`
--
ALTER TABLE `glass`
  ADD CONSTRAINT `glass_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id_customer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glass_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id_employee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glass_ibfk_4` FOREIGN KEY (`model_id`) REFERENCES `glass_model` (`id_model`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glass_model`
--
ALTER TABLE `glass_model`
  ADD CONSTRAINT `glass_model_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id_supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`adress_id`) REFERENCES `supplier_adress` (`id_adress`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
