DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT * FROM producto;
SELECT * FROM fabricante;

SELECT nombre, ROUND(precio) FROM producto;/*Listar los nombres y los precios de todos los productos de la tabla producto,
 redondeando el valor del precio. */
SELECT codigo_fabricante FROM producto GROUP BY codigo_fabricante;/*Lista el código de los fabricantes
 que tienen productos en la tabla producto.*/
 
 SELECT nombre FROM fabricante ORDER BY nombre ASC; /*Listar los nombres de los fabricantes ordenados de forma ascendente. */
 
 SELECT * FROM fabricante WHERE codigo < 6;/*Devuelve una lista con las 5 primeras filas de la tabla fabricante. */
 
 SELECT MIN(precio), nombre FROM producto ORDER BY nombre LIMIT 1;/*Listar el nombre y el precio del producto más barato.
 (Utilice solamente las cláusulas ORDER BY y LIMIT) */
 
 SELECT nombre, precio FROM producto WHERE precio <= 120; /*Lista el nombre de los productos que tienen un precio menor o igual a $120.*/
 SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;/*Lista todos los productos que tengan un precio
 entre $60 y $200. Utilizando el operador BETWEEN. */
 
SELECT * FROM producto;
SELECT * FROM fabricante;

ALTER TABLE producto CHANGE COLUMN nombre nombre_producto VARCHAR(255) NOT NULL;
ALTER TABLE producto CHANGE COLUMN codigo id_producto int(50);
 
 SELECT id_producto, nombre_producto, codigo_fabricante, nombre FROM producto INNER JOIN fabricante ON 
 producto.codigo_fabricante = fabricante.codigo;/*Devuelve una lista con el código del producto, 
 nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos. */
 
 SELECT nombre_producto, precio, nombre FROM producto INNER JOIN fabricante
 ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
 /*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los 
productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden 
alfabético.*/

SELECT nombre_producto, MIN(precio), nombre FROM producto INNER JOIN fabricante 
ON producto.codigo_fabricante = fabricante.codigo;
/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.*/

SELECT nombre_producto, codigo_fabricante, nombre FROM producto INNER JOIN fabricante ON
producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
/*Devuelve una lista de todos los productos del fabricante Lenovo. */

SELECT nombre, nombre_producto FROM fabricante LEFT JOIN producto ON
fabricante.codigo = producto.codigo_fabricante; /*en esta sentencia, veo todos los fabricantes, aun sin tener productos
se completa la lista con valores null*/
SELECT nombre, nombre_producto FROM producto LEFT JOIN fabricante ON
producto.codigo_fabricante = fabricante.codigo;/*en esta sentencia, veo solo los productos, con su fabricante 
no se completa la lista con valores null y no muestra fabricantes sin productos activos en la lista*/
/*Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los 
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que 
no tienen productos asociados.
*/

 