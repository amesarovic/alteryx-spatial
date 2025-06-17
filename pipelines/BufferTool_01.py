Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    buffer_polygons = Task(
        task_id = "buffer_polygons", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "buffer_polygons", "sourceName" : "andre_dev.alteryx_spatial", "sourceType" : "Table"}
    )
    model_BufferTool_01_buffer_polygons_1 = Task(
        task_id = "model_BufferTool_01_buffer_polygons_1", 
        component = "Model", 
        modelName = "model_BufferTool_01_buffer_polygons_1"
    )
    buffer_polygons.out >> model_BufferTool_01_buffer_polygons_1.in_0
