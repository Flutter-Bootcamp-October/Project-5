import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_resume/home_screen.dart';
import 'package:project_resume/model/verify_model.dart';
import 'package:project_resume/networking/api_service.dart';
import 'package:project_resume/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class verifiyAccountScreen extends StatelessWidget {
  verifiyAccountScreen({
    super.key,
    required this.email,
    required this.type,
  });

  String email;
  String type;

  TextEditingController conOTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(email),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: conOTP,
              decoration: const InputDecoration(
                hintText: 'Enter OTP code',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (type == 'registration') {
                    final Map<String, dynamic> res = await verificationMethod(
                        body: {
                          "otp": conOTP.text,
                          "email": email,
                          "type": type
                        });
                    Verify resMap = Verify.fromJson(res);
                    if (resMap.codeState == 200) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text((await jsonDecode(resMap.msg.toString())))));
                    }
                  } else if (type == 'login') {
                    final Map<String, dynamic> res = await verificationMethod(
                        body: {
                          "otp": conOTP.text,
                          "email": email,
                          "type": type
                        });
                    Verify resMap = Verify.fromJson(res);

                    if (resMap.codeState == 200) {
                      final token = resMap.data!.token.toString();

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("token", token);

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }
                  }
                },
                child: const Text('verification')),
          ],
        ),
      ),
    );
  }
}
