
{%- macro ST_BufferTool_03(table_name,schema,polygonColumnName,distance,unit,writeInputGeometry) -%}
    {{ log("table_name=" ~ table_name, info=True) }}
    {{ log("schema=" ~ schema, info=True) }}
    {{ log("polygonColumnName=" ~ polygonColumnName, info=True) }}
    {{ log("distance=" ~ distance, info=True) }}
    {{ log("unit=" ~ unit, info=True) }}
    {{ log("writeInputGeometry=" ~ writeInputGeometry, info=True) }}

/*
select
  st_astext(
    st_buffer(
       ST_GeomFromText({{polygonColumnName}}),
       2
    )
  ) as output
from {{ table_name }}

select {{ polygonColumnName }} from {{ table_name }} 
*/

    select
        andre_dev.alteryx_spatial.buffer(
            {{polygonColumnName}},
            {{distance}},
            "{{unit}}",
            {{writeInputGeometry}}
        ) as output
    from {{ table_name }}

{%- endmacro -%}

