import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostWidget extends StatelessWidget {
  final String docId;
  final String imageUrl;
  final String caption;
  final int likes;

  const PostWidget({
    super.key,
    required this.docId,
    required this.imageUrl,
    required this.caption,
    required this.likes,
  });

  Future<void> likePost() async {
    await FirebaseFirestore.instance.collection("posts").doc(docId).update({
      "likes": likes + 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl),

        Row(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: likePost,
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.all(8),
          child: Text(caption),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("❤️ $likes likes"),
        ),
      ],
    );
  }
}