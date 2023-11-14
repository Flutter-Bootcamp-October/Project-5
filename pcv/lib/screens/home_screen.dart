// ignore_for_file: use_build_context_synchronous

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/widgets/get_about.dart';
import 'package:pcv/widgets/get_education.dart';
import 'package:pcv/widgets/get_project.dart';
import 'package:pcv/widgets/get_social.dart';
import 'package:pcv/widgets/skill_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadingAbout();
    Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
  }

  _loadingAbout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await netAbout.aboutMethod(token: token!);
    if (res.statusCode == 200) {

      about = (await jsonDecode(res.body))["data"];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.pink, Colors.deepPurple, Colors.lightBlue])),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: appBarMethod(title: 'Home'),
        drawer: const Drawer(
          child: DrawerScreens(),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (about.isEmpty)
                  const Center(child: CircularProgressIndicator()),
                if (about.isNotEmpty) const GetAbout(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  color: Colors.transparent,
                  child: const Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    GetEducation(),
                    SizedBox(
                      height: 10,
                    ),
                    GetSkill(),
                    SizedBox(
                      height: 10,
                    ),
                    GetProjectWidget(),
                    GetSocial(),
                    SizedBox(
                      height: 8,
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
