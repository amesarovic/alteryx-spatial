Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    new_england = Task(
        task_id = "new_england", 
        component = "Dataset", 
        table = {"name" : "new_england", "sourceType" : "Source", "sourceName" : "andre_dev.alteryx_spatial", "alias" : ""}
    )
    model_MakeGridTool3_create_grid = Task(
        task_id = "model_MakeGridTool3_create_grid", 
        component = "Model", 
        modelName = "model_MakeGridTool3_create_grid"
    )
    new_england_1 = Task(
        task_id = "new_england_1", 
        component = "Dataset", 
        table = {"name" : "new_england", "sourceType" : "Source", "sourceName" : "andre_dev.alteryx_spatial", "alias" : ""}
    )
    model_MakeGridTool3_create_grid_1 = Task(
        task_id = "model_MakeGridTool3_create_grid_1", 
        component = "Model", 
        modelName = "model_MakeGridTool3_create_grid_1"
    )
    input_stream_csv = Task(
        task_id = "input_stream_csv", 
        component = "OrchestrationTarget", 
        kind = "DatabricksVolumeTarget", 
        connector = Connection(kind = "databricks", id = "andre_cpnn"), 
        properties = {
          "filePath": {
            "type": "concat_operation", 
            "properties": {
              "elements": [{
                              "type": "literal", 
                              "properties": {
                                "value": "/Volumes/andre_dev/alteryx_spatial/data/output/buffer/new_england.csv"
                              }
                            }]
            }
          }
        }, 
        format = {
          "properties": {
            "allowLazyQuotes": False, 
            "allowEmptyColumnNames": True, 
            "separator": ",", 
            "nullValue": "", 
            "header": True
          }, 
          "kind": "csv", 
          "category": "file"
        }, 
        isNew = False
    )
    new_england.out >> model_MakeGridTool3_create_grid.in_0
    new_england_1.out >> model_MakeGridTool3_create_grid_1.in_0
    model_MakeGridTool3_create_grid_1.out_0 >> input_stream_csv.in0
