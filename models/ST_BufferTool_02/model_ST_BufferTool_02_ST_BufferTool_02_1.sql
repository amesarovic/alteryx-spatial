{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mctu9q1i__ST_BufferTool_02__ST_BufferTool_02_1",
    "database": "andre_dev",
    "schema": "alteryx_spatial"
  })
}}

WITH new_england AS (

  SELECT * 
  
  FROM {{ source('andre_dev.alteryx_spatial', 'new_england') }}

),

ST_BufferTool_02_1 AS (

  {{ andre_spatial_07.ST_BufferTool_02('',,'',1,'miles',false) }}

)

SELECT *

FROM ST_BufferTool_02_1
