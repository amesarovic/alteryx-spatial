{%- macro BufferTool_06(table_name,schema,polygonColumnName,distance,unit,writeInputGeometry) -%}
    {{ log("table_name=" ~ table_name, info=True) }}
    {{ log("schema=" ~ schema, info=True) }}
    {{ log("polygonColumnName=" ~ polygonColumnName, info=True) }}
    {{ log("distance=" ~ distance, info=True) }}
    {{ log("unit=" ~ unit, info=True) }}
    {{ log("writeInputGeometry=" ~ writeInputGeometry, info=True) }}
    
    select
        andre_dev.alteryx_spatial.buffer(
            {{polygonColumnName}},
            {{distance}},
            "{{unit}}",
            {{writeInputGeometry}}
        ) as output
    from {{ table_name }}
{%- endmacro -%}