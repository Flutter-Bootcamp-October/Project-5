import 'package:flutter/material.dart';
import 'package:project_5/models/project_model.dart';
import 'package:project_5/screens/skill/skill_screen.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    //get project data
    //list data in rows then add delete button on the row of project
    super.initState();
  }

  List<Project> projectList = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController projectNameController = TextEditingController(),
        descriptionController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          // add refresh page package
          InputTextFields(
              controller: projectNameController,
              title: "project name",
              lines: 2),
          // edit description field size
          InputTextFields(
              controller: descriptionController,
              title: "project description",
              lines: 4),
          ElevatedButton(
            onPressed: () {},
            child: const Text("add project "),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("delete project "),
          ),
        ],
      ),
    );
  }
}
