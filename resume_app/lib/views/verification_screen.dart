import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resume_app/main.dart';
import 'package:resume_app/services/authorization.dart';
import 'package:resume_app/views/profile.dart';
import 'package:resume_app/views/signin_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen(
      {super.key,
      required this.email,
      required this.type,
      required this.token});

  final String email;
  final String type;
  final String token;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController controllerOTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text(" Enter code sent to ${widget.email}"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controllerOTP,
              decoration: const InputDecoration(
                hintText: "otp",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                final network = Authorization();
                final String res;
                if (controllerOTP.text.isNotEmpty) {
                  try {
                    if (widget.type == "registration") {
                      res = await network.verifiyRegistration(body: {
                        "otp": controllerOTP.text,
                        "email": widget.email,
                        "type": widget.type
                      });
                      //else if (widget.type == "login")
                    } else {
                      res = await network.verifiyUserLogin(body: {
                        "otp": controllerOTP.text,
                        "email": widget.email,
                        "type": widget.type
                      }, token: widget.token);
                    }
                    print("this is res : $res");
                    prefs.setString("token", res);
                    if (widget.type == "registration") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen(token: res)));
                    } else if (widget.type == "login") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(token: res)));
                    }
                  } on FormatException catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.message.toString())));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please insert code")));
                }
              },
              child: const Text("check"))
        ]));
  }
}
