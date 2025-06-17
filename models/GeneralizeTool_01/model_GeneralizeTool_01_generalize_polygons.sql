{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mbzyvhg0__GeneralizeTool_01__generalize_polygons",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH buffer_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'buffer_polygons') }}

),

generalize_polygons AS (

  {{
    andre_spatial_07.GeneralizeTool(
      'buffer_polygons', 
      [{ "name": "name", "dataType": "String" }, { "name": "geometry", "dataType": "String" }], 
      'geometry', 
      0, 
      'kms'
    )
  }}

)

SELECT *

FROM generalize_polygons
