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
    model_MakeGridTool_04_MakeGridTool_04_0 = Task(
        task_id = "model_MakeGridTool_04_MakeGridTool_04_0", 
        component = "Model", 
        modelName = "model_MakeGridTool_04_MakeGridTool_04_0"
    )
    new_england.out >> model_MakeGridTool_04_MakeGridTool_04_0.in_0
