with results as (
    
    select * from 
{{ref("stg_results")}}

),

driver as (

    select * from
    {{ref("stg_drivers")}}
)

select * From 
results
where positionorder = 1
order by raceid desc