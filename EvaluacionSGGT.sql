-- =============================================================
-- 		EXÁMEN MÓDULO 2 - SABRINA GISELLE GÓMEZ TRUJILLO		
-- =============================================================

/*El presente exámen utiliza la base de datos Sakila.*/

USE sakila;	        -- Query para seleccionar la Base de Datos Sakila.

/*1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.*/ 

SELECT '========== 
  Ejercicio 1
==========' AS '';

SELECT DISTINCT title  'Nombre de película' 	-- La tabla film tiene como primary key film_id, no debiera de haber duplicados. 
FROM film;

/* Consultas auxiliares para corroborar resultado:

SELECT COUNT(DISTINCT title)					-- Total de registros: 1.000.
FROM film;

SELECT COUNT(DISTINCT film_id)					-- Total de registros: 1.000.
FROM film;
*/

/*2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".*/

SELECT '========== 
  Ejercicio 2
==========' AS '';

SELECT title 'Nombre de película'
FROM film
WHERE rating IN ('PG-13');

/*-- Consulta auxiliar para corroborar resultado:

SELECT rating, COUNT(rating) 'Cantidad de films' -- Total de registros PG-13: 223.
FROM film
GROUP BY rating;				
*/

/*3. Encuentra el título y la descripción de todas las películas que contengan la cadena de caracteres "amazing" en su descripción.*/

SELECT '========== 
  Ejercicio 3
==========' AS '';

SELECT title 'Nombre de película', description 'Descripción'
FROM film
WHERE description REGEXP 'amazing';					-- [[:<:]]amazing[[:>:]] delimita la palabra y no permite caracteres adicionales, por ejemplo: amazingly quedaria excluido.

/*-- Consulta auxiliar para corroborar resultado:

SELECT title 'Nombre de película', description 'Descripción'
FROM film
WHERE description LIKE '%amazing%';
*/

/*4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.*/

SELECT '========== 
  Ejercicio 4
==========' AS '';

SELECT title 'Nombre de película'
FROM film
WHERE length > 120
ORDER BY length DESC;

/*-- Consulta auxiliar para corroborar resultado:

SELECT title 'Nombre de película', length
FROM film
WHERE length > 120
ORDER BY length ASC;
*/

/*5. Recupera los nombres y apellidos de todos los actores.*/

SELECT '========== 
  Ejercicio 5
==========' AS '';

SELECT CONCAT(first_name,' ',last_name) 'Nombre y Apellidos de actor' 
FROM actor;

/*-- Consultas auxiliares para corroborar resultado:

SELECT COUNT(*)										-- Total de registros: 200.
FROM actor;

SELECT actor_id 									-- Total de registros: 200.
FROM actor 
ORDER BY actor_id DESC 
LIMIT 1 ;
*/

/*6. Encuentra el nombre y apellidos de los actores que tengan "Gibson" en su apellido.*/

SELECT '========== 
  Ejercicio 6
==========' AS '';

SELECT CONCAT(first_name,' ',last_name) 'Nombre y Apellidos de actor' 
FROM actor
WHERE first_name LIKE '%Gibson%'or last_name LIKE '%Gibson%';

/*-- Consultas auxiliares para corroborar resultado:

SELECT CONCAT(first_name,' ',last_name) 'Nombre y Apellidos de actor' 		-- Total de registros: 0. Se realiza la consulta para caractéres en una cadena, no palabra estricta.
FROM actor
WHERE first_name LIKE 'gibson';

SELECT CONCAT(first_name,' ',last_name) 'Nombre y Apellidos de actor'       -- Total de registros: 1. Se realiza la consulta para caractéres en una cadena, no palabra estricta.
FROM actor
WHERE last_name LIKE 'gibson';
*/

/*7. Encuentra los nombres y apellidos de los actores que tengan un actor_id entre 10 y 20.*/

SELECT '========== 
  Ejercicio 7
==========' AS '';

SELECT CONCAT(first_name,' ',last_name) 'Nombre y Apellidos de actor' 
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

/*-- Consulta auxiliar para corroborar resultado:

SELECT CONCAT(first_name,' ',last_name) 'Nombre y Apellidos de actor' , actor_id 'N° de ID' 
FROM actor
WHERE actor_id BETWEEN 10 AND 20;
*/

/*8. Encuentra el título de las películas en la tabla `film` que no sean ni "R" ni "PG-13" en cuanto a su clasificación.*/

SELECT '========== 
  Ejercicio 8
==========' AS '';

