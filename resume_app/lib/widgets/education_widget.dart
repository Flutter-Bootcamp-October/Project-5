import 'package:flutter/material.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/education_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:resume_app/services/education_services.dart';
import 'package:resume_app/views/education_screen.dart';

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
          await EducationServ().deleteEducation(
              token: getToken(), educationID: widget.edu.id!.toString());
          userEducation.remove(widget.edu);
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
                width: 200,
                height: 200,
                child: Center(
                  child: Column(
                    children: [
                      const Icon(Icons.school_outlined, size: 50),
                      Text(
                        widget.edu.level,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        widget.edu.specialization,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        widget.edu.specialization,
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
