import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/skill_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('add Skill'),
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                      await network.addSkillMethod(token: token!, body: {
                    "skill": skillController.text,
                  });

                  if (resp.statusCode == 200) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SkillScreen()),
                        (Route<dynamic> route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            (await jsonDecode(resp.body))["msg"].toString())));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              text: 'Add')
        ],
      ),
    );
  }
}
