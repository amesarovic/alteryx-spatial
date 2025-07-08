
{%- macro ST_BufferTool_02(table_name,schema,polygonColumnName,distance,unit,writeInputGeometry) -%}
    {{ log("table_name=" ~ table_name, info=True) }}
    {{ log("schema=" ~ schema, info=True) }}
    {{ log("polygonColumnName=" ~ polygonColumnName, info=True) }}
    {{ log("distance=" ~ distance, info=True) }}
    {{ log("unit=" ~ unit, info=True) }}
    {{ log("writeInputGeometry=" ~ writeInputGeometry, info=True) }}


SELECT
  ST_AsText(
    ST_Transform(
      ST_Buffer(
        ST_Transform(
          ST_GeomFromText(
            {{polygonColumnName}},
            4326 
          ),
          3857  
        ),
        {{distance}}  
      ),
      4326  
    )
  ) as output
FROM
  {{table_name}}

{%- endmacro -%}