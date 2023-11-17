// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/education_screen.dart';
import 'package:pcv/screens/home_screen.dart';
import 'package:pcv/screens/project_screen.dart';
import 'package:pcv/screens/sign_in_screen.dart';
import 'package:pcv/screens/skill_screen.dart';
import 'package:pcv/screens/social_screen.dart';
import 'package:pcv/screens/user.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/services/education_api.dart';
import 'package:pcv/services/project_api.dart';
import 'package:pcv/services/skill_api.dart';
import 'package:pcv/services/social_network.dart';
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

    _loedingEducation();
    _loedingProject();
    _loedingSkill();
    _loedingSocial();
    _loedingUser();
    Future.delayed(const Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      try{
      final Response res = await netAbout.aboutMethod(token: token!);
      if (res.statusCode == 200) {
        about = (await jsonDecode(res.body))["data"];
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
        setState(() {});
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
            (route) => false);
      }}catch(e){

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _loedingEducation() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final Response res =
          await educationNetwork.educationMethod(token: token!);

      if (res.statusCode == 200) {
        education = (await jsonDecode(res.body))["data"];
        setState(() {});
      }
    } catch (error) {
      //
    }
  }

  _loedingSkill() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final Response res = await netSkill.skillMethod(token: token!);

      if (res.statusCode == 200) {
        skills = (await jsonDecode(res.body))["data"];
        setState(() {});
      }
    } catch (error) {
      //
    }
  }

  _loedingProject() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      
      final Response res = await projectNet.projectMethod(token: token!);

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
     try {
    final Response res = await socialNetwork.socialMethod(token: token!);
   
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
    try {
      final Response res = await netAbout.getUserMethod(token: token!);

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
