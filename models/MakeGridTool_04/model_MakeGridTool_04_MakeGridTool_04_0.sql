{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mcahv0xx__MakeGridTool_04__MakeGridTool_04_0",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

MakeGridTool_04_0 AS (

  {{ andre_spatial_07.MakeGridTool_04('',,'',0.1,'miles') }}

)

SELECT *

FROM MakeGridTool_04_0
