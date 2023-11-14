import 'package:flutter/material.dart';

List user = [];

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pink, Colors.deepPurple, Colors.lightBlue])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (user.isEmpty)
                  const Center(child: CircularProgressIndicator()),
                if (user.isNotEmpty)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: user
                          .map((e) => Card(
                                color: Colors.grey.shade100.withOpacity(0.6),
                                child: ListTile(
                                  title: Text(
                                    "${e["name"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text("${e["email"]}",
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                  trailing: Text(e["phone"]),
                                ),
                              ))
                          .toList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
