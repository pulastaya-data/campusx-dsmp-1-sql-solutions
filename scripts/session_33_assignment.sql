-- 1. Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.
SELECT 
	AVG(`Sleep duration`) 
FROM sleep_efficiency
WHERE 
	Gender = 'Male' 
	AND `Sleep duration` >= 7.5
ORDER BY 
	`Sleep duration` DESC LIMIT 15;


-- 2. Show avg deep sleep time for both gender. Round result at 2 decimal places.
SELECT 
	ROUND(
		AVG(`Sleep duration` * (`Deep sleep percentage`/100))
		,2)
FROM sleep_efficiency
GROUP BY Gender;


-- 3. Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage values are between 25 to 45. 
-- Display age, light sleep percentage and deep sleep percentage columns only.
SELECT 
	Age, 
	`Light Sleep percentage`, 
	`Deep Sleep percentage`
FROM sleep_efficiency
WHERE 
	`Deep sleep percentage` BETWEEN 25 AND 45
ORDER BY 
	`Light sleep percentage` DESC LIMIT 10, 30;


-- 4. Group by on exercise frequency and smoking status and show average deep sleep time, average light sleep time and avg rem sleep time.
SELECT 
	`Exercise frequency`, 
	`Smoking status`,
	AVG(`Sleep duration` * `Deep sleep percentage`/100) AS 'avg_deep_sleep', 
	AVG(`Sleep duration` * `Light sleep percentage`/100) AS 'avg_light_sleep', 
	AVG(`Sleep duration` * `REM sleep percentage`/100) AS 'avg_rem'
FROM sleep_efficiency
GROUP BY 
	`Exercise frequency`, 
	`Smoking status`;

-- 5. Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol consumption only for people who do exercise atleast 3 days a week. 
-- Show result in descending order awekenings
SELECT 
	Awakenings, 
	AVG(`Caffeine consumption`), 
	AVG(`Sleep duration` * `Deep sleep percentage`/100), 
	AVG(`Alcohol consumption`)
FROM sleep_efficiency
WHERE `Exercise frequency` >= 3
GROUP BY Awakenings
ORDER BY Awakenings DESC;

-- 6. Display those power stations which have average 'Monitored Cap.(MW)' (display the values) between 1000 and 2000 
-- and the number of occurance of the power stations (also display these values) are greater than 200. 
-- Also sort the result in ascending order.
SELECT 
	`Power Station`, 
	AVG(`Monitored Cap.(MW)`) AS 'avg_capacity', 
	COUNT(*) AS 'Occurance'
FROM power_generation
GROUP BY `Power Station`
HAVING 
	(AVG(`Monitored Cap.(MW)`) BETWEEN 1000 AND 2000) 
	AND Occurance > 200
ORDER BY Occurance ASC;

-- 7. Display top 10 lowest "value" State names of which the Year either belong to 2013 or 2017 or 2021 and type is 'Public In-State'.
-- Also the number of occurance should be between 6 to 10. 
-- Display the average value upto 2 decimal places, state names and the occurance of the states.
SELECT 
	`State`, 
    ROUND(AVG(`Value`), 2) AS 'Avg_value', 
    COUNT(*) AS 'Occurance'
FROM ug_cost
WHERE 
	(`Type` = 'Public In-State') 
	AND (`Year` IN (2013, 2017, 2021))
GROUP BY `State`
HAVING Occurance BETWEEN 6 AND 10
ORDER BY Avg_value ASC LIMIT 10;


-- 8. Best state in terms of low education cost (Tution Fees) in 'Public' type university.
SELECT 
	`State`, 
    ROUND(AVG(`Value`), 2) AS 'Avg_value'
FROM ug_cost
WHERE 
	`Type` LIKE '%Public%' 
	AND Expense LIKE '%Tuition%'
GROUP BY `State`
ORDER BY Avg_value ASC LIMIT 1;

-- 9. 2nd Costliest state for Private education in year 2021. Consider, Tution and Room fee both.
SELECT 
	`State`, 
    ROUND(AVG(`Value`), 2) AS 'Avg_value'
FROM ug_cost
WHERE 
	`Type` = 'Private' 
	AND (Expense LIKE '%Tuition%' OR Expense LIKE '%Room%') 
	AND `Year` = 2021
GROUP BY `State`
ORDER BY Avg_value DESC LIMIT 1, 1;