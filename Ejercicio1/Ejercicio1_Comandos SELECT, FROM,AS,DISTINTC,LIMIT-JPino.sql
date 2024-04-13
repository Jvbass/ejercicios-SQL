								/*EJERCICIO1*/
		-- Juan V. Pino Contreras
/*Entramos en la base de datos world”*/
USE world;

/* Comprueba la estructura de la tabla country*/
DESCRIBE country;

/*Realiza una query para recuperar todas las columnas y filas de la de la tabla.*/
SELECT * FROM country;

/*Visualiza los nombres de los países.*/
SELECT name FROM country;

/*Visualizar el nombre el continente y la población de cada país*/
SELECT name, continent, population FROM country;

/*Cambia la cabecera de cada columna de la consulta anterior traduciéndola al español.*/
-- Con AS damos un alias a las columnas que estan en ingles
SELECT name AS nombre, continent AS continente, population AS poblacion FROM country;

/* Usando la columna “IndepYear” (Año de independencia), Averigua el número de años que un país lleva independiente 
suponiendo que estamos ahora mismo en el 2024. Debes visualizar el nombre del país el año de independencia y el 
número de años transcurridos.
Visualiza el nombre del país el año de independencia el número de años transcurridos.
Debes poner como nombre de columna “Años Transcurridos”*/
-- Con AS damos un alias a la columna seleccionada o al resultado del calculo de años en la consulta
SELECT name AS nombre_pais, indepyear AS año_independencia, (YEAR(NOW()) - indepyear) AS años_transcurridos FROM country;

/*Visualiza los continentes sin que aparezcan repetidos.*/
-- Con DISTINCT se eliminan datos duplicados en la consulta
SELECT DISTINCT continent FROM country;

/*Visualizar los 5 primeros países.*/
-- Usamos LIMIT 5 para obtener 5 paises
SELECT name FROM country LIMIT 5;

/*Visualizar los países desde la posición 10 a la 15*/
-- Usamos LIMIT 9, 5. El 9 indica que salta los primeros 9 registros y con 5 indica que devuelva 5.
SELECT name FROM country LIMIT 9, 5;



