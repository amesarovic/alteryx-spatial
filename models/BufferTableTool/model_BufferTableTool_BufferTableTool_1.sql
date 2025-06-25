{{
  config({    
    "materialized": "table",
    "alias": "prophecy_tmp__mccds0pd__BufferTableTool__BufferTableTool_1",
    "database": "andre_dev",
    "schema": "spatial"
  })
}}

WITH BufferTableTool_1 AS (

  {{ andre_spatial_07.BufferTableTool('', '', '', 1, 'miles', false) }}

)

SELECT *

FROM BufferTableTool_1
