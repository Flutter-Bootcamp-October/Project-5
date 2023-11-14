import 'package:cv_app_project/components/appBar/appBar.dart';
import 'package:cv_app_project/components/general/app_button.dart';
import 'package:cv_app_project/components/general/textfield_with_label.dart';
import 'package:flutter/material.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({super.key});

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  TextEditingController universityController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController graduationDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Add Education', () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(width: double.infinity),
              TextFieldWithLabel(
                  label: 'University',
                  hint: 'Enter your university',
                  controller: universityController,
                  isPass: false),
              TextFieldWithLabel(
                  label: 'College',
                  hint: 'Enter your college',
                  controller: collegeController,
                  isPass: false),
              TextFieldWithLabel(
                  label: 'Specialization',
                  hint: 'Enter your specialization',
                  controller: specializationController,
                  isPass: false),
              TextFieldWithLabel(
                  label: 'Level',
                  hint: 'Enter your level',
                  controller: levelController,
                  isPass: false),
              TextFieldWithLabel(
                  label: 'Graduation date',
                  hint: 'Enter your graduation date as, ex: 2023/6/2',
                  controller: graduationDateController,
                  isPass: false),
              AppButton(
                text: 'Add',
                onTap: () async {},
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
