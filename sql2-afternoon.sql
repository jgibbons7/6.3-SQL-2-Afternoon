-- Section 1
-- 1 
select * from invoice
where invoice_id IN (
	select invoice_id from invoice_line
  where unit_price > .99
  )

-- 2
select invoice.invoice_date, invoice.total, customer.first_name, customer.last_name
from invoice
join customer on invoice.customer_id = customer.customer_id

-- 3
select customer.first_name, customer.last_name, employee.first_name, employee.last_name
from customer
join employee on customer.support_rep_id = employee.employee_id

-- 4

SELECT album.title, artist.name
FROM album 
JOIN artist ON album.artist_id = artist.artist_id;

-- 5
SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music'

-- 6
SELECT t.name
FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5

-- 7 
SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id

-- 8
SELECT t.name, a.title
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk'

-- Section 2
--1
SELECT *
FROM invoice
WHERE invoice_id IN 
(SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99)

--2
SELECT *
FROM playlist_track
WHERE playlist_id IN 
(SELECT playlist_id FROM playlist WHERE name = 'Music')

--3
SELECT name
FROM track
WHERE track_id IN 
(select track_id from playlist_track where playlist_id = 5)

--4
SELECT *
FROM track
WHERE genre_id IN 
(SELECT genre_id FROM genre WHERE name = 'Comedy')

--5
SELECT *
FROM track
WHERE album_id IN 
(SELECT album_id FROM album WHERE title = 'Fireball')

--6
SELECT *
FROM track
WHERE album_id IN 
(SELECT album_id FROM album WHERE artist_id IN ( 
    SELECT artist_id FROM artist WHERE name = 'Queen'
  ))

-- Section 3
--1
UPDATE customer
SET fax = null
WHERE fax is not null

--2
UPDATE customer
SET company = 'Self'
WHERE company = null

--3
UPDATE customer 
SET last_name = 'Thompson' 
WHERE first_name = 'Julia' AND last_name = 'Barnett'

--4
UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl'

--5
UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
  AND composer is null

-- Section 4
--1
SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name

--2
SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name

--3
SELECT ar.name, COUNT(*)
FROM album al
JOIN artist ar ON ar.artist_id = al.artist_id
GROUP BY ar.name

-- Section 5
--1
SELECT DISTINCT composer
FROM track

--2
SELECT DISTINCT billing_postal_code
FROM invoice

--3
SELECT DISTINCT company
FROM customer

-- Section 6
--1
DELETE 
FROM practice_delete 
WHERE type = 'bronze'

--2
DELETE 
FROM practice_delete 
WHERE type = 'silver'

--3
DELETE 
FROM practice_delete 
WHERE value = 150

--Section 7

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  price DEC(5,2)
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(id),
  user_id INT REFERENCES users(id)
)