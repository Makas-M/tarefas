import 'package:flutter/material.dart';
import 'drawer.dart';
import 'lista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text("Tarefas"),
          backgroundColor: Colors.blue,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}
