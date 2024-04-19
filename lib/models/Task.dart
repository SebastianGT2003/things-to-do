class Task {
  late String id;
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

  Map<String, dynamic> toJson(Task task) {
    return {
      'title': title,
      'description': description,
      "taskCompleted": taskCompleted
    };
  }
}
