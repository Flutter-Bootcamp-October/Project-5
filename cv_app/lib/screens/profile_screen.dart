import 'dart:io';

import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/main.dart';
import 'package:cv_app/screens/edit_about_screen.dart';
import 'package:cv_app/screens/login_screen.dart';
import 'package:cv_app/services/about.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: showAbout(),
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            if (snapshot.data!.id == null) {
              prefs.remove("token");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        uploadeImg(File(image!.path));
                      },
                      child: ClipOval(
                        child: Center(
                          child: snapshot.data!.image == null
                              ? Image.asset("assets\\defualt_img.png", scale: 5)
                              : Image.network(snapshot.data!.image.toString()),
                        ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("About Me",
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 88),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditAboutScreen(
                                  about: snapshot.data!,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit_location_sharp,
                            color: mainColor,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              deleteAccount();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                  (route) => false);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ))
                      ],
                    ),
                    const Divider(),
                    AboutMeRow(
                      icon: Icons.adjust_sharp,
                      title: "User Id",
                      value: snapshot.data!.id.toString(),
                    ),
                    const Divider(),
                    AboutMeRow(
                      icon: Icons.dynamic_feed_rounded,
                      title: "User name",
                      value: snapshot.data!.name.toString(),
                    ),
                    const Divider(),
                    AboutMeRow(
                      icon: Icons.workspace_premium_rounded,
                      title: "Title Posision",
                      value: snapshot.data!.titlePosition.toString(),
                    ),
                    const Divider(),
                    AboutMeRow(
                      icon: Icons.phone_in_talk_rounded,
                      title: "Phone No",
                      value: snapshot.data!.phone.toString(),
                    ),
                    const Divider(),
                    AboutMeRow(
                      icon: Icons.location_on_rounded,
                      title: "Location",
                      value: snapshot.data!.location.toString(),
                    ),
                    const Divider(),
                    AboutMeRow(
                      icon: Icons.cake,
                      title: "Birthday",
                      value: snapshot.data!.birthday.toString(),
                    ),
                    const Divider(),
                    AboutMeRow(
                      icon: Icons.history_edu_sharp,
                      title: "About",
                      value: snapshot.data!.about.toString(),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        prefs.remove("token");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.login_rounded, color: Colors.redAccent),
                          Text(" Logout",
                              style: TextStyle(color: Colors.redAccent))
                        ],
                      ),
                    ),
                  ]),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(color: mainColor));
          }
        }),
      ),
    );
  }
}

class AboutMeRow extends StatelessWidget {
  const AboutMeRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: mainColor),
        Text(value == "null" ? " $title:" : " $title:   $value"),
      ],
    );
  }
}
