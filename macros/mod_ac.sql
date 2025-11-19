{% macro modtab(table_name) %}
    {% do run_query(
        "ALTER TABLE " ~ table_name ~
        " ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP;"
    ) %}
{% endmacro %}


