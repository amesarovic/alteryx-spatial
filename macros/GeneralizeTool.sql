
{%- macro GeneralizeTool(table_name,schema,polygonColumnName,distance,unit) -%}
    {{ log("table_name=" ~ table_name, info=True) }}
    {{ log("schema=" ~ schema, info=True) }}
    {{ log("polygonColumnName=" ~ polygonColumnName, info=True) }}
    {{ log("distance=" ~ distance, info=True) }}
    {{ log("unit=" ~ unit, info=True) }}

    select
    andre_dev.alteryx_spatial.generalize({{polygonColumnName}}, {{distance}}) as output
    from {{ table_name }}
{%- endmacro -%}