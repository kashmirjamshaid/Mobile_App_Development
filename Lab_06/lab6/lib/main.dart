import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
        isDark: isDark,
        onToggle: (value) {
          setState(() {
            isDark = value;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onToggle;

  const HomeScreen({super.key, required this.isDark, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Flutter Themes'),
        actions: [
          Switch(
            value: isDark,
            onChanged: onToggle,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'This is Flutter',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'I use this para as temporary, where asFlutter is an open-source framework developed by Google.It is used to build beautiful and fast applications.',

                

                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Card used for theme',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text('Theme Button')),
            ],
          ),
        ),
      ),
    );
  }
}