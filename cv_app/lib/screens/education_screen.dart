import 'package:cv_app/model/education_model.dart';
import 'package:cv_app/screens/skils_screen.dart';
import 'package:cv_app/services/post.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  TextEditingController gcontroller = TextEditingController();
  TextEditingController ucontroller = TextEditingController();
  TextEditingController ccontroller = TextEditingController();
  TextEditingController scontroller = TextEditingController();
  TextEditingController radioController = TextEditingController();
  final network = PostAdd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  ListTile(
                    title: Text('graduation_date'),
                    subtitle: TextFormField(
                      controller: gcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('university'),
                    subtitle: TextFormField(
                      controller: ucontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('college'),
                    subtitle: TextFormField(
                      controller: ccontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('specialization'),
                    subtitle: TextFormField(
                      controller: scontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      RadioListTile(
                        title: Text("school"),
                        value: "school",
                        groupValue: radioController.text,
                        onChanged: (value) {
                          setState(() {
                            radioController.text = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("diploma"),
                        value: "diploma",
                        groupValue: radioController.text,
                        onChanged: (value) {
                          setState(() {
                            radioController.text = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Bachelors"),
                        value: "Bachelors",
                        groupValue: radioController.text,
                        onChanged: (value) {
                          setState(() {
                            radioController.text = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Master"),
                        value: "Master",
                        groupValue: radioController.text,
                        onChanged: (value) {
                          setState(() {
                            radioController.text = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Ph.D"),
                        value: "Ph.D",
                        groupValue: radioController.text,
                        onChanged: (value) {
                          setState(() {
                            radioController.text = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Other"),
                        value: "other",
                        groupValue: radioController.text,
                        onChanged: (value) {
                          setState(() {
                            radioController.text = value.toString();
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            CustomBottom(
              color: orang,
              border: orang,
              text: "Continue",
              ontap: () async {
                try {
                  final response = await PostAdd().addEducation({
                    "graduation_date": gcontroller.text,
                    "university": ucontroller.text,
                    "college": ccontroller.text,
                    "specialization": scontroller.text,
                    "level": radioController.text,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Saved Successfully")));
                } on FormatException catch (error) {
                  print("-----");
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.message.toString())));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
