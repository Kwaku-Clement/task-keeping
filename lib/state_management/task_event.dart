import 'package:equatable/equatable.dart';

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

  const AddTask(this.title);

  @override
  List<Object> get props => [title];
}

class DeleteTask extends TaskEvent {
  final int id;

  const DeleteTask(this.id);

  @override
  List<Object> get props => [id];
}
