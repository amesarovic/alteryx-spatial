{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc00wk89__BufferTool_01__buffer_polygons_1",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH ne_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'ne_polygons') }}

),

buffer_polygons_1 AS (

  {{
    andre_spatial_07.BufferTool(
      'ne_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      0, 
      'miles'
    )
  }}

)

SELECT *

FROM buffer_polygons_1
