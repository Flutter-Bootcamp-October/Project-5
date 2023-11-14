import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_text_field.dart';

import 'package:project_5/services/projects_api.dart';

Future<dynamic> projectsModalBottomSheet(
  BuildContext context, {
  required TextEditingController projectNameController,
  required TextEditingController projectDescriptionController,
  required String content,
  required Function? updateMethod,
}) {
  final List<String> process = [
    "other",
    "completed",
    "processing",
  ];
  String selectedProcess = "processing";
  return showModalBottomSheet(
    showDragHandle: true,
    isDismissible: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.getHeight() * .02),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "New $content",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: context.getHeight() * .01),
              AuthTextField(
                isPassword: false,
                content: "Project Name",
                controller: projectNameController,
              ),
              SizedBox(height: context.getHeight() * .01),
              AuthTextField(
                isPassword: false,
                content: "Description",
                controller: projectDescriptionController,
              ),
              SizedBox(height: context.getHeight() * .01),
              DropdownButton<String>(
                hint: const Text("Select Your Degree"),
                value: selectedProcess,
                padding: const EdgeInsets.only(left: 16),
                items: process.map<DropdownMenuItem<String>>((menuItem) {
                  return DropdownMenuItem<String>(
                    value: menuItem,
                    child: Text(
                      menuItem,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedProcess = value!;
                  setState(() {});
                },
              ),
              SizedBox(height: context.getHeight() * .04),
              AuthButton(
                  content: "ADD",
                  color: Colors.grey[300]!,
                  onPressedFunc: () {
                    if (projectNameController.text.isNotEmpty &&
                        projectDescriptionController.text.isNotEmpty) {
                      addProjects(
                              name: projectNameController.text,
                              description: projectDescriptionController.text,
                              state: selectedProcess)
                          .then((value) async {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Project has been added")));
                        await updateMethod?.call();
                        projectNameController.clear();
                        projectDescriptionController.clear();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                              bottom: (context.getHeight() * .5)),
                          content: const Text("Please don't fill all fields")));
                    }
                  },
                  isDisabled: false),
              SizedBox(height: context.getHeight() * .01),
            ],
          ),
        ),
      );
    },
  );
}
