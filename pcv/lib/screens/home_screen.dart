// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';

import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/screens/education_screen.dart';
import 'package:pcv/screens/project_screen.dart';
import 'package:pcv/screens/skill_screen.dart';
import 'package:pcv/widgets/get_about.dart';
import 'package:pcv/widgets/get_education.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/sign_in_screen.dart';
import 'package:pcv/widgets/get_project.dart';
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
    _loedingEducation();
    _loedingProject();
    _loedingSkill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 185, 174, 243),
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
                color: Colors.white54,
                child: Column(children: [
                  if (education.isNotEmpty) const GetEducation(),
                  SizedBox(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          if (skills.isNotEmpty) const GetSkill(),
                          if (projects.isNotEmpty) const GetProjectWidget()
                        ],
                      )),
                ]),
              )
            ],
          ),
        ),
      ),
    );
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

  _loedingEducation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.educationMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        education = (await jsonDecode(res.body))["data"];
        setState(() {});
        // ignore: empty_catches
      }
    } catch (error) {
      //
    }
  }

  _loedingSkill() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.SkillMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        skills = (await jsonDecode(res.body))["data"];
        setState(() {});
      }
    } catch (error) {
      //
    }
  }

  _loedingProject() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.projectMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        projects = (await jsonDecode(res.body))["data"];
        setState(() {});
      }
    } catch (error) {
      //
    }
  }
}
