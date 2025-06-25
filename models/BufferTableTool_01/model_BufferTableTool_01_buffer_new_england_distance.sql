{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mcbjpqz8__BufferTableTool_01__buffer_new_england_distance",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england_distance AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england_distance') }}

),

buffer_new_england_distance AS (

  {{
    andre_spatial_07.BufferTableTool_01(
      'new_england_distance', 
      [
        { "name": "name", "dataType": "String" }, 
        { "name": "distance", "dataType": "Integer" }, 
        { "name": "unit", "dataType": "String" }, 
        { "name": "geometry", "dataType": "String" }
      ], 
      'geometry', 
      'distance', 
      'unit', 
      true
    )
  }}

)

SELECT *

FROM buffer_new_england_distance
