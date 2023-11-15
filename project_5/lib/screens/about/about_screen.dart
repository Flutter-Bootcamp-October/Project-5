import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/screens/about/component/delete_button.dart';
import 'package:project_5/screens/auth/register_screen.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/components/input_text_fields.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final apimethod = ApiMethods();

  TextEditingController userController = TextEditingController(),
      titleController = TextEditingController(),
      locationController = TextEditingController(),
      birthdayController = TextEditingController(),
      aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          actions: [
            // add edit about api method here to edit
            InkWell(
              onTap: () async {
                await apimethod.editAbout(body: {
                  "name": userController.text,
                  "title_position": titleController.text,
                  "phone": phoneController.text,
                  "location": locationController.text,
                  "birthday": birthdayController.text,
                  "about": aboutController,
                });
              },
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputTextFields(
              lines: 1,
              controller: userController,
              title: 'name',
            ),
            InputTextFields(
              lines: 1,
              controller: titleController,
              title: 'title position',
            ),
            InputTextFields(
              lines: 1,
              controller: phoneController,
              title: 'phone',
            ),
            InputTextFields(
              lines: 1,
              controller: locationController,
              title: 'location',
            ),
            InputTextFields(
              lines: 1,
              controller: birthdayController,
              title: 'birthday',
            ),
            InputTextFields(
              lines: 1,
              controller: aboutController,
              title: 'about',
            ),
            SizedBox(
              height: 10,
            ),
            DeleteButtonWidget(
                textEntry: "Delete Account",
                onpress: () async {
                  // await apimethod.deleteAccount( aboutId: ),
                }),
            SizedBox(
              height: 8,
            ),
            ButtonWidget(
                textEntry: "Upload image",
                onpress: () async {
                  await apimethod.uploadImage(body: {});
                }),
          ],
        ));
  }
}
