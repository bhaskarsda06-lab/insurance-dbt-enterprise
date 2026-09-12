{% macro clean_string(column_name) -%}
    nullif(trim(regexp_replace(cast({{ column_name }} as string), '\\s+', ' ')), '')
{%- endmacro %}
