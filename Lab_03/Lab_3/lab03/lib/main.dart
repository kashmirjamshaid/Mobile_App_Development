// task4_card_listtile.dart
import 'package:flutter/material.dart';

void main() => runApp(const Task4App());

class Task4App extends StatelessWidget {
  const Task4App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Task4Screen(),
    );
  }
}

class Task4Screen extends StatelessWidget {
  const Task4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4: Card + ListTile'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // ── Version 1
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // rounded corners
              ),
              child: ListTile(
                // Leading: icon on the left
                leading: const Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.indigo,
                ),
                // Title: contact name (main bold text)
                title: const Text(
                  'Ali Hassan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // Subtitle: registration number (smaller text below title)
                subtitle: const Text('Reg No:23-Ntu-Cs-1167'),
              ),
            ),

            const SizedBox(height: 16),

            // ── Version 2: CircleAvatar 
            Card(
              color: Colors.deepPurple[50],   // different background color
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                // Leading: CircleAvatar with initials
                leading: const CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Text(
                    'S',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: const Text(
                  'Kashmir Khan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
                subtitle: const Text(
                  'Reg No: F2021-BCE-067',
                  style: TextStyle(color: Colors.deepPurple),
                ),
                // Trailing: icon on the RIGHT side
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepPurple,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}