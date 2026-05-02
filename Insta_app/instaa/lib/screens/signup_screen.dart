import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signupUser(BuildContext context) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );
    if (!context.mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: password, decoration: InputDecoration(labelText: "Password")),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => signupUser(context),
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}