{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mc0m8wki__Float_MakeGridTool_01__Float_MakeGridTool_0",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH ne_polygons AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'ne_polygons') }}

),

Float_MakeGridTool_0 AS (

  {{ andre_spatial_07.Float_MakeGridTool() }}

)

SELECT *

FROM Float_MakeGridTool_0
