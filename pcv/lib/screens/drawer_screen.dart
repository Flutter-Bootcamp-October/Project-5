// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/edit_about.dart';
import 'package:pcv/screens/education_screen.dart';
import 'package:pcv/screens/project.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/sign_in_screen.dart';
import 'package:pcv/screens/skill_screen.dart';
import 'package:pcv/screens/social_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class DrawerScreens extends StatefulWidget {
  const DrawerScreens({
    super.key,
  });

  @override
  State<DrawerScreens> createState() => _DrawerScreensState();
}

class _DrawerScreensState extends State<DrawerScreens> {
  Map about = {};
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  @override
  void initState() {
    super.initState();
    _loadingAbout();
  }

  _loadingAbout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.aboutMethod(
      token: token!,
    );
    if (res.statusCode == 200) {
      about = (await jsonDecode(res.body))["data"];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                Text('Services'),
                if (about.isNotEmpty)
                  ClipOval(
                      child: Container(
                          height: 120,
                          width: 120,
                          child: Image.network(about["image"])))
              ],
            ),
          ),
          ListTile(
            title: const Text('Home'),
            trailing: Icon(Icons.home_outlined),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditAboutScreen(),
                  ));
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: const Text('Update information'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditAboutScreen(),
                  ));
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: const Text('projects'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProjectScreen(),
                  ));
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: const Text('Skills'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SkillScreen(),
                  ));
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: const Text('Social'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SocialScreen(),
                  ));
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: const Text('Education'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EducationScreen(),
                  ));
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
          const Spacer(),
          ListTile(
            title: const Text(
              'Delete Account',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are You Sure Delete Account?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("back"),
                    ),
                    TextButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final token = prefs.getString('token');
                        network.deleteAccountMethod(token: token!);
                      },
                      child: const Text("DELETE"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Log out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are You Sure Log out?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Back"),
                    ),
                    TextButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('token', '');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                            (route) => false);
                      },
                      child: const Text("Log out"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
