part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask(this.task);
}

class UpdateTask extends TasksEvent {
  final Task task;

  const UpdateTask(this.task);
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask(this.task);
}
