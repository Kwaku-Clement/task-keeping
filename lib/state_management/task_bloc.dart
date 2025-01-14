import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/task_controller.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskController taskController;

  TaskBloc({required this.taskController}) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async {
      final tasks = await taskController.getTasks();
      emit(TaskLoadSuccess(tasks));
    });

    on<ToggleTaskCompletion>((event, emit) async {
      await taskController.toggleTaskCompletion(event.id);
      final tasks = await taskController.getTasks();
      emit(TaskLoadSuccess(tasks));
    });

    on<AddTask>((event, emit) async {
      await taskController.addTask(event.title);
      final tasks = await taskController.getTasks();
      emit(TaskLoadSuccess(tasks));
    });

    on<DeleteTask>((event, emit) async {
      await taskController.deleteTask(event.id);
      final tasks = await taskController.getTasks();
      emit(TaskLoadSuccess(tasks));
    });
  }
}
