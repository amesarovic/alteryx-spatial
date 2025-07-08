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
    model_ST_BufferTool_02_ST_BufferTool_02_1 = Task(
        task_id = "model_ST_BufferTool_02_ST_BufferTool_02_1", 
        component = "Model", 
        modelName = "model_ST_BufferTool_02_ST_BufferTool_02_1"
    )
    new_england.out >> model_ST_BufferTool_02_ST_BufferTool_02_1.in_0
