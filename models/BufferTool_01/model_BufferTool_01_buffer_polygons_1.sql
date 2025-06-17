{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mbzz50xy__BufferTool_01__buffer_polygons_1",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH buffer_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'buffer_polygons') }}

),

buffer_polygons_1 AS (

  {{
    andre_spatial_07.BufferTool(
      'buffer_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      0, 
      'kms'
    )
  }}

)

SELECT *

FROM buffer_polygons_1