SELECT title 'Nombre de película'
FROM film
WHERE rating NOT IN ('R','PG-13');

/*-- Consultas auxiliares para corroborar resultado:

SELECT title 'Nombre de película', rating		-- Total de registros:582.
FROM film
WHERE rating NOT IN ('R','PG-13');

SELECT title 'Nombre de película', rating		-- Total de registros:418.
FROM film
WHERE rating IN ('R','PG-13');

SELECT COUNT(*)									-- Total de registros:1.000.
FROM film;
*/

/*9. Encuentra la cantidad total de películas en cada clasificación de la tabla `film` y muestra la clasificación junto con el recuento.*/

SELECT '========== 
  Ejercicio 9
==========' AS '';

SELECT rating 'Clasificación', COUNT(title) 'Cantidad de películas'
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC; 

/*-- Consultas auxiliares para corroborar resultado:

SELECT COUNT(*) FROM film;				-- Total de registros: 1.000.

SELECT COUNT(*) 		-- Total de registros: 178.
FROM film 
WHERE rating = 'G';		

SELECT COUNT(*)			-- Total de registros: 195.
FROM film 
WHERE rating = 'R';		
*/

/*10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.*/

SELECT '========== 
  Ejercicio 10
==========' AS '';

SELECT c.customer_id 'ID de cliente', CONCAT(c.first_name, ' ', c.last_name) 'Nombre y Apellidos de cliente', COUNT(r.rental_id) 'Cantidad de películas alquiladas'
FROM rental r
LEFT JOIN customer c
ON c.customer_id=r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY `Cantidad de películas alquiladas`;

/*-- Consultas auxiliares para corroborar resultado:

SELECT COUNT(*) 
FROM customer;		-- Total de registros: 599.

SELECT COUNT(*) 
FROM rental;		-- Total de registros: 16.044.

SELECT COUNT(r.rental_id) 'Cantidad de películas alquiladas' -- Total de registros:16.044.
FROM rental r
LEFT JOIN customer c
ON c.customer_id=r.customer_id;
*/

/*11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.*/

SELECT '========== 
  Ejercicio 11
==========' AS '';

SELECT c.name 'Categoría', COUNT(fc.film_id) 'Cantidad de películas alquiladas' 
FROM rental r
INNER JOIN inventory i
ON r.inventory_id =i.inventory_id
INNER JOIN film_category fc
ON i.film_id=fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name;

/*-- Consulta auxiliar para corroborar resultado:

SELECT COUNT(*) 													-- Total de registros: 16.044.
FROM rental;		

SELECT COUNT(fc.film_id) 'Cantidad de películas alquiladas'			-- Total de registros: 16.044. 
FROM rental r
INNER JOIN inventory i
ON r.inventory_id =i.inventory_id
INNER JOIN film_category fc
ON i.film_id=fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id;
*/

/*12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla `film` y muestra la clasificación junto con el promedio de duración.*/

SELECT '========== 
  Ejercicio 12
==========' AS '';

SELECT rating 'Clasificación', ROUND(AVG(length),2) 'Promedio de duración'
FROM film
GROUP BY rating
ORDER BY AVG(length) DESC;

/*-- Consultas auxiliares para corroborar resultado:

SELECT COUNT(*)	'Total de films categoría R'					-- Total de films de clasificaicón 'R': 195. 
FROM film
WHERE rating = 'R';

SELECT SUM(length) 'Duración total de películas categoría R'	-- Total minutos películas categoría 'R': 23.139.
FROM film
WHERE rating = 'R';

SELECT rating 'Clasificación',AVG(length) 'Promedio de duración'	-- Promedio de minutos de duración para clasificación 'R':118,66.
FROM film
WHERE rating ='R'
GROUP BY rating;
*/

/*13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".*/

SELECT '========== 
  Ejercicio 13
==========' AS '';

SELECT a.first_name 'Nombre',a.last_name 'Apellidos'
FROM film f
LEFT JOIN film_actor fa
ON f.film_id = fa.film_id
LEFT JOIN actor a
ON fa.actor_id= a.actor_id 
WHERE f.title LIKE '%Indian Love%';

/*-- Consultas auxiliares para corroborar resultado:

SELECT title,film_id				-- film_id: 458
FROM film
WHERE title = 'Indian Love';

SELECT actor_id						-- actor_id: 2,8,38,77,81,107,135,149,176,177
FROM film_actor
WHERE film_id = 458;

SELECT CONCAT(first_name, ' ' ,last_name) 'Nombre y Apellidos'						-- actor_id: 2,8,38,77,81,107,135,149,176,177
FROM actor
WHERE actor_id IN (2,8,38,77,81,107,135,149,176,177);
*/

