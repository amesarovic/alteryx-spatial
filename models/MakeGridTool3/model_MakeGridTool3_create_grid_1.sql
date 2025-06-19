{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc2tepzi__MakeGridTool3__create_grid_1",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england_1 AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

create_grid_1 AS (

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

FROM create_grid_1
