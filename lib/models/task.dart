import 'package:flutter/material.dart';
import 'package:todo_provider/screens/add_task.dart';

class Task {
  String? taskTitle;
  String? taskDescription;
  bool? isCompleted;
  String? taskFont;
  Color? taskColor;

  Task(
      {this.taskTitle,
      this.taskDescription,
      this.isCompleted,
      this.taskFont,
      this.taskColor});
}

class TaskData extends ChangeNotifier {
  List<Task> listTask = [
    Task(
        taskTitle: 'Task 1',
        taskDescription: 'Task 1 Description',
        isCompleted: false,
        taskFont: fontList[0],
        taskColor: Colors.red)
  ];

  // Color? getColor(int index) {
  //   notifyListeners();
  //   return listTask[index].taskColor;
  //   // notifyListeners();
  // }

  setColor(int index, Color value) {
    listTask[index].taskColor = value;
    notifyListeners();
  }

  toggle(int index, bool? value) {
    listTask[index].isCompleted = value;
    notifyListeners();
  }

  addTask(Task task) {
    listTask.add(task);
    notifyListeners();
  }

  deleteTask(int index) {
    listTask.removeAt(index);
    notifyListeners();
  }
}
