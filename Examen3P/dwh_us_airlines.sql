USE sys;
DROP DATABASE IF EXISTS dwh_us_airlines;
CREATE DATABASE dwh_us_airlines;
USE dwh_us_airlines;

CREATE TABLE dim_dates (
    id_date BIGINT PRIMARY KEY,
    date_year INT,
    date_month INT,
    date_day INT,
    date_full DATE
);

CREATE TABLE dim_local_gateway (
    id_local_airport BIGINT PRIMARY KEY,
    airport_code VARCHAR(5),
    world_area_code BIGINT,
    airport_name VARCHAR(100)
);

CREATE TABLE dim_foreign_gateway (
    id_foreign_airport BIGINT PRIMARY KEY,
    airport_code VARCHAR(5),
    world_area_code BIGINT,
    airport_name VARCHAR(100)
);

CREATE TABLE dim_airline (
    id_airline BIGINT PRIMARY KEY,
    carrier_code VARCHAR(5),
    carrier_name VARCHAR(100),
    is_from_us BOOL
);

CREATE TABLE dim_flight_type (
    id_type INT PRIMARY KEY,
    flight_type VARCHAR(20)
);

CREATE TABLE us_flights_facts (
    id_date BIGINT,
    id_local_airport BIGINT,
    id_foreign_airport BIGINT,
    id_airline BIGINT,
    id_type INT,
    flight_schedule INT,
    charter INT,
    total INT,
    CONSTRAINT fk_dim_dates FOREIGN KEY (id_date) REFERENCES dim_dates (id_date),
    CONSTRAINT fk_dim_local_gateway FOREIGN KEY (id_local_airport) REFERENCES dim_local_gateway (id_local_airport),
    CONSTRAINT fk_dim_foreign_gateway FOREIGN KEY (id_foreign_airport) REFERENCES dim_foreign_gateway (id_foreign_airport),
    CONSTRAINT fk_dim_airline FOREIGN KEY (id_airline) REFERENCES dim_airline (id_airline),
    CONSTRAINT fk_dim_flight_type FOREIGN KEY (id_type) REFERENCES dim_flight_type (id_type)
);