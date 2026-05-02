import"package:flutter/material.dart";

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      
      appBar: AppBar(
      
      ),
      body: SafeArea(child:Center(child:Text('flutter developer ',style: TextStyle(fontSize: 30),),),
      )
      
    );
  }
}

