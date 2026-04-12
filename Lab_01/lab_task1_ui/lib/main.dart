import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter LAB-1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Flutter LAB-1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Row as First Child
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                
                SizedBox(width: 10),
                Text(
                  "Flutter Layout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //  Asset Image Section
            const Text(
              "Asset Image",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/flutter_image.jpeg",
              height: 150,
            ),

            const SizedBox(height: 20),

          //  Network Image Section
            const Text(
              "Network Image",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Image.network(
  "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png",
  height: 150,
)
           
          ],
        ),
      ),
    );
  }
}
