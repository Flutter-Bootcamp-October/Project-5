import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/models/authentiction/authentiction_model.dart';
import 'package:cv_app/screens/authorization_screens/reset_password_screen.dart';
import 'package:cv_app/screens/authorization_screens/verification_screen.dart';
import 'package:cv_app/services/api/networking_methods.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:cv_app/widgets/information_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:cv_app/constentes/sized_box.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    super.key,
  });

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

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
                    'LogIn',
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
                      AuthTextFelid(
                        text: 'Password',
                        title: 'Password',
                        icon: Icons.lock_outline_rounded,
                        isHaveIcon: true,
                        controller: passwordController,
                      ),
                      height20,
                      ButtonWidget(
                        onTap: () async {
                          setState(() {});
                          final network = ConsentNetworking();

                          final AuthentictionModel respons = await network
                              .loginMethod(body: {
                            "email": emailController!.text,
                            "password": passwordController!.text
                          });
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificationScreen(
                                        email: respons.data.email,
                                        type: "login",
                                      )));
                        },
                        name: 'LogIn',
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ResetPasswordScreen()));
                          },
                          child: const Text(
                            'Forget Password ?',
                            style: TextStyle(
                                color: prussianBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
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
