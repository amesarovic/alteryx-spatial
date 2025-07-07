{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mctka2cx__BufferTableTool__BufferTableTool_1",
    "database": "andre_dev",
    "schema": "alteryx_spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

BufferTableTool_1 AS (

  {{
    andre_spatial_07.BufferTableTool(
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

FROM BufferTableTool_1
