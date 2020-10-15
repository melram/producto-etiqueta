-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.31-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para etiqueta_ortu
CREATE DATABASE IF NOT EXISTS `etiqueta_ortu` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `etiqueta_ortu`;

-- Volcando estructura para tabla etiqueta_ortu.products
CREATE TABLE IF NOT EXISTS `products` (
  `codigo_producto` varchar(100) NOT NULL,
  `nombre_producto` varchar(250) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `codigo_barra` varchar(50) NOT NULL,
  `ingrediente` varchar(200) NOT NULL,
  `detalle` varchar(200) NOT NULL,
  `nutricion` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `etiqueta` varchar(2) NOT NULL,
  `medida_nutricion` varchar(10) NOT NULL,
  `porcion_nutricion` varchar(10) NOT NULL DEFAULT 'Porc',
  `vencimiento` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_producto`),
  UNIQUE KEY `codigo_producto` (`codigo_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla etiqueta_ortu.products: 2 rows
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`codigo_producto`, `nombre_producto`, `marca`, `codigo_barra`, `ingrediente`, `detalle`, `nutricion`, `fecha`, `etiqueta`, `medida_nutricion`, `porcion_nutricion`, `vencimiento`) VALUES
	('1004/05', '1004/05 - SERENATA', '471', '100405', 'Contiene Gluten, Leche, Castaña de Caju, Mank, Nuez de Brasil, Avellana, Almendra, Derivados de Leche, de Huevo y de Soja', 'Importado y envasado en ZOFRI- CHILE', 'Porción: 1 unidad (19gr)\r\nPorciones por envase: 05', '2019-01-18 17:17:38', '1', '100Gr', 'Porc', ''),
	('1004/475', '1004/475 - SERENATA', '471', '789102', 'Contiene Gluten, Leche, Castaña de Caju, Mank, Nuez de Brasil, Avellana, Alimendra, Derivados de Leche, de Huevo y De Soja.    ', 'Importado y envasado en ZOFRI- CHILE   ', 'Porción: 1 unidad (19gr)\r\nPorciones por envase: 25 aprox', '2020-10-15 12:29:37', '5', '100Gr', 'Porc', '');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla etiqueta_ortu.products_marca
CREATE TABLE IF NOT EXISTS `products_marca` (
  `codigo_marca` varchar(100) NOT NULL,
  `nombre_marca` varchar(250) NOT NULL,
  PRIMARY KEY (`codigo_marca`),
  UNIQUE KEY `codigo_producto` (`codigo_marca`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla etiqueta_ortu.products_marca: 3 rows
/*!40000 ALTER TABLE `products_marca` DISABLE KEYS */;
INSERT INTO `products_marca` (`codigo_marca`, `nombre_marca`) VALUES
	('471', 'CHOCOLATE'),
	('10', 'TE'),
	('12', 'BOMBONES');
/*!40000 ALTER TABLE `products_marca` ENABLE KEYS */;

-- Volcando estructura para tabla etiqueta_ortu.products_nutricion
CREATE TABLE IF NOT EXISTS `products_nutricion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `medida` varchar(50) NOT NULL DEFAULT '0',
  `porcion` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_producto_nombre` (`codigo_producto`,`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla etiqueta_ortu.products_nutricion: 15 rows
/*!40000 ALTER TABLE `products_nutricion` DISABLE KEYS */;
INSERT INTO `products_nutricion` (`id`, `codigo_producto`, `nombre`, `medida`, `porcion`) VALUES
	(1, '1004/05', 'Energia(kcal)', '5,42', '87'),
	(2, '1004/05', 'Proteinas(g)', '8,8', '1,4'),
	(3, '1004/05', 'Grasa Total(g)', '33', '5,2'),
	(4, '1004/05', 'Gras. Sat(g)', '20', '3,1'),
	(7, '1004/05', 'Gras. Mon(g)', '9,4', '1,5'),
	(8, '1004/05', 'Gras. Po(g)', '1,0', '0,2'),
	(9, '1004/05', 'Ac. Gras. Trns(g)', '0,4', '0'),
	(10, '1004/05', 'Colesterol(mg)', '0,1', '0'),
	(13, '1004/05', 'Hide C Disp. (g)', '52', '8,3'),
	(14, '1004/05', 'Azuc. Total (g)', '52', '8,3'),
	(15, '1004/05', 'Sodio (mg)', '98', '16'),
	(22, '1004/475', 'Energia (kcal)', '551', '88'),
	(23, '1004/475', 'Proteinas(g)', '6,9', '1,1'),
	(24, '1004/475', 'Grasa Total(g)', '33', '5,2'),
	(25, '1004/475', 'Gras. Sat(g)', '19', '3,0');
/*!40000 ALTER TABLE `products_nutricion` ENABLE KEYS */;

-- Volcando estructura para tabla etiqueta_ortu.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  `tipo_user` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_modulo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opcion_cierre` bit(1) NOT NULL DEFAULT b'0',
  `opcion_pedido` bit(1) NOT NULL DEFAULT b'0',
  `opcion_cliente` bit(1) NOT NULL DEFAULT b'0',
  `opcion_personal` bit(1) NOT NULL DEFAULT b'0',
  `opcion_tarea` bit(1) NOT NULL DEFAULT b'0',
  `opcion_tareahistorial` bit(1) NOT NULL DEFAULT b'0',
  `opcion_proveedor` bit(1) NOT NULL DEFAULT b'0',
  `opcion_supervisor` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

-- Volcando datos para la tabla etiqueta_ortu.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`, `tipo_user`, `id_modulo`, `opcion_cierre`, `opcion_pedido`, `opcion_cliente`, `opcion_personal`, `opcion_tarea`, `opcion_tareahistorial`, `opcion_proveedor`, `opcion_supervisor`) VALUES
	(5, 'admin', 'admin', 'admin', '$2y$10$5KPPpa.N1h8iJmxhJzGbPOHE47BEG5KC1cZxg33Q.wAGJ2V6wPLYC', 'admi5@admin.com', '0000-00-00 00:00:00', '1', '1', b'0', b'1', b'0', b'0', b'0', b'0', b'0', b'0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
