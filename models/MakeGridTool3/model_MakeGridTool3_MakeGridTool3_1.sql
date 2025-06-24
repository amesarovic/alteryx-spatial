{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc9rbpv2__MakeGridTool3__MakeGridTool3_1",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

MakeGridTool3_1 AS (

  {{
    andre_spatial_07.MakeGridTool3(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      '', 
      0.1, 
      'miles'
    )
  }}

)

SELECT *

FROM MakeGridTool3_1
