import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';
import 'task_container.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.tasks.length,
        itemBuilder: (context, index) {
          return TaskContainer(
            taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            checkboxCallback: (){
              taskData.changeTaskCheck(taskData.tasks[index]);
            },
            longPressCallback: (){
              taskData.deleteTask(taskData.tasks[index]);
            },
          );
        },
      );
    });
  }
}
