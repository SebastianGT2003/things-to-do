import 'package:flutter/material.dart';
import 'package:things_to_do/models/Task.dart';

class TaskProvider extends ChangeNotifier {
  // Lista privada
  List<Task> _task = [
    Task(
      title: "Tarea de Movil",
      description: "Hacer crear, eliminar y editar tarea",
    )
  ];

  //Lista publica
  List<Task> get tasks => _task;

  addTask(Task task) {
    _task.add(task);
  }

  deleteTask(Task task) {
    _task.remove(task);
  }

  editTask(Task task, index, TaskProvider provider) {
    _task[index] = task;
    provider.notifyListeners();
  }
}
