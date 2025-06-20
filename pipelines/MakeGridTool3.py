Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    new_england = Task(
        task_id = "new_england", 
        component = "Dataset", 
        table = {"name" : "new_england", "sourceType" : "Source", "sourceName" : "andre_dev.alteryx_spatial", "alias" : ""}
    )
    model_MakeGridTool3_create_grid_new_england = Task(
        task_id = "model_MakeGridTool3_create_grid_new_england", 
        component = "Model", 
        modelName = "model_MakeGridTool3_create_grid_new_england"
    )
    new_england.out >> model_MakeGridTool3_create_grid_new_england.in_0
