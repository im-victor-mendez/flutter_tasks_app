import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  static const name = 'Completed Tasks';
  static const path = '/completed-tasks';

  const CompletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) => _View(state.completedTasks),
      );
}

class _View extends StatelessWidget {
  final List<Task> tasks;

  const _View(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Chip(
            label: Text('Completed Tasks: ${tasks.length}'),
          ),
        ),
        TaskList(tasks),
      ],
    );
  }
}
