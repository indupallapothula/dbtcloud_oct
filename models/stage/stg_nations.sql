{{ config(
    query_tag = 'test1',
    alias = this.name + var('v_id'),
    access = 'public'
) }}
with nation as (
select 
        N_NATIONKEY as nation_id,
        N_NAME as name,
        N_REGIONKEY AS region_id,
        updated_at
from {{ source('src', 'nations') }}
)

select * from nation 