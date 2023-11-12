import 'dart:convert';
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/models/authentiction/authentiction_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/screens/authorization_screens/verification_screen.dart';
import 'package:cv_app/services/api/networking_methods.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:flutter/material.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inite();
  }

  Future inite() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: richBlack,
      body: Column(
        children: [
          Expanded(
            child: Container(),
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
                        icon: Icons.email_outlined,
                        isHaveIcon: true,
                        controller: emailController,
                      ),
                      AuthTextFelid(
                        text: 'Password',
                        icon: Icons.lock_outline_rounded,
                        isHaveIcon: true,
                        controller: passwordController,
                      ),
                      height20,
                      InkWell(
                        onTap: () async {
                          final network = ConsentNetworking();

                          final AuthentictionModel respons = await network
                              .loginMethod(body: {
                            "email": emailController!.text,
                            "password": passwordController!.text
                          });

                          if (respons.codeState == 200) {
                            // ignore: use_build_context_synchronously

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerificationScreen(
                                          email: respons.data.email,
                                          type: "login",
                                        )));
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(respons.msg.toString())));
                          }
                          setState(() {});
                        },
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: payneGrey,
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              'LogIn',
                              style: TextStyle(
                                color: eggShell,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const LogInScreen()));
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
