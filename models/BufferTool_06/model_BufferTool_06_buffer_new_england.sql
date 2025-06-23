{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc9gre37__BufferTool_06__buffer_new_england",
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
    andre_spatial_07.BufferTool_06(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      10, 
      'miles', 
      true
    )
  }}

)

SELECT *

FROM buffer_new_england
