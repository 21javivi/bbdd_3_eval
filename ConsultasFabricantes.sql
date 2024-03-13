-- 1 Selecciona todos los productos que hay en la tabla añadiendo un campo después de precio que muestre la unidad de €.
SELECT nombre,precio,'€' AS DIVISA FROM producto;

-- 2 Nombre y precio de productos con precio menor de 120€ en formato descendente, mostrando la moneda.
SELECT nombre,precio,'€' AS DIVISA FROM producto WHERE precio < 120 ORDER BY precio DESC;

-- 3a Nombre y precio de productos con precio mayor o igual a 180€ de forma Ascendente, mostrando la moneda.
SELECT nombre, precio,'€' AS DIVISA FROM producto WHERE precio >= 180 ORDER BY precio ASC;

-- 3b Nombre y precio de productos que no tienen un precio mayor o igual a 180€, mostrando la moneda.
SELECT nombre,precio,'€' AS DIVISA FROM producto WHERE precio < 180;

-- 3c Nombre y precio de productos que tienen un precio entre 100€ y 200€ en formato ascendente, mostrando la moneda. [1€ = 1.08$]
SELECT nombre,precio,'€' AS DIVISA FROM producto WHERE (precio>100 AND precio<200) ORDER BY precio asc;

-- 4a Mostrar el nombre y el precio de los productos en dólares. Para ello tendrás que buscar el cambio actual del euro a dólar y recalcular sus precios.
-- Se mostrará la moneda de Dólar con el símbolo $. Define una variable que se llame dólar para realizar los cálculos.
SET @dolar=1.08;
SELECT @dolar;
SELECT nombre,FORMAT(precio*@dolar,4) AS PRECIO_DOLLAR,'$' AS DIVISA FROM producto;

-- 4b Redondear el valor anterior a dos decimales con la función matemática ROUND:  [ROUND(campo, nºdecimales)]
SELECT nombre,ROUND(precio*@dolar,2) AS PRECIO_DOLLAR,'$' AS DIVISA FROM producto;

-- 5 Muestra todos los productos que tengan un precio mayor de 150€ cuyo fabricante sea Fujitsu. Fija el código del fabricante mediante una variable en un SELECT.
SET @fujitsu=0000000005;
SELECT @fujitsu;
SELECT nombre, precio,'€' AS DIVISA FROM producto WHERE (precio > 150 AND codigo_fabricante = @fujitsu);

-- 6 Listar todos los productos donde el código del fabricante sea 1,3 ó 5.
SELECT nombre,codigo_fabricante FROM producto WHERE (codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5);

-- 7 Listar todos los productos que sean DVD.
SELECT nombre, codigo_fabricante FROM producto WHERE nombre LIKE '%DVD%';

-- 8 Listar todos los productos que sean CD o DVD.
SELECT nombre,codigo_fabricante FROM producto WHERE nombre LIKE '%DVD%' OR nombre LIKE '%CD%';

-- 9 Listar todos los productos que sean drive o disk.
SELECT nombre, codigo_fabricante FROM producto WHERE nombre LIKE '%DRIVE%' OR nombre LIKE '%DISK%';

-- 10 Listar los productos que acaben con la letra “e”.
SELECT nombre, codigo_fabricante FROM producto WHERE nombre LIKE '%e';

-- 11 Listar los fabricantes que comiencen por la letra S.
SELECT nombre FROM fabricante WHERE nombre LIKE 's%';

-- 12 Listar los fabricantes que contengan la letra S y la letra E.
SELECT nombre FROM fabricante WHERE nombre LIKE '%S%' AND nombre LIKE '%E%';

-- 13 Listar los productos que comiencen por la letra C ó la letra D y acaben por la letra E.
SELECT nombre FROM producto WHERE (nombre LIKE 'C%' OR nombre LIKE 'D%') AND nombre LIKE '%E';

-- 14 Listar los productos que no contengan ni CD ni DVD.
SELECT nombre FROM producto WHERE (nombre NOT LIKE '%CD%' AND nombre NOT LIKE '%DVD%');

-- 15 Seleccionar productos que contengan la palabra drive y no sean ni CD ni DVD.
SELECT nombre FROM producto WHERE nombre LIKE '%DRIVE%' AND nombre NOT LIKE '%CD%' AND nombre NOT LIKE '%DVD%';

-- 16 Muestra la información completa de los productos con código 1,5,8 sin utilizar la palabra reservada OR y AND. Ordénalos por precio de mayor a menor.
SELECT nombre, codigo, codigo_fabricante,precio FROM producto WHERE codigo IN(1,5,8) ORDER BY precio DESC;

