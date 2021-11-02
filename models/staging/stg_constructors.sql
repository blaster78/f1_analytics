with constructors as (

select 
constructorid,
name as constructor_name,
nationality as constructor_nation 
  from {{ source("f1_analytics","tbl_constructors")}}


)

select * From constructors