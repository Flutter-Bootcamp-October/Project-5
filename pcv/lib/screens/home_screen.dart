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
