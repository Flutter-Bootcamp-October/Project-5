import 'package:flutter/material.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:badges/badges.dart' as badges;
import 'package:resume_app/models/social_model.dart';
import 'package:resume_app/services/social_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/views/skills_screen.dart';

bool showDelete = false;

class SocialWidget extends StatefulWidget {
  const SocialWidget({
    super.key,
    required this.social,
  });
  final Social social;

  @override
  State<SocialWidget> createState() => SocialWidgetState();
}

class SocialWidgetState extends State<SocialWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () async {
          try {
            await SocialServ().deleteSocial(
                token: getToken(), socialID: widget.social.id!.toString());
            userSocials = await SocialServ().getSocials(token: getToken());
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
                    widget.social.username,
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
