import 'package:flutter/material.dart';
import 'drawer_widget.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text(
          "This is Kj , part buisness and i want to stay alone ",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}