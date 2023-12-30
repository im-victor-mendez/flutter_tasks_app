import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksInitial()) {
    on<AddTask>(_onAddTask);
    on<DeleteAllTasks>(_onDeleteAllTask);
    on<DeleteTask>(_onDeleteTask);
    on<EditTask>(_onEditTask);
    on<FavoriteTask>(_onFavoriteTask);
    on<RemoveTask>(_onRemoveTask);
    on<RestoreTask>(_onRestoreTask);
    on<UpdateTask>(_onUpdateTask);
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) => state.fromJson(json);

  @override
  Map<String, dynamic>? toJson(TasksState state) => state.toJson();

  void _onAddTask(AddTask event, Emitter<TasksState> emit) =>
      emit(state.copyWith(pendingTasks: [...state.pendingTasks, event.task]));

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) =>
      event.task.isDone!
          // Pass from completedTasks to pendingTasks list
          ? emit(state.copyWith(
              completedTasks: List.from(state.completedTasks)
                ..remove(event.task),
              pendingTasks: List.from(state.pendingTasks)
                ..add(event.task.copyWith(isDone: !event.task.isDone!)),
            ))
          // Pass from pendingTasks to completedTasks list
          : emit(state.copyWith(
              completedTasks: List.from(state.completedTasks)
                ..add(event.task.copyWith(isDone: !event.task.isDone!)),
              pendingTasks: List.from(state.pendingTasks)..remove(event.task),
            ));

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    return emit(state.copyWith(
      removedTasks: List.from(state.pendingTasks)..remove(event.task),
    ));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    return emit(state.copyWith(
      pendingTasks: List.from(state.pendingTasks)..remove(event.task),
      removedTasks: List.from(state.removedTasks)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  void _onFavoriteTask(FavoriteTask event, Emitter<TasksState> emit) {
    final state = this.state;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;

    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    }
    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> favoriteTasks = List.from(state.favoriteTasks);
    if (event.oldTask.isFavorite == true) {
      favoriteTasks
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)
        ..remove(event.oldTask)
        ..insert(0, event.newTask),
      completedTasks: List.from(state.completedTasks)..remove(event.oldTask),
      favoriteTasks: favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final pendingTasks = List<Task>.from(state.pendingTasks)
      ..insert(
        0,
        event.task.copyWith(
          isDeleted: false,
          isDone: false,
          isFavorite: false,
        ),
      );

    return emit(state.copyWith(
      removedTasks: List.from(state.removedTasks)..remove(event.task),
      pendingTasks: pendingTasks,
    ));
  }

  void _onDeleteAllTask(DeleteAllTasks event, Emitter<TasksState> emit) {
    return emit(
      state.copyWith(removedTasks: List.from(state.removedTasks)..clear()),
    );
  }
}
