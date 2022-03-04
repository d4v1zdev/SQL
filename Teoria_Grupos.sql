--   FUNCIONES DE GRUPO -------------

--   ************************************************************************
--   1. AVG - MAX - MIN

/* AVG --> Nos permite sacar la media de una determinada fila o un 
grupo de filas*/

SELECT AVG(SALARY) FROM EMPLOYEES;

/* MAX --> Nos permite sacar el maximo de una determinada fila o un 
grupo de filas*/
SELECT MAX(SALARY) FROM EMPLOYEES;

/* MIN --> Nos permite sacar el minimo de una determinada fila o un 
grupo de filas*/
SELECT MIN(SALARY) FROM EMPLOYEES;
-- SE PUEDE MEZCLAR LAS DIFERENTES FUNCIONES DE GRUPO
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY) FROM EMPLOYEES;

-- Y USAR LA CLASE WHERE
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY) FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

-- Con AVG solo se pueden usar valores numericos pero cn MAX y MIN si se pueden
-- usar otro tipo de datos

SELECT MAX(FIRST_NAME), MIN(HIRE_DATE) FROM EMPLOYEES;
SELECT MAX(FIRST_NAME), MIN(FIRST_NAME) FROM EMPLOYEES;

--   ************************************************************************
--   2. FUNCION DE GRUPO COUNT
     /* COUNT --> Cuenta todo hasta filas duplicadas PERO NO CUENTA LOS NULOS */

SELECT COUNT(FIRST_NAME) FROM EMPLOYEES;

-- EJEMPLO DE NO CONTAR NULOS. CUANTOS TRABAJADORES NO TIENEN COMISION

SELECT COUNT(SALARY), COUNT(COMMISSION_PCT) FROM EMPLOYEES;

-- PARA CONTAR TODOS LOS EMPLEADOS. Usaremos un COUNT de la clave Primaria (PK)

SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES;

-- SI NO SABEMOS LA PK O ESTA EN MUY COMPLICADA

SELECT COUNT(*) FROM EMPLOYEES;

SELECT COUNT(*) FROM EMPLOYEES
WHERE SALARY > 6000;

-- PARA CONTAR VALORES DISTINTOS

SELECT COUNT(DISTINCT FIRST_NAME) FROM EMPLOYEES;

--   ************************************************************************
--   3. FUNCION SUM
     --> Suma valores
     
SELECT SUM(SALARY) AS "SUMA DE SALARIOS", COUNT(*) AS "NUMERO DE EMPLEADOS"
FROM EMPLOYEES
WHERE DEPARTMENT_ID=50;

-- SE PUEDEN HACER OPERACIONES, EJEMPLO SUM(SALARY)*12

SELECT SUM(SALARY) AS "SUMA DE SALARIOS", SUM(SALARY)*12 AS "SUMA ANUAL",
COUNT(*) AS "NUMERO DE EMPLEADOS"
FROM EMPLOYEES
WHERE DEPARTMENT_ID=50;

-- CUAL ES LA DIFERENCIA ENTRE EL MAXIMO SALARIO Y EL MINIMO

SELECT MAX(SALARY) - MIN(SALARY)
FROM EMPLOYEES;
--   ************************************************************************
--   4. GROUP BY
     --> Permite agrupar valores por grupos, es decir, recuperrar un conjunto 
     -- de valores de una tabla
     -- SIEMPRE VA DESPUES DEL FROM O DEL WHERE SI LO HAY
     -- DEJANDO EL WHERE PARA RECUPERAR DE LINEAS
     
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- LA SUMA DE SALRIO Y POR DEPARTAMENTO

SELECT DEPARTMENT_ID, COUNT(*) AS "NUM EMPLEADOS", SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- COMO EL GROUP BY NO ORDENA, PODEMOS USAR EL ORDER BY

SELECT DEPARTMENT_ID, COUNT(*) AS "NUM EMPLEADOS", SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- PODEMOS INCLUIR OTROS GRUPOS, ASI TENDREMOS LOS EMPLEADOS POR GRUPO DE
-- DEPARTAMENTO Y DE TIPO DE TRABAJO
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) AS "NUM EMPLEADOS", SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID;


--   ************************************************************************

--   5. HAVING
     --> Permite hacer condiciones sobre el grupo.
-- Si queremos saber de los grupos del ejemplo quien gana mas de 25000

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) AS "NUM EMPLEADOS", SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING SUM(SALARY) > 25000
ORDER BY DEPARTMENT_ID;

-- SI AHORA LO QUE QUEREMOS SABER A MAYORES EL NUMERO DE EMPLEADOS POR 
-- DEPARTAMENTO SEA MAYOR DE 10

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) AS "NUM EMPLEADOS", SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING SUM(SALARY) > 25000 AND COUNT(*) > 10
ORDER BY DEPARTMENT_ID;