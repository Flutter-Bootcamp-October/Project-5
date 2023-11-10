import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/screens/authorization_screens/verification_screen.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({
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
                      const AuthTextFelid(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        isHaveIcon: true,
                      ),
                      const AuthTextFelid(
                        text: 'Password',
                        icon: Icons.lock_outline_rounded,
                        isHaveIcon: true,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerificationScreen()));
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
