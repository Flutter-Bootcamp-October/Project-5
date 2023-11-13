import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_text_field.dart';
import 'package:project_5/services/education_api.dart';

Future<dynamic> educationModalBottomSheet(
  BuildContext context, {
  required TextEditingController gradDateController,
  required TextEditingController universityController,
  required TextEditingController collegeController,
  required TextEditingController specializationController,
  required String content,
  required bool isSkills,
  required Function? updateMethod,
}) {
  final List<String> level = [
    // "Diploma",
    // "Associate",
    // "Bachelor's",
    // "Master's",
    // "Post-Master's"
    //     "Doctorate",
    // "First Professional",
    "school",
    "diploma",
    "Bachelors",
    "Master",
    "Ph.D",
    "other",
  ];
  String selectedLevel = "school";
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
              !isSkills
                  ? const ListTile(
                      title: Text("Current"),
                      subtitle: Text("User Name"),
                    )
                  : const SizedBox(),
              SizedBox(height: context.getHeight() * .02),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "New $content",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: context.getHeight() * .01),
              DropdownButton<String>(
                hint: const Text("Select Your Degree"),
                value: selectedLevel,
                padding: const EdgeInsets.only(left: 16),
                items: level.map<DropdownMenuItem<String>>((menuItem) {
                  return DropdownMenuItem<String>(
                    value: menuItem,
                    child: Text(
                      menuItem,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedLevel = value!;
                  setState(() {});
                },
              ),
              AuthTextField(
                isPassword: false,
                content: "University",
                controller: universityController,
              ),
              SizedBox(height: context.getHeight() * .01),
              AuthTextField(
                isPassword: false,
                content: "College",
                controller: collegeController,
              ),
              SizedBox(height: context.getHeight() * .01),
              AuthTextField(
                isPassword: false,
                content: "Specialization",
                controller: specializationController,
              ),
              SizedBox(height: context.getHeight() * .01),
              AuthTextField(
                isPassword: false,
                content: "Graduation Date",
                controller: gradDateController,
                onlyRead: true,
                onTapFunc: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(1800),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      gradDateController.text =
                          "${value.year.toString()}/${value.month.toString()}/${value.day.toString()}";
                    }
                  });
                },
              ),
              SizedBox(height: context.getHeight() * .04),
              AuthButton(
                  content: "ADD",
                  color: Colors.grey[300]!,
                  onPressedFunc: () {
                    if (gradDateController.text.isNotEmpty &&
                        collegeController.text.isNotEmpty &&
                        universityController.text.isNotEmpty &&
                        specializationController.text.isNotEmpty) {
                      addEducation(
                              level: selectedLevel,
                              specialization: specializationController.text,
                              college: collegeController.text,
                              university: universityController.text,
                              gradDate: gradDateController.text)
                          .then((value) async {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Education has been added")));

                        await updateMethod?.call();
                        specializationController.clear();
                        collegeController.clear();
                        universityController.clear();
                        gradDateController.clear();
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
