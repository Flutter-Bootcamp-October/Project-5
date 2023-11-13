// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cv/models/user.dart';
import 'package:cv/services/user/edit_user.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, required this.user});
  final User user;
  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController nameController;
  late TextEditingController titleController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController birthController;
  late TextEditingController aboutController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    titleController =
        TextEditingController(text: widget.user.titlePosition ?? "");
    phoneController = TextEditingController(text: widget.user.phone);
    locationController =
        TextEditingController(text: widget.user.location ?? "");
    birthController = TextEditingController(text: widget.user.birthday ?? "");
    aboutController = TextEditingController(text: widget.user.about ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hight40(),
                hight14(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Edit your Information",
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
                          label: 'Name',
                          hint: 'Enter your name',
                          isPassword: false,
                          controller: nameController,
                          icon: Icons.text_decrease,
                        ),
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Title Position',
                        hint: 'Enter your title position',
                        isPassword: false,
                        controller: titleController,
                        icon: Icons.verified_user_rounded,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Phone',
                        hint: 'Enter your phone',
                        isPassword: false,
                        controller: phoneController,
                        icon: Icons.phone,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Location',
                        hint: 'Enter your location',
                        isPassword: false,
                        controller: locationController,
                        icon: Icons.location_on,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Birthday',
                        hint: 'Enter your birthday',
                        isPassword: false,
                        controller: birthController,
                        icon: Icons.calendar_month,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'About',
                        hint: 'Enter about your selfe ',
                        isPassword: false,
                        controller: aboutController,
                        icon: Icons.text_fields_outlined,
                      ),
                      hight30(),
                    ]),
                Center(
                  child: InkWell(
                    onTap: () async {
                      try {
                        if (aboutController.text.isNotEmpty &&
                            locationController.text.isNotEmpty &&
                            birthController.text.isNotEmpty &&
                            titleController.text.isNotEmpty &&
                            nameController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty) {
                          final response = await editUser(context, {
                            "name": nameController.text,
                            "title_position": titleController.text,
                            "phone": phoneController.text,
                            "location": locationController.text,
                            "birthday": birthController.text,
                            "about": aboutController.text
                          });
                          if (response != null) {
                            if (response.statusCode >= 200 &&
                                response.statusCode < 300) {
                              setState(() {});
                              // context
                              //     .findAncestorStateOfType<HomeScreenState>()!
                              //     .setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Your information is updated successfully")));

                              Navigator.pop(context, true);
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
                          "Update Information",
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
