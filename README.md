# travego.passenger
DATA BASE CREATION DDL,DML,DCL COMMANDS FINDING PASSGER PRICE AND THEIR LACTION HOW LONG TO REACH THE DESTINATION
Travego Database README
Introduction
This SQL script is designed to create and interact with the travego database. It includes the creation of two tables, passenger and price, along with sample data inserts and various queries to extract meaningful information.

Table Descriptions
Table: passenger
Passenger_id: Unique identifier for each passenger.
Passenger_name: Name of the passenger.
Category: Passenger category (AC, Non-AC).
Gender: Gender of the passenger.
Boarding_city: City where the passenger boards the bus.
Destination_city: City where the passenger's journey ends.
Distance: Travel distance in kilometers.
Bus_Type: Type of bus the passenger is traveling in (Sleeper, Sitting).
Table: price
id: Unique identifier for each price entry.
Bus_type: Type of bus (Sleeper, Sitting).
Distance: Travel distance corresponding to the price.
Price: Cost of the ticket for the specified distance.
Queries
a. How many female passengers traveled a minimum distance of 600 KMs?

sql
Copy code
SELECT * FROM travego.passenger;
SELECT gender FROM travego.passenger WHERE distance >= 600;
b. Display passenger details with travel distance greater than 500 and traveling in a sleeper bus.

sql
Copy code
SELECT * FROM travego.passenger WHERE distance > 500 AND Bus_Type = "Sleeper";
c. Select passenger names starting with the character 'S'.

sql
Copy code
SELECT passenger_name FROM travego.passenger WHERE Passenger_name LIKE "S%";
d. Calculate the price charged for each passenger.

sql
Copy code
SELECT
    passenger.passenger_name,
    passenger.Boarding_city,
    passenger.Destination_city,
    passenger.Bus_Type,
    price.Price
FROM
    passenger, price
WHERE
    passenger.Distance = price.Distance;
e. Passenger names and ticket prices for those who traveled 1000 KMs sitting in a bus.

sql
Copy code
SELECT passenger.Passenger_name, price.price FROM passenger, price WHERE passenger.Distance >= 1000 AND passenger.Bus_Type = "Sitting";
f. Sitting and Sleeper bus charge for Pallavi traveling from Bangalore to Panaji.

sql
Copy code
SELECT * FROM travego.passenger WHERE Passenger_name = "Pallavi";
SELECT bus_type, price FROM price WHERE distance = (SELECT distance FROM passenger WHERE passenger_name = "Pallavi");
g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper.

sql
Copy code
UPDATE passenger SET category = "Non-AC" WHERE bus_type = "Sleeper";
h. Delete an entry where the passenger name is Piyush and commit this change.

sql
Copy code
DELETE FROM passenger WHERE Passenger_name = "Piyush";
COMMIT;
i. Truncate the table passenger and comment on the number of rows in the table.

sql
Copy code
SELECT COUNT(*) AS no_of_rows_in_passenger_table FROM passenger;
j. Delete the table passenger from the database.

sql
Copy code
DROP TABLE passenger;
