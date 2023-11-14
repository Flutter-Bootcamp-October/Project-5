import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/authentiction/authentiction_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/screens/authorization_screens/verification_screen.dart';
import 'package:cv_app/services/api/networking_methods.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:cv_app/widgets/information_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({
    super.key,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: richBlack,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
         height20,
          Expanded(
            child: Container(
              child: ImageIcon(
                AssetImage(
                  'lib/assets/images/pngkey.com-resume-png-1225289.png',
                ),
                color: white,
                size: 150,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 500,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                        color: prussianBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AuthTextFelid(
                        text: 'Email',
                        title: 'Email',
                        icon: Icons.email_outlined,
                        isHaveIcon: true,
                        controller: emailController,
                      ),
                      height20,
                      ButtonWidget(
                        name: 'Submit',
                        onTap: () async {
                          final network = ConsentNetworking();

                          final AuthentictionModel respons =
                              await network.resetPasswordMethod(body: {
                            "email": emailController.text,
                          });
                          if (respons.codeState == 200) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerificationScreen(
                                          email: respons.data.email,
                                          type: "rest_password",
                                        )));
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(respons.msg.toString())));
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
