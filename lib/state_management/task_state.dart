import 'package:equatable/equatable.dart';
import 'package:task_keeping/models/task_model.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoadSuccess extends TaskState {
  final List<TaskModel> tasks;

  const TaskLoadSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskLoadFailure extends TaskState {
  final String error;

  const TaskLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}