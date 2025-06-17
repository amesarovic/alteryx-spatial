Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    ne_polygons = Task(
        task_id = "ne_polygons", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "ne_polygons", "sourceName" : "andre_dev.alteryx_spatial", "sourceType" : "Table"}
    )
    model_FoobarTool2_a_process_geospatial_data = Task(
        task_id = "model_FoobarTool2_a_process_geospatial_data", 
        component = "Model", 
        modelName = "model_FoobarTool2_a_process_geospatial_data"
    )
    ne_polygons.out >> model_FoobarTool2_a_process_geospatial_data.in_0
