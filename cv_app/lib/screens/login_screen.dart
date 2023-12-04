import 'package:cv_app/screens/otp_screen.dart';
import 'package:cv_app/screens/registration_screen.dart';
import 'package:cv_app/services/auth.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: bg,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Text(
              "Welcom,",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Text("Glad to see you!", style: TextStyle(fontSize: 24)),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Email'),
                    subtitle: TextFormField(
                      controller: EmailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Password'),
                    subtitle: TextFormField(
                      controller: PasswordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 270),
                    child: TextButton(
                        onPressed: () {}, child: Text("Forgot Password?")),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 156,
            ),
            CustomBottom(
              color: orang,
              ontap: () async {
                try {
                  final response = await login({
                    "email": EmailController.text,
                    "password": PasswordController.text
                  });
                  if (response?.statusCode == 200) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            email: EmailController.text,
                            type: "login",
                          ),
                        ));
                  }
                } on FormatException catch (error) {
                  print("-----");
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.message.toString())));
                }
              },
              border: orang,
              text: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
