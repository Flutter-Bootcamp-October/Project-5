// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/views/edit_about.dart';
import 'package:pcv/views/home/home_screen.dart';
import 'package:pcv/views/auth/register_screen.dart';
import 'package:pcv/views/auth/sign_in_screen.dart';
import 'package:pcv/views/user.dart';
import 'package:pcv/services/api_about.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/project/add_project.dart';

class DrawerScreens extends StatefulWidget {
  const DrawerScreens({
    super.key,
  });

  @override
  State<DrawerScreens> createState() => _DrawerScreensState();
}

class _DrawerScreensState extends State<DrawerScreens> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            title: const Text('Home'),
            trailing: const Icon(Icons.home_outlined),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
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
            onTap: () => addProject(context),
          ),
          const Divider(
            color: Colors.black45,
          ),
          // ListTile(
          //   title: const Text('Skills'),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const SkillScreen(),
          //         ));
          //   },
          // ),
          // const Divider(
          //   color: Colors.black45,
          // ),
          // ListTile(
          //   title: const Text('Social'),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const SocialScreen(),
          //         ));
          //   },
          // ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: const Text('Education'),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const EducationScreen(),
              //     ));
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: const Text('User'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserScreen(),
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
                        final Response res =
                            await netAbout.deleteAccountMethod(token: token!);
                        if (res.statusCode == 200) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                              (route) => false);
                        }
                      },
                      child: const Text(
                        "DELETE",
                        style: TextStyle(color: Colors.red),
                      ),
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
