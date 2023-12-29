import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks_app/blocs/bloc/tasks_bloc.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.folder_special_rounded),
              title: const Text('My Tasks'),
              trailing: Text(
                context.read<TasksBloc>().state.allTasks.length.toString(),
              ),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.delete_rounded),
              title: Text('Bin'),
              // TODO: Fix length indicator
              trailing: Text('0'),
            ),
          ],
        ),
      ),
    );
  }
}
