-- Crear base de datos
DROP DATABASE IF EXISTS pedidos;
CREATE DATABASE pedidos;
USE pedidos;

CREATE TABLE vendedor (
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	vendedor_id INT NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	nacimiento VARCHAR(12) NOT NULL,
	email VARCHAR(65) NOT NULL,
    PRIMARY KEY (vendedor_id)
);

-- Crear tabla cliente
CREATE TABLE cliente (
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	cliente_id INT NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	nacimiento VARCHAR(12) NOT NULL,
	email VARCHAR(65) NOT NULL,
    PRIMARY KEY (cliente_id)
);

-- Crear tabla producto
CREATE TABLE producto (
  producto_id INT NOT NULL,
  nombre VARCHAR(30) NOT NULL ,
  precio_unitario DOUBLE NOT NULL,
  PRIMARY KEY (producto_id)
);

-- Crear tabla estado pedido
create table estadoPedido
(
    estado_ID int primary key ,
    nombre VARCHAR(50) NOT NULL,
    descripción VARCHAR(400) NOT NULL
);

-- Crear tabla  det pedido
CREATE TABLE detalle_pedido (
  det_pedido_id INT NOT NULL,
  pedido_id INT NOT NULL ,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  precio_total DOUBLE NOT NULL,
  PRIMARY KEY (det_pedido_id),
  FOREIGN KEY (producto_id) REFERENCES producto (producto_id)

);



-- Crear tabla pedido
CREATE TABLE pedido (
  pedido_id INT NOT NULL AUTO_INCREMENT,
  vendedor_id INT NOT NULL,
  cliente_id INT NOT NULL,
  sucursal VARCHAR(50) NOT NULL,
  region VARCHAR(50) NOT NULL,
  estadoPedidoID INT NOT NULL,
  det_pedido_id INT NOT NULL,
  PRIMARY KEY (pedido_id),
  FOREIGN KEY (vendedor_id) REFERENCES vendedor (vendedor_id),
  FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id),
  FOREIGN KEY (EstadoPedidoID) REFERENCES estadoPedido (estado_ID),
  FOREIGN KEY (det_pedido_id) REFERENCES detalle_pedido (det_pedido_id)

);




-- Insertar datos en la tabla vendedor
INSERT INTO vendedor (nombre, apellido, vendedor_id, direccion, nacimiento, email)
VALUES
('Juan', 'Pérez', 1, 'Calle 123, Ciudad de México', '1980-01-01', 'juan.perez@example.com'),
('María', 'González', 2, 'Calle 456, Guadalajara', '1981-02-02', 'maria.gonzalez@example.com'),
('José', 'García', 3, 'Calle 789, Monterrey', '1982-03-03', 'jose.garcia@example.com'),
('Ana', 'López', 4, 'Calle 1012, Puebla', '1983-04-04', 'ana.lopez@example.com'),
('Pedro', 'Martínez', 5, 'Calle 1314, Querétaro', '1984-05-05', 'pedro.martinez@example.com'),
('Luis', 'Sánchez', 6, 'Calle 1516, León', '1985-06-06', 'luis.sanchez@example.com'),
('Carlos', 'Hernández', 7, 'Calle 1718, Aguascalientes', '1986-07-07', 'carlos.hernandez@example.com'),
('David', 'Gómez', 8, 'Calle 1920, Chihuahua', '1987-08-08', 'david.gomez@example.com'),
('María', 'Rodríguez', 9, 'Calle 2122, Ciudad Juárez', '1988-09-09', 'maria.rodriguez@example.com');

