-- Part 1

create table movie (
	movie_id serial primary key,
  title text,
  media_type_id INT references media_type(media_type_id)
);

insert into movie (title, media_type_id)
values
('Gattaca', 3),
('Voldemort and the Pesky Child', 3);

-- Part 2

alter table movie
add column genre_id int references genre(genre_id)

UPDATE
  movie
SET
  genre_id = 20
WHERE
  movie_id = 1;

UPDATE
  movie
SET
  genre_id = 22
WHERE
  movie_id = 2;


-- Part 3, JOIN

select title, name from movie
join genre on movie.genre_id = genre.genre_id

    --alias join
    select * from movie m
    join genre g on m.genre_id = g.genre_id


--Part 4
    --This is bad since it uses 2 queries
    select genre_id from genre 
    where name in ('Jazz', 'Blues')

    select * from track
    where genre_id IN (2,6)

--Nested query.  More efficient than multiple queries.
select * from track
where genre_id IN (
	select genre_id from genre
  where name IN ('Jazz', 'Blues')
)

--set values to null
SELECT * FROM employee
WHERE employee_id = 1

UPDATE employee 
SET phone = NULL
WHERE employee_id = 1

SELECT * FROM customer
WHERE company IS (IS NOT) NULL

select * from customer where fax is null