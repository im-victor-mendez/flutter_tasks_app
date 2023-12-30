import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';
import '../services/guid_gen.dart';

class EditTaskScreen extends StatelessWidget {
  final Task task;
  const EditTaskScreen(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);

    void editTask() {
      final newTask = Task(
        description: descriptionController.text,
        isDone: false,
        title: titleController.text,
        date: DateTime.now(),
        id: GUIDGen.generate(),
      );

      context.read<TasksBloc>().add(EditTask(task, newTask));
      Navigator.pop(context);
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text('Add Task', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 10),
              TextField(
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
                maxLines: 5,
                minLines: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: editTask,
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
