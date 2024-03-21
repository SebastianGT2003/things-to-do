import 'package:flutter/material.dart';
import 'package:things_to_do/models/Task.dart';

class TaskProvider extends ChangeNotifier {
  // Lista privada
  List<Task> _task = [];

  //Lista publica
  List<Task> get task => _task;

  addTask(Task task) {
    _task.add(task);
  }
}
