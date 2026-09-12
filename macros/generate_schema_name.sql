{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if target.name == 'dev' -%}
        {{ target.schema }}{% if custom_schema_name %}_{{ custom_schema_name }}{% endif %}
    {%- else -%}
        {%- if custom_schema_name -%}
            {{ custom_schema_name | trim }}
        {%- else -%}
            {{ target.schema }}
        {%- endif -%}
    {%- endif -%}
{%- endmacro %}
