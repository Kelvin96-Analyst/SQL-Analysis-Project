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
