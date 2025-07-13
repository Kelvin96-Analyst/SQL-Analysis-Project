
-- 1. List of all states and ANSI codes
SELECT state_name, state_ansi
FROM state_lookup;

-- 2. Total Pasta Production for 2019
SELECT SUM(value) AS total_pasta_2019
FROM pasta_production
WHERE year = '2019';

-- 3. Total Noodle Production for 2010
SELECT SUM(value) AS total_noodle_2010
FROM noodles_production
WHERE year = '2010';

-- 4. Average Flour Production for 2016
SELECT AVG(value) AS avg_flour_2016
FROM flour_production
WHERE year = '2016';

-- 5. Average Flour Production where Noodle Production > 1M
SELECT AVG(f.value) AS average_flour_production
FROM flour_production f
WHERE f.year IN (
    SELECT DISTINCT year
    FROM noodle_production np
    WHERE value > 1000000
);

-- 6. States missing Pasta Production data in 2021
SELECT COUNT(DISTINCT s.state_name) AS missing_states_in_2021
FROM state_lookup s
LEFT JOIN pasta_production p
  ON s.state_ansi = p.state_ansi AND p.year = '2021'
WHERE p.state_ansi IS NULL;

-- 7. Pasta Production in 2017 where Noodle data exists for 2018
SELECT SUM(pp.value) AS total_pasta_2017
FROM pasta_production pp
WHERE pp.year = '2017'
  AND pp.state_ansi IN (
    SELECT DISTINCT np.state_ansi
    FROM noodle_production np
    WHERE np.year = '2018'
);

-- 8. All states with Flour Production in April 2020 (including zero)
SELECT s.state_name,
       SUM(f.value) AS total_flour_apr_2020
FROM state_lookup s
LEFT JOIN flour_production f
  ON s.state_ansi = f.state_ansi
  AND f.period = 'APR'
  AND f.year = '2020'
GROUP BY s.state_name;

-- 9. States with Flour Production > 500M in April 2021
SELECT l.state_name, p.period, p.year, p.value, l.state_ansi
FROM flour_production p
INNER JOIN state_lookup l
  ON p.state_ansi = l.state_ansi
WHERE p.value > 500000000
  AND p.period = 'APR'
  AND p.year = '2021';

-- Count of such states
SELECT COUNT(DISTINCT l.state_name) AS high_flour_states
FROM flour_production p
JOIN state_lookup l ON p.state_ansi = l.state_ansi
WHERE p.value > 500000000
  AND p.period = 'APR'
  AND p.year = '2021';
