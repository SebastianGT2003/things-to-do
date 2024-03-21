import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/views/TaskPage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => TaskProvider(),
      )
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
    );
  }
}
