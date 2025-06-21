{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc5n8h7p__BufferTool_04__buffer_new_england",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

buffer_new_england AS (

  {{
    andre_spatial_07.BufferTool_04(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      10, 
      'miles'
    )
  }}

)

SELECT *

FROM buffer_new_england
