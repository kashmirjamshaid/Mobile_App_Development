import 'package:flutter/material.dart';
import 'package:whatsaapui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // modern constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}