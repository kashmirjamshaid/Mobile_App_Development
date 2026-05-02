import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final String name;

  const StoryWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.pinkAccent,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.grey[300],
            ),
          ),
          SizedBox(height: 5),
          Text(name, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}