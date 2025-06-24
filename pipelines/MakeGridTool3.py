Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    new_england = Task(
        task_id = "new_england", 
        component = "Dataset", 
        table = {"name" : "new_england", "sourceType" : "Source", "sourceName" : "andre_dev.alteryx_spatial", "alias" : ""}
    )
    model_MakeGridTool3_MakeGridTool3_1 = Task(
        task_id = "model_MakeGridTool3_MakeGridTool3_1", 
        component = "Model", 
        modelName = "model_MakeGridTool3_MakeGridTool3_1"
    )
    new_england.out >> model_MakeGridTool3_MakeGridTool3_1.in_0
