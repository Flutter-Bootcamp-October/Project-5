import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/models/skill/skill_data_model.dart';
import 'package:cv_app/widgets/home_tab_bar/skill_tab_bar/skill_widget.dart';
import 'package:flutter/material.dart';

class GridViewSkills extends StatelessWidget {
  const GridViewSkills({
    super.key, required SkillData skill,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(top: 12),
      crossAxisCount: 4,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: eggShell),
          child:  SkillWidget(),
        ),
      ],
    );
  }
}
