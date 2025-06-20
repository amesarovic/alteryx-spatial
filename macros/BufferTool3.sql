{%- macro BufferTool2(table_name,schema,polygonColumnName,distance,unit) -%}
    {{ log("table_name=" ~ table_name, info=True) }}
    {{ log("schema=" ~ schema, info=True) }}
    {{ log("geometryColumnName=" ~ geometryColumnName, info=True) }}
    {{ log("distance=" ~ distance, info=True) }}
    {{ log("unit=" ~ unit, info=True) }}

    select
    andre_dev.alteryx_spatial.buffer({{geometryColumnName}}, {{distance}}, "{{unit}}" ) as output
    from {{ table_name }}
{%- endmacro -%}