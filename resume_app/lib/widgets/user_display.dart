import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/services/about_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';

class UserDisplay extends StatefulWidget {
  const UserDisplay({
    super.key,
  });

  @override
  State<UserDisplay> createState() => UserDisplayState();
}

class UserDisplayState extends State<UserDisplay> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: userAbout.name);
    TextEditingController titleController =
        TextEditingController(text: userAbout.titlePosition ?? "");
    TextEditingController phoneController =
        TextEditingController(text: userAbout.phone);
    TextEditingController locationController =
        TextEditingController(text: userAbout.location ?? "");
    TextEditingController bdController =
        TextEditingController(text: userAbout.birthday ?? "");
    TextEditingController aboutController =
        TextEditingController(text: userAbout.about);
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: FittedBox(
            child: Row(children: [
              Text(
                userAbout.name!,
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
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
                      userAbout.image = await AboutServ()
                          .uploadImage(token: getToken(), image: imageFile)!;
                      setState(() {});
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
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appBlue,
          onPressed: () {},
          child: const Icon(Icons.picture_as_pdf_sharp),
        ),
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(children: [
              const SizedBox(height: 70),
              TextField(
                controller: nameController,
                maxLines: 1,
                decoration: returnDec(
                    icon: const Icon(Icons.person),
                    hint: userAbout.name!,
                    labelText: 'Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 1,
                controller: titleController,
                decoration: returnDec(
                    icon: const Icon(Icons.email_outlined),
                    hint: 'Enter Your Position Title',
                    labelText: 'Title-Position'),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 1,
                controller: phoneController,
                decoration: returnDec(
                    icon: const Icon(Icons.phone_android_outlined),
                    hint: 'Enter Your Phone Number',
                    labelText: 'Phone Number'),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 1,
                controller: locationController,
                decoration: returnDec(
                    icon: const Icon(Icons.pin_drop_outlined),
                    hint: 'Enter Your Location',
                    labelText: 'Location'),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 1,
                controller: bdController,
                decoration: returnDec(
                    icon: const Icon(Icons.date_range_outlined),
                    hint: 'Enter Your Birthday',
                    labelText: 'Birthday'),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: null,
                controller: aboutController,
                decoration: returnDec(hint: '...', labelText: 'Summary'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    userAbout.name = nameController.text;
                    userAbout.titlePosition = titleController.text;
                    userAbout.phone = phoneController.text;
                    userAbout.location = locationController.text;
                    userAbout.birthday = bdController.text;
                    userAbout.about = aboutController.text;
                    try {
                      await AboutServ()
                          .editAbout(token: getToken(), aboutObject: userAbout);
                      setState(() {});
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
                  },
                  child: const Text("Update Info")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                        ModalRoute.withName("/screen"));
                  },
                  child: const Text("Sign Out"))
            ]),
          ),
        ),
      )
    ]);
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
