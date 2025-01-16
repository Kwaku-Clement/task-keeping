import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_keeping/controllers/task_controller.dart';
import 'package:task_keeping/models/task_model.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskController taskController;

  TaskBloc({required this.taskController}) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async {
      try {
        final tasks = await taskController.getTasks();
        emit(TaskLoadSuccess(tasks));
      } catch (e) {
        emit(TaskLoadFailure(e.toString()));
      }
    });

    on<AddTask>((event, emit) async {
      try {
        final newTask = TaskModel(
          id: 0,
          title: event.title,
          description: event.description,
          isCompleted: false,
          createdAt: DateTime.now(),
        );
        await taskController.addTask(newTask);
        final tasks = await taskController.getTasks();
        emit(TaskLoadSuccess(tasks));
      } catch (e) {
        emit(TaskLoadFailure(e.toString()));
      }
    });

    on<UpdateTask>((event, emit) async {
      try {
        await taskController.updateTask(event.task);
        final tasks = await taskController.getTasks();
        emit(TaskLoadSuccess(tasks));
      } catch (e) {
        emit(TaskLoadFailure(e.toString()));
      }
    });

    on<DeleteTask>((event, emit) async {
      try {
        await taskController.deleteTask(event.id);
        final tasks = await taskController.getTasks();
        emit(TaskLoadSuccess(tasks));
      } catch (e) {
        emit(TaskLoadFailure(e.toString()));
      }
    });

    on<ToggleTaskCompletion>((event, emit) async {
      try {
        if (state is TaskLoadSuccess) {
          final currentState = state as TaskLoadSuccess;
          final task = currentState.tasks.firstWhere((t) => t.id == event.id);
          final updatedTask = TaskModel(
            id: task.id,
            title: task.title,
            description: task.description,
            isCompleted: !task.isCompleted,
            createdAt: task.createdAt,
          );
          await taskController.updateTask(updatedTask);
          final tasks = await taskController.getTasks();
          emit(TaskLoadSuccess(tasks));
        }
      } catch (e) {
        emit(TaskLoadFailure(e.toString()));
      }
    });
  }
}