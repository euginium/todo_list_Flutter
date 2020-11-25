import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_app/screens/add_task_screen.dart';
import 'package:todoey_app/widgets/task_list.dart';
import 'package:todoey_app/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              (newTaskTitle) {
                setState(() {
                  Provider.of<TaskData>(context)
                      .tasks
                      .add(Task(taskName: newTaskTitle));
                });
                Navigator.pop(context);
              },
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent.shade200,
        elevation: 2.0,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, bottom: 20.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 40.0,
                      color: Colors.lightBlueAccent.shade100,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).tasks.length} tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}

/*this is what a bottomsheet fundamentally requires to build. However, there's a shortcut used above.
In line 14.*/
Widget bottomSheetWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.0),
        topLeft: Radius.circular(30.0),
      ),
    ),
  );
}

//this class is traditional Row build (If I were to do it without ListTIle).
class TaskWidget extends StatelessWidget {
  TaskWidget({this.taskText});

  final String taskText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$taskText',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Checkbox(value: false, onChanged: null)
      ],
    );
  }
}
