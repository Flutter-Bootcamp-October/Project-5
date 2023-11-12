import 'dart:ffi';

import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/otp/otp_msg_model.dart';
import 'package:cv_app/screens/authorization_screens/log_in_screen.dart';
import 'package:cv_app/services/api/networking_methods.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({
    super.key,
    required this.email,
    required this.type,
  });
  final String email;
  final String type;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController OTPcontroller = TextEditingController();
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
            height: 400,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Check your email',
                    style: TextStyle(
                        color: prussianBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  height10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AuthTextFelid(
                        text: 'Verification code',
                        icon: Icons.lock_outline_rounded,
                        isHaveIcon: true,
                        controller: OTPcontroller,
                      ),
                      height20,
                      InkWell(
                        onTap: () async {
                          final network = ConsentNetworking();
                          final OTPModel respons = await network
                              .verificationMethod(body: {
                            "otp": OTPcontroller.text,
                            "email": widget.email,
                            "type": widget.type
                          });
                          if (respons.codeState == 200) {
                            final token = respons.data.token.toString();
                            prefs.setString('token', token);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInScreen()));
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(respons.msg.toString())));
                          }
                        },
                        child: Container(
                          width: 290,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: payneGrey,
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: eggShell,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
