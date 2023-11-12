import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    //get project data
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // add refresh page package
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
