
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/home_tab_bar/project_tab_bar/project_card.dart';
import 'package:flutter/material.dart';

class ProjectGridView extends StatelessWidget {
  const ProjectGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: const [
        ProjectCard(),
      ],
    );
  }
}
