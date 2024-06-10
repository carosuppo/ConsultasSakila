--21

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
--22

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

--23

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
--24

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

--25
SELECT 
    a.actor_id, 
    a.first_name, 
    a.last_name
FROM 
    public.actor a
LEFT JOIN 
    public.film_actor fa ON a.actor_id = fa.actor_id
WHERE 
    fa.actor_id IS NULL;