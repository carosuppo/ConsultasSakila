-- Mostrar 10 películas mas alquiladas (table rental -> inventory -> film)
SELECT f.title, COUNT(*) AS "Veces Alquilada"
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Listar las películas alquiladas por el cliente "OWENS, CARMEN"
SELECT f.title
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.last_name = 'OWENS' AND c.first_name = 'CARMEN';

-- Buscar los pagos que no han sido asignados a ningún alquiler (table payment -> rental)
SELECT *
FROM payment
WHERE rental_id IS NULL;

-- Seleccionar todas las películas que son en "Mandarin" y listar las por orden alfabético, mostrando el titulo de la película y el idioma 
-- ingresando el idioma en minúsculas. (table film -> language)
SELECT f.title AS "Título de la Película", l.name AS "Idioma"
FROM film f
JOIN language l ON f.language_id = l.language_id
WHERE LOWER(l.name) = 'mandarin'
ORDER BY f.title ASC;

-- Mostrar los clientes que hayan alquilado mas de 1 vez la misma película 

-- Mostrar los totales de alquileres por mes del año 2005 

-- Mostrar los totales históricos de alquileres discriminados por categoría. Ordene los resultados por el campo monto en orden descendente al campo calculado llamarlo monto. 

-- Listar todos los actores de las películas alquiladas en el periodo 7 del año 2005. Ordenados alfabéticamente representados "APELLIDO, nombre" renombrar el campo como Actor 

-- Listar el monto gastado por el customer last_name=SHAW; first_name=CLARA; 

-- Listar el valor mas alto de los alquileres registrados en el año 2005. Mostrar además quien fue el cliente que abono ese alquiler. 
