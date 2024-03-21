import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Task list"),
        ),
        body: Text("Hola") /* getListView() */);
  }

  /*  Widget getListView() {
    return 
  } */
}