/*14. Muestra el título de todas las películas que contengan la cadena de caracteres "dog" o "cat" en su descripción.*/

SELECT '========== 
  Ejercicio 14
==========' AS '';

SELECT title 'Nombre de película'			   		-- Total de películas: 167.
FROM film
WHERE description REGEXP 'dog|cat';

/*-- Consultas auxiliares para corroborar resultado:
SELECT title 'Nombre de película', description		-- Total de películas: 99.
FROM film
WHERE description LIKE '%dog%';

SELECT title 'Nombre de película', description		-- Total de películas: 70.
FROM film
WHERE description LIKE '%cat%';
*/

/*15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla `film_actor`.*/

SELECT '========== 
  Ejercicio 15
==========' AS '';

SELECT a.actor_id							-- No hay actor/actriz que no se encuentre en alguna de las películas de la tabla 'film_actor'.
FROM actor a
WHERE NOT EXISTS (SELECT 1 
	FROM film_actor fa 
    WHERE fa.actor_id=a.actor_id);


/*-- Consultas auxiliares para corroborar resultado:

SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
WHERE fa.actor_id IS NULL;

SELECT COUNT(DISTINCT actor_id)		-- Total de registros: 200.
FROM film_actor;					

SELECT COUNT(*)						-- Total de registros: 200.
FROM actor;			
*/

/*16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.*/

SELECT '========== 
  Ejercicio 16
==========' AS '';

SELECT title 'Nombre de película', release_year
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

/*-- Consulta auxiliar para corroborar resultado:

SELECT DISTINCT release_year		-- Año 2006
FROM film;
*/

/*17. Encuentra el título de todas las películas que son de la misma categoría que "Family".*/

SELECT '========== 
  Ejercicio 17
==========' AS '';

SELECT f.title 'Nombre de película'						-- Total de 69 películas para la categoría 'Family'
FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id  
WHERE fc.category_id = (SELECT category_id 
FROM category WHERE name LIKE 'Family');			

/*-- Consultas auxiliares para corroborar resultado:

SELECT category_id 														-- Category_id para 'Family': 8.
FROM category WHERE name LIKE '%Family%';

SELECT fc.category_id, COUNT(f.title) 'Cantidad de películas'			-- Películas agrupadas por categoría.
FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
GROUP BY fc.category_id;

SELECT COUNT(*) FROM film_category;				-- Total de registros: 1.000. (películas)

SELECT COUNT(*) FROM category;					-- Total de registros: 16. (categorías)
*/

/*18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.*/

SELECT '========== 
  Ejercicio 18
==========' AS '';

SELECT CONCAT(a.first_name, ' ', a.last_name) 'Nombre y Apellidos'
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 10;

/*-- Consultas auxiliares para corroborar resultado:

SELECT CONCAT(a.first_name, ' ', a.last_name) 'Nombre y Apellidos', COUNT(fa.film_id)'Total de películas'	-- Se incorpora columna con cantidad de películas.
FROM actor a
LEFT JOIN film_actor fa																						-- LEFT para traer NULLS si hubiera
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 10;

SELECT CONCAT(a.first_name, ' ', a.last_name) 'Nombre y Apellidos', fa.film_id'ID_Películas'		-- Se realiza consulta para caso testigo, detallando listado de id_películas. Total de registros para 'Bergen', 30.
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
WHERE a.last_name = 'BERGEN';
*/

/*19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla `film`.*/

SELECT '========== 
  Ejercicio 19
==========' AS '';

SELECT title 'Nombre de película'
FROM film
WHERE rating = 'R' AND length > 120;

/*-- Consultas auxiliares para corroborar resultado:

SELECT title 'Nombre de película', rating 'Clasificación', length 'Duración'		--Se incorporan columans de control Clasificación y Duración
FROM film
WHERE rating = 'R' AND length > 120;

SELECT title 'Nombre de película', MIN(length) 'Duración mínima'					-- Resultado: American Circus, 121 minutos. 
FROM film
WHERE rating = 'R' AND length > 120;
*/

/*20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.*/

SELECT '========== 
  Ejercicio 20
==========' AS '';

