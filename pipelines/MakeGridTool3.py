Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    ne_polygons = Task(
        task_id = "ne_polygons", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "ne_polygons", "sourceName" : "andre_dev.alteryx_spatial", "sourceType" : "Table"}
    )
    model_MakeGridTool3_create_grid = Task(
        task_id = "model_MakeGridTool3_create_grid", 
        component = "Model", 
        modelName = "model_MakeGridTool3_create_grid"
    )
    ne_polygons.out >> model_MakeGridTool3_create_grid.in_0
