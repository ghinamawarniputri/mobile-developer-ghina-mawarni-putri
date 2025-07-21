import 'package:flutter/material.dart';
import 'screens/first.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palindrome App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: FirstScreen(),
    );
  }
}