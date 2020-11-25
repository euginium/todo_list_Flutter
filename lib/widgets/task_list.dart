import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  // TaskList({this.tasks});
  //
  // final List<Task> tasks;
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.taskName,
              isCheck: task.isDone,
              toggleBoxState: (bool boxState) {
                setState(() {
                  task.isDone = boxState;
                  //or use the function in the Task class => tasks[index].toggleDone();
                });
              },
              longPressCallback: () {
                taskData.delelteTask(task);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}

//below method is for manual small list build
/*ListView(
padding:
EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0, bottom: 10.0),
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
TaskTile(taskTitle: tasks[0].taskName, isCheck: tasks[0].isDone),
TaskTile(taskTitle: tasks[1].taskName, isCheck: tasks[1].isDone),
TaskTile(taskTitle: tasks[2].taskName, isCheck: tasks[2].isDone),
],
),
],
);*/
