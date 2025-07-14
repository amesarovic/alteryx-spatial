
{%- macro Hello_World(parameter1) -%}
    select * from {{ parameter1 }}
{%- endmacro -%}
