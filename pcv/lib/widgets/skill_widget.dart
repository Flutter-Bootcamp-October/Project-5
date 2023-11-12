import 'package:flutter/material.dart';
import 'package:pcv/screens/skill_screen.dart';

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
      children: [
        // if (skills.isEmpty) const Center(child: CircularProgressIndicator()),
        if (skills.isNotEmpty) Text('Skills'),
        Column(
            children: skills
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100.withOpacity(0.5),
                        ),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: ListTile(
                          title: Text("${e["skill"]}"),
                        ),
                      ),
                    ))
                .toList())
      ],
    );
  }
}
