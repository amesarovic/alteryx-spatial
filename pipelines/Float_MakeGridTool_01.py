Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    ne_polygons = Task(
        task_id = "ne_polygons", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "ne_polygons", "sourceName" : "andre_dev.alteryx_spatial", "sourceType" : "Table"}
    )
    model_Float_MakeGridTool_01_Float_MakeGridTool_0 = Task(
        task_id = "model_Float_MakeGridTool_01_Float_MakeGridTool_0", 
        component = "Model", 
        modelName = "model_Float_MakeGridTool_01_Float_MakeGridTool_0"
    )
    ne_polygons.out >> model_Float_MakeGridTool_01_Float_MakeGridTool_0.in_0
