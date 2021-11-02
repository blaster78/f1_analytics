with races as (

    select 
    
raceid,
year as year_of_race,
round as championship_round,
circuitid,
name as name_of_race,
date as date_of_race,
cast(replace(time,"\\N","00:00:00") as time) as time_of_race


    from {{ source("f1_analytics","tbl_races")}}

)

select * from races