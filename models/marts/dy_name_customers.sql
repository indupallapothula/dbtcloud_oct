{{ config(
    materialized = 'dynamic_table',
    target_lag = '5 minutes',
    snowflake_warehouse = 'TRANSFORM_WH',
    refresh_mode = 'INCREMENTAL'
    
) }}

select  
    n.name  nation_name,
    sum(c.customer_id)  no_of_customers,
    sum(c.account_balance)  account_balance
from {{ ref('stg_customers') }} c
join {{ ref('stg_nations') }} n on c.nation_id = n.nation_id
group by n.name