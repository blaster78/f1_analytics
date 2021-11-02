with drivers as (

select 
driverid,
number as driver_number,
code as driver_code,
forename as driver_forename,
surname as driver_surname,
dob as driver_dob,
nationality as driver_nation

      from {{ source("f1_analytics","tbl_drivers")}}
)

select * from drivers