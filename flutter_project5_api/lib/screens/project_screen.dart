import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project5_api/models/project.dart';
import 'package:flutter_project5_api/servers_api/project/add_projects_api.dart';
import 'package:flutter_project5_api/servers_api/project/del_project_api.dart';
import 'package:flutter_project5_api/widgets/custom_button.dart';
import 'package:flutter_project5_api/widgets/textfelides.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final List<Project> projects = [];

  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController projectStatusController = TextEditingController();

  void _addProject() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Project',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  CustomTextField(
                    hint: 'Name',
                    controller: projectNameController,
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    hint: 'Description',
                    controller: projectDescriptionController,
                    maxLines: 3,
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    hint: 'Status',
                    controller: projectStatusController,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      await _addProjectAPI();
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _saveProject(Project project) {
    setState(() {
      projects.add(project);
    });

    projectNameController.clear();
    projectDescriptionController.clear();
    projectStatusController.clear();
  }

  void _deleteProject(int index) {
    setState(() {
      projects.removeAt(index);
    });
  }

  Future<void> _addProjectAPI() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await addproject(
        token: token!,
        body: {
          'name': projectNameController.text,
          'description': projectDescriptionController.text,
          'state': projectStatusController.text,
        },
      );

      if (response.codeState == 200) {
        setState(() {
          _saveProject(response);
        });

        projectNameController.clear();
        projectDescriptionController.clear();
        projectStatusController.clear();
      } else {
        print("Failed to adding the project. Error: ${response.msg}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<void> _deleteProjectAPI(int projectId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await deleteprojects(
        token: token!,
        body: {'id': projectId},
      );

      if (response.codeState == 200) {
        _deleteProject(projectId);
      } else {
        print("Failed to deleteing the project. Error: ${response.msg}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Projects',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: _addProject,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 26, 8, 90),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(projects.length, (int index) {
                    return Card(
                      margin: EdgeInsets.only(bottom: 16.0),
                      child: ListTile(
                        title: Text(
                          projects[index].data![0].name!,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Description: ${projects[index].data![0].description!}'),
                            Text('Status: ${projects[index].data![0].state!}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _deleteProject(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
