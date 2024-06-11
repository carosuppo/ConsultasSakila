--21. Listar el monto gastado por los customer que hayan gastado mas de 40 en el mes 6 de 2005

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
