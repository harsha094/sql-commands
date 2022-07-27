
SELECT 'SQL is cool'
AS result;


--In the real world, you will often want to select multiple columns. Luckily, SQL makes this really easy. To select multiple columns from a table, simply separate the column names with commas!
--For example, this query selects two columns, name and birthdate, from the people table:
SELECT name, birthdate
FROM people;

--Sometimes, you may want to select all columns from a table. Typing out every column name would be a pain, so there's a handy shortcut:
SELECT *
FROM people;

--If you only want to return a certain number of results, you can use the LIMIT keyword to limit the number of rows returned:
SELECT *
FROM people
LIMIT 10;

--Often your results will include many duplicate values. If you want to select all the unique values from a column, you can use the DISTINCT keyword
SELECT DISTINCT language
FROM films;

--The COUNT() function lets you do this by returning the number of rows in one or more columns.
--For example, this code gives the number of rows in the people table:

SELECT COUNT(*)
FROM people;

--In SQL, the WHERE keyword allows you to filter based on both text and numeric values in a table. There are a few different comparison operators you can use:

= equal
<>, != not equal
< less than
> greater than
<= less than or equal to
>= greater than or equal to

--You can build up your WHERE queries by combining multiple conditions with the AND keyword.

--For example,

SELECT title
FROM films
WHERE release_year > 1994
AND release_year < 2000;
--For some condition to be met? use OR keyword.
SELECT title
FROM films
WHERE release_year = 1994
OR release_year = 2000;
--Another example of multiply use of AND , OR conditions. 
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish')
AND (gross > 2000000);

--The BETWEEN keyword provides a useful shorthand for filtering values within a specified range. This query is equivalent to the one above:

SELECT title
FROM films
WHERE release_year
BETWEEN 1994 AND 2000;

--Enter the IN operator! The IN operator allows you to specify multiple values in a WHERE clause, making it easier and quicker to specify multiple OR conditions! Neat, right?
--So, the above example would become simply:
SELECT name
FROM kids
WHERE age IN (2, 4, 6, 8, 10);

--In SQL, NULL represents a missing or unknown value. You can check for NULL values using the expression IS NULL. For example, to count the number of missing birth dates in the people table:
SELECT COUNT(*)
FROM people
WHERE birthdate IS NULL;

--In SQL, the LIKE operator can be used in a WHERE clause to search for a pattern in a column. To accomplish this, you use something called a wildcard as a placeholder for some other values. There are two wildcards you can use with LIKE:
--The % wildcard will match zero, one, or many characters in text. For example, the following query matches companies like 'Data', 'DataC' 'DataCamp', 'DataMind', and so on:

SELECT name
FROM companies
WHERE name LIKE 'Data%';
--The _ wildcard will match a single character. For example, the following query matches companies like 'DataCamp', 'DataComp', and so on:

SELECT name
FROM companies
WHERE name LIKE 'DataC_mp';
--You can also use the NOT LIKE operator to find records that don't match the pattern you specify.

--Aggregate functions
--Often, you will want to perform some calculation on the data in a database. SQL provides a few functions, called aggregate functions, to help you out with this.

--For example,

SELECT AVG(budget)
FROM films;

--Aggregate functions can be combined with the WHERE clause to gain further insights from your data.

--For example, to get the total budget of movies made in the year 2010 or later:

SELECT SUM(budget)
FROM films
WHERE release_year >= 2010;

--A note on arithmetic
--In addition to using aggregate functions, you can perform basic arithmetic with symbols like +, -, *, and /.

--So, for example, this gives a result of 12:

SELECT (4 * 3);

--Aliasing simply means you assign a temporary name to something. To alias, you use the AS keyword, which you've already seen earlier in this course.

--For example, in the above example we could use aliases to make the result clearer:

SELECT MAX(budget) AS max_budget,
       MAX(duration) AS max_duration
FROM films;
