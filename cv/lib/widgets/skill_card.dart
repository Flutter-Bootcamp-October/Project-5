import 'package:cv/constants/sizes.dart';
import 'package:cv/widgets/single_skill.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({super.key});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width - 32,
      height: MediaQuery.of(context).size.height * 0.2,
      child: const Padding(
        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleSkill(
              skillName: "skill",
            ),
            height4,
            SingleSkill(
              skillName: "skill",
            ),
            SingleSkill(
              skillName: "skill",
            ),
          ],
        ),
      ),
    );
  }
}
