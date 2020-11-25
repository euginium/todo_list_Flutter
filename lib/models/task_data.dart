import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(taskName: 'buy milk'),
    Task(taskName: 'buy egg'),
    Task(taskName: 'buy bread'),
  ];

  void addtask(String name) {
    final task = Task(taskName: name);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void delelteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
