import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_resume/networking/api_service.dart';
import 'package:project_resume/screens/auth/verifiy_account_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPassword = TextEditingController();
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
                'Login:',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: conEmail,
                decoration: const InputDecoration(
                  label: Text("Enter your Email"),
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
                  label: Text("Enter your password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
              TextButton(onPressed: () {
                
              }, child: const Text('rest password')),
              ElevatedButton(
                  onPressed: () async {
                    final res = await sendDataLogin(body: {
                      "email": conEmail.text,
                      "password": conPassword.text
                    });
                    if (res.statusCode == 200) {
                      final String getEMail =
                          json.decode(res.body)["data"]["email"];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => verifiyAccountScreen(
                                    email: getEMail,
                                    type: "login",
                                  )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              (await jsonDecode(res.body))["msg"].toString())));
                    }
                  },
                  child: const Text('Login'))
            ]),
      ),
    );
  }
}
