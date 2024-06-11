-- Query 1
SELECT film.title, language.name, rental_date, return_date
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN language ON film.language_id = language.language_id
WHERE customer.first_name = 'BARBARA' AND customer.last_name = 'JONES';

-- Query 2 con repeticion
SELECT actor.last_name, actor.first_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
WHERE film_category.category_id = (
    SELECT category_id
    FROM category
    WHERE category.name = 'Comedy'
)

-- Query 2 sin repeticion
SELECT DISTINCT actor.last_name, actor.first_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
WHERE film_category.category_id = (
    SELECT category_id
    FROM category
    WHERE category.name = 'Comedy'
)

-- Query 3
SELECT film.*
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'RAY';

-- Query 4 (da distinto, pero para mi esta bien)
SELECT title
FROM film
WHERE length BETWEEN 61 AND 99
  AND language_id = (
    SELECT language_id
    FROM language
    WHERE name = 'French'
  );

-- Query 5
SELECT UPPER(ci.city) AS nombre_ciudad, 
       UPPER(co.country) AS nombre_pais
FROM city ci
JOIN country co ON ci.country_id = co.country_id
WHERE co.country IN ('Austria', 'Chile', 'France')
ORDER BY UPPER(co.country), UPPER(ci.city);

-- Query 6
SELECT LOWER(last_name) || ' ' || UPPER(first_name) AS nombre_completo
FROM actor
WHERE last_name LIKE '%SS%';

-- Query 7
SELECT i.inventory_id AS nro_ejemplar, f.title AS nombre_pelicula
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
WHERE EXTRACT(DAY FROM r.rental_date) = 26
  AND c.city = 'Woodridge'
ORDER BY i.inventory_id;

-- Query 8
SELECT f.title AS nombre_pelicula,
       l.name AS lenguaje_original,
       f.replacement_cost AS valor_reposicion
FROM film f
JOIN language l ON f.language_id = l.language_id
ORDER BY f.replacement_cost DESC
LIMIT 10 OFFSET 10;

-- Query 9 (no da, pero no encuentro el error)
SELECT f.title AS nombre_pelicula,
       c.first_name AS nombre_cliente,
       i.inventory_id AS nro_ejemplar,
       r.rental_date AS fecha_alquiler,
       r.return_date AS fecha_devolucion
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE r.return_date IS NOT NULL
  AND AGE(r.return_date, r.rental_date) > INTERVAL '7 days';

-- Query 10
SELECT f.title AS nombre_pelicula,
       i.inventory_id AS numero_ejemplar,
       CONCAT(c.last_name, ', ', c.first_name) AS nombre_cliente,
       r.rental_date AS fecha_alquiler
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE r.return_date IS NULL;

--21 Listar el monto gastado por los customer que hayan gastado mas de 40 en el mes 6 de 2005

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_gastado
FROM 
    public.customer c
JOIN 
    public.payment p ON c.customer_id = p.customer_id
WHERE 
    EXTRACT(MONTH FROM p.payment_date) = 6
    AND EXTRACT(YEAR FROM p.payment_date) = 2005
GROUP BY 
    c.customer_id, c.first_name, c.last_name
HAVING 
    SUM(p.amount) > 40;

--22. Mostrar la cantidad del clientes hay por ciudad (revisar)

SELECT 
    city.city_id,
    city.city,
    COUNT(customer.customer_id) AS cantidad_clientes
FROM 
    public.city
LEFT JOIN 
    public.address ON city.city_id = address.city_id
LEFT JOIN 
    public.customer ON address.address_id = customer.address_id
GROUP BY 
    city.city_id, city.city
ORDER BY 
    city.city_id;

--23. Mostrar las 5 películas con mayor cantidad de actores

SELECT 
    f.film_id,
    f.title,
    COUNT(fa.actor_id) AS cantidad_actores
FROM 
    public.film f
INNER JOIN 
    public.film_actor fa ON f.film_id = fa.film_id
GROUP BY 
    f.film_id, f.title
ORDER BY 
    COUNT(fa.actor_id) DESC
LIMIT 
    5;

