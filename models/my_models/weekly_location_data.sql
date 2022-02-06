{{ config(materialized='table') }}

with source_data as (
    select week_year,
    location,
    sum(NEW_CASES) Total_new_cases,
	sum(NEW_ACTIVE_CASES) total_new_active_cases,
	sum(NEW_RECOVERED) total_new_recovered_cases,
	sum(NEW_DEATHS) total_new_deaths
    from {{ref("full_data_for_analysis")}}
    where location_level = 'Province'
    group by 1,2

)

select *
from source_data
