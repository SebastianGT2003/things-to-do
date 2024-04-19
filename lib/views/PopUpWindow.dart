import 'package:flutter/material.dart';
import 'package:things_to_do/controllers/TaskController.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/models/Task.dart';

Future<void> PopUpWindow(
    BuildContext context, TaskProvider taskProvider) async {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TaskController taskController_ = TaskController();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Nueva Tarea'),
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
                validator: taskController_.validateField,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                ),
                validator: taskController_.validateField,
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
                Task task = Task(
                  title: title,
                  description: description,
                );

                taskController_.saveTask(task,
                    taskProvider); // Pasar la clave del formulario al método de guardado
                taskController_.create(task);

                Navigator.of(context).pop(); // Cerrar el diálogo emergente
              }
            },
            child: Text('Guardar'),
          ),
        ],
      );
    },
  );
}
