import '../model_data/task_model.dart';

class TaskListController {
  // List<Task> tasks = [     //Todo: Replace this with an Object of TaskList Class
  //   Task('Task 1', false),
  //   Task('Task 2', true),
  //   Task('Task 3', false),
  // ];

  //Controller is just triggering business logic:
  void toggleTaskCompletion(int index) {
    tasks[index].setStatus(!tasks[index].status);
  }

  static TaskListController initController() {
    return TaskListController();
  }
}
