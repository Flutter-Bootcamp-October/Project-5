import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
String? token;

class GetUsersScreen extends StatefulWidget {
  const GetUsersScreen({super.key});

  @override
  State<GetUsersScreen> createState() => _GetUsersScreenState();
}

class _GetUsersScreenState extends State<GetUsersScreen> {
  Future<List<dynamic>> fetchUsers() async {
    var url = Uri.parse("https://bacend-fshi.onrender.com/user/get_users");
    var response = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6Ikc4c2lRbVB5dGw3Vzc2K00iLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzAwMDMzMDM0LCJpYXQiOjE3MDAwMTUwMzQsImlzcyI6Imh0dHBzOi8vbXpranV5cnZ3eHVsc3d3cmlvcm0uc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6IjRmY2VkNDE3LTI1ZDAtNGI3MS04ZDAxLTBkMmQzN2ZjZGNkZSIsImVtYWlsIjoic294YXZhdzE3M0BtYWlubWlsZS5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE3MDAwMTUwMzR9XSwic2Vzc2lvbl9pZCI6ImIxYzliYTg1LTk5NGYtNGY4Mi05YjBkLTMxNjM1MmM0OThiMCJ9.oLzaA9rlnhBBXZWi1LVg_Yl50IsXbn50emRM5XpYGaQ"
    });
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      // Make sure to access the 'users' key or whatever the actual key is.
      return json['data'] as List;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadToken(); // Call an async method to load the token
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8C5CB3),
      appBar: AppBar(title: Text('users List')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var user = snapshot.data![index];
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black, // Set the background color to blue
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      user['image'] != null
                          ? Image.network(user['image'],
                              width: 100, height: 100)
                          : Container(),
                      Text(user['name'],
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(user['email'],
                          style: TextStyle(color: Colors.white)),
                      // Add more fields here as needed
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
