import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_resume/networking/api_service.dart';
import 'package:project_resume/screens/auth/verifiy_account_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController conName = TextEditingController();
  TextEditingController conPhone = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  TextEditingController conEmail = TextEditingController();
  @override
  // bool isValidEmail = false;
  // bool isValidPhone = false;
  // bool _isValidEmail(String email) {
  //   String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  //   RegExp regex = RegExp(emailRegex);
  //   return regex.hasMatch(email);
  // }

  // bool _isValidPhone(String phoneNumber) {
  //   String phoneRegex = r'^05\d{8}$';
  //   RegExp regex = RegExp(phoneRegex);
  //   return regex.hasMatch(phoneNumber);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Registration",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: conName,
              decoration: const InputDecoration(
                label: Text("Enter your name"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: conPhone,
              decoration: const InputDecoration(
                label: Text("Enter your phone"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: conPassword,
              decoration: const InputDecoration(
                // suffixIcon: Icon(Icons.remove_red_eye_outlined),
                label: Text("Enter your password"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: conEmail,
              decoration: const InputDecoration(
                label: Text("Enter your email"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            ElevatedButton(
                //fill all textField
                onPressed: () async {
                  final res = await sendDataRegistration(body: {
                    'name': conName.text,
                    'phone': conPhone.text,
                    'email': conEmail.text,
                    'password': conPassword.text,
                  });
                  if (res.statusCode == 200) {
                    final String getEMail =
                        jsonDecode(res.body)["data"]["email"];

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => verifiyAccountScreen(
                                email: getEMail,
                                type: "registration",
                              )),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            (await jsonDecode(res.body))["msg"].toString())));
                  }
                },
                child: const Text('Registration')),
          ],
        ),
      ),
    );
  }
}
