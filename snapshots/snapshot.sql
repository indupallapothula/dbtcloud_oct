{% snapshot scd_orders %}

{{
  config(
    alias='scd_orders_3',
    target_database='analytics',
    target_schema='scds',
    unique_key='o_orderkey',
    strategy='check',
    check_cols=['o_orderpriority', 'o_orderdate', 'o_comment'],
    hard_deletes='new_record',
    
  )
}}

select * from {{ source('src', 'orders') }}

{% endsnapshot %}
