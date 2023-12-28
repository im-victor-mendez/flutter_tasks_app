part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState(this.allTasks);

  @override
  List<Object> get props => [];
}

final class TasksInitial extends TasksState {
  const TasksInitial() : super(const <Task>[]);
}
