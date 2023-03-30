import 'package:flutter/material.dart';
import 'package:todo_provider/screens/add_task.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final snackBar = SnackBar(content: Text('Task Deleted!'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      // Theme: Background Color
      backgroundColor: Color.fromARGB(255, 196, 92, 214),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            // Name of the user
            child: Text(
              'Welcome, Siddhesh',
              // Welcome text style
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                // tasklist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      onLongPress: () {
                        // Options to delete
                      },
                      child: Container(
                        // elevation: 5,
                        height: 150,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 102, 99, 99),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 5))
                            ]),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                              child: Text('Task Name $index'),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                              child: Text('Task Description $index'),
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTask()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
