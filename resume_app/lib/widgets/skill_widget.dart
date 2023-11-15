import 'package:flutter/material.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/skill_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:resume_app/services/skill_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/views/skills_screen.dart';

bool showDelete = false;

class SkillWidget extends StatefulWidget {
  const SkillWidget({
    super.key,
    required this.skill,
  });
  final Skill skill;

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () async {
          try {
            await SkillServ().deleteSkill(
                token: getToken(), skillID: widget.skill.id!.toString());
            userSkills = await SkillServ().getSkills(token: getToken());
            showDelete = false;
            context
                .findAncestorStateOfType<SkillScreenState>()!
                .setState(() {});
          } on FormatException catch (error) {
            if (error.message.toString().contains("token") ||
                error.message.toString().contains("Token")) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                  ModalRoute.withName("/screen"));
            }
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.message.toString())));
          }
        },
        child: badges.Badge(
          badgeStyle: badges.BadgeStyle(
              badgeColor: showDelete ? Colors.grey : Colors.transparent),
          badgeContent: showDelete
              ? const Icon(
                  Icons.remove,
                  color: Colors.white,
                )
              : null,
          child: GestureDetector(
            onLongPress: () {
              showDelete = true;
              setState(() {});
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100)),
                width: 120,
                height: 120,
                child: Center(
                  child: Text(
                    widget.skill.skill,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
