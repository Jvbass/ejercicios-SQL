															/*EJERCICIO2*/
										-- Juan V. Pino Contreras
/*Entra en la base de datos sakila*/
USE sakila;

/*Seleccionar los campos “address” y “district” de la tabla “address” donde distrito sea Texas. */
SELECT address, district FROM address WHERE district = "Texas";

/*Seleccionar todas las columnas de la table “payment” cuyo campo “amount” sea mayor que 11.*/
SELECT * FROM payment WHERE amount > 11;

/*Visualizar todos los actores de la tabla “actor” cuyo first_name sea “Penelope”. 
Prueba con mayúscula y minúsculas para ver si devuelve el mismo resultado.*/
-- En ambas consultas devuelve el mismo resultado
SELECT first_name FROM actor WHERE first_name = "penelope";
SELECT first_name FROM actor WHERE first_name = "PENELOPE";

/*Hacer lo mismo, pero con la cláusula BINARY para comprobar la diferencia. */
-- La consulta con "penelope" com minuscula no devuelve resultado.
-- Usando BINARY las letras mayúsculas y minúsculas las trata como distintas durante la comparación.
SELECT first_name FROM actor WHERE BINARY first_name = "PENELOPE";
SELECT first_name FROM actor WHERE BINARY first_name = "penelope";

 /*Visualizar las columnas first_name y last_name de la tabla “customer” de aquellos clientes que 
 esté inactivos (campo “active” igual a 0) .*/
SELECT first_name, last_name FROM customer WHERE active = 0;
 
 /*Prueba cambiando la igualdad del CERO por un False. ¿funciona? Si es así ¿Cuál es el motivo?*/
 -- Si funciona. MySQL interpreta el valor BOOLEANO FALSE como 0 y TRUE como 1.
SELECT first_name, last_name FROM customer WHERE active = false;
 
 /*¿Qué resultados daría el comando siguiente? ¿Los clientes activos o los 
inactivos : */
-- Muestra los clientes activos. Los valores 0 y 1 MySQL los interpreta como valores Boolean, por tanto en la consulta 
-- 'WHERE active'; lo interpreta como active = true
SELECT first_name,last_name,active FROM customer WHERE active;
 
/*¿Y el siguiente?¿Activos o inactivos? */
-- Muestra los clientes inactivos. En MySQL con el simbolo ! evaluamos el valor falso o valor contrario del campo comparatorio 
SELECT first_name,last_name,active from customer where !active;

/* Si ejecutamos esta query contra la tabla “rental”:*/
-- Devuelve valores nulos. 
SELECT * FROM rental where rental_date='2006-02-14';
DESCRIBE rental;

/*Verás que no aparece ninguna fila, a pesar de que si existen registros en esa fecha. 
¿A qué es debido? ¿Cómo podríamos visualizar alguno de los registros?*/
/* Esto porque el campo de comparacion retal_date se lo estamos pasando con un tipo de dato DATE,
 y el campo rental_date de la tabla esta en DATETIME, es decir fecha y hora.*/
-- Con DATE(rental_date) extramos el campo de tipo fecha del valor de rental_date.
DESC rental;
SELECT * FROM rental WHERE DATE(rental_date) = '2006-02-14';

 

