import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksInitial()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) =>
      emit(state.copyWith([...state.allTasks, event.task]));

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final List<Task> tasks = List.from(state.allTasks)..remove(event.task);
    tasks.insert(state.allTasks.indexOf(event.task),
        event.task.copyWith(isDone: !event.task.isDone!));

    emit(state.copyWith(tasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) =>
      emit(state.copyWith(List.from(state.allTasks)..remove(event.task)));

  @override
  TasksState? fromJson(Map<String, dynamic> json) => state.fromJson(json);

  @override
  Map<String, dynamic>? toJson(TasksState state) => state.toJson();
}
