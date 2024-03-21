import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';
import 'package:things_to_do/views/getListView.dart';
import 'package:things_to_do/views/PopUpWindow.dart';

class TaskPage extends StatefulWidget {
  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task list"),
      ),
      body: Consumer<TaskProvider>(builder: (_, TaskProvider, child) {
        return GetListView(provider: TaskProvider);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Pasar el contexto al método _showTaskDialog
          PopUpWindow(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
