Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    new_england_distance = Task(
        task_id = "new_england_distance", 
        component = "Dataset", 
        table = {"name" : "new_england_distance", "sourceType" : "Source", "sourceName" : "andre_dev.alteryx_spatial", "alias" : ""}
    )
    model_BufferTableTool_01_buffer_new_england_distance = Task(
        task_id = "model_BufferTableTool_01_buffer_new_england_distance", 
        component = "Model", 
        modelName = "model_BufferTableTool_01_buffer_new_england_distance"
    )
    new_england_distance.out >> model_BufferTableTool_01_buffer_new_england_distance.in_0
