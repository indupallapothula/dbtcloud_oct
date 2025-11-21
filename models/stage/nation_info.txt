with nation_info as (
select r.Region_id, n.name as name, r.name as name1, r.COMMENT  from {{ref('stg_regions')}} r
 join {{ref('stg_nations')}} n on r.REGION_ID = n.REGION_ID)

select * from nation_info 