--24. Mostrar los días donde se hayan alquilado mas de 10 de películas de "Drama"

SELECT 
    DATE(r.rental_date) AS rental_day,
    COUNT(r.rental_id) AS total_rentals
FROM 
    public.rental r
INNER JOIN 
    public.inventory i ON r.inventory_id = i.inventory_id
INNER JOIN 
    public.film_category fc ON i.film_id = fc.film_id
INNER JOIN 
    public.category c ON fc.category_id = c.category_id
WHERE 
    c.name = 'Drama'
GROUP BY 
    rental_day
HAVING 
    COUNT(r.rental_id) > 10;

--25. Mostrar los actores que no están en ninguna película

SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
WHERE a.actor_id NOT IN (SELECT fa.actor_id FROM film_actor fa);

--26. Mostrar los clientes que hayan alquilado la película mas alquilada conjuntamente con los clientes que 
--hayan alquilado la menos alquilada con repeticiones, ordenados alfabéticamente 

WITH max_alquilada AS (
    SELECT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
    ORDER BY COUNT(r.rental_id) DESC 
    LIMIT 1
),
min_alquilada AS (
    SELECT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
    ORDER BY COUNT(r.rental_id) ASC
    LIMIT 1
)
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN min_alquilada ma ON i.film_id = ma.film_id

UNION ALL

SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN max_alquilada ma ON i.film_id = ma.film_id

ORDER BY last_name, first_name;

--27. Mostrar los clientes que hayan alquilado la película mas alquilada conjuntamente con los clientes que hayan alquilado 
--la menos alquilada sin repeticiones, ordenados alfabéticamente 

WITH max_alquilada AS (
    SELECT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
    ORDER BY COUNT(r.rental_id) DESC 
    LIMIT 1
    ), min_alquilada AS (
    SELECT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
    ORDER BY COUNT(r.rental_id) ASC
    LIMIT 1
    )
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN max_alquilada ma ON i.film_id = ma.film_id

UNION ALL

SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN min_alquilada ma ON i.film_id = ma.film_id

GROUP BY c.customer_id
ORDER BY last_name, first_name;

--28. Mostrar el/los clientes que hayan alquilo la película mas alquilada y la menos alquilada. 

WITH max_alquilada AS (
    SELECT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
    ORDER BY COUNT(r.rental_id) DESC 
    LIMIT 1
    ), min_alquilada AS (
    SELECT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
    ORDER BY COUNT(r.rental_id) ASC
    LIMIT 1
    )
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
WHERE c.customer_id IN (
    SELECT r.customer_id
    FROM rental r
    JOIN inventory i ON i.inventory_id = r.inventory_id
    JOIN max_alquilada ma ON i.film_id = ma.film_id
)
AND c.customer_id IN(
    SELECT r.customer_id
    FROM rental r
    JOIN inventory i ON i.inventory_id = r.inventory_id
    JOIN min_alquilada mia ON i.film_id = mia.film_id
)
ORDER BY c.first_name, c.last_name;

--29. Mostrar los clientes que alquilaron películas de la categoría 'New' los días en que se hayan alquilado
--más de 40 ejemplares de dicha categoría 

SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE cat.name = 'New'
AND r.rental_date::date IN (
    SELECT rental_date::date
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category cat ON fc.category_id = cat.category_id
    WHERE cat.name = 'New'
    GROUP BY r.rental_date::date
    HAVING COUNT(*) > 40
);

--30. Mostrar los días que se hayan alquilado películas (cantidad) por encima de la media
--de alquileres diaria ordenado por la cantidad de alquileres.
WITH alquileres_por_dia AS (
    SELECT DATE(rental_date) AS fecha_alquiler, COUNT(*) AS cantidad_alquileres
    FROM rental
    GROUP BY DATE(rental_date)
),
promedio_alquileres AS (
    SELECT AVG(cantidad_alquileres) AS promedio_diario
    FROM alquileres_por_dia
)
SELECT fecha_alquiler, cantidad_alquileres
FROM alquileres_por_dia, promedio_alquileres
WHERE cantidad_alquileres > promedio_diario
ORDER BY cantidad_alquileres DESC;