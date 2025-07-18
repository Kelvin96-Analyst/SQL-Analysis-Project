# Gamas Flour Mill Data Analysis Overview
### Company Background:
Gamas Flour Mill is the largest producer of flour, pasta, and noodles across the 50 states of the United States of America. With an extensive network of branches in every state and an annual revenue exceeding $1 billion, Gamas continues to lead the market in food production and distribution


## Gamas Flour Mill – SQL Analysis Project Summary:

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
- 
## Objective:
### Using SQL, we will join these four tables to perform unified multi-commodity analysis across all U.S. states. This will enable insights such as:
#### 1. List of all states and ANSI codes
#### 2. Total Pasta Production for 2019
#### 3. Total Noodle Production for 2010
#### 4. Average Flour Production for 2016
#### 5. Average Flour Production where Noodle Production > 1M
#### 6.  All States from state_lookup that are missing from pasta_production in 2021.
#### 7. The total pasta production figures for all states in 2017 that also have recorded noodle production data from 2018.
#### 8. All states with Flour Production in April 2020,even if they didn’t produce any flour in April of 2020? (including zero).
#### 9. Count of  States with Flour Production > 500M in April 2021


## Key Insights Extracted
- Total and average production per year
- States missing data for quality checks
- Production trends across time and commodities
- States with exceptional production metrics

## Files Included
- `gamas_flour_analysis.sql` – Contains all the refined SQL queries
- `README.md` – Project overview and explanation

## Author
Kelvin Ayogu – Data Analyst | SQL, Power BI, Python

> Note: All scripts are for portfolio demonstration only and do not represent any proprietary or confidential data from the actual company.
