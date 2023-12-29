part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;

  const TasksState({required this.allTasks, required this.removedTasks});

  @override
  List<Object> get props => [allTasks, removedTasks];

  TasksState copyWith({List<Task>? allTasks, List<Task>? removedTasks}) =>
      TasksState(
        allTasks: allTasks ?? this.allTasks,
        removedTasks: removedTasks ?? this.removedTasks,
      );

  Map<String, dynamic> toJson() => {
        'allTasks': allTasks,
        'removedTasks': removedTasks,
      };

  TasksState fromJson(Map<String, dynamic> json) => TasksState(
        allTasks: List<Task>.from(
          json['allTasks']?.map((task) => Task.fromJson(task)),
        ),
        removedTasks: List<Task>.from(
          json['removedTasks']?.map((task) => Task.fromJson(task)),
        ),
      );
}

final class TasksInitial extends TasksState {
  const TasksInitial()
      : super(
          allTasks: const <Task>[],
          removedTasks: const <Task>[],
        );
}
