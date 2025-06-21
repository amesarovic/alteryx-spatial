Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    new_england = Task(
        task_id = "new_england", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {
          "name": "new_england", 
          "sourceType": "Table", 
          "sourceName": "andre_dev.alteryx_spatial", 
          "alias": "", 
          "additionalProperties": None
        }
    )
    buffer_new_england = Task(
        task_id = "buffer_new_england", 
        component = "BufferTool_04", 
        relation_name = ["new_england"], 
        geometryColumnName = "geometry", 
        _oldMacroProperties = {
          "macroName": "BufferTool_04", 
          "projectName": "andre_spatial_07", 
          "parameters": [{"name" : "relation_name", "value" : "['new_england']"},                           {
                            "name": "schema", 
                            "value": "[{"name": "name", "dataType": "String"}, {"name": "geometry", "dataType": "String"}]"
                          },                           {"name" : "destinationColumnNames", "value" : "geometry"},                           {"name" : "distance", "value" : "20"},                           {"name" : "unit", "value" : "miles"}]
        }, 
        schema = "[{"name": "name", "dataType": "String"}, {"name": "geometry", "dataType": "String"}]", 
        writeInputGeometry = False, 
        unit = "miles", 
        distance = 20
    )
    new_england.out >> buffer_new_england.in0
