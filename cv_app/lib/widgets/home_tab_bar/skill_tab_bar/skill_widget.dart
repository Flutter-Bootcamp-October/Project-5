import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/skill/skill_data_model.dart';
import 'package:flutter/material.dart';

class SkillWidget extends StatefulWidget {
  SkillWidget({
    super.key,
    required this.skill,
  });
  final SkillData skill;

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Chip(
        padding: EdgeInsets.all(8),
        backgroundColor: eggShell,
        shadowColor: Colors.black,
        label: Text(
          widget.skill.skill,
          style: TextStyle(fontSize: 18),
        ),
        deleteIcon: Icon(Icons.delete_outline_outlined),
        onDeleted: () {
          setState(() async {
            final result = await network
                .removeSkillsMethod(body: {'id_skill': widget.skill.id});
            _isSelected = false;
          });
          setState(() {});
        },
        deleteIconColor: richBlack,
        deleteButtonTooltipMessage: 'Delete',
      ),
    );
  }
}
