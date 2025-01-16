import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_keeping/state_management/task_bloc.dart';
import 'package:task_keeping/state_management/task_event.dart';
import 'package:task_keeping/state_management/task_state.dart';
import 'package:task_keeping/widgets/task_item.dart';
import 'package:task_keeping/widgets/task_dialog.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();

    // Load tasks when the screen is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskBloc.add(LoadTasks());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Keeper'),
        elevation: 2,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoadSuccess) {
            if (state.tasks.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.task_alt, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text(
                      'No tasks yet. Add some tasks to get started!',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => _showAddTaskDialog(context, taskBloc),
                      icon: const Icon(Icons.add),
                      label: const Text('Add Your First Task'),
                    ),
                  ],
                ),
              );
            }

            // Sort tasks: incomplete tasks first, then completed tasks
            final activeTasks = state.tasks.where((task) => !task.isCompleted).toList();
            final completedTasks = state.tasks.where((task) => task.isCompleted).toList();

            return ListView(
              padding: const EdgeInsets.only(bottom: 80), // Add padding for FAB
              children: [
                if (activeTasks.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Active Tasks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ...activeTasks.map((task) => TaskItem(task)),
                ],
                if (completedTasks.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Completed Tasks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  ...completedTasks.map((task) => TaskItem(task)),
                ],
              ],
            );
          }
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red),
                SizedBox(height: 16),
                Text(
                  'Something went wrong. Please try again.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddTaskDialog(context, taskBloc),
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, TaskBloc taskBloc) async {
    final result = await showDialog(
      context: context,
      builder: (ctx) => const TaskDialog(),
    );

    if (result != null && context.mounted) {
      taskBloc.add(AddTask(
        result['title'],
        result['description'],
      ));
    }
  }
}