import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state_management//task_bloc.dart';
import 'controllers/task_controller.dart';
import 'screens/task_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = TaskController();
    return MaterialApp(
      title: 'Task Keeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TaskBloc(taskController: taskController),
        child: TaskListScreen(),
      ),
    );
  }
}
