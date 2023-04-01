import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
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

  Map<String, dynamic> toJson() {
    return {
      'title': taskTitle,
      'description': taskDescription,
      'isCompleted': isCompleted,
      'font': taskFont,
      'color': taskColor,
    };
  }
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

  // TextEditingController nameController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();

  // getTitleController() {
  //   return
  // }

  Color? getColor(int index) {
    return listTask[index].taskColor;
  }

  setColor(int index, Color value, bool really) {
    if (really) {
      listTask[index].taskColor = value;
      notifyListeners();
    }
  }

  setFont(int index, String value, bool really) {
    if (really) {
      listTask[index].taskFont = value;
      notifyListeners();
    }
  }

  String? getFont(int index) {
    return listTask[index].taskFont;
  }

  setTitle(int index, String value, TextEditingController textController,
      bool really) {
    if (really) {
      // final int selectionStart = textController.selection.start;
      // final int selectionEnd = textController.selection.end;
      listTask[index].taskTitle = value;
  //     textController.selection = TextSelection.fromPosition(
  //   TextPosition(offset: value.length),
  // );
      // Set the cursor position to the end of the new text
      // final newCursorPosition = value.length;
      // textController.selection = TextSelection.fromPosition(
      //   TextPosition(offset: newCursorPosition),
      // );

      // Set the cursor position to the original position, if possible
      // if (selectionStart >= 0 && selectionEnd >= 0) {
      //   textController.selection = TextSelection(
      //     baseOffset: selectionStart,
      //     extentOffset: selectionEnd,
      //   );
      // }

      notifyListeners();
    }
  }

  String? getTitle(int index) {
    return listTask[index].taskTitle;
  }

  setDescription(int index, String value, TextEditingController textController,
      bool really) {
    if (really) {
      // final int selectionStart = textController.selection.start;
      // final int selectionEnd = textController.selection.end;

      // Set the new text value
      listTask[index].taskDescription = value;

      // Set the cursor position to the end of the new text
      // final newCursorPosition = value.length;
      // textController.selection = TextSelection.fromPosition(
      //   TextPosition(offset: newCursorPosition),
      // );

      // Set the cursor position to the original position, if possible
      // if (selectionStart >= 0 && selectionEnd >= 0) {
      //   textController.selection = TextSelection(
      //     baseOffset: selectionStart,
      //     extentOffset: selectionEnd,
      //   );
      // }
  //     SchedulerBinding.instance.addPostFrameCallback((_) {
  //   textController.selection = TextSelection.fromPosition(
  //     TextPosition(offset: textController.text.length),
  //   );
  // });

      notifyListeners();
    }
  }

  String? getDescription(int index) {
    return listTask[index].taskDescription;
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
