import 'package:flutter/material.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/project_model.dart';
import 'package:resume_app/services/project_services.dart';
import 'package:resume_app/views/projects_screen.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:badges/badges.dart' as badges;

bool showDelete = false;

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key, required this.project});
  final Project project;

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    late Color cColor;
    if (widget.project.state == 'completed') {
      cColor = const Color.fromARGB(255, 103, 209, 107);
    } else if (widget.project.state == 'processing') {
      cColor = const Color.fromARGB(255, 209, 193, 103);
    } else {
      cColor = const Color.fromARGB(255, 139, 160, 140);
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () async {
          try {
            await ProjectServ().deleteProject(
                token: getToken(), projectID: widget.project.id!.toString());
            userProjects = await ProjectServ().getProjects(token: getToken());
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
              .findAncestorStateOfType<ProjectsScreenState>()!
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
                    color: cColor, borderRadius: BorderRadius.circular(20)),
                width: 250,
                height: 250,
                child: Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.work_outline_outlined,
                          size: 70,
                        ),
                      ),
                      Text(
                        widget.project.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      Text(
                        widget.project.description,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
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
