{{ config(materialized='table') }}

with data as (

	select date, sum(new_cases) new_cases, sum(new_active_cases) new_active_cases, sum(new_recovered) new_recovered, sum(new_deaths) new_deaths, sum(new_cases) prev_week_new_cases, sum(new_active_cases) prev_week_new_active_cases, sum(new_recovered) prev_week_new_recovered, sum(new_deaths) prev_week_new_deaths
	from(select to_date(date) date, sum(new_cases) new_cases, sum(new_active_cases) new_active_cases, sum(new_recovered) new_recovered, sum(new_deaths) new_deaths, 0 as prev_week_new_cases, 0 as prev_week_new_active_cases, 0 as prev_week_new_recovered, 0 as prev_week_new_deaths
	from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ADITYA_ARYAN
	group by date

	union all

	select dateadd(day, 7, to_date(date)) date,0 as  new_cases, 0 as new_active_cases, 0 as new_recovered, 0 as new_deaths, sum(new_cases) prev_week_new_cases, sum(new_active_cases) prev_week_new_active_cases, sum(new_recovered) prev_week_new_recovered, sum(new_deaths) prev_week_new_deaths
	from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ADITYA_ARYAN
	group by date)
	group by date
	order by date
)

select *
from data