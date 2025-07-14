{%- macro BufferTool(table_name, schema, geometryColumnName, distance, unit) -%}
  {{ log("table_name=" ~ table_name, info=True) }}
  {{ log("schema=" ~ schema, info=True) }}
  {{ log("geometryColumnName=" ~ geometryColumnName, info=True) }}
  {{ log("distance=" ~ distance, info=True) }}
  {{ log("unit=" ~ unit, info=True) }}
SELECT
 ST_AsText(
  ST_Transform(
   ST_Buffer(
    ST_Transform(
     ST_GeomFromText(
      {{geometryColumnName}},
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