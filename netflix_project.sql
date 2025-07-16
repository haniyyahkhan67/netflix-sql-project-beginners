-- ---------------------------------------------
-- SQL Project: Netflix Data Analysis
-- Description: Analyzing Netflix titles dataset using MySQL
-- Author: [Your Name]
-- ---------------------------------------------

-- 1. Create and select the database
CREATE DATABASE IF NOT EXISTS NETFLIX;
USE NETFLIX;

-- 2. Create the table for Netflix titles
CREATE TABLE IF NOT EXISTS netflix_titles (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(100),
    title VARCHAR(100), 
    director VARCHAR(200),
    cast VARCHAR(200),
    country VARCHAR(80),
    date_added DATE,
    release_year INT,
    rating VARCHAR(30),
    duration VARCHAR(200),
    listed_in VARCHAR(300),
    description VARCHAR(500)
);

-- 3. Optional: View secure file directory path
-- SHOW VARIABLES LIKE 'secure_file_priv';

-- 4. Import data from CSV file (Adjust file path as per your system)
-- NOTE: Ensure LOCAL INFILE is enabled in your MySQL server.
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/netflix_titles.csv'
INTO TABLE netflix_titles
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 5. Preview the data
SELECT * FROM netflix_titles LIMIT 10;

-- 6. Total number of records
SELECT COUNT(*) AS total_titles FROM netflix_titles;

-- 7. Count of Movies vs TV Shows
SELECT type, COUNT(*) AS total
FROM netflix_titles 
GROUP BY type;

-- 8. Most common rating for Movies
SELECT rating, COUNT(*) AS total
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY rating
ORDER BY total DESC
LIMIT 1;

-- 9. Most common rating for TV Shows
SELECT rating, COUNT(*) AS total
FROM netflix_titles
WHERE type = 'TV Show'
GROUP BY rating
ORDER BY total DESC
LIMIT 1;

-- 10. List all Movies released in a specific year (example: 2021)
SELECT title, release_year
FROM netflix_titles
WHERE release_year = 2021 AND type = 'Movie';

-- 11. Top 5 countries with the most content
SELECT country, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL AND country <> ''
GROUP BY country
ORDER BY total DESC
LIMIT 5;

-- 12. Top 5 directors with the most titles
SELECT director, COUNT(*) AS total
FROM netflix_titles
WHERE director IS NOT NULL AND director <> ''
GROUP BY director
ORDER BY total DESC
LIMIT 5;

-- 13. Top 10 most frequent cast members (Note: "cast" needs to be split to analyze individually)
-- This shows frequency of full cast strings (not individual actors)
SELECT `cast`, COUNT(*) AS total
FROM netflix_titles
WHERE `cast` IS NOT NULL AND `cast` <> ''
GROUP BY `cast`
ORDER BY total DESC
LIMIT 10;

-- 14. Total number of titles per year
SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year;

-- 15. Number of Movies and TV Shows released each year
SELECT release_year, type, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year, type
ORDER BY release_year DESC;

-- 16. Count of titles per rating
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC;

-- 17. Count of Movies and TV Shows by country
SELECT country, type, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL AND country <> ''
GROUP BY country, type
ORDER BY total DESC;

-- 18. Year with the most releases
SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
ORDER BY total DESC
LIMIT 1;

-- 19. Longest Movie duration (in minutes)
SELECT title, duration
FROM netflix_titles
WHERE duration LIKE '%min%'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 1;

-- 20. Longest-running TV Show (by number of seasons)
SELECT title, duration
FROM netflix_titles
WHERE duration LIKE '%Season%'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 1;

-- 21. Top 5 most popular genres
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 5;
