vehicles=# SELECT owners.id as id, owners.first_name, vehicles.id as id, make, model, year, price, owner_id
FROM owners
LEFT OUTER JOIN vehicles
ON owners.id = vehicles.owner_id-- write your queries here

-- primary should not be null, unique and shouldnt be changed
vehicles=# SELECT owners.first_name, COUNT(*)
FROM owners
JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY first_name;


SELECT owners.first_name, ROUND(avg(vehicles.price)) AS average_price, COUNT(*)
FROM owners
JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY first_name 
HAVING ROUND(avg(vehicles.price)) >= 10000 AND COUNT(*) >= 2
ORDER BY first_name desc;

-- owners
-- ------
-- shana | vehicle 1 | 1 (vehicle id)
--       | vehicle 2 | 1
-- ------
-- DAVIS | vehicle 1
--       | bicycle 1