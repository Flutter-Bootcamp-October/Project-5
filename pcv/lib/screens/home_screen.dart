// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';

import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/sign_in_screen.dart';
import 'package:pcv/widgets/conta_home_widget.dart';
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
      print(token);
    }
    if (res.statusCode == 401) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 104, 87, 186),
      appBar: appBarMethod(title: 'Home'),
      drawer: const Drawer(
        child: DrawerScreens(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (about.isEmpty)
                const Center(child: CircularProgressIndicator()),
              if (about.isNotEmpty)
                Column( crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                      ),
                      Column(
                        children: [
                          Text(
                            ' ${about["name"].toString()}',
                            style: const TextStyle(fontSize: 28),
                          ),
                          Text(
                            about["title_position"].toString(),
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('about: ${about["about"].toString()}'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ContaHomeWidget(
                    icon: Icons.email,
                    text: about["email"].toString(),
                  ),
                  ContaHomeWidget(
                    icon: Icons.phone,
                    text: about["phone"].toString(),
                  ),
                  ContaHomeWidget(
                    icon: Icons.location_on,
                    text: about["location"].toString(),
                  ),
                  ContaHomeWidget(
                    icon: Icons.email,
                    text: about["birthday"].toString(),
                  ),
                ]),
            ],
          ),
        ),
      ),
    );
  }
}
