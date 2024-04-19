import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:things_to_do/controllers/TaskProvider.dart';
import 'package:things_to_do/firebase_options.dart';
import 'package:things_to_do/views/TaskPage.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      debugShowCheckedModeBanner: false,
      home: TaskPage(),
    );
  }
}
