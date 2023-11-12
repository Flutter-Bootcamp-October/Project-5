// ignore_for_file: use_build_context_synchronously

import 'package:cv/screens/signin_screen.dart';
import 'package:cv/services/user/about.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: aboutAPI(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(child: Text(snapshot.data!.email!));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            IconButton(
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
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
