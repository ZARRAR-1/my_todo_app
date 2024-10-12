import 'package:flutter/material.dart';
import 'package:my_todo_app/views/custom_widgets/add_task_button.dart';
import 'controllers/task_controller.dart';
import 'views/task_list_view.dart';

void main() {
  runApp(TaskListApp());
}

class TaskListApp extends StatelessWidget {
  final TaskListController controller = TaskListController.initController();

  TaskListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: TaskListView(controller: controller),
        floatingActionButton: addTaskButton(context),
      ),
    );
  }
}
