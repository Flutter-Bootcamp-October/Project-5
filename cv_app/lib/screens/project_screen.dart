import 'dart:convert';

import 'package:cv_app/model/error_model.dart';
import 'package:cv_app/model/project_model.dart';
import 'package:cv_app/screens/education_screen.dart';
import 'package:cv_app/services/post.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  TextEditingController proController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController staController = TextEditingController();
  final network = PostAdd();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Name of project'),
                    subtitle: TextFormField(
                      controller: proController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Dessriotion'),
                    subtitle: TextFormField(
                      controller: desController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      RadioListTile(
                        title: Text("completed"),
                        value: "completed",
                        groupValue: staController.text,
                        onChanged: (value) {
                          setState(() {
                            staController.text = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("processing"),
                        value: "processing",
                        groupValue: staController.text,
                        onChanged: (value) {
                          setState(() {
                            staController.text = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("other"),
                        value: "other",
                        groupValue: staController.text,
                        onChanged: (value) {
                          setState(() {
                            staController.text = value.toString();
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            CustomBottom(
                color: orang,
                ontap: () async {
                  try {
                    final response = await PostAdd().addProject({
                      "name": proController.text,
                      "description": desController.text,
                      "state": staController.text
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Saved Successfully")));
                  } on FormatException catch (error) {
                    print("-----");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.message.toString())));
                  }
                },
                border: orang,
                text: "Continue")
          ],
        ),
      ),
    );
  }
}
