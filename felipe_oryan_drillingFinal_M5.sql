--Insertar Customer 
INSERT INTO customer (store_id, first_name, last_name, email, address_id, activebool, create_date, last_update,active)
VALUES (1, 'Francisco', 'Jimenez', 'f.jimenez@gmail.com', 1, true, CURRENT_DATE, CURRENT_TIMESTAMP, 1
);

SELECT *FROM customer WHERE email = 'f.jimenez@gmail.com'; --Consulta

-- Modificar Customer
UPDATE customer
SET email = 'francisco.j@gmail.com'
WHERE customer_id = 606;

--Eliminar Customer
DELETE FROM customer
WHERE customer_id = 606;


-- Insertar Staff
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture
)
VALUES ('Joselito', 'Gonzalez', 1, 'joselito.gonzalez@gmail.com', 1, true, 'joselitogonzalez', 'password123', CURRENT_TIMESTAMP, 'profile_picture.jpg'
);

SELECT *FROM staff WHERE email = 'joselito.gonzalez@gmail.com'; --Consulta

--Modificar Staff
UPDATE staff
SET email = 'joselito2.0@gmail.com'
WHERE staff_id = 6;

--Eliminar staff
DELETE FROM staff
WHERE staff_id = 6;


--Insertar Actor
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Mario', 'Moreno', CURRENT_TIMESTAMP
);

SELECT *FROM actor WHERE last_name= 'Moreno'; --Consulta

--Modificar Actor
UPDATE actor
SET last_name = 'Cantinflas'
WHERE actor_id = 205;

--Eliminar Actor
DELETE FROM actor
WHERE actor_id = 204;



-- Listar todas las "rental" con los datos del "customer" dado un año y mes.
SELECT r.rental_id, r.rental_date, c.customer_id, c.first_name, c.last_name, c.email
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
WHERE EXTRACT(MONTH FROM r.rental_date) = 05 --mes mayo
  AND EXTRACT(YEAR FROM r.rental_date) = 2005 --año 2005

 
-- Listar Número, Fecha(payment_date) y Total (amount) de todas las "payment".
SELECT payment_id, payment_date, amount FROM payment;
SELECT DATE(payment_date) AS fecha, COUNT(*) AS cantidad_pagos, SUM(amount) AS total_pagado
FROM payment
GROUP BY DATE(payment_date);


--Listar todas las "film" del año 2006 que contengan un (rental_rate) mayor a 4.0
select * from film where release_year = 2006 and rental_rate > 4.0;



-- 5. Realiza un Diccionario de datos que contenga el nombre de las tablas y colmunas, si éstas pueden ser nulas, y su tipo de dato correspondiente.

SELECT
 t1.TABLE_NAME AS tabla_nombre,
 t1.COLUMN_NAME AS columna_nombre,
 t1.COLUMN_DEFAULT AS columna_defecto,
 t1.IS_NULLABLE AS columna_nulo,
 t1.DATA_TYPE AS columna_tipo_dato,
 COALESCE(t1.NUMERIC_PRECISION,
 t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
 PG_CATALOG.COL_DESCRIPTION(t2.OID,
 t1.DTD_IDENTIFIER::int) AS columna_descripcion,
 t1.DOMAIN_NAME AS columna_dominio
FROM
 INFORMATION_SCHEMA.COLUMNS t1
 INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
 t1.TABLE_SCHEMA = 'public'
ORDER BY
 t1.TABLE_NAME;
