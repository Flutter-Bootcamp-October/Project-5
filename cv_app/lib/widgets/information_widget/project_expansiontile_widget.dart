import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/projects/project_data_model.dart';
import 'package:cv_app/widgets/information_widget/button_widget.dart';
import 'package:cv_app/widgets/information_widget/textfiled_widget.dart';
import 'package:flutter/material.dart';

class ProjectExpansionTileWidget extends StatefulWidget {
  const ProjectExpansionTileWidget({super.key});

  @override
  State<ProjectExpansionTileWidget> createState() =>
      _ProjectExpansionTileWidgetState();
}

class _ProjectExpansionTileWidgetState
    extends State<ProjectExpansionTileWidget> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late String state = '';
  List<ProjectData> projectsList = [];
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: lightGrey,
      collapsedBackgroundColor: lightGrey,
      iconColor: prussianBlue,
      collapsedIconColor: prussianBlue,
      title: const Text(
        'Projects',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: prussianBlue),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: projectsList.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (context, index) {
                      final project = projectsList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFelidWidget(
                            title: 'Project name',
                            controller: projectNameController,
                            onChanged: (value) {
                              project.name = value;
                              projectNameController.text = value;
                            },
                            hintTitle: 'Project name',
                          ),
                          height10,
                          TextFelidWidget(
                            title: 'Project description',
                            controller: descriptionController,
                            onChanged: (value) {
                              project.description = value;
                              descriptionController.text = value;
                            },
                            hintTitle: 'Project description',
                          ),
                          height10,
                          const Text(
                            'Project status:',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: prussianBlue),
                          ),
                          height10,
                          Row(
                            children: [
                              Radio(
                                value: 'completed',
                                groupValue: project.state,
                                onChanged: (String? value) {
                                  project.state = value!;
                                  state = 'completed';
                                },
                              ),
                              const Text(
                                'Complete',
                                style: TextStyle(color: prussianBlue),
                              ),
                              width20,
                              Radio(
                                value: 'processing',
                                groupValue: project.state,
                                onChanged: (value) {
                                  project.state = value!;
                                  state = 'processing';
                                },
                              ),
                              const Text('Incomplete',
                                  style: TextStyle(color: prussianBlue)),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  height20,
                  if (projectsList.isEmpty)
                    ButtonWidget(
                      onTap: () {
                        setState(() {
                          projectsList.add(ProjectData(
                            name: '',
                            description: '',
                            state: '',
                          ));
                        });
                      },
                      name: 'Add Project',
                    ),
                  if (projectsList.isNotEmpty)
                    ButtonWidget(
                      onTap: () async {
                        final result = await network.addProjectMethod(
                          body: {
                            'name': projectNameController.text,
                            'state': state,
                            'description': descriptionController.text,
                          },
                        );
                      },
                      name: 'Send Project',
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
