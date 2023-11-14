// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/skill_screen.dart';
import 'package:pcv/services/skill_api.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSkill extends StatefulWidget {
  const AddSkill({super.key});

  @override
  State<AddSkill> createState() => _AddSkillState();
}

class _AddSkillState extends State<AddSkill> {
  TextEditingController skillController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.pink, Colors.lightBlue])),
      child: Scaffold(
        appBar: appBarMethod(title: "Add Skill"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                text: 'Skill', obscure: false, controller: skillController),
            ButtonWidget(
                onPressed: () async {
                  try {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final token = prefs.getString('token');
                    final Response resp =
                        await netSkill.addSkillMethod(token: token!, body: {
                      "skill": skillController.text,
                    });
                    if (resp.statusCode == 200) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SkillScreen()),
                          (Route<dynamic> route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text((await jsonDecode(resp.body))["msg"]
                              .toString())));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                text: 'Add')
          ],
        ),
      ),
    );
  }
}
