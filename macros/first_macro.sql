{% macro jodo(col1, col2) %}
    {{col1}} || ' ' || {{col2}}
{% endmacro %} 


-- Gender macro
{% macro gender(gn) %}
    case
        when {{ gn }} = 'M' then 'Male'
        when {{ gn }} = 'F' then 'Female'
        when {{ gn }} = 'U' then 'Unk'
    end
{% endmacro %}

-- Phone formatting macro
{% macro phone(ph) %}
    '(' || substr({{ ph }},1,3) || ') ' || substr({{ ph }},4,3) || '-' || substr({{ ph }},7,4)
{% endmacro %}

-- Age group macro
{% macro age_group(age_column) %}
    case
        when {{ age_column }} < 30 then 'Young'
        when {{ age_column }} between 30 and 50 then 'Middle'
        else 'Senior'
    end
{% endmacro %}

{% macro showemps() %}

    {% set results = run_query("select employee_name from " ~ ref('stg_employees')) %}

    {% if execute %}
        {% for row in results.rows %}
            {{ print(row[0]) }}
        {% endfor %}
    {% endif %}
{% endmacro %}

{% macro unload()%}
{% do run_query("create or replace stage stage_analytics") %}
{% do run_query("copy into @stage_analytics from stg_nations partition by (region_id)
file_format= (type = csv compression=none null_if=(' ')) header=true ; ") %}
{% endmacro %}