// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cv/services/project/add_project.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String statetype = "completed";
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add New Project",
                style: TextStyle(
                    fontSize: 25, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              AddTextField(
                label: 'Name',
                hint: 'Enter project name',
                isPassword: false,
                controller: nameController,
                icon: Icons.text_fields,
              ),
              hight30(),
              AddTextField(
                label: 'Description',
                hint: 'Enter project description',
                isPassword: false,
                controller: descriptionController,
                icon: Icons.description,
              ),
              hight30(),
              Padding(
                  padding: const EdgeInsets.only(left: 34.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hight8(),
                        Text(
                          "Choose project state:",
                          style: TextStyle(fontSize: 16, color: blue),
                        ),
                        hight8(),
                        RadioListTile(
                            fillColor: MaterialStateProperty.all(lightOrange),
                            activeColor: lightOrange,
                            title: const Text("Completed"),
                            value: "completed",
                            groupValue: statetype,
                            onChanged: (value) {
                              setState(() {
                                statetype = "completed";
                              });
                            },
                            dense: true),
                        RadioListTile(
                            fillColor: MaterialStateProperty.all(lightOrange),
                            activeColor: lightOrange,
                            title: const Text("Processing"),
                            value: "processing",
                            groupValue: statetype,
                            onChanged: (value) {
                              setState(() {
                                statetype = "processing";
                              });
                            },
                            dense: true),
                        RadioListTile(
                            fillColor: MaterialStateProperty.all(lightOrange),
                            activeColor: lightOrange,
                            title: const Text("Other"),
                            value: "other",
                            groupValue: statetype,
                            onChanged: (value) {
                              setState(() {
                                statetype = "other";
                              });
                            },
                            dense: true),
                      ])),
              hight40(),
              hight8(),
              InkWell(
                onTap: () async {
                  try {
                    if (nameController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty) {
                      final response = await addProject(context, {
                        "name": nameController.text,
                        "description": descriptionController.text,
                        "state": statetype
                      });
                      if (response != null) {
                        if (response.statusCode >= 200 &&
                            response.statusCode < 300) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Project is added successfully")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(jsonDecode(response.body)["msg"])));
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please enter all information")));
                    }
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  }
                },
                child: Container(
                  width: 330,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: pink),
                  child: const Center(
                    child: Text(
                      "Add Project",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
