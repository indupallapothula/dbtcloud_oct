--select employee_name from {{ ref('stg_employees') }};

{% macro showemps() %}
    {% set sql %}
        select name
        from {{ ref('stg_employees') }}
    {% endset %}

    {% set results = run_query(sql) %}

    {% if execute %}
        {% for name in results.columns[0].values() %}
            {{ log(name, info=True) }}
        {% endfor %}
    {% endif %}
{% endmacro %} 

{% macro unload() %}
{% do run_query("create or replace stage stage_analytics") %}
{% do run_query("copy into @stage_analytics from stg_nations partition by (region) file_format = (type = csv compression=none null_if(' ')) header=true;")%}
{% endmacro %}