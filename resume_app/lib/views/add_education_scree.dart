import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/education_model.dart';
import 'package:resume_app/services/education_services.dart';
import 'package:resume_app/views/education_screen.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({super.key});

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  late Education newEdu;
  TextEditingController dateController = TextEditingController();
  TextEditingController uniController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController speController = TextEditingController();
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: appBlue, title: const Text("Add Education")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                decoration:
                    returnDec(hint: "1978-12-20", labelText: "Graduation Date"),
                controller: dateController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration:
                    returnDec(hint: "University name", labelText: "University"),
                controller: uniController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration:
                    returnDec(hint: "College name", labelText: "College"),
                controller: collegeController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: returnDec(
                    hint: "Computer Science", labelText: "specialization"),
                controller: speController,
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('school'),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('diploma'),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('Bachelors'),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('Master'),
                leading: Radio(
                  value: 4,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('Ph.D'),
                leading: Radio(
                  value: 5,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('other'),
                leading: Radio(
                  value: 6,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
              ElevatedButton(
                child: const Text("add"),
                onPressed: () async {
                  print("in Here");
                  if (speController.text.isNotEmpty &&
                      (collegeController.text.isNotEmpty ||
                          uniController.text.isNotEmpty)) {
                            print("in Here");
                    if (dateController.text.isEmpty ||
                        (dateController.text.isNotEmpty &&
                            dateFormat.hasMatch(dateController.text))) {
                              print("in Here");
                      newEdu = Education(
                          graduationDate: "graduationDate",
                          university: "university",
                          college: "college",
                          specialization: "specialization",
                          level: "level");
                      userEducation.add(newEdu);
                      await EducationServ()
                          .addEducation(token: getToken(), edu: newEdu);
                      context
                          .findAncestorStateOfType<EducationScreenState>()!
                          .setState(() {});
                      Navigator.of(context).pop();
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
