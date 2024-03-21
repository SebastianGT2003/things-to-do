class Task {
  late String title;
  late String description;
  late bool taskCompleted = false;

  Task({
    required this.title,
    required this.description,
  });

  Task.empty() {
    title = "";
    description = "";
    taskCompleted = false;
  }
}
