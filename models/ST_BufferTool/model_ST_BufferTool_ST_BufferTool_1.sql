{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mctk2ycv__ST_BufferTool__ST_BufferTool_1",
    "database": "andre_dev",
    "schema": "alteryx_spatial"
  })
}}

WITH ST_BufferTool_1 AS (

  {{ andre_spatial_07.ST_BufferTool('', '', '', 1, 'miles', false) }}

)

SELECT *

FROM ST_BufferTool_1
