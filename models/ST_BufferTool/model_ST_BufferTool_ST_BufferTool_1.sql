{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mctk55f2__ST_BufferTool__ST_BufferTool_1",
    "database": "andre_dev",
    "schema": "alteryx_spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

ST_BufferTool_1 AS (

  {{
    andre_spatial_07.ST_BufferTool(
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

FROM ST_BufferTool_1
