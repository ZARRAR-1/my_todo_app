import 'package:flutter/material.dart';
import 'package:my_todo_app/model_data/task_model.dart';

class TaskList extends ChangeNotifier{
  final List<Task> _tasklist = []; //


  void addingTask(Task newTask)
  {
    _tasklist.add(newTask);
    notifyListeners();
  }

  void deletingTask(int id) //TODO: Study task removing mechanism
  {
    _tasklist.remove(id);
    notifyListeners();
  }

  void markAsDone()
  {
    notifyListeners();
  }


}