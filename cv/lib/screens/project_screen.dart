import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/widgets/add_new_button.dart';
import 'package:cv/widgets/bottom_sheet_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/project_card.dart';
import 'package:flutter/material.dart';

class Project extends StatelessWidget {
  Project({super.key});

  TextEditingController ProjectNameController = TextEditingController(),
      DescriptionController = TextEditingController(),
      stateController = TextEditingController();
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
                                            onpressed: () {
                                              //post
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
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) => height16,
                itemBuilder: (BuildContext context, int index) {
                  return const ProjectCard(
                    projectName: "Project Name",
                    projectDescription:
                        "Project description Project description  Project description  Project description  Project description  Project description  ",
                    isComplete: true,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
