// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/education_screen.dart';
import 'package:pcv/screens/home_screen.dart';
import 'package:pcv/screens/project_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/sign_in_screen.dart';
import 'package:pcv/screens/skill_screen.dart';
import 'package:pcv/screens/social_screen.dart';
import 'package:pcv/screens/user.dart';
import 'package:pcv/widgets/get_about.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  initState() {
    super.initState();
    //  _loadingAbout();
    _loedingEducation();
    _loedingProject();
    _loedingSkill();
    _loedingSocial();
    _loedingUser();
    Future.delayed(const Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final Response res = await network.aboutMethod(token: token!);
      if (res.statusCode == 200) {
        about = (await jsonDecode(res.body))["data"];
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
        setState(() {});
      }
      if (res.statusCode == 401) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
          backgroundColor: Colors.amber,
        ),
      ),
    );
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
    final Response res = await network.skillMethod(token: token!);
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

  _loedingSocial() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.socialMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        social = (await jsonDecode(res.body))["data"];

        setState(() {});
        // ignore: empty_catches
      }
    } catch (error) {
      //
    }
  }

  _loedingUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.getUserMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        user = (await jsonDecode(res.body))["data"];

        setState(() {});
        // ignore: empty_catches
      }
    } catch (error) {
      //
    }
  }
}