-- 17 Muestra todos los productos cuyo precio sea a partir de 100€ y no sea ni 180 ni 240. Utiliza un solo operador de comparación.
SELECT nombre, precio FROM producto WHERE precio > 100 AND PRECIO NOT LIKE '180%' AND PRECIO NOT LIKE '240%';

-- 18a Selecciona los primeros 5 fabricantes.
SELECT nombre FROM fabricante LIMIT 5;
-- O
SELECT nombre FROM fabricante ORDER BY codigo ASC LIMIT 1;

-- 18b Selecciona 2 fabricantes a partir del 4º.
-- NUEVA CLAUSULA OFFSET
SELECT nombre FROM fabricante LIMIT 2 OFFSET 3;

-- Parte II: Consultas con funciones.

-- 20 Cuenta el número de fabricantes.
SELECT COUNT(nombre) AS NUMERO_FABRICANTES FROM fabricante;

-- 21 Cuenta los fabricantes que contienen la letra e.
SELECT COUNT(nombre) AS NUMERO_FABRICANTES FROM fabricante WHERE nombre LIKE '%E%';

-- 22 Muestra los códigos de fabricante distintos que aparecen en la tabla productos. No se pueden repetir.
SELECT DISTINCT(codFabricante) FROM producto;

-- 23 Calcula la media del precio de los productos mostrando el valor de €. Utiliza la función concat().
SELECT CONCAT(AVG(precio),'€') AS MEDIA FROM producto;
-- o
SELECT CONCAT(ROUND(AVG(precio), 2), '€') AS MEDIA FROM producto; -- Para redondear a 2 el numero de decimales 

-- 24 Calcula el precio medio de los productos en el valor monetario de Dólares mostrando su símbolo $.
SELECT CONCAT(ROUND(AVG(precio*@dolar),2),'$') AS MEDIA_EN_DOLARES FROM producto;

-- Parte III: Consultas complejas.

-- 25 Cuenta el número de productos que tiene cada fabricante, mostrando el nombre del fabricante.
SELECT COUNT(codProducto) AS numeroProductos, F.nombre
FROM producto P, fabricante F WHERE F.codFabricante=P.codFabricante
GROUP BY F.codFabricante ORDER BY numeroProductos DESC;

-- 26 Muestra el nombre, precio y fabricante de todos los productos, ordenado por el nombre en forma ascendente. Hazlo de dos formas diferentes.
SELECT P.nombre AS nombreProducto, precio, F.nombre AS nombreFabricante
FROM producto P, fabricante F WHERE F.codFabricante=P.codFabricante
ORDER BY F.nombre ASC;

SELECT P.nombre AS nombreProducto, precio, F.nombre AS nombreFabricante
FROM producto P, fabricante F WHERE F.codFabricante=P.codFabricante
ORDER BY P.nombre ASC;



-- 27 Calcula el precio medio de los productos de cada fabricante, mostrando el nombre de cada fabricante y su símbolo en €. Hazlo de dos formas diferentes
SELECT ROUND(CONCAT(AVG(precio),'€'),2)AS precioMedio, F.nombre AS nombreFabricante
FROM producto P, fabricante F WHERE F.codFabricante=P.codFabricante GROUP BY F.codFabricante;

-- 28 Selecciona los nombres de los fabricantes cuya media del precio de productos supera los 150€. Mostrar el nombre fabricante y su media,
-- ordenado por su media de forma descendente. Hazlo de dos formas diferentes.
SELECT ROUND(CONCAT(AVG(precio),'€'),2)AS precioMedio, F.nombre AS nombreFabricante
FROM producto P, fabricante F WHERE F.codFabricante=P.codFabricante GROUP BY F.codFabricante HAVING precioMedio>150 ORDER BY precioMedio DESC;

-- 29 Obtén el producto más barato de todos los productos. Muestra el nombre del producto, precio en euros y el nombre del fabricante.
SELECT MIN(precio) FROM producto P; -- Paso 1
SELECT nombre FROM producto P WHERE precio=(SELECT MIN(precio) FROM producto P); -- Paso 2
SELECT P.nombre AS nombreProducto, F.nombre AS nombreFabricante,(SELECT MIN(precio) FROM producto P) AS precioMinimo FROM producto P, fabricante F 
WHERE P.codFabricante= F.codFabricante AND precio=(SELECT MIN(precio) FROM producto P);-- Paso FINAL

-- 30 Obtén el producto más caro y más barato, mostrando el nombre, el precio en Euros y el nombre del fabricante.
SELECT MIN(precio) FROM producto P; -- Paso 1
SELECT nombre FROM producto P WHERE precio=(SELECT MIN(precio) FROM producto P); -- Paso 2
SELECT P.nombre AS nombreProducto, F.nombre AS nombreFabricante,(SELECT MIN(precio) FROM producto P) AS precio FROM producto P, fabricante F 
WHERE P.codFabricante= F.codFabricante AND precio=(SELECT MIN(precio) FROM producto P);-- Paso 3
-- ↑↑↑↑ MINIMO ↑↑↑↑

