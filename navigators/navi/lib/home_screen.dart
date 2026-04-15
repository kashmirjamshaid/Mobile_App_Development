import 'package:flutter/material.dart';
import 'drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text(
          "Welcome to my home  screen ",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}