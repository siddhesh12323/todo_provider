import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/task.dart';

List<String> fontList = [
  'Product Sans',
  'Comic Neue',
  'DP Dork Diary',
  'Merriweather',
  'Montserrat',
  'Noto Sans',
  'Raleway',
  'Source Sans',
  'Space Mono',
];

class AddTask extends StatelessWidget {
  int? recievedIndex;
  final snackBar = const SnackBar(
      content: Text('Task Name or Description cannot be empty!'));
  AddTask({super.key, required this.recievedIndex});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    Task? task = Task();
    task.isCompleted = false;
    task.taskColor = null;
    return Scaffold(
      // Background Color for Scaffold
      backgroundColor: Color.fromARGB(255, 196, 92, 214),
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Choose Color
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 11, 0),
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          // Circle Container The Note's Color
                          color: recievedIndex == null
                              ? Colors.amber
                              : (context
                                      .watch<TaskData>()
                                      .listTask[recievedIndex!]
                                      .taskColor ??
                                  Colors.amber),
                          // color: recievedIndex == null ? Colors.amber :
                          // value.listTask[recievedIndex!].taskColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Show Color Picker
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text('Choose Task Color'),
                              content: SingleChildScrollView(
                                  child: MaterialColorPicker(
                                onColorChange: (color) {
                                  //task!.taskColor = color;
                                  recievedIndex == null
                                      ? task!.taskColor = color
                                      : Provider.of<TaskData>(context,
                                              listen: false)
                                          .listTask[recievedIndex!]
                                          .taskColor = color;
                                  // recievedIndex == null ?
                                  // value.a
                                },
                                selectedColor: recievedIndex == null
                                    ? (task!.taskColor ?? Colors.amber)
                                    : context
                                        .watch<TaskData>()
                                        .listTask[recievedIndex!]
                                        .taskColor,
                              )),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  // Choose Font
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11, 0, 10, 0),
                    child: GestureDetector(
                      // Font for Note
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 25),
                      ),
                      // Show Font List
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  title: Text('Select Font'),
                                  content: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: ListView.builder(
                                      itemCount: fontList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          title: GestureDetector(
                                            child: Text(
                                              fontList[index],
                                              style: TextStyle(
                                                  fontFamily: fontList[index]),
                                            ),
                                            onTap: () {
                                              task!.taskFont = fontList[index];
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ));
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
            // Enter Title
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                // Color of text chosen from container
                color: recievedIndex == null
                    ? (task.taskColor ?? Colors.amber)
                    : context
                        .watch<TaskData>()
                        .listTask[recievedIndex!]
                        .taskColor,
                height: 50,
                width: double.maxFinite,
                child: TextField(
                  onChanged: (value) {
                    (recievedIndex == null)
                        ? (task?.taskTitle = value)
                        : Provider.of<TaskData>(context, listen: false)
                            .listTask[recievedIndex!]
                            .taskTitle = value;
                  },
                  controller: nameController
                    ..text = (recievedIndex == null)
                        ? ''
                        : context
                            .watch<TaskData>()
                            .listTask[recievedIndex!]
                            .taskTitle!,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Task Name',
                  ),
                ),
              ),
            ),
            // Enter Task Description
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                // Color of text chosen from container
                color: recievedIndex == null
                    ? (task.taskColor ?? Colors.amber)
                    : context
                        .watch<TaskData>()
                        .listTask[recievedIndex!]
                        .taskColor,
                height: 420,
                width: double.maxFinite,
                child: TextField(
                  controller: descriptionController
                    ..text = (recievedIndex == null)
                        ? ''
                        : context
                            .watch<TaskData>()
                            .listTask[recievedIndex!]
                            .taskDescription!,
                  onChanged: (value) {
                    (recievedIndex == null)
                        ? (task?.taskDescription = value)
                        : Provider.of<TaskData>(context, listen: false)
                            .listTask[recievedIndex!]
                            .taskDescription = value;
                  },
                  keyboardType: TextInputType.multiline,
                  expands: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Task Description',
                  ),
                ),
              ),
            ),
            // Cancel And add things
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          task = null;
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                  ),
                  recievedIndex == null
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (nameController.text == '' ||
                                    descriptionController.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  context.read<TaskData>().addTask(task!);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Add')),
                        )
                      : const Padding(padding: EdgeInsets.fromLTRB(4, 0, 0, 0))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