-- Insertar datos en la tabla cliente
INSERT INTO cliente (nombre, apellido, cliente_id, direccion, nacimiento, email)
VALUES
('Pedro', 'Pérez', 10, 'Calle 123, Ciudad de México', '1980-01-01', 'pedro.perez@example.com'),
('María', 'González', 11, 'Calle 456, Guadalajara', '1981-02-02', 'maria.gonzalez@example.com'),
('José', 'García', 12, 'Calle 789, Monterrey', '1982-03-03', 'jose.garcia@example.com'),
('Ana', 'López', 13, 'Calle 1012, Puebla', '1983-04-04', 'ana.lopez@example.com'),
('Pedro', 'Martínez', 14, 'Calle 1314, Querétaro', '1984-05-05', 'pedro.martinez@example.com'),
('Luis', 'Sánchez', 15, 'Calle 1516, León', '1985-06-06', 'luis.sanchez@example.com'),
('Carlos', 'Hernández', 16, 'Calle 1718, Aguascalientes', '1986-07-07', 'carlos.hernandez@example.com'),
('David', 'Gómez', 17, 'Calle 1920, Chihuahua', '1987-08-08', 'david.gomez@example.com'),
('María', 'Rodríguez', 18, 'Calle 2122, Ciudad Juárez', '1989-06-06', 'hola@gmail.com');

-- Insertar datos en la tabla producto
INSERT INTO producto (producto_id, nombre, precio_unitario)
VALUES
(1, 'Producto 1', 100),
(2, 'Producto 2', 200),
(3, 'Producto 3', 300),
(4, 'Producto 4', 400),
(5, 'Producto 5', 500),
(6, 'Producto 6', 600),
(7, 'Producto 7', 700),
(8, 'Producto 8', 800),
(9, 'Producto 9', 900),
(10, 'Producto 10', 1000);

-- Insertar datos en la tabla estadoPedido
INSERT INTO estadoPedido (estado_ID, nombre, descripción)
VALUES
(1, 'Pendiente', 'El pedido está pendiente de ser procesado'),
(2, 'Procesando/preparando', 'El pedido está siendo procesado'),
(3, 'LPR', 'El pedido esta listo para retirar'),
(4, 'cancelado', 'El pedido esta cancelado'),
(5, 'Entregado', 'El pedido ha sido entregado');

-- Insertar datos en la tabla detalle_pedido
INSERT INTO detalle_pedido (det_pedido_id,pedido_id, producto_id, cantidad, precio_total)
VALUES
(544,1, 1, 1, 100),
(501,2, 2, 2, 400),
(505,3, 3, 3, 900),
(566,4, 4, 4, 1600),
(508,5, 5, 5, 2500),
(684,6, 6, 6, 3600),
(650,7, 7, 7, 4900),
(599,8, 8, 8, 6400),
(578,9, 9, 9, 8100);



-- Insertar datos en la tabla pedido
INSERT INTO pedido (pedido_id, vendedor_id, cliente_id, sucursal, region, estadoPedidoID, det_pedido_id)
VALUES
(1, 1, 10, 'Sucursal 1', 'Región amba', 1,544),
(2, 2, 11, 'Sucursal 2', 'Región andina', 2,501),
(3, 3, 12, 'Sucursal 3', 'Región este', 3,505),
(4, 4, 13, 'Sucursal 4', 'Región sur', 4,566),
(5, 5, 14, 'Sucursal 5', 'Región norte', 1,508),
(6, 6, 15, 'Sucursal 6', 'Región centro', 2,684),
(7, 7, 16, 'Sucursal 7', 'Región litoral', 3,650),
(8, 8, 17, 'Sucursal 8', 'Región centro', 4,599),
(9, 9, 18, 'Sucursal 9', 'Región patagonia', 5,578);





create view pedidosGrandes as
(
SELECT pedido.pedido_id, vendedor_id,cliente_id,sucursal,region,pedido.det_pedido_id
FROM pedido
INNER JOIN detalle_pedido
ON pedido.pedido_id = detalle_pedido.pedido_id
WHERE detalle_pedido.precio_total > 4000
) ;

create view pedidosCentro as
(
SELECT pedido.pedido_id, vendedor_id,cliente_id,sucursal,region,pedido.det_pedido_id
FROM pedido
INNER JOIN detalle_pedido
ON pedido.pedido_id = detalle_pedido.pedido_id
WHERE region = 'Región centro'
order by detalle_pedido.precio_total
) ;



create view clientesX as
(
SELECT *
FROM cliente
WHERE cliente.cliente_id >15

) ;