part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState(this.allTasks);

  @override
  List<Object> get props => [allTasks];

  TasksState copyWith(List<Task>? allTasks) =>
      TasksState(allTasks ?? this.allTasks);
}

final class TasksInitial extends TasksState {
  const TasksInitial() : super(const <Task>[]);
}
