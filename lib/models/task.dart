class Task {
  Task({this.taskName, this.isDone = false});
  final String taskName;
  bool isDone;

  void toggleDone() {
    isDone = !isDone;
  }
}
