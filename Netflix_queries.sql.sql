/*Create Database*/
create database netflix_db;
use netflix_db;

select * from titles;
select count(*) from titles;
Drop Table titles;
select * from credits;
select count(*) from credits;

SHOW VARIABLES LIKE 'secure_file_priv';
DROP TABLE IF EXISTS titles;
USE netflix_db;

CREATE TABLE titles (
    id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(255),
    type VARCHAR(20),
    description TEXT,
    release_year INT,
    age_certification VARCHAR(20),
    runtime INT,
    genres TEXT,
    production_countries TEXT,
    seasons INT,
    imdb_id VARCHAR(20),
    imdb_score DECIMAL(3,1),
    imdb_votes INT,
    tmdb_popularity DECIMAL(10,3),
    tmdb_score DECIMAL(3,1)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/titles.csv'
INTO TABLE titles
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS Total_Titles
FROM titles;
DROP TABLE titles;
CREATE TABLE titles (
    id VARCHAR(20),
    title TEXT,
    type TEXT,
    description TEXT,
    release_year TEXT,
    age_certification TEXT,
    runtime TEXT,
    genres TEXT,
    production_countries TEXT,
    seasons TEXT,
    imdb_id TEXT,
    imdb_score TEXT,
    imdb_votes TEXT,
    tmdb_popularity TEXT,
    tmdb_score TEXT
);
select * from titles
Limit 10;
select 
min(release_year) as Earliest_Year,
max(release_year) as Latest_Year
from titles;
Select distinct age_certification from titles;
Select count(*) as total_contents from titles;
Select type,count(*) as total_contents 
from titles
group by type;
select distinct type from titles;
select * from titles where type = 'movie';
select title, release_year from titles
where release_year > 2020;
select title, type from titles
where age_certification = 'PG-13';
select title, release_year from titles
order by release_year Desc;
select title from titles
where title like 'The%';
select title, release_year from titles
where release_year > 2015;
select title, release_year from titles
where release_year between 2018 and 2020;
select title, age_certification, release_year from titles
Where age_certification in ('PG','R','TV-MA')
order by release_year Desc
Limit 10;
select type, title from titles
where type='Show' AND release_year>2020;
select title, type , release_year, imdb_score from titles
where type = 'Movie' AND release_year> 2015
order by imdb_score Desc
Limit 10;
select title, type, imdb_score from titles
where imdb_score > 8.5 and type = 'SHOW'
order by imdb_score Desc
limit 5;
select count(*) as Total_content , Type from titles 
where release_year> 2018
Group by TYPE;
Select title, release_year, imdb_score from titles
where 
 release_year between 2010 and 2020
 And imdb_score > 8;
select  age_certification , round(avg(imdb_score),2) as Avg_imdb_rating
from titles
group by age_certification
Having round(avg(imdb_score),2) > 6
order by round(avg(imdb_score),2) Desc;
 
 SHOW COLUMNS FROM titles;
SELECT
age_certification,
AVG(imdb_score)
FROM titles
GROUP BY age_certification;
SELECT
COUNT(*)
FROM titles
WHERE age_certification IS NOT NULL;
SELECT COUNT(*)
FROM titles
WHERE imdb_score IS NULL;
SELECT COUNT(*)
FROM titles
WHERE imdb_score = '';
UPDATE titles
SET imdb_id = NULL
WHERE imdb_id = '';
SELECT COUNT(*) FROM titles WHERE tmdb_score = '';
SELECT COUNT(*) FROM titles WHERE imdb_votes = '';
SELECT COUNT(*) FROM titles WHERE tmdb_popularity = '';
SELECT COUNT(*) FROM titles WHERE runtime = '';
SELECT COUNT(*) FROM titles WHERE release_year = '';
SELECT COUNT(*) FROM titles WHERE seasons = '';
SELECT COUNT(*) FROM titles WHERE age_certification = '';
SELECT COUNT(*) FROM titles WHERE imdb_id = '';
SELECT DISTINCT seasons
FROM titles
ORDER BY seasons;
ALTER TABLE titles
MODIFY release_year INT;
ALTER TABLE titles
MODIFY runtime INT;
ALTER TABLE titles
MODIFY imdb_score DECIMAL(3,1);
ALTER TABLE titles
MODIFY tmdb_score DECIMAL(3,1);
ALTER TABLE titles
MODIFY imdb_votes INT;
ALTER TABLE titles
MODIFY tmdb_popularity DECIMAL(8,3);
ALTER TABLE titles
MODIFY seasons INT;
select title , runtime from titles
where type = 'MOVIE'
order by runtime desc
limit 10;
select title, tmdb_popularity from titles
order by tmdb_popularity Desc
limit 10;
select title, imdb_votes from titles
order by imdb_votes desc
limit 10;
select type , round(avg(runtime),2) as Avg_Runtime
from titles
group by type;
select release_year, count(*) as Total_titles
from titles
group by release_year
order by release_year;
select release_year, count(*) as Total_titles
from titles
group by release_year
Having count(*) > 100;
select type, round(avg(tmdb_score),2) as Avg_tmdb from titles
group by type;
select production_countries, count(*) as total from titles
group by production_countries
order by count(*) desc
limit 10;
select count(*) as High_rated from titles
where imdb_score >8;
select title, runtime from titles
where runtime>120
order by runtime desc;
SELECT COUNT(*)
FROM credits
WHERE id = '';


