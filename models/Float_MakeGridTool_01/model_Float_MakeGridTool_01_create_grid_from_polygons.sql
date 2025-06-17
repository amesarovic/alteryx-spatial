{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc0ssbk0__Float_MakeGridTool_01__create_grid_from_polygons",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH ne_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'ne_polygons') }}

),

create_grid_from_polygons AS (

  {{
    andre_spatial_07.Float_MakeGridTool(
      'ne_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      1, 
      'kms'
    )
  }}

)

SELECT *

FROM create_grid_from_polygons
