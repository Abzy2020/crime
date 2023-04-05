-- Active: 1680326086543@@localhost@3306@crime


-- All Victims
SELECT date_occured, crime, age, Status, LAT, LON,
    CASE 
        WHEN race = 'H' THEN 'Hispanic' 
        WHEN race = 'B' THEN 'Black' 
        WHEN race = 'W' THEN 'White' 
        WHEN race = 'A' THEN 'Asian' 
        ELSE 'Other'
        END AS race,
    CASE 
        WHEN gender = 'M' THEN 'Male'  
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Other'
        END AS gender
FROM crime_stats;


-- Victims all demographics
SELECT date_occured, crime, age, Status, 
    CASE 
        WHEN age = 0 THEN "N/A"
        WHEN age < 13 THEN "Child"
        WHEN age < 18 THEN "Teen"
        WHEN age >= 18 THEN "Adult"
        WHEN age >= 60 THEN "Senior"
        END AS age_group,
    CASE 
        WHEN race = 'H' THEN 'Hispanic' 
        WHEN race = 'B' THEN 'Black' 
        WHEN race = 'W' THEN 'White' 
        WHEN race = 'A' THEN 'Asian' 
        ELSE 'Other'
        END,
    CASE 
        WHEN gender = 'M' THEN 'Male'  
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Other'
        END
FROM crime_stats;


-- Avg age of victims
SELECT AVG(age) AS avg_age FROM crime_stats;


-- Avg age of victims by gender
SELECT AVG(age) AS victim_count,
    CASE 
        WHEN gender = 'M' THEN 'Male'  
        WHEN gender = 'F' THEN 'Female'
        WHEN gender = 'X' THEN 'Other'
        ELSE 'Unknown'
        END AS gender
FROM crime_stats
WHERE gender IS NOT NULL
GROUP BY gender;


-- Victim count by gender
SELECT COUNT(gender) AS victim_count,
    CASE 
        WHEN gender = 'M' THEN 'Male'  
        WHEN gender = 'F' THEN 'Female'
        WHEN gender = 'X' THEN 'Other'
        ELSE 'Unknown'
        END AS gender
FROM crime_stats
WHERE gender IS NOT NULL
GROUP BY gender;


-- Victim count by race
SELECT COUNT(race) AS victim_count,
    CASE 
        WHEN race = 'H' THEN 'Hispanic' 
        WHEN race = 'B' THEN 'Black' 
        WHEN race = 'W' THEN 'White' 
        WHEN race = 'A' THEN 'Hispanic'
        WHEN race = 'N' THEN 'Native American'
        WHEN race = 'P' THEN 'Pacific Islander' 
        ELSE 'Other'
END AS race
FROM crime_stats
GROUP BY race;


-- Victim count by age group
SELECT COUNT(age) AS victim_count,
    CASE 
        WHEN age = 0 THEN "N/A"
        WHEN age < 13 THEN "Child"
        WHEN age < 18 THEN "Teen"
        WHEN age >= 18 THEN "Adult"
        WHEN age >= 60 THEN "Senior"
        END AS age_group
FROM crime_stats
GROUP BY age_group;


-- List of crimes
SELECT DISTINCT(crime) FROM crime_stats;


-- Theft
SELECT crime, age,
    CASE 
        WHEN age = 0 THEN "N/A"
        WHEN age < 13 THEN "Child"
        WHEN age < 18 THEN "Teen"
        WHEN age >= 18 THEN "Adult"
        WHEN age >= 60 THEN "Senior"
        END AS age_group,
    CASE 
        WHEN race = 'H' THEN 'Hispanic' 
        WHEN race = 'B' THEN 'Black' 
        WHEN race = 'W' THEN 'White' 
        WHEN race = 'A' THEN 'Asian' 
        ELSE 'Other'
        END,
    CASE 
        WHEN gender = 'M' THEN 'Male'  
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Other'
        END
FROM crime_stats
WHERE crime LIKE '%THEFT%';