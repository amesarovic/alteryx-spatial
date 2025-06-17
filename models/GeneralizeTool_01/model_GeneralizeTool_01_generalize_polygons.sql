{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc0im9td__GeneralizeTool_01__generalize_polygons",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH ne_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'ne_polygons') }}

),

generalize_polygons AS (

  {{
    andre_spatial_07.GeneralizeTool(
      'ne_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      0, 
      'kms'
    )
  }}

)

SELECT *

FROM generalize_polygons
