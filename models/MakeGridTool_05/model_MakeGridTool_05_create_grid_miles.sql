{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mcai1ym8__MakeGridTool_05__create_grid_miles",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

create_grid_miles AS (

  {{
    andre_spatial_07.MakeGridTool_05(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      0.1, 
      'miles'
    )
  }}

)

SELECT *

FROM create_grid_miles
