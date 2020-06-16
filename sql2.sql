create table racers (
	racerId serial primary key,
  name text,
  age int,
  country text
);

INSERT INTO racers (name, age, country)
VALUES
('Jergen Ikea', 29, 'Sweden'),
('Mario Marinara', 54, 'Italy'),
('Otto von Schokolade', 13, 'Switzerland'),
('Dave Johnson', 25, 'Canada'),
('Luigi Linguini', 24, 'Italy');


select distinct country from racers;


alter table racers
add column team varchar(300);


alter table racers
drop column team;


alter table racers
alter name
type varchar(100);


alter table racers
rename column country
to "nation";


alter table racers
rename to "bike_racers";


CREATE TABLE bikes (
  bikeId SERIAL PRIMARY KEY,
  racerId INTEGER REFERENCES bike_racers(racerId),
  type TEXT,
  color TEXT
);


INSERT INTO bikes (racerId, type, color)
VALUES
(1, 'Meatball Machine', 'blue'),
(3, 'Chococycle', 'brown'),
(4, 'Regular', 'gray'),
(2, 'Fizzoli', 'red'),
(5, 'Fizzoli', 'green');


select *
from bike_racers
join bikes on bike_racers.racerId = bikes.racerId


select * from bike_racers
where racerId in (
  	select racerId from bikes
  	where type = 'Fizzoli'
		)