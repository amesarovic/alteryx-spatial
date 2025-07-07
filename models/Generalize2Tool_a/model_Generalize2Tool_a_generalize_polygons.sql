{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc1l34j0__Generalize2Tool_a__generalize_polygons",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

generalize_polygons AS (

  {{
    andre_spatial_07.Generalize2Tool(
      'new_england', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      4, 
      'miles'
    )
  }}

)

SELECT *

FROM generalize_polygons
