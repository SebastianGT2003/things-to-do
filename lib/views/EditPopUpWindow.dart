import 'package:flutter/material.dart';
import 'package:things_to_do/controllers/TaskController.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';

Future<void> EditPopUpWindow(BuildContext context, Task task, int index,
    TaskProvider taskProvider) async {
  TextEditingController titleController = TextEditingController(
    text: task.title,
  );
  TextEditingController descriptionController = TextEditingController(
    text: task.description,
  );
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Editar Tarea'),
        content: Form(
          key: _key, // Asociar la clave con el formulario
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
                validator: validateField,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                ),
                validator: validateField,
              ),
            ],
          ),
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
              if (_key.currentState!.validate()) {
                // Validar el formulario
                // Aquí puedes guardar la tarea con el título y la descripción
                String title = titleController.text;
                String description = descriptionController.text;
                Task _task = Task(
                  title: title,
                  description: description,
                );
                taskProvider.editTask(_task, index, taskProvider);

                Navigator.of(context).pop(); // Cerrar el diálogo emergente
              }
            },
            child: Text('Editar'),
          ),
        ],
      );
    },
  );
}
