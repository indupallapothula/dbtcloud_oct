{{ config(materialized='view') }}

with suppliers as (
    select *
    from {{ ref('stg_suppliers') }}
),

nations as (
    select *
    from {{ ref('stg_nations') }}
),

regions as (
    select *
    from {{ ref('stg_regions') }}
)

select
    s.supplier_id,
    s.supplier_name,
    s.supplier_address,
    s.phone_number,
    s.comment as supplier_comment,
    s.account_balance,
    s.updated_time,

    n.name as nation_name,

    r.name as region_name,
    r.comment as region_comment,
    {{  dbt_meta() }}
from suppliers s
join nations n
    on s.nation_id = n.nation_id
join regions r
    on n.region_id = r.region_id



