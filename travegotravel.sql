-- Create the two tables

create database travego;
create table travego.passenger
(
Passenger_id int,
Passenger_name varchar(25),
Category varchar(20),
Gender varchar(20),
Boarding_city varchar(20),
Destination_city varchar(20),
Distance int,
Bus_Type varchar(20)
);
describe passenger;

create table travego.price
(
id int,
Bus_type varchar(20),
Distance int,
Price int
);
describe price;

-- Insert data in these tables

insert into travego.passenger values

(1, "Sejal","AC","F"," Bengaluru","Chennai",350,"Sleeper"), 
(2, "Anmol", "Non-AC","M","Mumbai","Hyderabad",700,"Sitting"),
(3, "Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper"),
(4, "Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper"),
(5, "Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper"),
(6, "Ankur","AC","M","Nagpur"," Hyderabad",500,"Sitting"),
(7, "Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper"),
(8, "Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting"),
(9, "Piyush","AC","M","Pune","Nagpur",700,"Sitting");

select * from travego.passenger;

insert into travego.price values
(1,"Sleeper",350,770),
(2,"Sleeper",500,1100),
(3,"Sleeper",600,1320),
(4,"Sleeper",700,1540),
(5,"Sleeper",1000,2200),
(6,"Sleeper",1200,2640),
(7,"Sleeper",1500,2700),
(8,"Sitting",500,620),
(9,"Sitting",600,744),
(10,"Sitting",700,868),
(11,"Sitting",1000 ,1240),
(12,"Sitting",1200,1488),
(13,"Sitting",1500,1860);

select * from travego.price;

-- a. How many female passengers traveled a minimum distance of 600 KMs? 

select * from travego.passenger;
select gender from travego.passenger where distance >= 600;

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and
-- who are traveling in a sleeper bus. (2 marks)

select * from travego.passenger where distance > 500 and Bus_Type = "sleeper";

-- c. Select passenger names whose names start with the character 'S'.(2 marks)

select passenger_name from travego.passenger where Passenger_name like "s%";

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
-- Destination City, Bus type, and Price in the output. (3 marks)

select
    passenger.passenger_name,
    passenger.Boarding_city,
    passenger.Destination_city,
    passenger.Bus_Type,
    price.Price
    
from
   passenger,price where passenger.Distance = price.Distance;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in
-- a bus? (4 marks)

select passenger.Passenger_name,price.price from passenger,price where passenger.Distance >= 1000 and passenger.Bus_Type = "Sitting"; 

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? (5
-- marks)

select * from travego.passenger where Passenger_name = "pallavi";
select bus_type,price from price where distance = (select distance from passenger where passenger_name = "pallavi");

-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper (2 marks)

update passenger set category = "non_ac" where bus_type = "sleeper";
select * from travego.passenger;

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in
-- the database. (1 mark)

delete from passenger where Passenger_name = "piyush";
commit;
select * from  travego.passenger;

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if
-- required). (1 mark)

select count(*) as no_of_rows_in_passenger_table from passenger;

-- j. Delete the table passenger from the database. (1 mark)

drop table passenger;





