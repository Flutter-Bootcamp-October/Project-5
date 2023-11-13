import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_text_field.dart';
import 'package:project_5/services/social_api.dart';

Future<dynamic> socialModalBottomSheet(
  BuildContext context, {
  required TextEditingController userNameController,
  required String content,
  required bool isSkills,
  required Function? updateMethod,
}) {
  final List<String> socials = [
    'facebook',
    'youtube',
    'whatsapp',
    'instagram',
    'twitter',
    'tiktok',
    'telegram',
    'snapchat',
    'other'
  ];
  String selectedSocial = "facebook";
  return showModalBottomSheet(
    showDragHandle: true,
    isDismissible: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !isSkills
                  ? const ListTile(
                      title: Text("Current"),
                      subtitle: Text("User Name"),
                    )
                  : const SizedBox(),
              SizedBox(height: context.getHeight() * .02),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "New $content",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: context.getHeight() * .01),
              DropdownButton<String>(
                hint: const Text("Select Your Degree"),
                value: selectedSocial,
                padding: const EdgeInsets.only(left: 16),
                items: socials.map<DropdownMenuItem<String>>((menuItem) {
                  return DropdownMenuItem<String>(
                    value: menuItem,
                    child: Text(
                      menuItem,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedSocial = value!;
                  setState(() {});
                },
              ),
              AuthTextField(
                isPassword: false,
                content: "User Name",
                controller: userNameController,
              ),
              SizedBox(height: context.getHeight() * .01),
              SizedBox(height: context.getHeight() * .04),
              AuthButton(
                  content: "ADD",
                  color: Colors.grey[300]!,
                  onPressedFunc: () {
                    if (userNameController.text.isNotEmpty) {
                      addSocial(
                        userName: userNameController.text,
                        social: selectedSocial,
                      ).then((value) async {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Social has been added")));

                        await updateMethod?.call();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                              bottom: (context.getHeight() * .5)),
                          content: const Text("Please don't fill all fields")));
                    }
                  },
                  isDisabled: false),
              SizedBox(height: context.getHeight() * .01),
            ],
          ),
        ),
      );
    },
  );
}
