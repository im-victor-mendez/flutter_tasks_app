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
    on<RemoveTask>(_onRemoveTask);
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) => state.fromJson(json);

  @override
  Map<String, dynamic>? toJson(TasksState state) => state.toJson();

  void _onAddTask(AddTask event, Emitter<TasksState> emit) =>
      emit(state.copyWith(pendingTasks: [...state.pendingTasks, event.task]));

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) =>
      event.task.isDone!
          ? emit(state.copyWith(
              completedTasks: List.from(state.completedTasks)
                ..remove(event.task),
              pendingTasks: List.from(state.pendingTasks)
                ..add(event.task.copyWith(isDone: !event.task.isDone!)),
            ))
          : emit(state.copyWith(
              completedTasks: List.from(state.completedTasks)
                ..add(event.task.copyWith(isDone: !event.task.isDone!)),
              pendingTasks: List.from(state.pendingTasks)..remove(event.task),
            ));

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) =>
      emit(state.copyWith(
        removedTasks: List.from(state.pendingTasks)..remove(event.task),
      ));

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) =>
      emit(state.copyWith(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ));
}
