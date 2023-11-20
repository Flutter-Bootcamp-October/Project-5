import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/services/education.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({super.key});

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

int selectedValue = 1;
List opt = ["school", "diploma", "Bachelors", "Master", "PH.D", "other"];

class _AddEducationScreenState extends State<AddEducationScreen> {
  TextEditingController graduationDateController = TextEditingController(),
      universityController = TextEditingController(),
      collegeController = TextEditingController(),
      specializationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Add Education"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AppTextField(
              label: "graduation_date",
              icon: Icons.date_range_outlined,
              controller: graduationDateController),
          AppTextField(
              label: "univercity",
              icon: Icons.school_rounded,
              controller: universityController),
          AppTextField(
              label: "college",
              icon: Icons.school_outlined,
              controller: collegeController),
          AppTextField(
              label: "specialization",
              icon: Icons.workspace_premium_rounded,
              controller: specializationController),
          DropdownMenu(
              onSelected: (value) {
                selectedValue = value!;
              },
              width: MediaQuery.of(context).size.width / 1.3,
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 0, label: "School"),
                DropdownMenuEntry(value: 1, label: "Diploma"),
                DropdownMenuEntry(value: 2, label: "Bachelors"),
                DropdownMenuEntry(value: 3, label: "Master"),
                DropdownMenuEntry(value: 4, label: "Ph.D"),
                DropdownMenuEntry(value: 5, label: "other"),
              ]),
          const SizedBox(height: 20),
          AppBotton(
            text: "Add",
            onTap: () async {
              final response = await addEducation(
                  graduationDate: graduationDateController.text,
                  university: universityController.text,
                  college: collegeController.text,
                  specialization: specializationController.text,
                  level: opt[selectedValue]);
              if (response['codeState'] == 200) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(response['msg'].toString())),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
