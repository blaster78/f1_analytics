with races as (

select * from 
{{ ref ("stg_races")}}

),

attendance as (

select * from
{{ ref ("race_attendance")}}

),

circuit as (

select * from
{{ref("stg_circuits")}}

),

win_results as (

select * from 
{{ref("stg_results")}}
where positionorder = 1

),

driver as (

    select * from
    {{ref("stg_drivers")}}
),

constructor as (

    select * from
{{ref("stg_constructors")}}

),

final as (

select date_of_race, races.name_of_race, circuit.circuit_name, circuit_location, 
ifnull(constructor_name, "Not yet raced") as winning_constructor, ifnull(concat(driver_forename, " ", driver_surname), "Not yet raced") as winning_driver, 
case watched_live when "y" then "Yes" else "No" end as watched_live,
winning_driver_name,
winning_time_hours,
fastest_time_hours,
case winning_time_hours
when fastest_time_hours then 1
else 0
end as circuit_record
from races
left join circuit using (circuitid)
left join attendance using (raceid)
left join win_results using (raceid)
left join driver using (driverid)
left join constructor using (constructorid)
left join {{ref("winning_times")}} using(raceid)
left join {{ref("fastest_times")}} using(circuitid)
)

select * from final
where circuit_Record = 1
order by date_of_race desc