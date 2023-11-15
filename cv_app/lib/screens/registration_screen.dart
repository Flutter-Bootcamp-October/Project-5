import 'package:cv_app/screens/login_screen.dart';
import 'package:cv_app/screens/otp_screen.dart';
import 'package:cv_app/services/auth.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController NameController = TextEditingController();

  TextEditingController PhoneController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Text("Create Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          Text("to get started now!", style: TextStyle(fontSize: 24)),
          Padding(
            padding: const EdgeInsets.only(top: 43),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Name'),
                    subtitle: TextFormField(
                      controller: NameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Phone'),
                    subtitle: TextFormField(
                      controller: PhoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
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
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 43,
          ),
          CustomBottom(
            color: purble,
            ontap: () async {
              try {
                final response = await registration({
                  "name": NameController.text,
                  "phone": PhoneController.text,
                  "email": EmailController.text,
                  "password": PasswordController.text
                });
                if (response?.statusCode == 200) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(
                          email: EmailController.text,
                          type: "registration",
                        ),
                      ));
                }
              } on FormatException catch (error) {
                print("-----");
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error.message.toString())));
              }
            },
            border: purble,
            text: 'Sing up',
          )
        ],
      ),
    );
  }
}