SELECT MAX(precio) FROM producto P; -- Paso 4
SELECT nombre FROM producto P WHERE precio=(SELECT MAX(precio) FROM producto P); -- Paso 5
SELECT P.nombre AS nombreProducto, F.nombre AS nombreFabricante,(SELECT MAX(precio) FROM producto P) AS precio FROM producto P, fabricante F 
WHERE P.codFabricante= F.codFabricante AND precio=(SELECT MAX(precio) FROM producto P);-- Paso 6
-- ↑↑↑↑ MAXIMO ↑↑↑↑

SELECT P.nombre AS nombreProducto, F.nombre AS nombreFabricante,(SELECT MIN(precio) FROM producto P) AS precio FROM producto P, fabricante F 
WHERE P.codFabricante= F.codFabricante AND precio=(SELECT MIN(precio) FROM producto P)
UNION
SELECT P.nombre AS nombreProducto, F.nombre AS nombreFabricante,(SELECT MAX(precio) FROM producto P) AS precio FROM producto P, fabricante F 
WHERE P.codFabricante= F.codFabricante AND precio=(SELECT MAX(precio) FROM producto P);-- Paso FINAL
-- ↑↑↑↑ UNION MINIMO Y MAXIMO ↑↑↑↑

-- 31 Obtén el nombre de cada fabricante con el nombre y precio de su producto más caro.
-- Debes añadir los siguientes productos:
-- DDR2 memory, 50€, Winchester
-- Bluetooth Speakers, 230€, bose
-- Multimedia Speakers, 140€, bose
-- Multimedia White Speakers, 80€, bose

INSERT INTO producto(nombre, precio, codFabricante) VALUES("DDR2",50,(SELECT codFabricante FROM fabricante WHERE nombre="Winchester")),("Bluetooth Speakers", 230, (SELECT codFabricante FROM fabricante WHERE nombre="Bose")),
("Multimedia Speakers",140,(SELECT codFabricante FROM fabricante WHERE nombre="Bose")),("Multimedia White Speakers",80,(SELECT codFabricante FROM fabricante WHERE nombre="Bose"));

SELECT F.nombre, MAX(precio) AS precio, P.nombre FROM producto P,fabricante F WHERE F.codFabricante=P.codFabricante GROUP BY P.codFabricante; -- A PESAR DEL ERROR, LA CONSULTA ES CORRECTA
-- NOS DA EL ERROR 1055, POR LO QUE PARA SOLUCIONARLO DEBEREMOS EJECUTAR LO SIGUIENTE:
SELECT @@sql_mode;
SET @@sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- UNA VEZ EJECUTADO, SI VOLVEMOS A EJECUTAR LA CONSULTA NO NOS DARA ERROR

-- b) Idem con el Producto más barato.
SELECT F.nombre, MIN(precio) AS precio, P.nombre FROM producto P,fabricante F WHERE F.codFabricante=P.codFabricante GROUP BY P.codFabricante;

-- c) Idem con el Producto más caro y barato.
SELECT F.nombre AS nombreFabricante, MAX(precio) AS precio, P.nombre FROM producto P,fabricante F WHERE F.codFabricante=P.codFabricante GROUP BY P.codFabricante
UNION
SELECT F.nombre AS nombreFabricante, MIN(precio) AS precio, P.nombre FROM producto P,fabricante F WHERE F.codFabricante=P.codFabricante GROUP BY P.codFabricante 
ORDER BY nombreFabricante, precio;

-- 32 Computa el precio medio de todos los productos cuyo fabricante sea 'Creative Labs'.
SELECT ROUND(AVG(precio),2) AS precioMedio FROM producto P, fabricante F WHERE P.codFabricante = F.codFabricante GROUP BY F.nombre HAVING F.nombre="Creative Labs";

-- 33 Selecciona el nombre de cada fabricante cuya media de productos sea superior a 140€ y al menos contenga 2 o más productos diferentes.
SELECT AVG(precio) AS precioMedio, F.nombre FROM producto P, fabricante F WHERE P.codFabricante=F.codFabricante GROUP BY F.nombre HAVING precioMedio>140 ORDER BY precioMedio DESC; -- Paso 1
SELECT COUNT(precio) AS numeroProductos, F.nombre FROM producto P, fabricante F WHERE P.codFabricante=F.codFabricante GROUP BY F.nombre HAVING numeroProductos>1 ORDER BY numeroProductos DESC; -- Paso 2


-- 34 Por campaña de ABRIL, actualiza los precios aplicando un descuento del 10%. Además, los precios que superen los 200 € se les añadirá un 5%