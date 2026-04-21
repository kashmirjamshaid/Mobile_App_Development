import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String username;
  final String size;

  const ConfirmationScreen({
    super.key,
    required this.username,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Confirmation")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Customer: $username", style: const TextStyle(fontSize: 18)),
            Text("Pizza Size: $size", style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }
}