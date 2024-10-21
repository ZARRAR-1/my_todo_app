import 'package:flutter/material.dart';
import 'package:my_todo_app/views/custom_widgets/add_task_button.dart';
import 'package:provider/provider.dart';
import 'controllers/task_controller.dart';
import 'model_data/task_list_model.dart';
import 'views/task_list_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return TaskList(); //Our List of Tasks
      },
      child: ToDoApp(),
    ),
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
          title: const Text('Task List'),
        ),
        body: TaskListView(controller: controller),
        // floatingActionButton: addTaskButton(context),
      ),
    );
  }
}
