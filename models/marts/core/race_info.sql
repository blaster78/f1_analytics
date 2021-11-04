select * from
{{ref("stg_circuits")}}
left join
{{ref("circuit_extended")}} using(circuitid)
order by circuitid

