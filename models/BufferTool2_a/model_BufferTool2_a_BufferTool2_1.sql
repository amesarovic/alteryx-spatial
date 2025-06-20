{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc4xzqde__BufferTool2_a__BufferTool2_1",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

BufferTool2_1 AS (

  {{
    andre_spatial_07.BufferTool2(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      '', 
      1, 
      'miles'
    )
  }}

)

SELECT *

FROM BufferTool2_1
