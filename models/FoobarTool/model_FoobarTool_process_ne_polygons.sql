{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc0kfwgo__FoobarTool__process_ne_polygons",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH ne_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'ne_polygons') }}

),

process_ne_polygons AS (

  {{
    andre_spatial_07.FoobarTool(
      'ne_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      1, 
      'kms'
    )
  }}

)

SELECT *

FROM process_ne_polygons
