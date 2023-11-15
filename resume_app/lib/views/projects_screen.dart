import 'package:flutter/material.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/project_model.dart';
import 'package:resume_app/services/project_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';
import 'package:resume_app/widgets/project_widget.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => ProjectsScreenState();
}

class ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Projects",
                      style: TextStyle(color: Colors.black, fontSize: 40)),
                  IconButton(
                      onPressed: () async {
                        late Project newProject;
                        TextEditingController customController =
                            TextEditingController();
                        TextEditingController descriptionController =
                            TextEditingController();
                        TextEditingController stateController =
                            TextEditingController();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Enter Project "),
                                content: Column(
                                  children: [
                                    TextField(
                                      controller: customController,
                                      decoration: returnDec(
                                          hint: "name",
                                          labelText: "Project Name"),
                                    ),
                                    const SizedBox(height: 5),
                                    TextField(
                                      controller: descriptionController,
                                      decoration: returnDec(
                                          hint: "description",
                                          labelText: "Description"),
                                    ),
                                    const SizedBox(height: 5),
                                    TextField(
                                      controller: stateController,
                                      decoration: returnDec(
                                          hint:
                                              "completed','processing', 'other'",
                                          labelText: "State"),
                                    ),
                                  ],
                                ),
                                actions: [
                                  MaterialButton(
                                    elevation: 5.0,
                                    child: const Text("add"),
                                    onPressed: () async {
                                      if (customController.text.isNotEmpty &&
                                          descriptionController
                                              .text.isNotEmpty &&
                                          stateController.text.isNotEmpty) {
                                        try {
                                          newProject = Project.fromJson({
                                            "name": customController.text,
                                            "description":
                                                descriptionController.text,
                                            'state': stateController.text
                                          });
                                          await ProjectServ().addProject(
                                              token: getToken(),
                                              project: newProject);
                                          userProjects = await ProjectServ()
                                              .getProjects(token: getToken());
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        } on FormatException catch (error) {
                                          if (error.message
                                                  .toString()
                                                  .contains("token") ||
                                              error.message
                                                  .toString()
                                                  .contains("Token")) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignInScreen()),
                                                ModalRoute.withName("/screen"));
                                          }
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(error.message
                                                      .toString())));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "please fill out required feild to add skill"
                                                        .toString())));
                                      }
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
            Center(
              child: Wrap(
                  children: List.generate(userProjects.length,
                      (index) => ProjectWidget(project: userProjects[index]))),
            ),
          ]))
    ]);
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
