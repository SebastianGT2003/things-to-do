import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';
import 'package:things_to_do/views/EditPopUpWindow.dart';

class GetListView extends StatefulWidget {
  final TaskProvider provider; // Pasa el proveedor al estado
  const GetListView({Key? key, required this.provider}) : super(key: key);

  @override
  State<GetListView> createState() => _GetListViewState();
}

class _GetListViewState extends State<GetListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget
                .provider.tasks.length, // Accede a tasks desde widget.provider
            itemBuilder: (context, index) {
              Task task = widget.provider.tasks[index];

              return getListTile(task, widget.provider, index);
            },
          ),
        ),
      ],
    );
  }

  Widget getListTile(task, provider, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.blue, // Color para editar
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(Icons.edit, color: Colors.white),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            setState(() {
              provider.deleteTask(task);
            });
          } else if (direction == DismissDirection.startToEnd) {
            setState(() {
              EditPopUpWindow(context, task, index,
                  Provider.of<TaskProvider>(context, listen: false));
            });
          }
        },
        child: ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: task.taskCompleted,
                onChanged: (bool? newValue) {
                  setState(() {
                    task.taskCompleted = newValue!;
                  });
                },
                activeColor: Color.fromARGB(158, 255, 2, 91),
                shape: CircleBorder(eccentricity: 1.0),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Color.fromARGB(158, 255, 2, 91),
                onPressed: () {
                  setState(() {
                    provider.deleteTask(task);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.edit),
                color: Color.fromARGB(158, 255, 2, 91),
                onPressed: () {
                  setState(() {
                    EditPopUpWindow(context, task, index,
                        Provider.of<TaskProvider>(context, listen: false));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
