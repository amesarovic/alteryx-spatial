{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mcuql3z6__ST_BufferTool_02__ST_BufferTool_02_1",
    "database": "andre_dev",
    "schema": "alteryx_spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

ST_BufferTool_02_1 AS (

  {{
    andre_spatial_07.ST_BufferTool_02(
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

FROM ST_BufferTool_02_1
