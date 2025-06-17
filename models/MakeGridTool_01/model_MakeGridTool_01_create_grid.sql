{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc0k27wa__MakeGridTool_01__create_grid",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH ne_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'ne_polygons') }}

),

create_grid AS (

  {{
    andre_spatial_07.MakeGridTool(
      'ne_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      2, 
      'kms'
    )
  }}

)

SELECT *

FROM create_grid
