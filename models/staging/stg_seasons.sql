with seasons as (

select 
year,
url as season_url
 from
    {{ source("f1_analytics","tbl_seasons")}}
)

select * from seasons