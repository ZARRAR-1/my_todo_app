import 'package:my_todo_app/services/database_service.dart';

class Task {
  String content;
  int id, status;

  Task({required this.content, required this.id, required this.status});

  // bool _completed;

  static final DatabaseService databaseService = DatabaseService.instance;

  //Business Logic:

  //Setters
  // void setTitle(String newTitle) {
  //   content = newTitle;
  // }

  void setStatus(bool newStatus) {
    newStatus == true ? status = 1 : status = 0 ;
    // status = newStatus;
  }

  //Getters
  get taskStatus => status;

  get title => content;
}
