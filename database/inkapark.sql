/**-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2026 a las 16:39:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inkapark`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `id_boleta` varchar(12) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_evento` date NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `precio` decimal(10,2) NOT NULL,
  `estado` enum('VIGENTE','USADA','CANCELADA') DEFAULT 'VIGENTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`id_boleta`, `id_usuario`, `fecha_evento`, `cantidad`, `precio`, `estado`) VALUES
('2NI2G1597F03', 8, '2025-09-30', 2, 100.00, 'USADA'),
('7JDK0W9EYVWB', 15, '2025-11-19', 1, 50.00, 'VIGENTE'),
('8HPS25GPR8FX', 6, '2025-09-28', 1, 50.00, 'VIGENTE'),
('9LRE79KK4I7S', 15, '2025-11-19', 1, 50.00, 'VIGENTE'),
('AB12CD34EF56', 3, '2025-09-27', 2, 120.00, 'USADA'),
('CFY973I7YH6Z', 15, '2025-11-19', 1, 50.00, 'VIGENTE'),
('ERHV6JWF9VF0', 15, '2025-10-27', 2, 100.00, 'USADA'),
('G9V57XDWGM2B', 15, '2025-11-19', 1, 50.00, 'VIGENTE'),
('IP003VJMECG6', 6, '2025-09-28', 3, 150.00, 'VIGENTE'),
('J5FZE1R0JZ8Z', 15, '2025-11-19', 1, 50.00, 'VIGENTE'),
('LQXOSAPCDI63', 6, '2025-09-29', 6, 300.00, 'VIGENTE'),
('M9OB127N78C3', 6, '2025-09-28', 1, 50.00, 'VIGENTE'),
('MKQD218000NR', 11, '2025-10-22', 1, 50.00, 'USADA'),
('NYKHUCD01VHW', 15, '2025-11-19', 5, 250.00, 'USADA'),
('P8BEHUM16BL8', 15, '2025-11-19', 1, 50.00, 'VIGENTE'),
('QW11ER22TY33', 5, '2025-09-27', 3, 180.00, 'VIGENTE'),
('SGVIT8UAQXRZ', 15, '2025-11-21', 3, 150.00, 'USADA'),
('V9299QEXDF5B', 6, '2025-09-28', 2, 100.00, 'VIGENTE'),
('VRKBTM1JQ7TV', 16, '2025-11-28', 3, 150.00, 'USADA'),
('X1SEIZZCF03P', 15, '2025-11-19', 3, 150.00, 'VIGENTE'),
('X767Y8CL215M', 15, '2025-11-19', 3, 150.00, 'VIGENTE'),
('X94UQRRKJNMA', 6, '2025-09-28', 1, 50.00, 'VIGENTE'),
('YIS76YJYV730', 6, '2025-09-28', 1, 50.00, 'VIGENTE'),
('ZKLZRBNA6CGX', 15, '2025-11-28', 1, 50.00, 'VIGENTE'),
('ZX90YU12TR34', 4, '2025-09-27', 1, 60.00, 'VIGENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_mensaje`
--

CREATE TABLE `contacto_mensaje` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `asunto` varchar(200) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('NUEVO','ATENDIDO') NOT NULL DEFAULT 'NUEVO',
  `id_usuario` int(11) DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  `fecha_respuesta` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contacto_mensaje`
--

INSERT INTO `contacto_mensaje` (`id`, `nombre`, `correo`, `asunto`, `mensaje`, `fecha_envio`, `estado`, `id_usuario`, `respuesta`, `fecha_respuesta`) VALUES
(3, 'Rodrigo', 'rubinam423@gmail.com', 'Duda', 'a', '2025-10-22 21:31:47', 'NUEVO', NULL, NULL, NULL),
(4, 'rodrigo', 'rubinam423@gmail.com', 'Duda', 'hola', '2025-10-22 22:30:37', 'ATENDIDO', NULL, 'Funcional asdsa', '2025-10-22 22:48:29'),
(5, 'RK', 'examenfinal1234@gmail.com', 'Funcional', 'dsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2025-10-22 22:50:17', 'ATENDIDO', NULL, 'a', '2025-10-22 22:50:34'),
(6, 'Maria', 'examenfinal1234@gmail.com', 'Funcional', 'Esta habilitado', '2025-10-22 23:05:05', 'ATENDIDO', NULL, NULL, '2025-10-22 23:05:13'),
(7, 'Jose', 'alvaradojhon867@gmail.com', 'Funcional', 'Duda sobre el parque', '2025-10-24 16:49:40', 'NUEVO', NULL, NULL, NULL),
(8, 'Joshua', 'alvaradojhon867@gmail.com', 'Funcional', 'anfnewuionfoewnfonid', '2025-10-27 16:41:07', 'ATENDIDO', NULL, 'Funcional ah', '2025-10-27 16:43:02'),
(9, 'Renato', 'alvaradojhon867@gmail.com', 'Funcional', 'Hola', '2025-10-27 18:04:05', 'ATENDIDO', NULL, 'Hola', '2025-10-27 18:04:32'),
(10, 'Rodrigo', 'rubinam423@gmail.com', 'Funcional', 'f', '2025-11-28 17:24:24', 'ATENDIDO', NULL, 'f', '2025-11-28 17:24:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manejo_aforo`
--

CREATE TABLE `manejo_aforo` (
  `aforo_total` int(11) NOT NULL,
  `aforo_disponible` int(11) NOT NULL,
  `fecha_evento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `manejo_aforo`
--

INSERT INTO `manejo_aforo` (`aforo_total`, `aforo_disponible`, `fecha_evento`) VALUES
(50, 44, '2025-09-27'),
(50, 41, '2025-09-28'),
(50, 44, '2025-09-29'),
(50, 48, '2025-09-30'),
(50, 50, '2025-10-01'),
(50, 50, '2025-10-02'),
(50, 50, '2025-10-03'),
(50, 50, '2025-10-04'),
(50, 50, '2025-10-05'),
(50, 49, '2025-10-22'),
(50, 50, '2025-10-23'),
(50, 50, '2025-10-24'),
(50, 50, '2025-10-25'),
(50, 50, '2025-10-26'),
(50, 48, '2025-10-27'),
(50, 50, '2025-10-28'),
(50, 50, '2025-10-29'),
(50, 50, '2025-10-30'),
(50, 50, '2025-10-31'),
(50, 50, '2025-11-01'),
(50, 50, '2025-11-02'),
(50, 33, '2025-11-19'),
(50, 50, '2025-11-20'),
(50, 47, '2025-11-21'),
(50, 50, '2025-11-22'),
(50, 50, '2025-11-23'),
(50, 50, '2025-11-24'),
(50, 50, '2025-11-25'),
(50, 50, '2025-11-26'),
(50, 50, '2025-11-27'),
(50, 46, '2025-11-28'),
(50, 50, '2025-11-29'),
(50, 50, '2025-11-30'),
(50, 50, '2025-12-01'),
(50, 50, '2025-12-02'),
(50, 50, '2025-12-03'),
(50, 50, '2025-12-04'),
(50, 50, '2026-04-26'),
(50, 50, '2026-04-27'),
(50, 50, '2026-04-28'),
(50, 50, '2026-04-29'),
(50, 50, '2026-04-30'),
(50, 50, '2026-05-01'),
(50, 50, '2026-05-02'),
(50, 50, '2026-05-30'),
(50, 50, '2026-05-31'),
(50, 50, '2026-06-01'),
(50, 50, '2026-06-02'),
(50, 50, '2026-06-03'),
(50, 50, '2026-06-04'),
(50, 50, '2026-06-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notif` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_boleta` varchar(12) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `numero_tarjeta` varchar(32) NOT NULL,
  `cvv_enc` varchar(255) NOT NULL,
  `fecha_venc_enc` varchar(255) NOT NULL,
  `tipo_tarjeta` enum('VISA','MASTERCARD','AMEX','DINERS','OTRA') NOT NULL DEFAULT 'OTRA',
  `metodo` enum('YAPE','PLIN','TARJETA') NOT NULL,
  `estado` enum('CONFIRMADO','FALLIDO') NOT NULL DEFAULT 'CONFIRMADO',
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `id_boleta`, `monto`, `numero_tarjeta`, `cvv_enc`, `fecha_venc_enc`, `tipo_tarjeta`, `metodo`, `estado`, `fecha_pago`) VALUES
(1, 'V9299QEXDF5B', 100.00, '', '', '', 'OTRA', 'PLIN', 'CONFIRMADO', '2025-09-28 05:21:06'),
(2, '8HPS25GPR8FX', 50.00, '', '', '', 'OTRA', 'YAPE', 'CONFIRMADO', '2025-09-28 05:21:31'),
(3, 'M9OB127N78C3', 50.00, '', '', '', 'OTRA', 'PLIN', 'CONFIRMADO', '2025-09-28 05:21:36'),
(4, 'YIS76YJYV730', 50.00, '', '', '', 'OTRA', 'YAPE', 'CONFIRMADO', '2025-09-28 05:21:40'),
(5, 'IP003VJMECG6', 150.00, '', '', '', 'OTRA', 'PLIN', 'CONFIRMADO', '2025-09-28 05:21:48'),
(6, 'X94UQRRKJNMA', 50.00, '', '', '', 'OTRA', 'PLIN', 'CONFIRMADO', '2025-09-28 05:21:51'),
(7, 'LQXOSAPCDI63', 300.00, '', '', '', 'OTRA', 'YAPE', 'CONFIRMADO', '2025-09-29 11:17:08'),
(8, '2NI2G1597F03', 100.00, '', '', '', 'OTRA', 'YAPE', 'CONFIRMADO', '2025-09-29 17:26:42'),
(9, 'MKQD218000NR', 50.00, '', '', '', 'OTRA', 'YAPE', 'CONFIRMADO', '2025-10-22 21:23:49'),
(10, 'ERHV6JWF9VF0', 100.00, '', '', '', 'OTRA', 'YAPE', 'CONFIRMADO', '2025-10-27 18:06:09'),
(11, 'CFY973I7YH6Z', 50.00, '1434343434343434', 'p/gJhtt3GX8Ozhx8knqnaQ==', 'gYHDbZb+cFR6Fy8I7HOBcw==', 'VISA', 'TARJETA', 'CONFIRMADO', '2025-11-19 14:18:23'),
(12, '7JDK0W9EYVWB', 50.00, '2322222222222222', '9HVWy2JIQ/s9GeVKPDOgOg==', 'sErXzc3+BHWxBX/m3MJFHQ==', 'MASTERCARD', 'TARJETA', 'CONFIRMADO', '2025-11-19 14:23:47'),
(13, 'J5FZE1R0JZ8Z', 50.00, '1323232323232323', 'p/gJhtt3GX8Ozhx8knqnaQ==', 'pBSuCsyWb7QzkFL1KsZZpw==', 'VISA', 'TARJETA', 'CONFIRMADO', '2025-11-19 14:36:13'),
(14, 'P8BEHUM16BL8', 50.00, '3121111111111111', '66etK1rvwS/RwZeMF/cvGw==', '9hzUcup5DD7mRULWQTnKyA==', 'AMEX', 'TARJETA', 'CONFIRMADO', '2025-11-19 15:42:34'),
(18, '9LRE79KK4I7S', 50.00, '2333333333333333', '1L8IIcBRHZmx2g6iKuMm/w==', 'gYHDbZb+cFR6Fy8I7HOBcw==', 'MASTERCARD', 'TARJETA', 'CONFIRMADO', '2025-11-19 16:36:01'),
(19, 'G9V57XDWGM2B', 50.00, '1322222222222222', 'p/gJhtt3GX8Ozhx8knqnaQ==', 'pBSuCsyWb7QzkFL1KsZZpw==', 'VISA', 'TARJETA', 'CONFIRMADO', '2025-11-19 16:50:53'),
(20, 'X1SEIZZCF03P', 150.00, '3323232323323232', 'Neanmnwl9AzV8gxd3qqZeg==', 'gYHDbZb+cFR6Fy8I7HOBcw==', 'AMEX', 'TARJETA', 'CONFIRMADO', '2025-11-19 16:54:22'),
(21, 'X767Y8CL215M', 150.00, '2311111111111111', 'Neanmnwl9AzV8gxd3qqZeg==', 'KqzAqDnyPO0ecRTDPpoW9w==', 'MASTERCARD', 'TARJETA', 'CONFIRMADO', '2025-11-19 17:00:56'),
(22, 'NYKHUCD01VHW', 250.00, '3232332323232323', 'p/gJhtt3GX8Ozhx8knqnaQ==', 'KqzAqDnyPO0ecRTDPpoW9w==', 'AMEX', 'TARJETA', 'CONFIRMADO', '2025-11-19 17:11:51'),
(23, 'SGVIT8UAQXRZ', 150.00, '1321232323232323', '66etK1rvwS/RwZeMF/cvGw==', 'gYHDbZb+cFR6Fy8I7HOBcw==', 'VISA', 'TARJETA', 'CONFIRMADO', '2025-11-21 17:26:41'),
(24, 'ZKLZRBNA6CGX', 50.00, '2131111111111111', 'Neanmnwl9AzV8gxd3qqZeg==', '0234FamqK4xDQSY2f/Otmg==', 'MASTERCARD', 'TARJETA', 'CONFIRMADO', '2025-11-28 14:09:21'),
(25, 'VRKBTM1JQ7TV', 150.00, '1232323232323232', 'mWBpRednySOfkGh7lqWukg==', 'sTCN1roFOGGBRO+6h5+6Mw==', 'VISA', 'TARJETA', 'CONFIRMADO', '2025-11-28 17:26:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('CLIENTE','ADMIN') NOT NULL DEFAULT 'CLIENTE',
  `token_expira` datetime(6) DEFAULT NULL,
  `token_verificacion` varchar(64) DEFAULT NULL,
  `verificado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `contrasena`, `rol`, `token_expira`, `token_verificacion`, `verificado`) VALUES
(1, 'Admin', 'admin@inkapark.com', 'admin123', 'ADMIN', NULL, NULL, b'1'),
(3, 'Juan Pérez', 'juan@demo.com', '123456', 'CLIENTE', NULL, NULL, b'0'),
(4, 'María Gómez', 'maria@demo.com', '123456', 'CLIENTE', NULL, NULL, b'0'),
(5, 'Luis Torres', 'luis@demo.com', '123456', 'CLIENTE', NULL, NULL, b'0'),
(6, 'RK', 'examenfinal1234@gmail.com', '$2a$10$mZkcQcU2CIQNgQFeGl3ehu0RkubMahuTms/2qnKwZPCcmoEi.zZ9G', 'CLIENTE', NULL, NULL, b'0'),
(7, 'Daniel Fernández', 'www@gmail.com', '$2a$10$tVYHLZVZ4v6gyJMwxxnhRuSAKy0venkhe9JhdDQg3lPNYTIg8/xiK', 'CLIENTE', NULL, NULL, b'0'),
(8, 'Pedro', 'zikirito1234@gmail.com', '$2a$10$MbZurTY8xVUpqRImRNk8w.PhSs3aIjxnUnj/N5R/6w3SoWZ8Hz39u', 'CLIENTE', NULL, NULL, b'0'),
(9, 'Rodrigos2s2', '21212@gmail', '$2a$10$XfKBQk.25nNDoGtW.PuOE.0/Bu5ysEVs6zkelmlx7ajgvjjodOK1y', 'CLIENTE', NULL, NULL, b'0'),
(10, 'Matias', 'komisan1140@gmail.com', '$2a$10$yj6ys5w0IfRMy9JGDhmaeukM9b./kryYP7V31S5mt3Z7Mt4I.XBU6', 'CLIENTE', '2025-11-20 09:14:36.000000', '0108a563-d67a-4652-a9aa-a3723c18ca0f', b'0'),
(11, 'Rodrigo', 'rubinam423@gmail.com', '$2a$10$OkQMSXBH48isi4XgDrafe.5C.tzQ0WyRn4EwOtxKPUjS89/R6kiYO', 'CLIENTE', NULL, NULL, b'1'),
(12, 'Admin1', 'dsadasd@gmail.com', '$2a$10$XrkXglXch9KkQjHMsw4PTubmjQ9o8vC8NT4PiZM0rgTfT2HqLEr/.', 'ADMIN', NULL, NULL, b'0'),
(13, 'Jhon', 'alvaradojhon867@gmail.com', '$2a$10$DoYrfTrnx426APfG1qT1uefrhUKIYj/Yc2mD7jN5k7iirEDlbq.dW', 'CLIENTE', NULL, NULL, b'1'),
(14, 'Matias', 'danielfernandez4541390@gmail.com', '$2a$10$yR6Fr.yiSZmeCEpGiLrEyeRcgu3TSyfGI.zOY.vdHUAESFwuPDB.O', 'CLIENTE', NULL, NULL, b'1'),
(15, 'Renato', 'marioandez410@gmail.com', '$2a$10$1MEa1boRt7Qr1cT4/F/1weX8Wh4QXCOZaeTT9H3URJFXMXUCQVAni', 'CLIENTE', NULL, NULL, b'1'),
(16, 'Mario', 'matiaszdxc@gmail.com', '$2a$10$n4xd6J65OIlmzi/BSyCqv.TS4fCYjn/uJw0qiPOtS.ijPkEz.Dzja', 'CLIENTE', NULL, NULL, b'1'),
(17, 'Matias', 'drogo400@gmail.com', '$2a$10$bnauHlvCBcWZDShUphXeguszbNapB.FaW55Z/5GDM8lenIr.8IEO.', 'CLIENTE', '2026-05-31 09:54:30.000000', '53ef12e2-a838-4e6a-950a-9b87ef0c902b', b'0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`id_boleta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `fk_boleta_manejo_fecha` (`fecha_evento`);

--
-- Indices de la tabla `contacto_mensaje`
--
ALTER TABLE `contacto_mensaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contacto_usuario` (`id_usuario`);

--
-- Indices de la tabla `manejo_aforo`
--
ALTER TABLE `manejo_aforo`
  ADD PRIMARY KEY (`fecha_evento`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id_notif`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_pago_boleta` (`id_boleta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `uk_usuario_correo` (`correo`),
  ADD KEY `idx_usuario_correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacto_mensaje`
--
ALTER TABLE `contacto_mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id_notif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_boleta_manejo_fecha` FOREIGN KEY (`fecha_evento`) REFERENCES `manejo_aforo` (`fecha_evento`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `contacto_mensaje`
--
ALTER TABLE `contacto_mensaje`
  ADD CONSTRAINT `fk_contacto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_boleta` FOREIGN KEY (`id_boleta`) REFERENCES `boleta` (`id_boleta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
