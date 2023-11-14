import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/screens/auth/create_verification.dart';

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
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
              decoration: const InputDecoration(label: Text("Enter name")),
              controller: nameController),
          TextField(
              decoration: const InputDecoration(label: Text("Enter phone")),
              controller: phoneController),
          TextField(
              decoration: const InputDecoration(label: Text("Enter email")),
              controller: emailController),
          TextField(
              decoration: const InputDecoration(label: Text("Enter password")),
              controller: passwordController),
          ElevatedButton(
              onPressed: () async {
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
                    // showModalBottomSheet(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           const Text("Enter OTP"),
                    //           TextField(
                    //               decoration: const InputDecoration(
                    //                   label: Text("Enter email otp")),
                    //               controller: otpController),
                    //           ElevatedButton(
                    //             onPressed: () async {
                    //               final apiMethod = ApiMethods();
                    //               if (otpController.text.isNotEmpty) {
                    //                 try {
                    //                   apiMethod.emialVerification(
                    //                     body: {
                    //                       "otp": otpController.text,
                    //                       "email": res.data.email,
                    //                       "type": "registration",
                    //                     },
                    //                   );
                    //                   Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                         builder: (context) =>
                    //                             const LoginScreen()),
                    //                   );
                    //                 } on FormatException catch (error) {
                    //                   ScaffoldMessenger.of(context)
                    //                       .showSnackBar(SnackBar(
                    //                     content: Text(
                    //                       error.message.toString(),
                    //                     ),
                    //                   ));
                    //                 }
                    //               } else {
                    //                 ScaffoldMessenger.of(context).showSnackBar(
                    //                   const SnackBar(
                    //                     content: Text("Enter otp"),
                    //                   ),
                    //                 );
                    //               }
                    //             },
                    //             child: const Text("submit OTP"),
                    //           ),
                    //         ],
                    //       );
                    //     });
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
              child: const Text("Create account"))
        ]),
      ),
    );
  }
}