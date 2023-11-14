import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/add_project.dart';
import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/services/project_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

List projects = [];

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  bool empty = projects.isEmpty;
  @override
  initState() {
    super.initState();
    _loedingProject();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        empty = false;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pink, Colors.lightBlue])),
      child: Scaffold(
        drawer: const Drawer(
          child: DrawerScreens(),
        ),
        backgroundColor: Colors.transparent,
        appBar: appBarMethod(title: 'Project'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 176, 165, 186),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProjectScreen(),
                ));
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (empty == true)
                const Center(child: CircularProgressIndicator()),
              if (projects.isNotEmpty)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: projects
                        .map((e) => InkWell(
                              onLongPress: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                final token = prefs.getString('token');
                                projectNet.deleteProjectMethod(
                                    token: token!,
                                    body: {"id_project": e["id"]});
                                projects.removeWhere(
                                    (element) => element["id"] == e["id"]);
                                setState(() {});
                              },
                              child: Card(
                                color: Colors.grey.shade100.withOpacity(0.6),
                                child: ListTile(
                                  title: Text("${e["name"]}"),
                                  subtitle: Text("${e["description"]}"),
                                ),
                              ),
                            ))
                        .toList())
            ],
          ),
        ),
      ),
    );
  }

  _loedingProject() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await projectNet.projectMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        projects = (await jsonDecode(res.body))["data"];
        setState(() {});
      }
    } catch (error) {
      //
    }
  }
}
