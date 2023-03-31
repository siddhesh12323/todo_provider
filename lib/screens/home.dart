import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/task.dart';
import 'package:todo_provider/screens/add_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final snackBar = const SnackBar(content: Text('Task Deleted!'));
  @override
  Widget build(BuildContext context) {
    int? sendIndex;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      // Theme: Background Color
      backgroundColor: Color.fromARGB(255, 196, 92, 214),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          // Welcome Message
          const Padding(
            padding: EdgeInsets.all(8),
            // Name of the user
            child: Text(
              'Welcome, Siddhesh',
              // Welcome text style
              style: TextStyle(fontSize: 38),
            ),
          ),
          // List of tasks
          Expanded(
            child: context.watch<TaskData>().listTask.isEmpty
                ? 
                // If there are no tasks 
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Tap + to add a new task',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : 
                // Else show tasks in list
                ListView.builder(
                    itemCount: context.watch<TaskData>().listTask.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          // On single press take user to the add list page
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddTask(recievedIndex: index)));
                          },
                          // On Long Press Show Popup menu
                          onLongPress: () {
                            myAsyncFunction(context, index);
                          },
                          // Task Card
                          child: Container(
                            // Card Decoration
                            height: 150,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: context.watch<TaskData>().listTask[index].taskColor ?? Colors.amber,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 102, 99, 99),
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(0, 5))
                                ]),
                            // Contents of Card (Task Name, Description)                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Task Name
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  child: Text(context
                                      .watch<TaskData>()
                                      .listTask[index]
                                      .taskTitle!, style: 
                                      TextStyle(fontSize: 20,fontFamily: 
                                      context.watch<TaskData>().listTask[index].taskFont),),
                                ),
                                // Task Description
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  child: Text(context
                                      .watch<TaskData>()
                                      .listTask[index]
                                      .taskDescription!,
                                      style: 
                                      TextStyle(fontFamily: 
                                      context.watch<TaskData>().listTask[index].taskFont),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTask(
                        recievedIndex: sendIndex,
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> myAsyncFunction(BuildContext context, int index) async {
    var result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 0, 0, 100),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: 1,
          child: Provider.of<TaskData>(context, listen: false)
                  .listTask[index]
                  .isCompleted!
              ? const Text('Mark as not Complete')
              : const Text('Mark as Complete'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Delete'),
        ),
      ],
    );
    if (result != null) {
      if (result == 1) {
        // ignore: use_build_context_synchronously
        Provider.of<TaskData>(context, listen: false)
                .listTask[index]
                .isCompleted =
            !Provider.of<TaskData>(context, listen: false)
                .listTask[index]
                .isCompleted!;
        print(Provider.of<TaskData>(context, listen: false)
            .listTask[index]
            .isCompleted);
      } else {
        Provider.of<TaskData>(context, listen: false).deleteTask(index);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
