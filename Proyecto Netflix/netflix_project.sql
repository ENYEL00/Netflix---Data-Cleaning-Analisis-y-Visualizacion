/*
Holaaaa!!!


*/

--Ver dataset
SELECT * FROM netflix.dbo.netflix_titles

--Ver la cantidad de registros en el dataset a partir de la columna show_id

SELECT COUNT(show_id) as cantidad_registros FROM netflix.dbo.netflix_titles
--8807 registros


/*La columna show_id es la unica que columna que contiene datos unicos, a partir de esta verificaré
si hay datos duplicados
*/

with cte as(
SELECT show_id, count(*) as cuenta_duplicados
FROM netflix.dbo.netflix_titles
group by show_id)

SELECT cuenta_duplicados from cte 
where cuenta_duplicados >= 2;

-- No hay duplicados


--Verificar si existen valores nulos

SELECT
    SUM(CASE WHEN show_id is NULL THEN 1 ELSE 0 END) as showid_nulls,
    SUM(CASE WHEN type is NULL THEN 1 ELSE 0 END) as type_nulls,
    SUM(CASE WHEN title is NULL THEN 1 ELSE 0 END) as title_nulls,
    SUM(CASE WHEN director is NULL THEN 1 ELSE 0 END) as director_nulls,
    SUM(CASE WHEN cast is NULL THEN 1 ELSE 0 END) as cast_nulls,
    SUM(CASE WHEN country is NULL THEN 1 ELSE 0 END) as country_nulls,
    SUM(CASE WHEN date_added is NULL THEN 1 ELSE 0 END) as date_added_nulls,
    SUM(CASE WHEN release_year is NULL THEN 1 ELSE 0 END) as releaseyear_nulls,
    SUM(CASE WHEN rating is NULL THEN 1 ELSE 0 END) as rating_nulls,
    SUM(CASE WHEN listed_in is NULL THEN 1 ELSE 0 END) as listedin_nulls,
    SUM(CASE WHEN duration is NULL then 1 else 0 end) as duration_nulls,
    SUM(CASE WHEN description is NULL THEN 1 ELSE 0 END) as description_nulls
FROM netflix.dbo.netflix_titles;


/*
Efectivamente hay valores nulos en los datos:
director_nulls = 2634,
cast_nulls = 825,
country_nulls = 831,
date_added_nulls = 98,
rating_nulls = 4,
duration_nulls = 3

La columna director tiene la mayor cantidad y proporcion de valores nulos.
No va a ser eliminada. Prefiero utilizar otra columna para rellenarla.
Para llenarla voy a encontrar la relacion entre esta columna director y la columna cast.

En el siguiente codigo, veremos si algunos directores les gusta trabajar mas con ciertos actores.
*/

WITH cte AS
(
    SELECT title, CONCAT(director, '--', cast) AS director_cast FROM netflix.dbo.netflix_titles
)

SELECT director_cast, count(*) as cuenta from cte
group by director_cast
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

UPDATE netflix.dbo.netflix_titles
SET director  = 'Alastair Fothergill'
WHERE cast = 'David Attenborough'
AND director IS NULL;

UPDATE netflix.dbo.netflix_titles
SET director  = 'Walter C. Miller'
WHERE cast = 'Sam Kinison'
AND director IS NULL;

UPDATE netflix.dbo.netflix_titles
SET director  = 'Stan Lathan'
WHERE cast = 'Dave Chappelle'
AND director IS NULL;

UPDATE netflix.dbo.netflix_titles
SET director  = 'Edward Cotterill'
WHERE cast = 'Rachel Stirling'
AND director IS NULL;

UPDATE netflix.dbo.netflix_titles
SET director  = 'Jay Karas'
WHERE cast = 'Bill Burr'
AND director IS NULL;

/*En el paso anterior lo que hice fue verificar la relacion entre directores y cast
para validar con que actores trabajan mas cada director. Los que mas peliculas tenian
juntos y que mas datos faltantes tenian fueron los que actualicé en la tabla netflix_titles

Sin embargo, no todos tienen esa relacion, por lo que los que quedaron sin actualizar
los llenare con el texto 'Desconocido'
*/

UPDATE netflix.dbo.netflix_titles
SET director  = 'Desconocido'
WHERE director IS NULL;

--Posteriormente, tambien voy a llenar los valores nulos de la columna cast con 'Desconocido'

UPDATE netflix.dbo.netflix_titles
SET cast = 'Desconocido'
WHERE cast is NULL;

/*Ahora, voy a tratar la columna de paises (country) basandome en los valores que tengo de 
la columna directores
*/

SELECT COALESCE(nt.country, nt2.country) FROM netflix.dbo.netflix_titles nt
JOIN netflix.dbo.netflix_titles nt2 ON nt.director = nt2.director AND nt.show_id <> nt2.show_id
WHERE nt.country is NULL;

UPDATE nt1
SET nt1.country = nt2.country
FROM netflix.dbo.netflix_titles nt1
JOIN netflix.dbo.netflix_titles nt2 ON nt1.director = nt2.director AND nt1.show_id <> nt2.show_id
WHERE nt1.country is NULL

