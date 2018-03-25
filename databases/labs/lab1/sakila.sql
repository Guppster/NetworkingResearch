EXPLAIN SELECT first_name, last_name, count(*) films FROM actor
JOIN film_actor USING (actor_id)
GROUP BY actor_id, first_name, last_name
ORDER BY films DESC
LIMIT 10;

EXPLAIN SELECT first_name, last_name,
(SELECT count(*) FROM film_actor fa WHERE fa.actor_id = actor.actor_id)
films FROM actor
ORDER BY films DESC
LIMIT 10;

SELECT CONCAT(first_name, ' ', last_name) AS name, email
FROM customer where customer_id IN
(SELECT customer_id FROM rental WHERE inventory_id IN
(SELECT inventory_id FROM inventory WHERE film_id IN
(SELECT film_id FROM film_category JOIN category USING (category_id)
WHERE category.name='Action')))
ORDER BY last_name ASC;

SELECT CONCAT(first_name, ' ', last_name) AS name, email
FROM customer
  JOIN rental USING (customer_id)
  JOIN inventory USING (inventory_id)
  JOIN film_category USING(film_id)
  JOIN category USING (category_id)
WHERE category.name = 'Action'
ORDER BY last_name ASC;

#Find average payment for each customer
SELECT customer_id, first_name, last_name, AVG(amount) as amount
FROM customer JOIN payment USING (customer_id)
GROUP BY customer_id;

EXPLAIN SELECT customer_id, first_name, last_name, (SELECT AVG(amount)
FROM payment WHERE payment.customer_id=customer.customer_id GROUP BY
customer_id) AS amount FROM customer;

#Do it yourself

#Find the name of each film, it's category and the
#aggregate number of films that fall within that category

##Doesnt work. My attempt at using subqueries
SELECT title,
  (SELECT name from category WHERE category_id IN
    (SELECT category_id FROM film_category WHERE film_category.film_id=film.film_id)) AS name,
  (SELECT count(*) from film WHERE name='Action')
FROM film f;

# Doesnt work. My attempt at using joins
SELECT title, name,  count(category.name) movies_in_category FROM film
  JOIN film_category USING (film_id)
  JOIN category USING (category_id)
GROUP BY title;

#Works
SELECT original.title, category.name, temp.movies_in_category FROM film original
  JOIN film_category USING (film_id)
  JOIN category USING (category_id)
  JOIN(
        SELECT title, name, count(*) as movies_in_category FROM film
          JOIN film_category USING (film_id)
          JOIN category USING (category_id)
        GROUP BY category.name
      ) temp on category.name = temp.name;

#Find all payments that exceed the average for each customer
SELECT payment_id, first_name, last_name, amount
FROM customer JOIN payment USING (customer_id)
WHERE payment.amount > (SELECT AVG(amount) from payment);

SELECT DATE(rental_date) as 'date', count(*) as number_rented FROM rental
GROUP BY DATE(rental_date);

SELECT DATE(rental_date) as 'date', count(*) as books_rented FROM rental
GROUP BY DATE(rental_date)
ORDER BY books_rented DESC
LIMIT 10

SELECT first_name, last_name FROM actor
WHERE actor_id IN
(SELECT actor_id FROM film_actor WHERE film_id IN
(SELECT film_id FROM film WHERE title='FLASH WARS'))


###EXAM
SELECT first_name, last_name FROM actor
WHERE actor_id IN
      (SELECT actor_id FROM film_actor WHERE film_id IN
                                             (SELECT film_id, count(*) as count FROM film GROUP BY film_id ORDER BY count DESC LIMIT 1));

SELECT first_name, last_name FROM
  (SELECT first_name, last_name, actor_id, count(*) as count FROM film_actor
    JOIN actor USING (actor_id) GROUP BY film_id ORDER BY count ASC LIMIT 1) actor


SELECT first_name, last_name, count(*) as count FROM film_actor
  JOIN actor USING (actor_id) GROUP BY film_id ORDER BY count ASC