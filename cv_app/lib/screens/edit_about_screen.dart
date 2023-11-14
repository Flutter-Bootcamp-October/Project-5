import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/models/about_model.dart';
import 'package:cv_app/services/about.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class EditAboutScreen extends StatefulWidget {
  const EditAboutScreen({super.key, required this.about});
  final About about;

  @override
  State<EditAboutScreen> createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends State<EditAboutScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
            TextEditingController(text: widget.about.name),
        titlePosisionController =
            TextEditingController(text: widget.about.titlePosition),
        phoneController = TextEditingController(text: widget.about.phone),
        locationController = TextEditingController(text: widget.about.location),
        birthdayController = TextEditingController(text: widget.about.birthday),
        aboutController = TextEditingController(text: widget.about.about);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ClipOval(
                        child: Container(
                          width: 40,
                          height: 40,
                          color: midColor,
                          child: const Icon(Icons.arrow_back_rounded,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                    const Text("Edit about"),
                  ],
                ),
              ),
              AppTextField(
                  label: "Name",
                  icon: Icons.dynamic_feed_rounded,
                  controller: nameController),
              AppTextField(
                  label: "Title Position",
                  icon: Icons.workspace_premium_rounded,
                  controller: titlePosisionController),
              AppTextField(
                  label: "Phone",
                  icon: Icons.phone_in_talk_rounded,
                  controller: phoneController),
              AppTextField(
                  label: "Location",
                  icon: Icons.location_on_rounded,
                  controller: locationController),
              AppTextField(
                  label: "Birthday",
                  icon: Icons.cake,
                  controller: birthdayController),
              AppTextField(
                  label: "About",
                  icon: Icons.history_edu_sharp,
                  controller: aboutController),
              const SizedBox(height: 88),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppBotton(
                    text: "Edit",
                    onTap: () async {
                      final response = await editAbout(
                          name: nameController.text,
                          titlePosition: titlePosisionController.text,
                          phone: phoneController.text,
                          location: locationController.text,
                          birthday: birthdayController.text,
                          about: aboutController.text);
                      if (response['codeState'] == 200) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response['msg'].toString())),
                        );
                      }
                    }),
              ),
              const SizedBox(height: 80)
            ],
          ),
        ),
      ),
    );
  }
}
