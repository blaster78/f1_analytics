with races as (

    SELECT * FROM {{ source(`f1_analytics`,`tbl_races`)}}

)

select * from races