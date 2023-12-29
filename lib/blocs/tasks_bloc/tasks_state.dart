part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> pendingTasks;
  final List<Task> removedTasks;

  const TasksState({
    required this.completedTasks,
    required this.favoriteTasks,
    required this.pendingTasks,
    required this.removedTasks,
  });

  @override
  List<Object> get props => [
        completedTasks,
        favoriteTasks,
        pendingTasks,
        removedTasks,
      ];

  TasksState copyWith({
    List<Task>? completedTasks,
    List<Task>? favoriteTasks,
    List<Task>? pendingTasks,
    List<Task>? removedTasks,
  }) =>
      TasksState(
        completedTasks: completedTasks ?? this.completedTasks,
        favoriteTasks: favoriteTasks ?? this.favoriteTasks,
        pendingTasks: pendingTasks ?? this.pendingTasks,
        removedTasks: removedTasks ?? this.removedTasks,
      );

  Map<String, dynamic> toJson() => {
        'completedTasks': completedTasks,
        'favoriteTasks': favoriteTasks,
        'pendingTasks': pendingTasks,
        'removedTasks': removedTasks,
      };

  TasksState fromJson(Map<String, dynamic> json) => TasksState(
        completedTasks: List<Task>.from(
          json['completedTasks']?.map((task) => Task.fromJson(task)),
        ),
        favoriteTasks: List<Task>.from(
          json['favoriteTasks']?.map((task) => Task.fromJson(task)),
        ),
        pendingTasks: List<Task>.from(
          json['pendingTasks']?.map((task) => Task.fromJson(task)),
        ),
        removedTasks: List<Task>.from(
          json['removedTasks']?.map((task) => Task.fromJson(task)),
        ),
      );
}

final class TasksInitial extends TasksState {
  const TasksInitial()
      : super(
          completedTasks: const <Task>[],
          favoriteTasks: const <Task>[],
          pendingTasks: const <Task>[],
          removedTasks: const <Task>[],
        );
}
