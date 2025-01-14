import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state_management/task_bloc.dart';
import '../state_management/task_event.dart';
import '../state_management/task_state.dart';
import '../widgets/task_item.dart';

class TaskListScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Keeper'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoadSuccess) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (ctx, i) => TaskItem(state.tasks[i]),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Add Task'),
              content: TextField(
                controller: _taskController,
                decoration: const InputDecoration(labelText: 'Task Title'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_taskController.text.isNotEmpty) {
                      taskBloc.add(AddTask(_taskController.text));
                      _taskController.clear();
                      Navigator.of(ctx).pop();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
