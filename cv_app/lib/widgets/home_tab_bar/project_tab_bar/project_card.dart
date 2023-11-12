import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/projects/project_data_model.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
   ProjectCard({
    super.key,
  });
  late ProjectData project;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 16, bottom: 200),
        color: eggShell,
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Projects',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: richBlack,
                ),
              ),
              height15,
              Row(
                children: [Text(project.name), Spacer(), Text(project.state)],
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              Text(project.description)
            ],
          ),
        ));
  }
}
