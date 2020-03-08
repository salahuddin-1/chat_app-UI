import 'package:calculator_app/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

// Title of the app      
      title: "Flutter chat UI",

// Theme of the main app and importing all these colors to the required widgets      
      theme: ThemeData(
        primaryColor: Colors.brown,
        accentColor: Color(0xFFFEF9EB),
      ),

// Calling the HomeScreen() class      
      home: HomeScreen(),
      
    );
  }
}