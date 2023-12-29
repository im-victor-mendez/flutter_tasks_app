import 'package:flutter/material.dart';

import 'screens.dart';

class TabsScreen extends StatefulWidget {
  static const name = 'Tabs';
  static const path = '/tabs';

  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      {'name': PendingTasksScreen.name, 'page': const PendingTasksScreen()},
      {'name': CompletedTasksScreen.name, 'page': const CompletedTasksScreen()},
      {'name': FavoriteTasksScreen.name, 'page': const FavoriteTasksScreen()},
    ];

    final appBar = AppBar(
      actions: [
        IconButton(
          onPressed: () => showAddTask(context),
          icon: const Icon(Icons.add),
        )
      ],
      title: Text(pages[currentIndex]['name'] as String),
    );

    const items = [
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.list_rounded),
        icon: Icon(Icons.list_alt_rounded),
        label: 'Pending Tasks',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.done_rounded),
        icon: Icon(Icons.done_outline),
        label: 'Completed Tasks',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.favorite_rounded),
        icon: Icon(Icons.favorite_outline),
        label: 'Favorite Tasks',
      ),
    ];

    final bottomNavigationBar = BottomNavigationBar(
      currentIndex: currentIndex,
      items: items,
      onTap: (int index) => setState(() => currentIndex = index),
    );

    final floatingActionButton = FloatingActionButton(
      onPressed: () => showAddTask(context),
      tooltip: 'Add Task',
      child: const Icon(Icons.add),
    );

    return Scaffold(
      appBar: appBar,
      body: pages[currentIndex]['page'] as Widget,
      bottomNavigationBar: bottomNavigationBar,
      drawer: const NavDrawer(),
      floatingActionButton: floatingActionButton,
    );
  }

  void showAddTask(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => const AddTaskScreen(),
      );
}
