import 'package:flutter/material.dart';
import 'package:resume_app/consts/buttons.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/about_model.dart';
import 'package:resume_app/services/about_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/widgets/upper_display.dart';

class UserDisplay extends StatefulWidget {
  const UserDisplay({
    super.key,
  });

  @override
  State<UserDisplay> createState() => UserDisplayState();
}

class UserDisplayState extends State<UserDisplay> {
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
      TextEditingController(text: userAbout.about ?? "");

  @override
  Widget build(BuildContext context) {
    print(userProjects.length.toString());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const UpperDisplay(),
          bottom: tabBar,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appBlue,
          onPressed: () {},
          child: const Icon(Icons.picture_as_pdf_sharp),
        ),
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: [
                  const SizedBox(height: 15),
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
                          await AboutServ().editAbout(
                              token: getToken(), aboutObject: userAbout);
                        } on FormatException catch (error) {
                          if (error.message.toString().contains("token") ||
                              error.message.toString().contains("Token")) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()),
                                ModalRoute.withName("/screen"));
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(error.message.toString())));
                        }
                      },
                      child: const Text("Update Info"))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Skills",
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              userProjects.length,
                              (index) => Container(
                                      child: Column(children: [
                                    Text(
                                      userProjects[index].name,
                                      style:
                                          const TextStyle(color: Colors.amber),
                                    ),
                                    Text(
                                      userProjects[index].description,
                                      style:
                                          const TextStyle(color: Colors.amber),
                                    ),
                                    Text(
                                      userProjects[index].state,
                                      style:
                                          const TextStyle(color: Colors.amber),
                                    ),
                                  ])))),
                    ),
                    const Text(
                      "Education",
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                    const Text(
                      "Projects",
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
