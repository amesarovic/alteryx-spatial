{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc1krw6d__MakeGridTool3__create_grid",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

create_grid AS (

  {{
    andre_spatial_07.MakeGridTool3(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      0.3, 
      'miles'
    )
  }}

)

SELECT *

FROM create_grid
