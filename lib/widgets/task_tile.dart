import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/tasks_bloc.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      decoration: task.isDone! ? TextDecoration.lineThrough : null,
    );

    deleteTask() => context.read<TasksBloc>().add(DeleteTask(task));

    addTask(bool? value) => context.read<TasksBloc>().add(UpdateTask(task));

    return ListTile(
      onLongPress: deleteTask,
      title: Text(task.title, style: style),
      trailing: Checkbox(value: task.isDone, onChanged: addTask),
    );
  }
}