import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/global/globally.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final apiMethod = ApiMethods();

  @override
  void initState() {
    //get skills data, send token to edit, add and delete
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        if (skillList.isEmpty)
          const Center(
            child: Text("No skills added"),
          ),
        if (skillList.isNotEmpty)
          Column(
              children: skillList
                  .map(
                    (e) => ListTile(
                      subtitle: Text(e.data.skill),
                      trailing: InkWell(
                          onTap: () async {
                            e.data.id;
                            skillList.remove(e);
                          },
                          child: Icon(Icons.delete)),
                    ),
                  )
                  .toList()),
        ElevatedButton(
          onPressed: () {},
          child: const Text("edit skill "),
        ),
      ],
    ));
  }
}
