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

class RemoveTask extends TasksEvent {
  final Task task;

  const RemoveTask(this.task);
}

class FavoriteTask extends TasksEvent {
  final Task task;

  const FavoriteTask(this.task);
}

class EditTask extends TasksEvent {
  final Task oldTask;
  final Task newTask;

  const EditTask(this.oldTask, this.newTask);
}

class RestoreTask extends TasksEvent {
  final Task task;

  const RestoreTask(this.task);
}

class DeleteAllTasks extends TasksEvent {}
