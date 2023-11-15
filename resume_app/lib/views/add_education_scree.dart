import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/education_model.dart';
import 'package:resume_app/services/education_services.dart';
import 'package:resume_app/views/navigation_bar.dart';
import 'package:resume_app/views/signin_screen.dart';

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
  String level = "school";

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
                      level = "school";
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
                      level = "diploma";
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
                      level = "Bachelors";
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
                      level = "Master";
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
                      level = "Ph.D";
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
                    if (speController.text.isNotEmpty &&
                        collegeController.text.isNotEmpty &&
                        uniController.text.isNotEmpty &&
                        dateController.text.isNotEmpty) {
                      print("in Here");
                      newEdu = Education(
                          graduationDate: dateController.text,
                          university: uniController.text,
                          college: collegeController.text,
                          specialization: speController.text,
                          level: level);
                      try {
                        await EducationServ()
                            .addEducation(token: getToken(), edu: newEdu);
                        userEducation = await EducationServ()
                            .getEducation(token: getToken());
                      } on FormatException catch (error) {
                        if (error.message.toString().contains("token") ||
                            error.message.toString().contains("Token")) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                              ModalRoute.withName("/screen"));
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.message.toString())));
                      }
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigationScreen()),
                          ModalRoute.withName("/screen"));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("please fill out all required feilds"
                              .toString())));
                    }
                  })
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
