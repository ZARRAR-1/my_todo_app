import 'package:flutter/material.dart';
import 'controllers/task_controller.dart';
import 'views/task_list_view.dart';

void main() {
  runApp(
    ToDoApp(),
  );
}

class ToDoApp extends StatelessWidget {
  final TaskListController controller = TaskListController.initController();

  ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text('Task List'),
          ),
        ),
        body: TaskListView(controller: controller),
        // floatingActionButton: addTaskButton(context),
      ),
    );
  }
}
