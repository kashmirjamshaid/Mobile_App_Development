import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeContainerScreen(),
    );
  }
}

class SafeContainerScreen extends StatelessWidget {
  const SafeContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [

            /// Center Container
            Center(
              child: Container(
                width: 250,
                height: 100,
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'My container',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),

            /// Top Left Button
            Positioned(
              top: 10,
              left: 10,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Left"),
              ),
            ),

            /// Top Right Button
            Positioned(
              top: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Right"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
