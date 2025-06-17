{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc0jnmr9__Generalize2Tool_a__generalize_polygons",
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
    andre_spatial_07.Generalize2Tool(
      'ne_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      4, 
      'kms'
    )
  }}

)

SELECT *

FROM generalize_polygons
