 select driverid, count(*) as poles from
    {{ref("stg_results")}}
    where grid = 1
    group by driverid