import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Flutter LAB-1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 196, 210), // Light pink background

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 87, 197), // Light pink background
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          "This is Flutter Lab ",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
