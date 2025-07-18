# Gamas Flour Mill Data Analysis Overview
### Company Background:
Gamas Flour Mill is the largest producer of flour, pasta, and noodles across the 50 states of the United States of America. With an extensive network of branches in every state and an annual revenue exceeding $1 billion, Gamas continues to lead the market in food production and distribution


## Gamas Flour Mill – 📊 SQL Analysis Project Summary:

This project showcases SQL queries and analysis on production data from Gamas Flour Mill, the largest producer of flour, pasta, and noodles in the United States. For data-driven insights and performance tracking, we collected and consolidated data from the various divisions of Gamas Flour Mill into four primary tables:

## Tables Involved:
- `flour_production`
- `pasta_production`
- `noodle_production`
- `state_lookup`
  
## Table Structure:
### Each of the commodity tables (Flour, Pasta, and Noodles) includes the following columns:
- `year`
- `period`
- `state_ansi`
- `commodity_id`
- `value`

### The State Metadata Table contains:
- `state_ansi`  – used as a foreign key to join with the commodity tables
- `state_name`
  
## Objective:
### Using SQL, we will join these four tables to perform unified multi-commodity analysis across all U.S. states. This will enable insights such as:
#### 1. List of all states and ANSI codes.
Retrieved a complete list of U.S. states along with their ANSI codes from the state_lookup table to support clean joins across datasets.
```sql
SELECT state_name, state_ansi
FROM state_lookup;
```

#### 2. Total Pasta Production for 2019.
Aggregated pasta production data for 2019 to support the yearly management report.
```sql
SELECT SUM(value) AS total_pasta_2019
FROM pasta_production
WHERE year = '2019';
```

#### 3. Total Noodle Production for 2010.
Calculated the total noodle production to assess past performance.
```sql
SELECT SUM(value) AS total_noodle_2010
FROM noodles_production
WHERE year = '2010';
```

#### 4. Average Flour Production for 2016.
Prepared this insight for the Flour division.
```sql
SELECT AVG(value) AS avg_flour_2016
FROM flour_production
WHERE year = '2016';
```

#### 5. Average Flour Production where Noodle Production > 1M.
Computed the average flour production for all years where noodle production exceeded 1 million units. This helped cross-reference commodity impact.
```sql
SELECT AVG(f.value) AS average_flour_production
FROM flour_production f
WHERE f.year IN (
    SELECT DISTINCT year
    FROM noodle_production np
    WHERE value > 1000000
);
```

#### 6.  All States from state_lookup that are missing from pasta_production in 2021.
Identified states present in `state_lookup` but missing pasta production entries for 2021 to address data completeness and reporting gaps.
```sql
SELECT COUNT(DISTINCT s.state_name) AS missing_states_in_2021
FROM state_lookup s
LEFT JOIN pasta_production p
  ON s.state_ansi = p.state_ansi AND p.year = '2021'
WHERE p.state_ansi IS NULL;
```

#### 7. The total pasta production figures for all states in 2017 that also have recorded noodle production data from 2018.
Found states with pasta production in 2017 that also had noodle data in 2018 to support inter-commodity correlation analysis.
```sql
SELECT SUM(pp.value) AS total_pasta_2017
FROM pasta_production pp
WHERE pp.year = '2017'
  AND pp.state_ansi IN (
    SELECT DISTINCT np.state_ansi
    FROM noodle_production np
    WHERE np.year = '2018'
);
```

#### 8. All states with Flour Production in April 2020,even if they didn’t produce any flour in April of 2020? (including zero).
Listed all states with their flour production in April 2020 (even if zero), supporting a cross-commodity production report for that period.
```sql
SELECT s.state_name,
       SUM(f.value) AS total_flour_apr_2020
FROM state_lookup s
LEFT JOIN flour_production f
  ON s.state_ansi = f.state_ansi
  AND f.period = 'APR'
  AND f.year = '2020'
GROUP BY s.state_name;
```

#### 9. Count of  States with Flour Production > 500M in April 2021.
Identified states with flour production greater than $500M in April 2021 to assist the flour Department’s regional marketing strategy.
```sql
SELECT l.state_name, p.period, p.year, p.value, l.state_ansi
FROM flour_production p
INNER JOIN state_lookup l
  ON p.state_ansi = l.state_ansi
WHERE p.value > 500000000
  AND p.period = 'APR'
  AND p.year = '2021';

--- Count of such states
SELECT COUNT(DISTINCT l.state_name) AS high_flour_states
FROM flour_production p
JOIN state_lookup l ON p.state_ansi = l.state_ansi
WHERE p.value > 500000000
  AND p.period = 'APR'
  AND p.year = '2021';
```

## Skills Applied
- SQL (Intermediate – Advanced)
Used advanced SQL techniques such as `JOIN`, `LEFT JOIN`, subqueries, aggregation (`SUM`, `AVG`), `DISTINCT`, and conditional filtering.
- Data Cleaning & Exploration
Ensured accuracy by filtering out null values, misjoins, and using appropriate conditions for time-specific and state-specific queries.
- Business Reporting
Aligned analysis with department-specific goals (e.g. Flour Department) to produce actionable insights.

## Tools Used
- SQL (MySQL syntax)
- Power BI (visualization)

## Key Insights Extracted
- Total and average production per year
- States missing data for quality checks
- Production trends across time and commodities
- States with exceptional production metrics
- This project provided valuable insights into commodity production across U.S. states, supported decision-making for inter-departmental planning, and showcased data-driven storytelling using SQL.

## Author
Kelvin Ayogu – Data Analyst | Operation Analyst | Business Analyst

> Note: All scripts are for portfolio demonstration only and do not represent any proprietary or confidential data from any company.
