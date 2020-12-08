CREATE TABLE customers (
  id        SERIAL PRIMARY KEY,
  name      VARCHAR(30) NOT NULL,
  email     VARCHAR(120) NOT NULL,
  address   VARCHAR(120),
  city      VARCHAR(30),
  postcode  VARCHAR(12),
  country   VARCHAR(20)
);

create table hotels ( 
	id		SERIAL primary key,
	NAME	VARCHAR(30) NOT NULL,
	rooms	int not null,
	postcode	VARCHAR(12)
);

create table mentors (
  id			SERIAL primary key,
  name			varchar(20) not null,
  years			int not null, 
  address		varchar(40),
  language		varchar(20) not null
)

CREATE TABLE bookings (
  id               SERIAL PRIMARY KEY,
  customer_id      INT REFERENCES customers(id),
  hotel_id         INT REFERENCES hotels(id),
  checkin_date     DATE NOT NULL,
  nights           INT NOT NULL
);

INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('John Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Triple Point Hotel', 10, 'CM194JS');
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 1, '2019-10-01', 2);
insert into customers (name, email, city, country) values ('Angelo Zarate', 'mrlmister', 'Roma', 'hetalia');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Royal Cosmos Hotel', 5, 'TR209AX');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Pacific Petal Motel', 15, 'BN180TG');
insert into hotels (name, rooms, postcode) values ('gran budapest', 18, 'BL5643');
insert into hotels (name, rooms, postcode) values ('gran bucarest', 21, 'IN7612');
insert into customers (name, email, address, city, country) values ('mr keshon', 'kgmail','via dandolo', 'tibur', 'norway');

insert into mentors (name, years, address, language) values ('mr M', 5 ,'via gram', 'Python');
insert into mentors (name, years, address, language) values ('mr L', 2 ,'via graul', 'HTML');
insert into mentors (name, years, address, language) values ('mr second', 6 ,'via grall', 'CSS');
insert into mentors (name, years, address, language) values ('mr maybe', 1 ,'viale gram', 'Javascript');
insert into mentors (name, years, address, language) values ('mr not', 8 ,'indeed', 'Java');

create table students (
	id			serial primary key,
	name 		varchar(20) not null, 
	address		varchar(20),
	graduated	Boolean not null
)

insert into students (name, address, graduated) values ('ignored loser', 'indeed', TRUE);
insert into students (name, address, graduated) values ('ignored volunteer', 'close', TRUE);
insert into students (name, address, graduated) values ('la la land', 'scedule', TRUE);
insert into students (name, address, graduated) values ('ignored loser', 'maybe', False);
insert into students (name, address, graduated) values ('poser', 'liute', false);
insert into students (name, address, graduated) values ('engineer', 'leven', TRUE);

select name from students;

create table class(
	id				serial primary key,
	leader_mentor	INT references mentors (id),
	topic			varchar(20) not null,
	date			date not null, 
	location		varchar(30) not null
);

--ok so, with classes we dont need to reference the location or topic
insert into class (leader_mentor, topic, date,location) values ('2', 'CSS', '2020-02-12', 'indeed');
insert into class (leader_mentor, topic, date, location) values ('5', 'Javascript', '2020-08-30', 'via graul');
insert into class (leader_mentor, topic, date, location) values ('4', 'Java', '2020-08-30', 'via ravenna');
insert into class (leader_mentor, topic, date, location) values ('1', 'HTML', '2020-08-30', 'via quasina');
insert into class (leader_mentor, topic, date, location) values ('3', 'Python', '2020-08-30', 'via kappa');


create table attendance(
	id			serial primary key, 
	student_id	INT references students(id),
	topic_id	int references class(id)
)

insert into attendance (student_id, topic_id) values ('2', '2');
insert into attendance (student_id, topic_id) values ('1', '5');
insert into attendance (student_id, topic_id) values ('3', '4');
insert into attendance (student_id, topic_id) values ('4', '2');

--here some for the bookings
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (2, 3, '2020-10-01', 5);
--customer_id 4 doesnt exist so its not there
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (4, 5, '2018-04-12', 5);

SELECT * FROM customers INNER JOIN bookings ON customers.id=bookings.customer_id;
SELECT * FROM customers INNER JOIN bookings ON customers.id=bookings.hotel_id;
SELECT * FROM customers INNER JOIN bookings ON customers.id=2;
SELECT * FROM bookings
INNER JOIN customers ON customers.id=bookings.customer_id
INNER JOIN hotels ON hotels.id=bookings.hotel_id;

SELECT bookings.checkin_date, customers.name, hotels.name FROM bookings
INNER JOIN customers ON customers.id=bookings.customer_id
INNER JOIN hotels ON hotels.id=bookings.hotel_id
WHERE customers.id=4;

SELECT * FROM hotels

select * from customers
select * from hotels
select * from customers

SELECT name,address,city FROM customers;
select * from hotels where rooms < 10
select * from customers where name='Angelo Zarate'
select * from bookings where id=2

SELECT * FROM hotels WHERE name='Royal Cosmos Hotel' OR rooms > 10;
select * from hotels where name='Laurence Lebihan'

ALTER TABLE customers ADD COLUMN date_of_birth DATE;
alter table customers rename column date_of_birth to birthday;
alter table customers drop column birthday;

create table missing ()
drop table missing

UPDATE hotels SET postcode='L10XYZ' WHERE name='Pacific Petal Motel';
update hotels set rooms=35 where name='Royal Cosmos Hotel'
update customers set address='2 Blue Street', city='Glasgow' where name='John Smith'
update bookings set nights=25 where id=1

delete from customers where id=2


