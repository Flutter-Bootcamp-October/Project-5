import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/modules/project_module.dart';
import 'package:cv/screens/regestratio_screen%20.dart';
import 'package:cv/services/project_api.dart';
import 'package:cv/widgets/add_new_button.dart';
import 'package:cv/widgets/bottom_sheet_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProjectScreen extends StatefulWidget {
  ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  TextEditingController ProjectNameController = TextEditingController(),
      DescriptionController = TextEditingController(),
      stateController = TextEditingController();
  ProjectModel? project;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProject();
  }

  loadProject() async {
    project = await getAllProjectData();
    print(project?.data[0].name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width - 260),
                        child: const Text(
                          "Project",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      AddNewButton(
                        title: "Add new",
                        color: Colors.white,
                        iconColor: Colors.white,
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8))),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, top: 64),
                                    child: Column(
                                      children: [
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Add new project",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        BottomSheetFiled(
                                          controller: ProjectNameController,
                                          lable: "Project Name",
                                        ),
                                        BottomSheetFiled(
                                          controller: DescriptionController,
                                          lable: "Project Description",
                                        ),
                                        BottomSheetFiled(
                                          controller: stateController,
                                          lable: "State",
                                        ),
                                        Appbutton(
                                            //post
                                            onpressed: () async {
                                              try {
                                                Response result =
                                                    await sendProjectData(
                                                        nameController.text,
                                                        DescriptionController
                                                            .text,
                                                        stateController.text);
                                                if (result.statusCode == 200) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      content: Text(
                                                        ("new project has been added successfully"),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              } catch (error) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      (error.toString()),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                            btnColor: AppColors.primaryColor,
                                            title: "Add",
                                            titleColor: Colors.white),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 706,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            margin: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
              child: FutureBuilder(
                  future: getAllProjectData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      ListView.separated(
                        itemCount: project!.data.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            height16,
                        itemBuilder: (BuildContext context, int index) {
                          return ProjectCard(
                            projectName: project?.data[0].name ?? "No project",
                            projectDescription: project?.data[0].description ??
                                "No description",
                            isComplete: true,
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("error"),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
