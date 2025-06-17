{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc0ls74f__FoobarTool2_a__process_geospatial_data",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH ne_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'ne_polygons') }}

),

process_geospatial_data AS (

  {{
    andre_spatial_07.FoobarTool2(
      'ne_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      1, 
      'kms'
    )
  }}

)

SELECT *

FROM process_geospatial_data
