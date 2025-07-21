import 'package:flutter/material.dart';
import 'third.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  final List<String> nameHistory;

  const SecondScreen({required this.name, required this.nameHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose a User")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text("Hello, $name", style: TextStyle(fontSize: 18))),
          SizedBox(height: 10),
          Text("Selected User: -", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Center(child: Text("No users available.")), // dummy placeholder
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ThirdScreen(nameHistory: nameHistory),
                ),
              );
            },
            child: Text("View All Users"),
          )
        ],
      ),
    );
  }
}
