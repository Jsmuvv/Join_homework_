--Question 1
SELECT first_name, last_name, district
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
WHERE district = 'Texas';



SELECT *
FROM customer 
GROUP BY customer_id;


-- Question 2
SELECT first_name, last_name, amount
FROM payment p 
JOIN customer c 
ON p.customer_id = c.customer_id 
WHERE amount > 7;




-- Question 3
SELECT *
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment p 
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);


      532|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|


-- Question 4
SELECT first_name, last_name, address, city, district, country
FROM customer c
JOIN address a
ON c.address_id = a.address_id
JOIN city ci 
ON ci.city_id = a.city_id
JOIN country co
ON ci.country_id = co.country_id
WHERE country = 'Argentina';








-- Question 5
SELECT fc.category_id, c.name, COUNT(*) AS num_movies_in_cat
FROM film_category fc
JOIN category c 
ON fc.category_id = c.category_id 
GROUP BY fc.category_id, c.name
ORDER BY num_movies_in_cat DESC;




-- Question 6
SELECT fa.film_id, f.title, COUNT(*) AS num_actors
FROM film_actor fa
JOIN film f
ON fa.film_id = f.film_id
GROUP BY fa.film_id, f.title
ORDER BY num_actors DESC
LIMIT 1;

SELECT *
FROM film 
WHERE film_id = (
	SELECT film_id
	FROM film_actor
	GROUP BY film_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
);



-- Question 7 
SELECT fa.actor_id, first_name, last_name, COUNT(*) AS num_films
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id 
GROUP BY fa.actor_id, first_name, last_name
ORDER BY num_films
LIMIT 1;




-- Question 8
SELECT *
FROM country 
WHERE country_id = (
	SELECT country_id
	FROM city
	GROUP BY country_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
);

SELECT ci.country_id, co.country, COUNT(*)
FROM city ci
JOIN country co
ON ci.country_id = co.country_id 
GROUP BY ci.country_id, co.country
ORDER BY COUNT(*) DESC;




-- Question 9
SELECT fa.actor_id, first_name, last_name, COUNT(*)
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id 
GROUP BY fa.actor_id, first_name, last_name
HAVING COUNT(*) BETWEEN 20 AND 25;

















