{%- macro ST_BufferTool(table_name,schema,polygonColumnName,distance,unit,writeInputGeometry) -%}
    {{ log("table_name=" ~ table_name, info=True) }}
    {{ log("schema=" ~ schema, info=True) }}
    {{ log("polygonColumnName=" ~ polygonColumnName, info=True) }}
    {{ log("distance=" ~ distance, info=True) }}
    {{ log("unit=" ~ unit, info=True) }}
    {{ log("writeInputGeometry=" ~ writeInputGeometry, info=True) }}

/*
    select
        andre_dev.alteryx_spatial.buffer(
            {{polygonColumnName}},
            {{distance}},
            "{{unit}}",
            {{writeInputGeometry}}
        ) as output
    from {{ table_name }}

    select name from {{ table_name }} 
*/

-- Consider enabling Photon or switch to a tier that supports ST expressions SQLSTATE: 0A000

select st_astext(st_buffer(ST_GeomFromText('POLYGON ((-71.0565 42.3555, -73.9249 40.6943, -73.5617 45.5089, -71.0565 42.3555))'), 
2)) as result

{%- endmacro -%}