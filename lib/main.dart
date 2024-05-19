import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/animals_page.dart';
import 'package:state_provider/todo_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => TodoProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimalsPage(),
    );
  }
}
