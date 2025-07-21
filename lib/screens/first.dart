import 'package:flutter/material.dart';
import 'second.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();
  static List<String> nameHistory = [];

  bool isPalindrome(String text) {
    String clean = text.replaceAll(' ', '').toLowerCase();
    return clean == clean.split('').reversed.join('');
  }

  void _navigateToSecondScreen() {
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      nameHistory.add(name); // simpan ke histori
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SecondScreen(
            name: name,
            nameHistory: nameHistory,
          ),
        ),
      );
    }
  }

  void _checkPalindrome() {
    final result = isPalindrome(_palindromeController.text)
        ? 'is Palindrome'
        : 'not Palindrome';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(result),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("OK"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7F7FD5), Color(0xFF86A8E7), Color(0xFF91EAE4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                children: [
                  const Icon(Icons.person_add_alt_1,
                      size: 80, color: Colors.white),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _palindromeController,
                    decoration: InputDecoration(
                      hintText: "Palindrome",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _checkPalindrome,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 171, 196, 206),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("CHECK"),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _navigateToSecondScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 171, 196, 206),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("NEXT"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
