import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        // providers: [
        //   ChangeNotifierProvider(create: (context) => HomePage())
        // ],
        // child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    // );
  }
}
