import 'package:flutter/material.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';

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

              return getListTile(task, widget.provider);
            },
          ),
        ),
      ],
    );
  }

  Widget getListTile(task, provider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            setState(() {
              provider.delteTask(task);
            });
          }
        },
        child: ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          leading: Checkbox(
            value: task.taskCompleted,
            onChanged: (bool? newValue) {
              setState(() {
                task.taskCompleted = newValue!;
              });
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                provider.delteTask(task);
              });
            },
          ),
        ),
      ),
    );
  }
}
