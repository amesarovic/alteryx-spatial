{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc5nt97r__MakeGridTool3__create_grid_new_england",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

create_grid_new_england AS (

  {{
    andre_spatial_07.MakeGridTool3(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      0.1, 
      'miles'
    )
  }}

)

SELECT *

FROM create_grid_new_england
