import 'package:flutter/material.dart';
import 'package:untitled/classes/task.dart';

enum Views {
  home
}

class AppData with ChangeNotifier {
  Views _currentView = Views.home;
  ThemeData _currentTheme = ThemeData.dark();
  List<Task> tasks = [];
  String title = "Task title";


  Views get views => _currentView;
  set views(Views view) {
    _currentView = view;
    notifyListeners();
  }

  ThemeData get theme => _currentTheme;
  set theme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  changeTaskStatus(int index) {
    tasks[index].status ^= true;
    notifyListeners();
  }

  double taskCompletionProgress() {
    int taskAmount = tasks.length;
    int completedTasks = 0;
    for (Task task in tasks) {
      if (task.status) {
        completedTasks++;
      }
    }
    double completionProgress = completedTasks / taskAmount;
    return completionProgress;
  }

  deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  forceNotifyListeners() {
    notifyListeners();
  }

}