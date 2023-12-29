import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/tasks_bloc.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import 'nav_drawer.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasks = state.allTasks;

        return Scaffold(
          drawer: const NavDrawer(),
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () => showAddTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: _View(tasks),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showAddTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void showAddTask(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => const AddTaskScreen(),
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
            label: Text('Tasks: ${tasks.length}'),
          ),
        ),
        TaskList(tasks),
      ],
    );
  }
}
