import 'package:task_keeping/database/database_helper.dart';
import 'package:task_keeping/models/task_model.dart';

class TaskController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<TaskModel>> getTasks() async {
    return await _databaseHelper.getTasks();
  }

  Future<void> addTask(TaskModel task) async {
    await _databaseHelper.insertTask(task);
  }

  Future<void> updateTask(TaskModel task) async {
    await _databaseHelper.updateTask(task);
  }

  Future<void> deleteTask(int id) async {
    await _databaseHelper.deleteTask(id);
  }

  Future<void> toggleTaskCompletion(int id) async {
    final tasks = await getTasks();
    final task = tasks.firstWhere((t) => t.id == id);
    final updatedTask = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: !task.isCompleted,
      createdAt: task.createdAt,
    );
    await updateTask(updatedTask);
  }
}