SELECT c.name 'Categoría', ROUND(AVG(f.length),2) 'Promedio de duración'						-- Total de 4 registros. Se ordena de forma ascendente.
FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id
GROUP BY c.name
HAVING AVG(f.length) > 120
ORDER BY AVG(f.length);

/*-- Consulta auxiliar para corroborar resultado:

SELECT c.name 'Categoría', ROUND(AVG(f.length),2) 'Promedio de duración'	-- Total de 16 registros.
FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id
GROUP BY c.name;

SELECT COUNT(*)																-- Total de 1.000 registros.
FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id;
*/

/*21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.*/

SELECT '========== 
  Ejercicio 21
==========' AS '';

SELECT CONCAT(a.first_name, ' ', a.last_name) 'Nombre y Apellido del actor/actriz', COUNT(fa.film_id) 'Películas realizadas' -- Total de registros: 200 (min 14,max 42).
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 5
ORDER BY COUNT(fa.film_id) DESC;

/*-- Consultas auxiliares para corroborar resultado:

SELECT actor_id, COUNT(film_id)					-- Se consulta total de películas por ID ordenando de forma ascendente.
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id);

SELECT actor_id, COUNT(film_id) AS total_peliculas		-- Se reutiliza subconsulta inicial. 
FROM film_actor
GROUP BY actor_id
HAVING COUNT(film_id) = 
(SELECT MIN(total_peliculas)
FROM (SELECT COUNT(film_id) AS total_peliculas
FROM film_actor
GROUP BY actor_id) AS subconsulta
);

SELECT actor_id, COUNT(film_id) 				-- Se consulta el actor con menor cantiad de películas: ID 148, Emily Dee, 14 películas.
FROM film_actor
GROUP BY actor_id 
ORDER BY COUNT(film_id)
LIMIT 1;
*/

/*22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. 
Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.*/

SELECT '========== 
  Ejercicio 22
==========' AS '';

SELECT f.title
FROM film f
WHERE f.film_id IN (SELECT i.film_id
	FROM rental r
	JOIN inventory i ON r.inventory_id = i.inventory_id
	WHERE DATEDIFF(r.return_date, r.rental_date) >5);

/*-- Consulta auxiliar para corroborar resultado:

SELECT rental_id, DATEDIFF(return_date,rental_date) AS 'Días de alquiler', rental_date,return_date,
CASE WHEN DATEDIFF(return_date,rental_date) > 5 
THEN 'Alquilada por más de 5 días' 
ELSE 'Alquilada por 5 o menos días' 
END AS 'Subconsulta_días_alquiler'
FROM rental
ORDER BY DATEDIFF(return_date,rental_date)DESC;  
*/

/*23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". 
Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.*/

SELECT '========== 
  Ejercicio 23
==========' AS '';

SELECT a.first_name,a.last_name
FROM actor a
WHERE NOT EXISTS (SELECT 1																			-- 44 actores que no han realizado películas de categoría Horror.
	FROM film_actor fa
	JOIN film_category fc 
    ON fa.film_id = fc.film_id
	JOIN category c 
    ON fc.category_id = c.category_id
	WHERE fa.actor_id = a.actor_id AND c.name = 'Horror'
);

/*-- Consulta auxiliar para corroborar resultado:

SELECT DISTINCT a.actor_id, a.first_name, a.last_name 						-- Total de registros: 156 (actores que han actuado en películas de categoría 'Horror').
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
JOIN film_category fc 
ON fa.film_id = fc.film_id
JOIN category c 
ON fc.category_id = c.category_id
WHERE c.name = 'Horror'
ORDER BY a.actor_id;

/*24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla `film`.*/

SELECT '========== 
  Ejercicio 24
==========' AS '';

SELECT f.title
FROM film f
WHERE f.length > 180 AND EXISTS (
    SELECT 1
    FROM category c
    RIGHT JOIN film_category fc 
    ON fc.category_id = c.category_id
    WHERE fc.film_id = f.film_id AND c.name = 'Comedy'
  );

/*-- Consultas auxiliares para corroborar resultado:

SELECT COUNT(title)				-- Total de registros: 39.
FROM film
WHERE length > 180;  
  
SELECT category_id  		-- ID de categoría comedia '5'.
FROM category 
WHERE name = 'Comedy';

SELECT COUNT(film_id)		-- Total de registros:58.
FROM film_category 
WHERE category_id = 5; 

SELECT f.title, c.name											-- Se realizan JOINS y se incorpora columna categoría - sin subconsulta.
FROM film f
LEFT JOIN film_category fc ON fc.film_id = f.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy' AND f.length > 180;
