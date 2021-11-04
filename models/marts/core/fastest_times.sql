with fastest_time as (
    select 
circuitid,
min(milliseconds/3600000) as fastest_time_hours
 from 
{{ref("stg_results")}}
left join
{{ref("stg_races")}} using(raceid)
group by circuitid
)

select * from fastest_time