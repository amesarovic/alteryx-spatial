{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc0fd8y9__BufferTool_01__buffer_ne_polygons",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH ne_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'ne_polygons') }}

),

buffer_ne_polygons AS (

  {{
    andre_spatial_07.BufferTool(
      'ne_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      100, 
      'kms'
    )
  }}

)

SELECT *

FROM buffer_ne_polygons
