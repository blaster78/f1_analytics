with winning_times as (
    select 
raceid,
driverid,
year_of_race,
name_of_race,
concat(driver_forename, " ", driver_surname) as winning_driver_name,
milliseconds/3600000 as winning_time_hours
 from 
{{ref("stg_results")}}
left join
{{ref("stg_races")}} using(raceid)
left join
{{ref("stg_drivers")}} using(driverid)
)

select * from winning_times