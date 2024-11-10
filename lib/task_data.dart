import 'package:flutter/foundation.dart';
import 'package:to_do_list/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [Task(name: 'test')];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void addTask(newTaskText) {
    _tasks.add(Task(name: newTaskText));
    notifyListeners();
  }

  void changeTaskCheck(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    if (_tasks.isNotEmpty) _tasks.remove(task);
    notifyListeners();
  }
}
