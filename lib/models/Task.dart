class Task {
  late String title;
  late String description;
  late bool taskCompleted;

  Task({
    required this.title,
    required this.description,
    required this.taskCompleted,
  });

  Task.empty() {
    title = "";
    description = "";
    taskCompleted = false;
  }
}
