with wins as (
    
    select * from 
{{ref("stg_results")}}
where positionorder = 1

),

points as (
    
    select driverid, sum(points) as total_points from 
{{ref("stg_results")}}
group by driverid

),


driver as (

    select concat(driver_forename, " ", driver_surname) as driver_name, * from
    {{ref("stg_drivers")}}
),

poles as (
    select driverid, count(*) as pole_positions from
    {{ref("stg_results")}}
    where grid = 1
    group by driverid
)

select driver_name, count(wins.raceid)as wins, points.total_points as total_points, pole_positions as total_poles From 
driver
left join wins using(driverid)
left join points using(driverid)
left join poles using(driverid)
group by driver_name, points.total_points, pole_positions
order by wins desc
