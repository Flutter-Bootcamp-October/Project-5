// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/education_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({super.key});

  @override
  State<AddEducation> createState() => _AddEducationState();
}

const List<String> _level = <String>[
  'school',
  'diploma',
  'Bachelors',
  'Master',
  'Ph.D',
  'other'
];

class _AddEducationState extends State<AddEducation> {
  String dropdownValue = _level.first;
  TextEditingController dateGraduationController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.pink, Colors.lightBlue])),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBarMethod(title: "Add Social"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                  text: 'Graduation date',
                  obscure: false,
                  controller: dateGraduationController),
              TextFieldWidget(
                  text: 'university',
                  obscure: false,
                  controller: universityController),
              TextFieldWidget(
                  text: 'college',
                  obscure: false,
                  controller: collegeController),
              TextFieldWidget(
                  text: 'mejor',
                  obscure: false,
                  controller: specializationController),
              DropdownMenu<String>(
                width: MediaQuery.of(context).size.width * 0.9,
                inputDecorationTheme: const InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(25),
                            right: Radius.circular(25)))),
                initialSelection: _level.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    _level.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry(value: value, label: value);
                }).toList(),
              ),
              ButtonWidget(
                  onPressed: () async {
                    try {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      final token = prefs.getString('token');
                      final Response resp = await network
                          .addEducationMethod(token: token!, body: {
                        "graduation_date": dateGraduationController.text,
                        "university": universityController.text,
                        "college": collegeController.text,
                        "specialization": specializationController.text,
                        "level": dropdownValue
                      });

                      if (resp.statusCode == 200) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const EducationScreen()),
                            (Route<dynamic> route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text((await jsonDecode(resp.body))["msg"]
                                .toString())));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  text: 'Add')
            ],
          ),
        ),
      ),
    );
  }
}
