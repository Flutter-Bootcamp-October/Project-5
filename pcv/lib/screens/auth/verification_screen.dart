// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:pcv/screens/loading_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/auth/register_screen.dart';
import 'package:pcv/screens/auth/sign_in_screen.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen(
      {super.key, required this.type, required this.email});
  final String type;
  final String email;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otbController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              autofocus: true,
              length: 6,
              onCompleted: (pin) async {
                try {
                  final Response resp = await network.verificationMethod({
                    "otp": pin.toString(),
                    "email": widget.email,
                    "type": widget.type
                  });

                  if (resp.statusCode == 200) {
                    if (widget.type == "login" ||
                        widget.type == "registration") {
                      final String token =
                          jsonDecode(resp.body)['data']['token'];
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('token', token);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoadingPage(),
                          ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            (await jsonDecode(resp.body))["msg"].toString())));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
