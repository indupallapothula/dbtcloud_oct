{{ config(
    
    alias='stage_regions'
) }}

with REGION as (
    select 
        R_REGIONKEY as region_id,
        R_NAME as name,
        R_COMMENT as comment,
        {{dbt_meta()}}
    from {{ source('src', 'regions') }}
)

select * from REGION
