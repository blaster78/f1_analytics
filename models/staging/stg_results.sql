with results as (

select 

resultid,
raceid,
driverid,
constructorid,
number,
grid,
position
positiontext,
positionorder,
points,
laps,
time,
milliseconds,
fastestlap,
rank,
fastestlaptime,
fastestlapspeed,
statusid
  from {{ source("f1_analytics","tbl_results")}}


)

select * From results