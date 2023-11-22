// ignore_for_file: use_build_context_synchronous

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/widgets/card_widget.dart';
import 'package:pcv/widgets/get_about.dart';
import 'package:pcv/widgets/get_education.dart';
import 'package:pcv/widgets/get_project.dart';
import 'package:pcv/widgets/get_social.dart';
import 'package:pcv/widgets/skill_widget.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBarMethod(title: 'Home'),
      drawer: const Drawer(
        child: DrawerScreens(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const AboutData(),
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
    );
  }
}
