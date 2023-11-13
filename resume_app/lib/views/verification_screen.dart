import 'package:flutter/material.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/services/authorization.dart';
import 'package:resume_app/views/profile_screen.dart';
import 'package:resume_app/views/signin_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen(
      {super.key, required this.email, required this.type});

  final String email;
  final String type;

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
                      print("Reg res is $res");
                      prefs.setString("tokenReg", res);
                    } else {
                      res = await network.verifiyUserLogin(body: {
                        "otp": controllerOTP.text,
                        "email": widget.email,
                        "type": widget.type
                      }, token: await getToken());
                      print("login res is $res");
                      prefs.setString("token", res);
                    }
                    if (widget.type == "registration") {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                          ModalRoute.withName("/screen"));
                    } else if (widget.type == "login") {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()),
                          ModalRoute.withName("/screen"));
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
              child: const Text("enter"))
        ]));
  }

  Future<String> getToken() async {
    return prefs.getString("tokenReg") ?? "";
  }
}
