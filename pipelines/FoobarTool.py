Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    ne_polygons = Task(
        task_id = "ne_polygons", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "ne_polygons", "sourceName" : "andre_dev.alteryx_spatial", "sourceType" : "Table"}
    )
    model_FoobarTool_process_ne_polygons = Task(
        task_id = "model_FoobarTool_process_ne_polygons", 
        component = "Model", 
        modelName = "model_FoobarTool_process_ne_polygons"
    )
    ne_polygons.out >> model_FoobarTool_process_ne_polygons.in_0
