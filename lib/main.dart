import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_keeping/controllers/task_controller.dart';
import 'package:task_keeping/screens/task_list_screen.dart';
import 'package:task_keeping/state_management/task_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Keeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => TaskBloc(taskController: TaskController()),
        child: TaskListScreen(),
      ),
    );
  }
}