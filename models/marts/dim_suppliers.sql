with supps as (
    selectsupplier_id,
    supplier_name,
    account_balance,
    phone_number,
    supplier_address,
    nation as nation_name,
    region as region_name,
    updated_timefrom {{ ref('int_suppliers')}}
    {% if is_incremental() %}
    where updated_time < (select max(updated_time) from {{this}})
    {% endif %}


)
select *, {{ dbt_meta() }} from supps