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
    model_MakeGridTool_05_create_grid_miles = Task(
        task_id = "model_MakeGridTool_05_create_grid_miles", 
        component = "Model", 
        modelName = "model_MakeGridTool_05_create_grid_miles"
    )
    new_england.out >> model_MakeGridTool_05_create_grid_miles.in_0
