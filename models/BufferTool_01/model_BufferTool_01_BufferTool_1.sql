{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc49dxl8__BufferTool_01__BufferTool_1",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

BufferTool_1 AS (

  {{
    andre_spatial_07.BufferTool(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      '', 
      1, 
      'miles', 
      false
    )
  }}

)

SELECT *

FROM BufferTool_1
