import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
  });
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
              borderRadius: BorderRadius.circular(30),
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
                      const AuthTextFelid(
                        text: 'Verification code',
                        icon: Icons.lock_outline_rounded,
                        isHaveIcon: true,
                      ),
                      height20,
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const LogInScreen()));
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
