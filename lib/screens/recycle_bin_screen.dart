import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text('Tasks:'),
            ),
          ),
          // TODO: Pass right tasks
          TaskList([]),
        ],
      ),
    );
  }
}
