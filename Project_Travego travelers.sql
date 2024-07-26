use class;

# create passenger table
create table passenger
(
passenger_id int,
passenger_name varchar(25),
category varchar(20),
gender varchar(15),
boarding_city varchar(25),
destination_city varchar(25),
distance int,
bus_type varchar(25),
primary key(passenger_id)
);

# create price table
create table price
(
id int,
bus_type  varchar(25),
distance int,
price int,
primary key(id)
);

# insert data into the table

insert into passenger values
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Kushboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into price values
(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

# retrieve data from tables
select * from passenger;
select * from price;

# female passengers traveled a minimum distance of 600 KMs
select count(passenger_id) as female_passenger_count from passenger where gender = 'F' and distance >= 600;

# passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus. 
select * from passenger where bus_type = 'Sleeper' and distance > 500;

# passenger names whose names start with the character 'S'.
select passenger_name from passenger where passenger_name like 's%' or 'S%';

# price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type
select passenger_name, boarding_city, destination_city, bus_type, price from passenger p join price pr using (distance,bus_type);

# passenger name(s) and the ticket price for those who traveled 700 KMs Sitting in a bus
# using joins
select passenger_name, price  from passenger 
join price p using(bus_type, distance) 
where bus_type = 'Sitting' and distance = 700;

# using subqueries
select passenger_name, (select price from price p where bus_type  = 'Sitting' and distance = 700) as price from passenger
where bus_type  = 'Sitting' and distance = 700;

# Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji.
select passenger_name, bus_type, price from passenger p join price pr
using(bus_type, distance) where passenger_name = 'Pallavi'; 

# Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
update passenger
set category = 'Non-AC' where bus_type = 'Sleeper';

select * from passenger;

# Delete an entry from the table where the passenger name is Piyush
delete from passenger where passenger_name = 'Piyush';
select *  from passenger;
commit;

# Truncate the table passenger
truncate table passenger; # all the entries in the passenger table are removed.
select * from passenger;

# Delete the table passenger from the database. 
drop table passenger;
