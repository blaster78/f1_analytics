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

select date_of_race, name_of_race, circuit_name, circuit_location, 
ifnull(constructor_name, "Not yet raced") as winning_constructor, ifnull(concat(driver_forename, " ", driver_surname), "Not yet raced") as winning_driver, 
case watched_live when "y" then "Yes" else "No" end as watched_live 
from races
left join circuit using (circuitid)
left join attendance using (raceid)
left join win_results using (raceid)
left join driver using (driverid)
left join constructor using (constructorid)
)

select * from final
order by date_of_race desc