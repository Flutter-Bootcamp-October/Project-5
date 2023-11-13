// ignore_for_file: use_build_context_synchronously

import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:cv/services/user/delete_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.remove("token");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ),
                  (route) => false);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                ),
                Text("logout"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {},
            child: const Row(
              children: [
                Icon(
                  Icons.password,
                  color: Colors.black,
                ),
                Text("Reset Password"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              deleteUser(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SigninScreen(),
                ),
                (route) => false,
              );
            },
            child: const Row(
              children: [
                Icon(
                  Icons.delete_forever,
                  color: Colors.black,
                ),
                Text("Delete account"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
