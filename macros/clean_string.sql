-- ============================================================
-- MACRO: clean_string
-- Purpose:
--   Remove leading/trailing spaces and convert text to uppercase.
-- ============================================================

-- 'macro' creates a reusable dbt/Jinja function.
-- 'clean_string' is the name of the macro.
-- 'column_name' is the input parameter passed to the macro.
{% macro clean_string(column_name) %}

    -- trim() removes spaces from the beginning and end.
    -- upper() converts the resulting text to uppercase.
    --
    -- {{ column_name }} inserts the column/expression
    -- passed to the macro.
    upper(trim({{ column_name }}))

-- End of the dbt macro.
{% endmacro %}