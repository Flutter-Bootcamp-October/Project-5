
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/home_tab_bar/skill_tab_bar/skill_widget.dart';
import 'package:flutter/material.dart';

class GridViewSkills extends StatelessWidget {
  const GridViewSkills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: 12),
      crossAxisCount: 4,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: lightEggShell),
          child: SkillWidget(),
        ),
      ],
    );
  }
}
