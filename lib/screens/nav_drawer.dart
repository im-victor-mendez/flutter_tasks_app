import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/night_mode_bloc/night_mode_bloc.dart';
import '../blocs/tasks_bloc/tasks_bloc.dart';
import 'screens.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            // Title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
            ),
            // Tasks
            ListTile(
              leading: const Icon(Icons.folder_special_rounded),
              title: const Text('My Tasks'),
              trailing: BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) =>
                    Text(state.allTasks.length.toString()),
              ),
              onTap: () => context.goNamed(TasksScreen.name),
            ),
            const Divider(),
            // Bin
            ListTile(
              leading: const Icon(Icons.delete_rounded),
              title: const Text('Bin'),
              trailing: BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) =>
                    Text(state.removedTasks.length.toString()),
              ),
              onTap: () => context.goNamed(RecycleBinScreen.name),
            ),
            // Night Mode
            BlocBuilder<NightModeBloc, NightModeState>(
              builder: (context, state) {
                return Switch(
                  value: state.isActivated,
                  onChanged: (value) =>
                      context.read<NightModeBloc>().add(SwitchMode()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
