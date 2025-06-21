{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc6iu1gb__BufferTool_05__buffer_geometries",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

buffer_geometries AS (

  {{
    andre_spatial_07.BufferTool_05(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      10, 
      'miles', 
      false
    )
  }}

)

SELECT *

FROM buffer_geometries
