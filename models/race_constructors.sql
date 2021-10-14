with stg_constructors as (

select constructorid, name as constructor_name, nationality as constructor_nationality from `f1-analytics-328910.f1_analytics.tbl_constructors`

),

stg_races as(

 select raceid, year, round, circuitid, name, date, time from `f1-analytics-328910.f1_analytics.tbl_races`
 where year = 2021
 order by round

),

stg_constructor_standings as (

 select raceid, constructorid, points, position, positiontext, wins FROM `f1-analytics-328910.f1_analytics.tbl_constructor_standings`

),

stg_race_constructor_standings as (

select * from stg_races
left join stg_constructor_standings using (raceid)
left join stg_constructors using (constructorid)

)

select * from stg_race_constructor_standings