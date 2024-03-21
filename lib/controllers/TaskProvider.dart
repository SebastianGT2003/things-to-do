import 'package:flutter/material.dart';
import 'package:things_to_do/models/Task.dart';

class TaskProvider extends ChangeNotifier {
  // Lista privada
  List<Task> _task = [
    Task(
      title: "title",
      description: "description",
    )
  ];

  //Lista publica
  List<Task> get tasks => _task;

  addTask(Task task) {
    _task.add(task);
  }

  delteTask(Task task) {
    _task.remove(task);
  }
}
