import 'package:flutter/material.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';

void saveTask(Task task, TaskProvider provider) {
  provider.addTask(task);
  provider.notifyListeners();
}

String? validateField(value) {
  return value == null || value!.isEmpty ? "Este campo es obligatorio" : null;
}
