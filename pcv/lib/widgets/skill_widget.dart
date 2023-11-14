import 'package:flutter/material.dart';
import 'package:pcv/screens/skill_screen.dart';
import 'package:pcv/widgets/title_widget.dart';

class GetSkill extends StatefulWidget {
  const GetSkill({super.key});

  @override
  State<GetSkill> createState() => _GetSkillState();
}

class _GetSkillState extends State<GetSkill> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [if (skills.isNotEmpty)
        const TitlesWidget(titles: 'Skill'),
          GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2,
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: skills
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100.withOpacity(0.2),
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(15),
                                right: Radius.circular(15))),
                        // width: MediaQuery.of(context).size.width * 0.45,
                        child: Center(
                          child: Text(
                            "${e["skill"]}",
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList())
      ],
    );
  }
}
