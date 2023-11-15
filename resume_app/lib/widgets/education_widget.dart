import 'package:flutter/material.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/education_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:resume_app/services/education_services.dart';
import 'package:resume_app/views/education_screen.dart';
import 'package:resume_app/views/signin_screen.dart';

bool showDelete = false;

class EducationWidget extends StatefulWidget {
  const EducationWidget({
    super.key,
    required this.edu,
  });
  final Education edu;

  @override
  State<EducationWidget> createState() => EducationWidgetState();
}

class EducationWidgetState extends State<EducationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () async {
          try {
            await EducationServ().deleteEducation(
                token: getToken(), educationID: widget.edu.id!.toString());
            userEducation =
                await EducationServ().getEducation(token: getToken());
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

          showDelete = false;
          context
              .findAncestorStateOfType<EducationScreenState>()!
              .setState(() {});
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
                    borderRadius: BorderRadius.circular(20)),
                width: 250,
                height: 250,
                child: Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.school_outlined,
                          size: 70,
                        ),
                      ),
                      Text(
                        widget.edu.level,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      Text(
                        widget.edu.specialization,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        widget.edu.college,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        widget.edu.university,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        widget.edu.graduationDate,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
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
