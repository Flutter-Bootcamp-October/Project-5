// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cv/services/education/add_education.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:icons_plus/icons_plus.dart';

class EducationsScreen extends StatefulWidget {
  const EducationsScreen({super.key});

  @override
  State<EducationsScreen> createState() => _EducationsScreenState();
}

class _EducationsScreenState extends State<EducationsScreen> {
  TextEditingController graduationDateController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  String level = "school";
  final status = ["school", "diploma", "Bachelors", "Master", "Ph.D", "Other"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Add New Education",
                        style: TextStyle(
                            fontSize: 25,
                            color: blue,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: AddTextField(
                          label: 'University',
                          hint: 'Enter your university',
                          isPassword: false,
                          controller: universityController,
                          icon: HeroIcons.building_library,
                        ),
                      ),
                      hight30(),
                      AddTextField(
                        label: 'College',
                        hint: 'Enter your college',
                        isPassword: false,
                        controller: collegeController,
                        icon: HeroIcons.academic_cap,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Specialization',
                        hint: 'Enter your specialization',
                        isPassword: false,
                        controller: specializationController,
                        icon: Icons.settings,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Graduation Date',
                        hint: 'Enter graduation date',
                        isPassword: false,
                        controller: graduationDateController,
                        icon: Icons.calendar_month_sharp,
                      ),
                      hight30(),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Choose eduaction level:",
                    style: TextStyle(fontSize: 16, color: blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Column(
                    children: <Widget>[
                      RadioGroup<String>.builder(
                        groupValue: level,
                        onChanged: (value) => setState(() {
                          level = value ?? '';
                        }),
                        items: status,
                        itemBuilder: (item) => RadioButtonBuilder(
                          item,
                        ),
                        fillColor: lightOrange,
                      ),
                    ],
                  ),
                ),
                hight20(),
                Center(
                  child: InkWell(
                    onTap: () async {
                      try {
                        if (graduationDateController.text.isNotEmpty &&
                            collegeController.text.isNotEmpty &&
                            specializationController.text.isNotEmpty &&
                            universityController.text.isNotEmpty) {
                          final response = await addEducation(context, {
                            "graduation_date": graduationDateController.text,
                            "university": universityController.text,
                            "specialization": specializationController.text,
                            "level": level,
                            "college": collegeController.text
                          });
                          if (response != null) {
                            if (response.statusCode >= 200 &&
                                response.statusCode < 300) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Education is added successfully")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          jsonDecode(response.body)["msg"])));
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Please enter all information")));
                        }
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())));
                      }
                    },
                    child: Container(
                      width: 330,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: pink),
                      child: const Center(
                        child: Text(
                          "Add Education",
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
          ],
        ),
      ),
    );
  }
}
