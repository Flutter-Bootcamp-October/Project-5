import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/add_project.dart';
import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
  List projects = [];
class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {


  @override
  void initState() {
    super.initState();
    _loedingProject();
  }

  _loedingProject() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.projectMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        projects = (await jsonDecode(res.body))["data"];
        setState(() {});
      }
    } catch (error) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerScreens(),
      ),
      backgroundColor: const Color.fromARGB(255, 104, 87, 186),
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
            if (projects.isEmpty)
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
                              network.deleteProjectMethod(
                                  token: token!, body: {"id_project": e["id"]});
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
    );
  }
}
