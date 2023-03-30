import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      // Background Color for Scaffold
      backgroundColor: Color.fromARGB(255, 196, 92, 214),
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 11, 0),
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          // Circle Container The Note's Color
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11, 0, 10, 0),
                    child: GestureDetector(
                      // Font for Note
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 25),
                      ),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
            // Enter Title
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                // Color of text chosen from container
                color: Color.fromARGB(224, 240, 230, 230),
                height: 50,
                width: double.maxFinite,
                child: TextField(
                  controller: nameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Task Name',
                    hintText: 'Enter Task Name',
                  ),
                ),
              ),
            ),
            // Enter Task Description
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                // Color of text chosen from container
                color: Color.fromARGB(224, 240, 230, 230),
                height: 300,
                width: double.maxFinite,
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  expands: false,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Task Description',
                    hintText: 'Enter Task Description',
                  ),
                ),
              ),
            ),
            // Cancel And add things
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: ElevatedButton(onPressed: () {}, child: Text('Add')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
