-- Indicar el nUmero de empleados del departamento 50

SELECT COUNT(*) FROM EMPLOYEES
WHERE DEPARTMENT_ID=50;

-- Indicar el nUmero de empleados que entraron en el aNo 2007 a trabajar

SELECT COUNT(*) FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '01/01/2007' AND '31/12/2007';

-- Indicar la diferencia entre el sueldo mas alto y al minimo

SELECT MAX(SALARY),MIN(SALARY), MAX(SALARY) - MIN(SALARY) FROM EMPLOYEES;

-- Visualizar la suma del salario del departamento 100

SELECT SUM(SALARY) FROM EMPLOYEES
WHERE DEPARTMENT_ID=100;

-- Mostrar el salario medio por departamento, con dos decimales

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),2)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- Mostrar el country_id y el numero de ciudades que hay en ese pais

SELECT COUNTRY_ID, COUNT(CITY)
FROM LOCATIONS
GROUP BY COUNTRY_ID;

-- Mostrar el promedio de salario de los empleados por departamento 
que tengan comision

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),2)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- Mostrar los aNos en que ingresaron mas de 10 empleados

SELECT TO_CHAR(HIRE_DATE,'YYYY'), COUNT (*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
HAVING COUNT(*) >10;

-- Mostrar por departamento y aNo el nUmero de empleados que ingresaron

SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE,'YYYY'), COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY DEPARTMENT_ID;

-- Mostrar los departament_id de los departamentos que tienen managers 
-- que tienen a cargo mas de 5 empleados

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, MANAGER_ID
HAVING COUNT(EMPLOYEE_ID) > 5;
