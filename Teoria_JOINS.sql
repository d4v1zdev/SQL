/*
******* NATURAL JOINS ******************
--> Busca enlas tablas las columnas que se llaman igual y las une
    En la mayoria de los casos debe ser PK y FK. En los demas casos
    puede llegar a ser PELIGROSO (por encontrar columnas que se llaman igual 
    y que no tienen nada que ver)
*/
SELECT * FROM REGIONS NATURAL JOIN COUNTRIES;


/*
******* CLAUSULA USING *****************
--> En este caso las columnas se las paso yo
*/
SELECT D.DEPARTMENT_NAME, E.FIRST_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
USING (DEPARTMENT_ID);

/*
******* CLAUSULA ON *********************
--> Similar a las USING pero pudiendo hacer comparaciones con = > < <> <= >=
*/

SELECT D.DEPARTMENT_NAME, E.FIRST_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID);

-- PODEMOS TENER MAS DE UNA CONDICION
-- EJEMPLO QUEREMOS SACAR TAMBIEN LA CIUDAD

SELECT D.DEPARTMENT_NAME, E.FIRST_NAME,E.SALARY, CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
    JOIN LOCATIONS L
    ON (D.LOCATION_ID=L.LOCATION_ID)
    -- PODEMOS USAR LA CLAUSULA AND PARA PONER OTRA CONDICION
    AND SALARY>8200;

