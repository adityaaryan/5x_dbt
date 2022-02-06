
{{ config(materialized='table') }}

with source_data as (

    select to_date(DATE) as Date,
    TO_DATE('01-'||MONTHNAME(TO_DATE(DATE))||'-'||YEAR(TO_DATE(DATE))) as month_start_date,
    concat(week(to_date(date)), '-', year(to_date(date))) as week_year,
    time_zone, 
    location,
    location_level,
    continent,
    country,
    location_iso_code,
    province,
    island,
    special_status,
    latitude,
    longitude,
    area_km_2_,
    total_cases,
    total_cases_per_million,
    total_active_cases,
    (total_active_cases/population)*1000000 as active_cases_per_million,
    new_active_cases,
    (new_active_cases/population)*1000000 as new_active_cases_per_million,
    new_cases,
    new_cases_per_million,
    growth_factor_of_new_cases,

    Total_recovered,
    (Total_recovered/population)*1000000 as recovered_per_million,
    new_recovered,
    (new_recovered/population)*1000000 as new_recovered_per_million,
    case_recovered_rate,
    total_deaths,
    total_deaths_per_million,
    new_deaths,
    new_deaths_per_million,
    growth_factor_of_new_deaths,
    case_fatality_rate,

    total_rural_villages,
    total_regencies,
    population,
    total_cities,
    total_districts,
    total_urban_villages,
    population_density
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ADITYA_ARYAN

)

select *
from source_data


