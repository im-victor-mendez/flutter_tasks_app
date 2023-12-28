part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState(this.allTasks);

  @override
  List<Object> get props => [allTasks];

  TasksState copyWith(List<Task>? allTasks) =>
      TasksState(allTasks ?? this.allTasks);

  Map<String, dynamic> toJson() => {
        'allTasks': allTasks,
      };

  TasksState fromJson(Map<String, dynamic> json) => TasksState(
        List<Task>.from(json['allTasks']?.map((task) => Task.fromJson(task))),
      );
}

final class TasksInitial extends TasksState {
  const TasksInitial() : super(const <Task>[]);
}
