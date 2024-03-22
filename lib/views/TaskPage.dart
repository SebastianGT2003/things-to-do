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
          title: Center(
              child: Text(
            "Task list",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
          backgroundColor: Color.fromARGB(158, 255, 2, 91)),
      body: Consumer<TaskProvider>(builder: (_, TaskProvider, child) {
        return GetListView(provider: TaskProvider);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Pasar el contexto al método _showTaskDialog
          PopUpWindow(
              context, Provider.of<TaskProvider>(context, listen: false));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
