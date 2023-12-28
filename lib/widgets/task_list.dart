import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/tasks_bloc.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList(this.tasks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final task = tasks[index];

          deleteTask() => context.read<TasksBloc>().add(DeleteTask(task));

          addTask(bool? value) =>
              context.read<TasksBloc>().add(UpdateTask(task));

          return ListTile(
            onLongPress: deleteTask,
            title: Text(task.title),
            trailing: Checkbox(value: task.isDone, onChanged: addTask),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
