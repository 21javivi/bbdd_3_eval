-- 20
SELECT book_name, CONCAT(book_price,'€') AS precioMenor, aut_name FROM libro L, autor A
WHERE A.aut_id=L.aut_id AND
book_price=(SELECT MIN(book_price) AS precioMenor FROM libro);

SELECT book_name, CONCAT(book_price,'€') AS precioMenor, aut_name FROM libro L NATURAL JOIN autor A
WHERE book_price=(SELECT MIN(book_price) AS precioMenor FROM libro);

-- 21
SET @dolar=1.09;
SELECT MAX(book_price) AS precioMayor FROM libro;
SELECT book_name, CONCAT(ROUND((book_price * @dolar),2),'$') AS precio
FROM libro
WHERE book_price=(SELECT MAX(book_price) AS precioMayor FROM libro);

-- 22
SELECT COUNT(book_id) AS nLibros, pub_name
FROM libro L, publicacion P -- FROM libro L NATURAL JOIN publicacion P
WHERE L.pub_id=P.pub_id 
GROUP BY pub_name;

-- 23
SELECT pub_name, COUNT(*) AS nPulicaciones
FROM libro L NATURAL JOIN publicacion P
WHERE country='USA'
GROUP BY pub_name;

-- 24
SELECT pub_name, COUNT(*) AS nPulicaciones
FROM libro L, publicacion P 
WHERE L.pub_id=P.pub_id AND 
country='USA'
GROUP BY pub_name
UNION
SELECT '',''
UNION
SELECT 'Total Publicaciones', COUNT(*) AS nPublicaciones
FROM libro L, publicacion P 
WHERE L.pub_id=P.pub_id AND 
country='USA';
