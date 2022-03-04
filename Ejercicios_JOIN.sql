/*Visualizar el nombre del pais y el nombre de la region. 
(tablas COUNTRIES y REGIONS). Usar un natural join*/

SELECT C.COUNTRY_NAME, R.REGION_NAME
FROM COUNTRIES C NATURAL JOIN REGIONS R;


/*Usando el ejemplo anterior visualizar tambien el nombre de la ciudad, 
incorporando una nueva tabla (LOCATIONS)*/

SELECT C.COUNTRY_NAME, R.REGION_NAME, CITY
FROM COUNTRIES C NATURAL JOIN REGIONS R
NATURAL JOIN LOCATIONS;

/*Indicar el nombre del departamento y la media de sus salarios*/


