SELECT * FROM persona P, telefonos T
WHERE P.dni=T.dni_persona;

SELECT * FROM persona P INNER JOIN telefonos T;

-- INNER JOIN muestra registros de ambas tablas
-- LEFT JOIN muestra registros de la tabla izquierda junto con los que coinciden de la derecha
-- RIGHT JOIN muestra registros de la tabla derecha junto con los que coinciden de la izquierda
-- FULL JOIN combina LEFT + UNION + RIGHT
-- STRAIGHT JOIN equivale al INNER JOIN pero asegura que no se cambia el orden de las tablas

-- PARA MOSTRAR LO QUE HAY EN LA TABLA DE LA IZQUIERDA PERO NO COINCIDE CON LA DE LA DERECHA SE USA LA SIGUIENTE ESTRUCTURA:
-- SELECT * FROM tabla1 LEFT JOIN tabla2 ON tabla1.PK=tabla2.FK WHERE tabla2 KEY IS NULL

-- MOSTRAR LAS PERSONAS CON SUS TELEFONOS
SELECT dni,nombre,apellidos,ciudad,telefono 
FROM persona P INNER JOIN telefonos T 
ON P.dni=T.dni_persona;

-- MOSTRAR A JUAN TORRES CON SUS TELEFONOS
SELECT dni,nombre,apellidos,ciudad,telefono 
FROM persona P INNER JOIN telefonos T 
ON P.dni=T.dni_persona
WHERE P.nombre='Juan' AND P.apellidos='Torres';

-- MOSTRAR TODAS LAS PERSONAS CON SUS TELEFONOS TENGAN O NO TENGAN
SELECT dni,nombre,apellidos,ciudad,telefono 
FROM persona P LEFT JOIN telefonos T 
ON P.dni=T.dni_persona;

-- PERSONAS QUE TIENEN TELEFONO USANDO RIGHT JOIN
SELECT dni,nombre,apellidos,ciudad,telefono 
FROM persona P RIGHT JOIN telefonos T 
ON P.dni=T.dni_persona;

-- PERSONAS QUE TIENEN TELEFONOS SIN REPETIRSE
SELECT DISTINCT nombre,apellidos 
FROM persona P RIGHT JOIN telefonos T 
ON P.dni=T.dni_persona;

-- PERSONAS QUE NO TIENEN TELEFONO
SELECT nombre, apellidos 
FROM persona P LEFT JOIN telefonos T
ON P.dni=T.dni_persona
WHERE T.dni_persona IS NULL;