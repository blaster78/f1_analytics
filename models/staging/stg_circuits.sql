with circuits as (

    select circuitid,
    name as circuit_name,
    location as circuit_location,
    country as circuit_country From

  {{ source("f1_analytics","tbl_circuits")}}

)

select * from circuits