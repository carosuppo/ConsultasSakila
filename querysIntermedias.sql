-- 11. Mostrar 10 películas mas alquiladas

SELECT f.title, COUNT(*) AS "Veces Alquilada"
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY COUNT(*) DESC
LIMIT 10;

-- 12. Listar las películas alquiladas por el cliente "OWENS, CARMEN"

SELECT f.title
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.last_name = 'OWENS' AND c.first_name = 'CARMEN';

-- 13. Buscar los pagos que no han sido asignados a ningún alquiler 

SELECT *
FROM payment
WHERE rental_id IS NULL;

-- 14. Seleccionar todas las películas que son en "Mandarin" y listar las por orden alfabético, mostrando el titulo de la película y el idioma 
-- ingresando el idioma en minúsculas

SELECT f.title AS "Título de la Película", l.name AS "Idioma"
FROM film f
JOIN language l ON f.language_id = l.language_id
WHERE LOWER(l.name) = 'mandarin'
ORDER BY f.title ASC;

-- 15. Mostrar los clientes que hayan alquilado mas de 1 vez la misma película

SELECT c.customer_id, c.first_name, c.last_name, f.title, COUNT(*) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, f.title
HAVING COUNT(*) > 1
ORDER BY c.last_name, c.first_name, f.title;

-- 16. Mostrar los totales de alquileres por mes del año 2005 (revisar, no se si esta bien la logica)

SELECT 
    EXTRACT(YEAR FROM p.payment_date) AS year,
    EXTRACT(MONTH FROM p.payment_date) AS month,
    SUM(p.amount) AS total_amount
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
WHERE 
    EXTRACT(YEAR FROM p.payment_date) = 2005
GROUP BY 
    EXTRACT(YEAR FROM p.payment_date), EXTRACT(MONTH FROM p.payment_date)
ORDER BY 
    year, month;

-- 17. Mostrar los totales históricos de alquileres discriminados por categoría. Ordene los resultados por el campo monto en orden 
-- descendente al campo calculado llamarlo monto

SELECT c.name AS "Categoría", SUM(p.amount) AS "Monto"
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY "Monto" DESC;

-- 18. Listar todos los actores de las películas alquiladas en el periodo 7 del año 2005. Ordenados alfabéticamente representados 
-- "APELLIDO, nombre" renombrar el campo como Actor

SELECT DISTINCT CONCAT(a.last_name, ', ', LOWER(a.first_name)) AS "Actor"
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_actor fa ON i.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE EXTRACT(YEAR FROM r.rental_date) = 2005 AND EXTRACT(MONTH FROM r.rental_date) = 7
ORDER BY CONCAT(a.last_name, ', ', LOWER(a.first_name)) ASC;

-- 19. Listar el monto gastado por el customer last_name=SHAW; first_name=CLARA; 

SELECT c.first_name, c.last_name, SUM(p.amount) AS "Monto"
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE c.last_name = 'SHAW' AND c.first_name = 'CLARA'
GROUP BY c.first_name, c.last_name;

-- 20. Listar el valor mas alto de los alquileres registrados en el año 2005. Mostrar además quien fue el cliente que abono ese alquiler

WITH max_payment AS (
    SELECT MAX(p.amount) AS max_amount
    FROM payment p
    WHERE EXTRACT(YEAR FROM p.payment_date) = 2005
)
SELECT c.first_name AS "Nombre", c.last_name AS "Apellido", p.amount AS "Monto"
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN customer c ON p.customer_id = c.customer_id
JOIN max_payment mp ON p.amount = mp.max_amount
WHERE EXTRACT(YEAR FROM p.payment_date) = 2005
ORDER BY p.amount DESC
LIMIT 1;
