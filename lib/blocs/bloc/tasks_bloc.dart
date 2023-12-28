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
      emit(state.copyWith([...state.allTasks, event.task]));

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final List<Task> tasks = List.from(state.allTasks)..remove(event.task);
    tasks.insert(state.allTasks.indexOf(event.task),
        event.task.copyWith(isDone: !event.task.isDone!));

    emit(state.copyWith(tasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) =>
      emit(state.copyWith(List.from(state.allTasks)..remove(event.task)));
}
