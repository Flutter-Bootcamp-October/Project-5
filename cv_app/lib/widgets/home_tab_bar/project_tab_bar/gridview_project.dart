
import 'package:cv_app/models/projects/project_data_model.dart';
import 'package:cv_app/widgets/home_tab_bar/project_tab_bar/project_card.dart';
import 'package:flutter/material.dart';

class ProjectGridView extends StatelessWidget {
  const ProjectGridView({
    super.key, required ProjectData project,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children:  [
        ProjectCard(),
      ],
    );
  }
}
