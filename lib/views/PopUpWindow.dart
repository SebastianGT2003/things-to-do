import 'package:flutter/material.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';

Future<void> PopUpWindow(
    BuildContext context, TaskProvider taskProvider) async {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Nueva Tarea'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Aquí puedes guardar la tarea con el título y la descripción
              String title = titleController.text;
              String description = descriptionController.text;

              // Realizar cambios en el proveedor
              taskProvider.addTask(Task(
                  title: title,
                  description: description,
                  taskCompleted: false));

              // Notificar a los widgets que escuchan cambios en el proveedor
              taskProvider.notifyListeners();

              Navigator.of(context).pop();
            },
            child: Text('Guardar'),
          ),
        ],
      );
    },
  );
}
