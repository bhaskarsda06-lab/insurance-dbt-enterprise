-- ============================================================
-- MACRO: generate_schema_name
-- Purpose:
--   Determine the target schema where a dbt model will be built.
-- ============================================================

-- Define the generate_schema_name macro.
-- custom_schema_name = schema explicitly supplied by the model.
-- node = dbt node/model information.
{% macro generate_schema_name(custom_schema_name, node) -%}

    -- Check whether dbt is running against the DEV target.
    {%- if target.name == 'dev' -%}

        -- In DEV:
        -- Start with the target schema.
        -- If a custom schema exists, append it with "_".
        {{ target.schema }}{% if custom_schema_name %}_{{ custom_schema_name }}{% endif %}

    -- If the target is NOT DEV:
    {%- else -%}

        -- Check whether a custom schema was supplied.
        {%- if custom_schema_name -%}

            -- Use the custom schema.
            -- trim removes unnecessary spaces.
            {{ custom_schema_name | trim }}

        -- If no custom schema was supplied:
        {%- else -%}

            -- Use the default target schema.
            {{ target.schema }}

        -- End custom schema condition.
        {%- endif -%}

    -- End DEV/non-DEV condition.
    {%- endif -%}

-- End the macro.
{%- endmacro %}