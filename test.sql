-- Base de datos Actual : 'sientrega'
CREATE DATABASE `sientrega`;
USE `sientrega`;

-- estructura de tabla para la tabla cliente
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(255) NOT NULL,
  `dv` char(3) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) NOT NULL,
  `apellido_materno` varchar(255),
  `telefono` varchar(255),
  `correo` varchar(255),
  `comuna_id` int(20) NOT NULL,
  `estado_cliente` boolean NOT NULL,
  `sexo` varchar(255),
  `fecha_naciemiento` DATETIME,

  PRIMARY KEY (`id`),
  FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`)) ;


-- estructura de tabla para la tabla comuna
CREATE TABLE comuna (
id int NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
ciudad_id int(11),
PRIMARY KEY (id),
constraint fk_ciudad
foreign key (ciudad_id) references ciudad (id));


-- estructura de tabla para la tabla ciudad
CREATE TABLE ciudad (
id int NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
region_id int(11),
constraint fk_region
foreign key (region_id) references region (id),
PRIMARY KEY (id));


-- estructura de tabla para la tabla region
create table region(  
id int NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
PRIMARY KEY (id));


-- estructura de tabla para la tabla perfil
create table perfil(  
id int NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
PRIMARY KEY (id));


-- estructura de tabla para la tabla usuario
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(255) NOT NULL,
  `dv` char(3) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) NOT NULL,
  `apellido_materno` varchar(255),
  `telefono` varchar(255),
  `correo` varchar(255),
  `comuna_id` int(20) NOT NULL,
  `perfil_id` int(20) NOT NULL,
  `enabled` boolean NOT NULL,
  `sexo` varchar(255),
  `fecha_naciemiento` DATETIME,
  
  PRIMARY KEY (`id`),
  constraint fk_comuna
  FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`),
  constraint fk_perfil
  foreign key (perfil_id) references perfil (id)) ;


-- estructura de tabla para la tabla delivery
CREATE TABLE `delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(255) NOT NULL,
  `dv` char(3) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) NOT NULL,
  `apellido_materno` varchar(255),
  `telefono` varchar(255),
  `correo` varchar(255),
  `comuna_id` int(20) NOT NULL,
  `enabled` boolean NOT NULL,
  `sexo` varchar(255),
  `fecha_naciemiento` DATETIME,
  
  PRIMARY KEY (`id`),
  constraint fk_comuna
  FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`)) ;

--


-- estructura de tabla para la tabla producto
create table producto(  
'id' int NOT NULL AUTO_INCREMENT,
'nombre' varchar(255) NOT NULL,
'enabled' boolean not null,
PRIMARY KEY (id));


-- estructura de tabla para la tabla estado
create table estado(  
'id' int NOT NULL AUTO_INCREMENT,
'tiupo_estado' varchar(255) NOT NULL,
PRIMARY KEY (id));


-- estructura de tabla para la tabla solicitud

  create table solicitud (
  'id' int not null auto_increment,
  'cliente_id' int(11) not null,
  'mision_id' int(11) not null,
  'producto_id' int(11) not null,
  'fecha_ingreso_solicitud' datetime,
  'usuario_id' int(11) not null,
  'comuna_id' int(11) not null,
  'observacion' varchar(255),
  'estado_solicitud' boolean not null,
  
  primary key (id),
  constraint fk_comuna
  foreign key (comuna_id) references comuna (id)
  constraint fk_cliente
  foreign key (cliente_id) references cliente (id)
  constraint fk_producto
  foreign key (producto_id) references producto (id)
  constraint fk_usuario
  foreign key (usuario_id) references usuario (id));



  -- estructura de tabla para la tabla mision

  create table mision (
  'id' int not null auto_increment,
  'solicitud_id' int(11) not null,
  'delivery_id' int(11) not null,
  'lat_inicio' varchar(255),
  'long_inicio' varchar(255),
  'lat_fin' varchar(255),
  'long_fin' varchar(255),
  'estado_id' int(11) not null,
  'observacion' varchar(255),


  primary key (id),
  constraint fk_solicitud
  foreign key (solicitud_id) references solicitud (id)
  constraint fk_delivery
  foreign key (delivery_id) references delivery (id)
  constraint fk_estado
  foreign key (estado_id) references estado (id));