--Para confirmar si aun hay directores ligados con countries que faltaron por actualizar

SELECT director, country, date_added FROM netflix.dbo.netflix_titles
WHERE country is NULL
GROUP BY director, country, date_added;

--Estos ultimos los rellenamos como 'Desconocido'

UPDATE netflix.dbo.netflix_titles
SET country = 'Desconocido'
WHERE country is NULL;

--Ahora, voy a tratar la columna date_added

SELECT show_id, date_added FROM netflix.dbo.netflix_titles
WHERE date_added is NULL
GROUP BY show_id, date_added;

--Estos, pueden ser eliminados ya que representan un numero pequeño de registros

DELETE FROM netflix.dbo.netflix_titles
WHERE date_added is NULL;

--La columna rating tiene 4 valores nulos, tambien los eliminamos

SELECT show_id, rating FROM netflix.dbo.netflix_titles
WHERE rating is NULL

DELETE FROM netflix.dbo.netflix_titles
WHERE rating is NULL;

--Lo mismo pasa con los datos de la columna duration, tambien los eliminamos. Son 3
SELECT show_id, duration FROM netflix.dbo.netflix_titles
WHERE duration is null

DELETE FROM netflix.dbo.netflix_titles
WHERE duration is NULL;


--Ahora volvemos a correr la misma consulta para verificar si aun hay valores nulos

SELECT
    SUM(CASE WHEN show_id is NULL THEN 1 ELSE 0 END) as showid_nulls,
    SUM(CASE WHEN type is NULL THEN 1 ELSE 0 END) as type_nulls,
    SUM(CASE WHEN title is NULL THEN 1 ELSE 0 END) as title_nulls,
    SUM(CASE WHEN director is NULL THEN 1 ELSE 0 END) as director_nulls,
    SUM(CASE WHEN cast is NULL THEN 1 ELSE 0 END) as cast_nulls,
    SUM(CASE WHEN country is NULL THEN 1 ELSE 0 END) as country_nulls,
    SUM(CASE WHEN date_added is NULL THEN 1 ELSE 0 END) as date_added_nulls,
    SUM(CASE WHEN release_year is NULL THEN 1 ELSE 0 END) as releaseyear_nulls,
    SUM(CASE WHEN rating is NULL THEN 1 ELSE 0 END) as rating_nulls,
    SUM(CASE WHEN listed_in is NULL THEN 1 ELSE 0 END) as listedin_nulls,
    SUM(CASE WHEN duration is NULL then 1 else 0 end) as duration_nulls,
    SUM(CASE WHEN description is NULL THEN 1 ELSE 0 END) as description_nulls
FROM netflix.dbo.netflix_titles;

--No hay valores nulos

--Para el analisis y la visualizacion no se van a requerir ciertas columnas, como el cast y la descripcion
--Por lo que las eliminamos

ALTER TABLE netflix.dbo.netflix_titles
DROP COLUMN cast, description;


SELECT country from netflix.dbo.netflix_titles
GROUP BY country;

/*Por lo visto en algunas filas de la columna country hay mas de un pais. En el analisis
y visualizacion a realizar solo necesitamos uno por fila, por lo que solamente tomare el primero
a la izquierda, el cual supongo que es el original
*/

WITH country_parts as(
    SELECT 
        show_id, 
        country, 
        value as country_part,
        ROW_NUMBER() OVER(PARTITION BY show_id ORDER BY show_id) as row_num
    from netflix.dbo.netflix_titles nt
    CROSS APPLY STRING_SPLIT(country, ','))

SELECT show_id, country, country_part, row_num FROM country_parts
WHERE row_num = 1;

--Ahora con estos datos, voy a actualizar el campo country. Para esto voy a crear una nueva columna que toma los paises

ALTER TABLE netflix.dbo.netflix_titles
ADD country1 varchar(500);

UPDATE netflix.dbo.netflix_titles
SET country1 = cp.country_part
FROM
    (SELECT 
    show_id, 
    country, 
    value as country_part,
    ROW_NUMBER() OVER(PARTITION BY show_id ORDER BY show_id) as row_num
    from netflix.dbo.netflix_titles nt
    CROSS APPLY STRING_SPLIT(country, ',')) cp
JOIN netflix.dbo.netflix_titles nt
ON nt.show_id = cp.show_id
WHERE cp.row_num = 1

/*Con este ultimo query utilizo la consulta del cte anterior para traer los valores de los paises ya divididos
y como hay una funcion de ventana trabajando en la consulta, le indico que me entregue el primer valor particionado,
en este caso el primer pais particionado, y lo coloco en la nueva columna country1
*/

SELECT show_id, country, country1 FROM netflix.dbo.netflix_titles
--Se verifica que los datos se hayan actualizado correctamente

--Ahora podemos eliminar la columna original de country para reemplazarla con la nueva country1

ALTER TABLE netflix.dbo.netflix_titles
DROP COLUMN country;

--Ahora de aqui pasamos a la parte de visualizacion en Power BI.

select * from netflix.dbo.netflix_titles