import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';


class ThirdScreen extends StatefulWidget {
  final List<String> nameHistory;

  const ThirdScreen({required this.nameHistory});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> users = [];
  int page = 1;
  bool isLoading = false;

  Future<void> fetchUsers() async {
    setState(() => isLoading = true);
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        users = data['data'];
      });
    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Users")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: fetchUsers,
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  Text("User:", style: TextStyle(fontWeight: FontWeight.bold)),
                  ...widget.nameHistory.map((name) => ListTile(title: Text(name))).toList(),
                  Divider(),
                  Text("API Users:", style: TextStyle(fontWeight: FontWeight.bold)),
                  ...users.map((user) => ListTile(
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text(user.email),
                    leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
                  )),
                ],
              ),
            ),
    );
  }
}
