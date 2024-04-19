import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';

class TaskController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late Task task_;

  final String collection = "task";
  Future<String> create(Task task) async {
    Map<String, dynamic> taskJson = task.toJson(task);
    DocumentReference response = await db.collection(collection).add(taskJson);
    task.id = response.id;
    return response.id;
  }

  Future<void> EditTask(Task task, String id) async {
    Map<String, dynamic> taskJson = task.toJson(task);
    await db.collection(collection).doc(id).update(taskJson);
  }

  void saveTask(Task task, TaskProvider provider) {
    provider.addTask(task);
    provider.notifyListeners();
  }

  String? validateField(value) {
    return value == null || value!.isEmpty ? "Este campo es obligatorio" : null;
  }
}
