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
    model_BufferTool_05_buffer_geometries = Task(
        task_id = "model_BufferTool_05_buffer_geometries", 
        component = "Model", 
        modelName = "model_BufferTool_05_buffer_geometries"
    )
    new_england.out >> model_BufferTool_05_buffer_geometries.in_0
