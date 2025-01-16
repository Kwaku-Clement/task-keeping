import 'package:equatable/equatable.dart';
import 'package:task_keeping/models/task_model.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {}

class ToggleTaskCompletion extends TaskEvent {
  final int id;

  const ToggleTaskCompletion(this.id);

  @override
  List<Object> get props => [id];
}

class AddTask extends TaskEvent {
  final String title;
  final String description;

  const AddTask(this.title, this.description);

  @override
  List<Object> get props => [title, description];
}

class UpdateTask extends TaskEvent {
  final TaskModel task;

  const UpdateTask(this.task);

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final int id;

  const DeleteTask(this.id);

  @override
  List<Object> get props => [id];
}