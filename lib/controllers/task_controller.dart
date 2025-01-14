import '../models/task_model.dart';
import '../database/database_helper.dart';

class TaskController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Task>> getTasks() async {
    return await _databaseHelper.getTasks();
  }

  Future<void> addTask(String title) async {
    final newTask = Task(
      id: 0,
      title: title,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
    await _databaseHelper.insertTask(newTask);
  }

  Future<void> toggleTaskCompletion(int id) async {
    final task = (await getTasks()).firstWhere((task) => task.id == id);
    task.isCompleted = !task.isCompleted;
    await _databaseHelper.updateTask(task);
  }

  Future<void> deleteTask(int id) async {
    await _databaseHelper.deleteTask(id);
  }
}
