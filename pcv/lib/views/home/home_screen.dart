import 'package:flutter/material.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/views/home/about/about_data.dart';
import 'package:pcv/views/home/education/get_education.dart';
import 'package:pcv/views/home/project/get_project.dart';
import 'package:pcv/views/home/social/get_social.dart';
import 'package:pcv/views/home/skill/skill_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(title: "Home"),
      resizeToAvoidBottomInset: true,
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
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const GetEducation(),
                  const SizedBox(
                    height: 10,
                  ),
                  const GetSkill(),
                  const SizedBox(
                    height: 10,
                  ),
                  const GetProjectWidget(),
                  GetSocial(),
                  const SizedBox(
                    height: 100,
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
