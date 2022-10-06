CREATE DATABASE PERSON_INFO_335;

SELECT * FROM DEPARTMENT;

SELECT * FROM PERSON;

--1. Find all persons with their department name & code.

	SELECT PERSON.PERSON_NAME,DEPARTMENT.DEPARTMENT_NAME,DEPARTMENT.DEPARTMENT_ID FROM PERSON INNER JOIN 
	DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID;
	 
--2. Give department wise maximum & minimum salary with department name.

	SELECT MAX(SALARY) AS MAXIMUM_SALARY,MIN(SALARY) AS MINIMUM_SALARY,DEPARTMENT.DEPARTMENT_NAME 
	FROM PERSON INNER JOIN DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID 
	GROUP BY DEPARTMENT_NAME;

--3. Find all departments whose total salary is exceeding 100000.

	SELECT DEPARTMENT.DEPARTMENT_NAME FROM 
	PERSON INNER JOIN DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID 
	GROUP BY DEPARTMENT_NAME HAVING SUM(SALARY)>100000;

--4. Retrieve person name, salary & department name who belongs to Jamnagar city.

	SELECT PERSON_NAME,SALARY,DEPARTMENT.DEPARTMENT_NAME FROM 
	PERSON INNER JOIN DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID
	WHERE CITY = 'JAMNAGAR'; 

--5. Find all persons who does not belongs to any department.

	SELECT PERSON_NAME FROM PERSON LEFT OUTER JOIN 
	DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID
	WHERE DEPARTMENT.DEPARTMENT_ID IS NULL;

--6. Find department wise person counts.

	SELECT COUNT(PERSON_ID),DEPARTMENT.DEPARTMENT_NAME FROM PERSON
	INNER JOIN DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID
	GROUP BY DEPARTMENT.DEPARTMENT_NAME;


--7. Find average salary of person who belongs to Ahmedabad city.

	SELECT AVG(SALARY),PERSON.CITY FROM PERSON LEFT OUTER JOIN DEPARTMENT
	ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID  GROUP BY CITY
	HAVING CITY = 'Ahmedabad';

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly. (In single column)

	SELECT PERSON_NAME + ' EARNS ' + CAST(SALARY AS varchar) + ' from department ' + DEPARTMENT.DEPARTMENT_NAME
	FROM PERSON INNER JOIN DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID;

--9. List all departments who have no persons.

	SELECT DEPARTMENT.DEPARTMENT_NAME FROM PERSON LEFT OUTER JOIN DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID
	WHERE PERSON_ID IS NULL;

--10. Find city & department wise total, average & maximum salaries.

	--CITY WISE
	SELECT CITY,SUM(SALARY),AVG(SALARY),MAX(SALARY)
	FROM PERSON LEFT OUTER JOIN DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID
	GROUP BY CITY;

	--GROUP WISE
	SELECT DEPARTMENT.DEPARTMENT_NAME,SUM(SALARY),AVG(SALARY),MAX(SALARY)
	FROM PERSON LEFT OUTER JOIN DEPARTMENT ON PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID
	GROUP BY DEPARTMENT_NAME;

--11. Display Unique city names.

	SELECT DISTINCT CITY FROM PERSON LEFT OUTER JOIN DEPARTMENT ON
	PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID;

--12. List out department names in which more than two persons.
	
	SELECT DEPARTMENT.DEPARTMENT_NAME FROM PERSON LEFT OUTER JOIN DEPARTMENT ON
	PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID GROUP BY DEPARTMENT_NAME HAVING COUNT(DEPARTMENT.DEPARTMENT_ID)>2;

--13. Combine person name’s first three characters with city name’s last three characters in single column.

	SELECT SUBSTRING(PERSON_NAME,1,3) + SUBSTRING(CITY,LEN(CITY)-2,LEN(CITY))
	FROM PERSON LEFT OUTER JOIN DEPARTMENT ON
	PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID;

--14. Give 10% increment in Computer department employee’s salary.

	SELECT SALARY = SALARY + (SALARY * 0.1) FROM PERSON LEFT OUTER JOIN DEPARTMENT ON
	PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID 
	WHERE DEPARTMENT_NAME = 'COMPUTER' ;

--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.

	SELECT PERSON_NAME FROM PERSON INNER JOIN DEPARTMENT ON
	PERSON.DEPARTMENT_ID = DEPARTMENT.DEPARTMENT_ID
	WHERE DATEDIFF(DAY,JOINING_DATE,GETDATE())>365;