import 'package:cv_app_project/components/appBar/appBar.dart';
import 'package:cv_app_project/components/general/about_text_field.dart';
import 'package:cv_app_project/components/general/app_button.dart';
import 'package:cv_app_project/components/general/textfield_with_label.dart';
import 'package:flutter/material.dart';

class EditAboutScreen extends StatefulWidget {
  const EditAboutScreen({super.key});

  @override
  State<EditAboutScreen> createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends State<EditAboutScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: 'Anas');
    TextEditingController phoneController =
        TextEditingController(text: '0523456789');
    TextEditingController locationController =
        TextEditingController(text: 'Dammam');
    TextEditingController positionController =
        TextEditingController(text: 'No thing');
    TextEditingController bdController =
        TextEditingController(text: '1999/10/13');
    TextEditingController aboutController =
        TextEditingController(text: 'I\'m a flutter front-end developer');
    return Scaffold(
      appBar: getAppBar('About', () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(width: double.infinity),
              SizedBox(height: 40),
              TextFieldWithLabel(
                  label: 'Name',
                  hint: 'Enter your name',
                  controller: nameController,
                  isPass: false),
              TextFieldWithLabel(
                  label: 'Phone',
                  hint: 'Enter your phone',
                  controller: phoneController,
                  isPass: false),
              TextFieldWithLabel(
                  label: 'City',
                  hint: 'Enter your city',
                  controller: locationController,
                  isPass: false),
              TextFieldWithLabel(
                  label: 'Position',
                  hint: 'Enter your position',
                  controller: positionController,
                  isPass: false),
              TextFieldWithLabel(
                  label: 'Birth Date',
                  hint: 'Enter your birth date as, ex: 1999/10/2',
                  controller: bdController,
                  isPass: false),
              AboutTextFieldWithLabel(
                label: 'About',
                hint: 'Describe yourself',
                controller: aboutController,
              ),
              SizedBox(height: 32),
              AppButton(
                text: 'Save',
                onTap: () {},
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
