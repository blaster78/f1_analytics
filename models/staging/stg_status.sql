with status as (

select 

statusid,
status as finish_status

from {{ source("f1_analytics","tbl_status")}}

)

select * from status