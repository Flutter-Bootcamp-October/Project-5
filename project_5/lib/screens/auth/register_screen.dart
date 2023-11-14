import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/screens/auth/create_verification.dart';
import 'package:project_5/screens/components/button_widget.dart';

import '../components/input_text_fields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

TextEditingController nameController = TextEditingController(),
    phoneController = TextEditingController(),
    emailController = TextEditingController(),
    passwordController = TextEditingController(),
    otpController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          )),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Create Account",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          SizedBox(
            height: 50,
          ),
          InputTextFields(
              controller: nameController, title: "Enter name", lines: 1),
          InputTextFields(
              controller: phoneController, title: "Enter phone", lines: 1),
          InputTextFields(
              controller: emailController, title: "Enter email", lines: 1),
          InputTextFields(
            controller: passwordController,
            title: "Enter password",
            lines: 1,
          ),
          SizedBox(
            height: 10,
          ),
          ButtonWidget(
            textEntry: "Create account",
            onpress: () async {
              final apiMethod = ApiMethods();
              if (nameController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                try {
                  final Auth res = await apiMethod.createAccount(body: {
                    "name": nameController.text,
                    "phone": phoneController.text,
                    "email": emailController.text,
                    "password": passwordController.text,
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountVerification(
                              email: res.data.email,
                              type: 'registration',
                            )),
                  );
                } on FormatException catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      error.message.toString(),
                    ),
                  ));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("plese fill all the fields"),
                ));
              }
            },
          )
        ]),
      ),
    );
  }
}
