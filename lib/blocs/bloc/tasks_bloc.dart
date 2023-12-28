import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksInitial()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) =>
      emit(TasksState([...state.allTasks, event.task]));

  // TODO: Fix emit functions
  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) =>
      emit(TasksState([]));
  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) =>
      emit(TasksState([]));
}
