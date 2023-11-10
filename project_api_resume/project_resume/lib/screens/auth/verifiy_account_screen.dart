import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_resume/networking/api_service.dart';
import 'package:project_resume/screens/auth/login_screen.dart';

class verifiyAccountScreen extends StatelessWidget {
  verifiyAccountScreen({super.key, required this.email, required this.type});
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
                  if (conOTP.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(('Please enter the OTP'))));
                  }

                  final res = await verificationMethod(
                      body: {"otp": conOTP.text, "email": email, "type": type});

                  if (res.statusCode == 200) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            (await json.decode(res.body))["msg"].toString())));
                  }
                },
                child: const Text('verification'))
          ],
        ),
      ),
    );
  }
}
  // onPressed: () async {
  //               final network = ConsentNetworking();
                // final http.Response res = await network.verificationLoginMethod(
                //     body: {
                //       "otp": controllerOTP?.text,
                //       "email": widget.email,
                //       "type": widget.type
                //     });

                // if (res.statusCode == 200) {
                //   final String token = json.decode(res.body)["data"]["token"];
                //   print(token);
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const HomeScreen()));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //       content: Text(
                //           (await json.decode(res.body))["msg"].toString())));
                // }
  //             },