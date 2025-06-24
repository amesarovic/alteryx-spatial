{%- macro BufferTableTool_01(table_name,schema,polygonColumnName,distanceColumnName,unitColumnName,writeInputGeometry) -%}
    {{ log("table_name=" ~ table_name, info=True) }}
    {{ log("schema=" ~ schema, info=True) }}
    {{ log("polygonColumnName=" ~ polygonColumnName, info=True) }}
    {{ log("distanceColumnName=" ~ distanceColumnName, info=True) }}
    {{ log("unitColumnName=" ~ unitColumnName, info=True) }}
    {{ log("writeInputGeometry=" ~ writeInputGeometry, info=True) }}

    select
        andre_dev.alteryx_spatial.buffer(
            {{polygonColumnName}},
            {{distanceColumnName}},
            {{unitColumnName}},
            {{writeInputGeometry}}
        ) as output
    from {{ table_name }}
{%- endmacro -%}