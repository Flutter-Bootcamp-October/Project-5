import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/services/about_services.dart';
import 'package:resume_app/views/profile_screen.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/views/signup_screen.dart';
import 'package:resume_app/widgets/user_display.dart';

class UpperDisplay extends StatefulWidget {
  const UpperDisplay({super.key});

  @override
  State<UpperDisplay> createState() => _UpperDisplayState();
}

class _UpperDisplayState extends State<UpperDisplay> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            userAbout.name!,
            style: const TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpSreen()),
                    ModalRoute.withName("/screen"));
              },
              icon: const Icon(
                size: 40,
                Icons.exit_to_app_sharp,
                color: Colors.red,
              ))
        ]),
        const SizedBox(width: 20),
        InkWell(
          onTap: () async {
            late File imageFile;
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              try {
                imageFile = File(image.path);
                await AboutServ()
                    .uploadImage(token: getToken(), image: imageFile);

                Future.delayed(const Duration(seconds: 10), () async {
                  context
                      .findAncestorStateOfType<ProfileScreenState>()!
                      .setState(() {});
                  print("----------here i am");
                  userAbout = await AboutServ().getAbout(token: getToken());
                  setState(() {});
                });
              } on FormatException catch (error) {
                if (error.message.toString().contains("token") ||
                    error.message.toString().contains("Token")) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                      ModalRoute.withName("/screen"));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error.message.toString())));
              }
            }
          },
          child: Container(
            color: Colors.white,
            width: 170,
            height: 180,
            child: userAbout.image != null
                ? Image.network(userAbout.image!, fit: BoxFit.cover)
                : const Center(
                    child: Text(
                    "insert image",
                    style: TextStyle(color: Colors.black),
                  )),
          ),
        ),
      ]),
    );
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
