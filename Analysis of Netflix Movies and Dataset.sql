-- REPLACING BLANK (-) VALUES TO 'NOT GIVEN' AND CHANGING TEXT TO PROPER CASE

SELECT
INITCAP (CASE
	WHEN director = '-' THEN 'not given'
	ELSE director
END) AS director,

INITCAP (CASE
	WHEN country = '-' THEN 'not given'
	ELSE country
END) AS country

FROM movies


-- EXTRACTING MONTH FROM DATE ADDED COLUMN (VERSION 1)

SELECT 
TO_CHAR(date_added,'Mon')AS month_added
FROM movies


-- EXTRACTING MONTH FROM DATE ADDED COLUMN (VERSION 2)

SELECT 

CASE
	WHEN EXTRACT (MONTH FROM date_added) = 1 THEN 'Jan'
	WHEN EXTRACT (MONTH FROM date_added) = 2 THEN 'Feb'
	WHEN EXTRACT (MONTH FROM date_added) = 3 THEN 'Mar'
	WHEN EXTRACT (MONTH FROM date_added) = 4 THEN 'Apr'
	WHEN EXTRACT (MONTH FROM date_added) = 5 THEN 'May'
	WHEN EXTRACT (MONTH FROM date_added) = 6 THEN 'Jun'
	WHEN EXTRACT (MONTH FROM date_added) = 7 THEN 'Jul'
	WHEN EXTRACT (MONTH FROM date_added) = 8 THEN 'Aug'
	WHEN EXTRACT (MONTH FROM date_added) = 9 THEN 'Sep'
	WHEN EXTRACT (MONTH FROM date_added) = 10 THEN 'Oct'
	WHEN EXTRACT (MONTH FROM date_added) = 11 THEN 'Nov'
	WHEN EXTRACT (MONTH FROM date_added) = 12 THEN 'Dec'
END AS month_added

FROM movies


-- IDENTIFYING TITLE TYPE (MOVIE OR TV SERIES)

SELECT duration,
CASE
	WHEN duration ILIKE '%Season' THEN 'TV Series'
	ELSE 'Movie'
END AS title_type
FROM movies

--CONCATINATING rating_1 AND rating_2

SELECT 
CONCAT(rating_1,'-',rating_2) AS rating
FROM movies


--ALL STEPS COMBINED

SELECT
show_id,
INITCAP (CASE
	WHEN director = '-' THEN 'not given'
	ELSE director
END) AS director,

INITCAP (CASE
	WHEN country = '-' THEN 'not given'
	ELSE country
END) AS country,

CASE
	WHEN EXTRACT (MONTH FROM date_added) = 1 THEN 'Jan'
	WHEN EXTRACT (MONTH FROM date_added) = 2 THEN 'Feb'
	WHEN EXTRACT (MONTH FROM date_added) = 3 THEN 'Mar'
	WHEN EXTRACT (MONTH FROM date_added) = 4 THEN 'Apr'
	WHEN EXTRACT (MONTH FROM date_added) = 5 THEN 'May'
	WHEN EXTRACT (MONTH FROM date_added) = 6 THEN 'Jun'
	WHEN EXTRACT (MONTH FROM date_added) = 7 THEN 'Jul'
	WHEN EXTRACT (MONTH FROM date_added) = 8 THEN 'Aug'
	WHEN EXTRACT (MONTH FROM date_added) = 9 THEN 'Sep'
	WHEN EXTRACT (MONTH FROM date_added) = 10 THEN 'Oct'
	WHEN EXTRACT (MONTH FROM date_added) = 11 THEN 'Nov'
	WHEN EXTRACT (MONTH FROM date_added) = 12 THEN 'Dec'
END AS month_added,

date_added,release_year,

CASE
	WHEN duration ILIKE '%Season' THEN 'TV Series'
	ELSE 'Movie'
END AS title_type,

CONCAT(rating_1,'-',rating_2) AS rating,

duration
FROM movies
