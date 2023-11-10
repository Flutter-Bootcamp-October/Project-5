import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map about = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadingAbout();
  }

  _loadingAbout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.aboutMethod(token: token!);
    if (res.statusCode == 200) {
      about = (await jsonDecode(res.body))["data"];
      setState(() {});
      // print(about);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 217, 241),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('home'),
        centerTitle: true,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (about.isEmpty)
                const Center(
                  child: Text("ggggggggg"),
                ),
              if (about.isNotEmpty) Text('Name: ${about["name"].toString()}'),
              Text('email: ${about["email"].toString()}'),
              Text('title position: ${about["title_position"].toString()}'),
              Text('phone: ${about["phone"].toString()}'),
              Text('location: ${about["location"].toString()}'),
              Text('birthday: ${about["birthday"].toString()}'),
              Text('about: ${about["about"].toString()}'),
              Text('image: ${about["image"].toString()}'),
              Text('create_at: ${about["create_at"].toString()}'),
            ]),
      ),
    );
  }
}
