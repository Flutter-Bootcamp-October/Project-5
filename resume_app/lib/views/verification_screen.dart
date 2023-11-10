import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resume_app/services/api_services.dart';
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
  TextEditingController? controllerOTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text(widget.email),
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
                final network = ApiServices();
                final http.Response res;
                if (widget.type == "registration") {
                  res = await network.verifiyRegistration(body: {
                    "otp": controllerOTP?.text,
                    "email": widget.email,
                    "type": widget.type
                  });
                } else {
                  res = await network.verifiyUserLogin(body: {
                    "otp": controllerOTP?.text,
                    "email": widget.email,
                    "type": widget.type
                  }, token: widget.token);
                }

                if (res.statusCode == 200) {
                  final String token = json.decode(res.body)["data"]["token"];
                  if (widget.type == "registration") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen(token: token)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen(token: token)));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          (await json.decode(res.body))["msg"].toString())));
                }
              },
              child: const Text("check"))
        ]));
  }
}
