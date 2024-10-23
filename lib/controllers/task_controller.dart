import '../model_data/task_model.dart';

class TaskListController {

  //Controller is just triggering business logic:
  void toggleTaskCompletion(int index, int status) {
    Task.databaseService.updateTaskStatus(index, status);
  }

  void deleteTask(int id) {
    Task.databaseService.deleteTask(id);
  }

  void addNewTask(String content) {
    Task.databaseService.addTask(content);
  }

  static TaskListController initController() {
    return TaskListController();
  }
}
