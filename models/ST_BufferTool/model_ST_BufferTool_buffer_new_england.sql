{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mctjayaf__ST_BufferTool__buffer_new_england",
    "database": "andre_dev",
    "schema": "alteryx_spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

buffer_new_england AS (

  {{
    andre_spatial_07.ST_BufferTool(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      10000, 
      'miles', 
      false
    )
  }}

)

SELECT *

FROM buffer_new_england
