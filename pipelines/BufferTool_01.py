Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    ne_polygons = Task(
        task_id = "ne_polygons", 
        component = "Dataset", 
        table = {"name" : "ne_polygons", "sourceType" : "Source", "sourceName" : "andre_dev.alteryx_spatial", "alias" : ""}
    )
    model_BufferTool_01_buffer_ne_polygons = Task(
        task_id = "model_BufferTool_01_buffer_ne_polygons", 
        component = "Model", 
        modelName = "model_BufferTool_01_buffer_ne_polygons"
    )
    ne_polygons.out >> model_BufferTool_01_buffer_ne_polygons.in_0
