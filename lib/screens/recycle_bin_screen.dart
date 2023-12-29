import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/tasks_bloc.dart';
import '../widgets/task_list.dart';
import 'nav_drawer.dart';

class RecycleBinScreen extends StatelessWidget {
  static const name = 'Recycle Bin';
  static const path = '/recycle-bin';

  const RecycleBinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        actions: [
          IconButton(
            // TODO: Add functionality
            onPressed: () {},
            icon: const Icon(Icons.add),
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
