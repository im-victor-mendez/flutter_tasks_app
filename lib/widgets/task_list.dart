import 'package:flutter/material.dart';

import '../models/task.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList(this.tasks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasks
              .map((task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isExpanded) => TaskTile(task),
                    body: SelectableText.rich(TextSpan(
                      children: [
                        TextSpan(text: task.description),
                      ],
                    )),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
