import 'package:flutter/material.dart';

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

          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) => task.copyWith(isDone: !task.isDone!),
            ),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
