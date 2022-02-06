{{ config(materialized='table') }}

with source_data as (

    select to_date(DATE) as Date,
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
