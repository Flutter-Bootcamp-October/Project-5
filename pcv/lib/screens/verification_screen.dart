// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/home_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/sign_in_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

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
            TextFieldWidget(
                text: 'OTP', obscure: false, controller: otbController),
            ButtonWidget(
                onPressed: () async {
                  try {
                    final Response resp = await network.verificationMethod({
                      "otp": otbController.text,
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
                        print(token);
                        await prefs.setString('token', token);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
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
                          content: Text((await jsonDecode(resp.body))["msg"]
                              .toString())));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                text: 'Done')
          ],
        ),
      ),
    );
  }
}
