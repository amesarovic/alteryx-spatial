Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    new_england = Task(
        task_id = "new_england", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "new_england", "sourceName" : "andre_dev.alteryx_spatial", "sourceType" : "Table"}
    )
    model_BufferTool_01_BufferTool_1 = Task(
        task_id = "model_BufferTool_01_BufferTool_1", 
        component = "Model", 
        modelName = "model_BufferTool_01_BufferTool_1"
    )
    new_england.out >> model_BufferTool_01_BufferTool_1.in_0
