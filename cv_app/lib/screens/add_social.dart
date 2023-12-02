import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/services/social.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class AddSocial extends StatefulWidget {
  const AddSocial({super.key});

  @override
  State<AddSocial> createState() => _AddSocialState();
}

class _AddSocialState extends State<AddSocial> {
  @override
  Widget build(BuildContext context) {
    TextEditingController socialController = TextEditingController(),
        usernameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Add Social"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AppTextField(
              label: "social",
              icon: Icons.connect_without_contact,
              controller: socialController),
          AppTextField(
              label: "username",
              icon: Icons.dynamic_feed,
              controller: usernameController),
          AppBotton(
            text: "Add",
            onTap: () async {
              final response = await addSocial(
                  username: usernameController.text,
                  social: socialController.text);
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
