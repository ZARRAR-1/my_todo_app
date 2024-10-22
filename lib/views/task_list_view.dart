import 'package:flutter/material.dart';
import 'package:my_todo_app/controllers/task_controller.dart';

import '../model_data/task_model.dart';

// import 'custom_widgets/add_task_button.dart';

class TaskListView extends StatefulWidget {
  final TaskListController controller;

  const TaskListView({super.key, required this.controller});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  String? _newTask;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: FutureBuilder(
            future: Task.databaseService.getTasks(),
            //Loading Task List via Model Class
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final task = snapshot.data![index];
                  return ListTile(
                    title: Text(task.title),
                    leading: Checkbox(
                      value: task.status == 1,
                      onChanged: (value) {
                        setState(
                          () => widget.controller.toggleTaskCompletion(index),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Add a Task'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _newTask = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Add a task...',
                        ),
                      ),
                      // SizedBox.shrink(),
                      MaterialButton(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        onPressed: () {
                          if (_newTask == null || _newTask == "") {
                            return;
                          } else {
                            widget.controller.addNewTask(_newTask!);
                            setState(() {
                              _newTask = null;
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Done'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
