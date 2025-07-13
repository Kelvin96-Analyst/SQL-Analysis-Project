
-- Table: state_lookup
CREATE TABLE state_lookup (
    state_ansi VARCHAR(5) PRIMARY KEY,
    state_name VARCHAR(100),
    region VARCHAR(50)
);

-- Table: flour_production
CREATE TABLE flour_production (
    year VARCHAR(4),
    period VARCHAR(3),
    geo_level VARCHAR(50),
    state_ansi VARCHAR(5),
    commodity_id INT,
    value DECIMAL,
    FOREIGN KEY (state_ansi) REFERENCES state_lookup(state_ansi)
);

-- Table: pasta_production
CREATE TABLE pasta_production (
    year VARCHAR(4),
    period VARCHAR(3),
    geo_level VARCHAR(50),
    state_ansi VARCHAR(5),
    commodity_id INT,
    value DECIMAL,
    FOREIGN KEY (state_ansi) REFERENCES state_lookup(state_ansi)
);

-- Table: noodle_production
CREATE TABLE noodle_production (
    year VARCHAR(4),
    period VARCHAR(3),
    geo_level VARCHAR(50),
    state_ansi VARCHAR(5),
    commodity_id INT,
    value DECIMAL,
    FOREIGN KEY (state_ansi) REFERENCES state_lookup(state_ansi)
);

-- Sample rows for demonstration
INSERT INTO state_lookup (state_ansi, state_name, region) VALUES
('01', 'Alabama', 'South'),
('02', 'Alaska', 'West'),
('04', 'Arizona', 'West');

INSERT INTO flour_production (year, period, geo_level, state_ansi, commodity_id, value) VALUES
('2020', 'APR', 'State', '01', 101, 120000000),
('2021', 'APR', 'State', '01', 101, 600000000);

INSERT INTO pasta_production (year, period, geo_level, state_ansi, commodity_id, value) VALUES
('2019', 'JAN', 'State', '02', 202, 80000000),
('2017', 'MAR', 'State', '04', 202, 45000000);

INSERT INTO noodle_production (year, period, geo_level, state_ansi, commodity_id, value) VALUES
('2010', 'JUN', 'State', '04', 303, 90000000),
('2018', 'SEP', 'State', '04', 303, 1500000);
