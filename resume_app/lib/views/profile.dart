import 'package:flutter/material.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/about_model.dart';
import 'package:resume_app/models/project_model.dart';
import 'package:resume_app/services/about_services.dart';
import 'package:resume_app/services/project_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    testMethod();
    return const Scaffold();
  }

  void testMethod() async {
    print("______________LOOK HERE_________________");
    try {
      List<Project> x = await ProjectServ().getProjects(token: getToken());
      ProjectServ()
          .deleteProject(projectID: x.last.id!.toString(), token: getToken());
      print(x.last.description);
    } on FormatException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
