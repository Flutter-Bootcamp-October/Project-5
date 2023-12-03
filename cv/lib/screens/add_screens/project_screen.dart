// ignore_for_file: use_build_context_synchronously

import 'package:cv/blocs/project_bloc/project_bloc.dart';
import 'package:cv/blocs/radio_button_bloc/radio_button_bloc.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:icons_plus/icons_plus.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String statetype = "completed";

    TextEditingController nameController = TextEditingController();

    TextEditingController descriptionController = TextEditingController();

    final status = [
      "completed",
      "processing",
      "other",
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add New Project",
                style: TextStyle(
                    fontSize: 25, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              AddTextField(
                label: 'Name',
                hint: 'Enter project name',
                isPassword: false,
                controller: nameController,
                icon: Icons.text_fields,
              ),
              hight30(),
              AddTextField(
                label: 'Description',
                hint: 'Enter project description',
                isPassword: false,
                controller: descriptionController,
                icon: HeroIcons.document_magnifying_glass,
              ),
              hight30(),
              Padding(
                  padding: const EdgeInsets.only(left: 34.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hight8(),
                        Text(
                          "Choose project state:",
                          style: TextStyle(fontSize: 16, color: blue),
                        ),
                        hight8(),
                        BlocBuilder<RadioButtonBloc, RadioButtonState>(
                          builder: (context, state) {
                            if (state is Radiostate) {
                              RadioGroup<String>.builder(
                                groupValue: statetype,
                                onChanged: (value) {
                                  context
                                      .read<RadioButtonBloc>()
                                      .add(RadioButtonEvent(value!));
                                  statetype = state.value;
                                },
                                items: status,
                                itemBuilder: (item) => RadioButtonBuilder(
                                  item,
                                ),
                                fillColor: lightOrange,
                              );
                            }
                            return RadioGroup<String>.builder(
                              groupValue: statetype,
                              onChanged: (value) {
                                context
                                    .read<RadioButtonBloc>()
                                    .add(RadioButtonEvent(value!));
                                statetype = value;
                              },
                              items: status,
                              itemBuilder: (item) => RadioButtonBuilder(
                                item,
                              ),
                              fillColor: lightOrange,
                            );
                          },
                        ),
                      ])),
              hight40(),
              hight8(),
              BlocListener<ProjectBloc, ProjectState>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(
                          state.massege,
                          style: const TextStyle(color: Colors.black),
                        )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(
                          "Project is added successfully",
                          style: TextStyle(color: Colors.black),
                        )));
                  }
                },
                child: InkWell(
                  onTap: () async {
                    context.read<ProjectBloc>().add(ProjectEvent(
                        context,
                        nameController.text,
                        descriptionController.text,
                        statetype));
                  },
                  child: Container(
                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: pink),
                    child: const Center(
                      child: Text(
                        "Add Project",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
