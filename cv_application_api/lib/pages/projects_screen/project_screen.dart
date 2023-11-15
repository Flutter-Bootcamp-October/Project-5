import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/project_model.dart';
import 'package:cv_application_api/pages/projects_screen/add_project_screen.dart';
import 'package:cv_application_api/services/api/project_api.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/normal_text.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  bool _isLoading = true;
  Project? project;
  @override
  void initState() {
    super.initState();
    getUserInfoMethode();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isLoading = false;
      });
    });
    setState(() {});
  }

  Future<Project?> getUserInfoMethode() async {
    final Project? response = await getUserProject(context: context);
    project = response;
    return project;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AddProjectScreen();
                      }));
                      setState(() {});
                    },
                    child: const TitleOfScreen(
                      title: "Add Project",
                      titleFontSize: 30,
                      titleletterSpacing: 3,
                      titleColor: appWhite,
                      titlefontWeight: FontWeight.bold,
                    ),
                  ),
                  if (_isLoading == true)
                    const Center(
                      child: CircularProgressIndicator(
                        color: app2DarkGreen,
                      ),
                    ),
                  if (_isLoading == false)
                    for (int i = 0; i < project!.projectData!.length; i++)
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Container(
                              height: 230,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: app2DarkGreenTrans),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      height14,
                                      const TitleOfScreen(
                                        title: 'Project name :',
                                        titleFontSize: 18,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
                                      ),
                                      height4,
                                      NormalText(
                                        title: project?.projectData![i].name! ??
                                            '',
                                        titleFontSize: 15,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
                                      ),
                                      height14,
                                      const TitleOfScreen(
                                        title: 'Description :',
                                        titleFontSize: 18,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
                                      ),
                                      height4,
                                      NormalText(
                                        title: project?.projectData![i]
                                                .description! ??
                                            '',
                                        titleFontSize: 15,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
                                      ),
                                      height14,
                                      const TitleOfScreen(
                                        title: 'State :',
                                        titleFontSize: 18,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
                                      ),
                                      height4,
                                      NormalText(
                                        title:
                                            project?.projectData![i].state! ??
                                                '',
                                        titleFontSize: 15,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 280,
                            child: IconButton(
                                onPressed: () async {
                                  await deleteUserProject(context: context, {
                                    "id_project": project!.projectData![i].id,
                                  });
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.remove_rounded,
                                  size: 40,
                                )),
                          ),
                        ],
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
