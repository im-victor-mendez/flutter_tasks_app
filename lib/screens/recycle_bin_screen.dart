import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../widgets/task_list.dart';
import 'nav_drawer.dart';

class RecycleBinScreen extends StatelessWidget {
  static const name = 'Recycle Bin';
  static const path = '/recycle-bin';

  const RecycleBinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    deleteAllTasks() => context.read<TasksBloc>().add(DeleteAllTasks());

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: deleteAllTasks,
                child: TextButton.icon(
                  label: const Text('Delete all'),
                  onPressed: deleteAllTasks,
                  icon: const Icon(Icons.delete_forever_rounded),
                ),
              )
            ],
          )
        ],
      ),
      body: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text('Tasks: ${state.removedTasks.length}'),
              ),
            ),
            TaskList(state.removedTasks),
          ],
        );
      },
    );
  }
}
