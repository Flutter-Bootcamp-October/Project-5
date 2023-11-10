
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
        margin: EdgeInsets.only(top: 16, bottom: 200),
        color: lightEggShell,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: 8),
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
                children: [
                  Text('Project name '),
                  Spacer(),
                  Text('status')
                ],
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              Text('description')
            ],
          ),
        ));
  }
}
