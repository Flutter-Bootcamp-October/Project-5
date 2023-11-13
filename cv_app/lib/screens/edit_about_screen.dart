import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class EditAboutScreen extends StatelessWidget {
  const EditAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
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
                label: "Name", icon: Icons.abc, controller: nameController),
            AppTextField(
                label: "Title Position",
                icon: Icons.abc,
                controller: nameController),
            AppTextField(
                label: "Phone", icon: Icons.abc, controller: nameController),
            AppTextField(
                label: "Location", icon: Icons.abc, controller: nameController),
            AppTextField(
                label: "Birthday", icon: Icons.abc, controller: nameController),
            AppTextField(
                label: "About", icon: Icons.abc, controller: nameController),
            const Spacer(),
            AppBotton(text: "Edit", onTap: () {}),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
