import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';
import '../screens/edit_task_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Info(task),
          _ActionButtons(task),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final Task task;

  const _Info(this.task);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      decoration: task.isDone! ? TextDecoration.lineThrough : null,
    );

    toggleFavorite() => context.read<TasksBloc>().add(FavoriteTask(task));

    return Expanded(
      child: Row(
        children: [
          // Toggle favorite button
          IconButton(
            icon: Icon(
              task.isFavorite!
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
            ),
            onPressed: toggleFavorite,
          ),
          const SizedBox(width: 10),
          // Task info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
                // Date
                Text(DateFormat.yMMMd().add_Hms().format(task.date)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final Task task;

  const _ActionButtons(this.task);

  @override
  Widget build(BuildContext context) {
    updateTask(bool? value) => context.read<TasksBloc>().add(UpdateTask(task));

    deleteTask() => task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task))
        : context.read<TasksBloc>().add(RemoveTask(task));

    return Row(
      children: [
        // Toggle #isDone
        Checkbox.adaptive(
          onChanged: task.isDeleted == false ? updateTask : null,
          value: task.isDone,
        ),
        // Menu
        // TODO: Implement functionality
        PopupMenuButton(
          itemBuilder: (context) => [
            if (task.isDeleted == false) ...[
              // Edit
              PopupMenuItem(
                onTap: () => showEditTask(context, task),
                child: TextButton.icon(
                  icon: const Icon(Icons.edit_rounded),
                  label: const Text('Edit'),
                  onPressed: () => showEditTask(context, task),
                ),
              ),
            ],
            // Delete
            PopupMenuItem(
              onTap: deleteTask,
              child: TextButton.icon(
                icon: const Icon(Icons.delete_rounded),
                label: const Text('Delete'),
                onPressed: null,
              ),
            ),
            if (task.isDeleted!)
              // Restore
              PopupMenuItem(
                onTap: () {},
                child: TextButton.icon(
                  icon: const Icon(Icons.restore_rounded),
                  label: const Text('Restore'),
                  onPressed: null,
                ),
              ),
          ],
        ),
      ],
    );
  }

  void showEditTask(BuildContext context, Task task) => showModalBottomSheet(
        builder: (context) => EditTaskScreen(task),
        context: context,
        isScrollControlled: true,
      );
}
