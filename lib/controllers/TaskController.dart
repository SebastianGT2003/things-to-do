import 'package:flutter/material.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';

void saveContact(GlobalKey<FormState> _key, Task task, TaskProvider provider) {
  // Valido el formulario
  if (_key.currentState!.validate()) {
    // Agregar a la lista del provider
    provider..addTask(task);
    provider.notifyListeners();
  }
}

String? validateField(value) {
  return value == null || value!.isEmpty ? "Este campo es obligatorio" : null;
}
