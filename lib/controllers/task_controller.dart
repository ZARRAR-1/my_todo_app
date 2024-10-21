import '../model_data/task_model.dart';

class TaskListController {
  // List<Task> tasks = [     //Todo: Replace this with an Object of TaskList Class
  //   Task('Task 1', false),
  //   Task('Task 2', true),
  //   Task('Task 3', false),
  // ];

  // List<Task> tasks = [];

  //Controller is just triggering business logic:
  void toggleTaskCompletion(int index) {
    // tasks[index].setStatus(!tasks[index].status);

    //TODO: Use the Task's databaseService object to call update task method, here.
  }

  //TODO: Use the Task's databaseService object to call delete task method, here.

  //TODO: Use the Task's databaseService object to call Add task method, here.

  void addNewTask(String content)
  {
    Task.databaseService.addTask(content);
  }

  static TaskListController initController() {
    return TaskListController();
  }
}
