import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File? image;
  final caption = TextEditingController();

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      image = File(picked.path);
      setState(() {});
    }
  }

  Future<void> uploadPost() async {
    String fileName = DateTime.now().toString();

    final ref = FirebaseStorage.instance.ref().child("posts/$fileName");

    await ref.putFile(image!);

    String url = await ref.getDownloadURL();

    await FirebaseFirestore.instance.collection("posts").add({
      "imageUrl": url,
      "caption": caption.text,
      "likes": 0,
      "timestamp": FieldValue.serverTimestamp(),
    });

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Post")),
      body: Column(
        children: [
          image != null ? Image.file(image!, height: 200) : Container(),

          TextField(controller: caption),

          ElevatedButton(onPressed: pickImage, child: Text("Pick Image")),
          ElevatedButton(onPressed: uploadPost, child: Text("Upload")),
        ],
      ),
    );
  }
}