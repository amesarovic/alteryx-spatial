Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)

with DAG(Schedule = Schedule):
    new_england = Task(
        task_id = "new_england", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "new_england", "sourceName" : "andre_dev.alteryx_spatial", "sourceType" : "Table"}
    )
    model_Generalize2Tool_a_generalize_polygons = Task(
        task_id = "model_Generalize2Tool_a_generalize_polygons", 
        component = "Model", 
        modelName = "model_Generalize2Tool_a_generalize_polygons"
    )
    new_england.out >> model_Generalize2Tool_a_generalize_polygons.in_0
