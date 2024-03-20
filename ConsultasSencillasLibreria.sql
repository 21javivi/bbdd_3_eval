-- NOMBRE DE LAS EDITORIALES AMERICANAS
SELECT pub_name AS editorial FROM publicacion WHERE country LIKE 'USA';

-- MOSTRAR LOS LIBROS CON MAS DE 200 PAGINAS (NOMBRE DE LIBRO Y NUMERO DE PAGINAS) ORDENADO POR NUMERO DE PAGINAS
SELECT book_name AS libro, no_page AS nPaginas FROM libro WHERE no_page>200 ORDER BY nPaginas ASC;

-- CANTIDAD DE LIBROS ESCRITOS EN INGLES Y CANTIDAD DE LIBROS ESCRITOS EN HINDI
SELECT COUNT(pub_lang) AS cantidad, pub_lang AS idiomaLibro FROM libro GROUP BY idiomaLibro HAVING pub_lang='English' OR pub_lang='Hindi';

-- EDITORIALES LOCALIZADAS EN NEW YORK, ORDENADAS DE MENOR A MAYOR POR SU NUMERO DE "BRANCH"
SELECT pub_name FROM publicacion WHERE pub_city LIKE 'New York' ORDER BY no_of_branch ASC;

-- AUTORES AMERICANOS QUE VIVEN EN HOUSTON O FLORIDA (NOMBRE DEL AUTOR, PAIS Y CIUDAD)
SELECT aut_name, country, home_city FROM autor WHERE home_city NOT IN (SELECT home_city FROM autor WHERE home_city NOT IN ('Houston','Florida'));

-- AUTORES NO AMERICANOS CUYO IDIOMA DE HABLA DE SU PAIS ES EL INGLES (NOMBRE DEL AUTOS, PAIS Y CIUDAD). ORDENADOS POR PAIS Y POR NOMBRE ALFABETICO
SELECT aut_name, country, home_city FROM autor A,libro L WHERE A.aut_id=L.aut_id AND country NOT IN ('USA','CANADA') AND pub_lang LIKE 'English' ORDER BY country,aut_name DESC;

-- CONTAR EL NUMERO DE AUTORES ORDENADOS POR PAIS, ORDENADORS DE FORMA ALFABETICA
SELECT COUNT(aut_id) AS nAutores, country FROM autor GROUP BY country ORDER BY country DESC;

-- ORDENALO TAMBIEN POR EL NUMERO DE AUTORES DE FORMA DESCENDENTE
SELECT COUNT(aut_id) AS nAutores, country 
FROM autor 
GROUP BY country 
ORDER BY country DESC, nAutores DESC;

-- CONTAR EL NUMERO DE AUTORES CUYO PAIS HABLAN EL INGLES COMO IDIOMA OFICIAL
SELECT COUNT(A.aut_id) AS nAutores,country 
FROM libro L, autor A 
WHERE A.aut_id=L.aut_id AND pub_lang LIKE 'English' 
GROUP BY country 
ORDER BY country DESC;

-- 9
SELECT COUNT(A.aut_id) AS nAutores,country 
FROM libro L, autor A WHERE A.aut_id=L.aut_id 
AND pub_lang <> 'English' 
GROUP BY country ORDER BY country ASC;

-- 10
SELECT COUNT(pub_id) AS nPublicaciones,country, pub_city 
FROM publicacion
GROUP BY country,pub_city
ORDER BY country;

-- 11
SELECT COUNT(pub_id) AS nPublicaciones,
ROUND(AVG(no_page),2) AS promedio, pub_lang 
FROM libro
GROUP BY pub_lang
ORDER BY nPublicaciones;

-- 11 OPCIÓN 2
SELECT COUNT(pub_id) AS nPublicaciones,
FORMAT(AVG(no_page),2) AS promedio, pub_lang 
FROM libro
GROUP BY pub_lang
ORDER BY nPublicaciones;

-- 12
SELECT CONCAT(ROUND(AVG(book_price),2),'€') AS precioMedio 
FROM libro;

-- 13
SELECT COUNT(book_id) AS nLibros, pub_lang FROM libro 
GROUP BY pub_lang 
ORDER BY nLibros DESC;

-- 14
SELECT COUNT(pub_name) AS nEditoriales, pub_city 
FROM publicacion 
GROUP BY pub_city;

-- 15
SELECT COUNT(pub_name) AS nEditoriales, pub_city,country 
FROM publicacion 
GROUP BY pub_city, country
HAVING country='USA';

-- 16
SELECT book_name, nombre, dt_of_pub 
FROM libro L, categoria C
WHERE L.cate_id=C.cate_id AND
 dt_of_pub BETWEEN '2002-01-01' AND '2003-12-31'
ORDER BY nombre ASC,dt_of_pub DESC;

-- 17
SELECT COUNT(book_id) AS nLibros, nombre
FROM libro L, categoria C
WHERE L.cate_id=C.cate_id 
GROUP BY nombre 
ORDER BY nombre;

-- 18
SELECT nombre, COUNT(book_id) AS nLibros 
FROM categoria C, libro L
WHERE L.cate_id=C.cate_id
GROUP BY nombre
HAVING nLibros>1;

-- 19
SELECT COUNT(book_id) AS nLibros, nombre
FROM libro L, categoria C
WHERE L.cate_id=C.cate_id 
AND dt_of_pub BETWEEN '2001-01-01' AND '2003-12-31'
GROUP BY nombre;