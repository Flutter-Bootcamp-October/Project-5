import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/screens/authorization_screens/log_in_screen.dart';
import 'package:cv_app/screens/authorization_screens/verification_screen.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
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
            height: 600,
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
                    'SignUp',
                    style: TextStyle(
                        color: prussianBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AuthTextFelid(
                        text: 'Name',
                        icon: null,
                        isHaveIcon: false,
                      ),
                      const AuthTextFelid(
                        text: 'Phone Number',
                        icon: null,
                        isHaveIcon: false,
                      ),
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
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerificationScreen()));
                        },
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: payneGrey,
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: eggShell,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?  ',
                            style: TextStyle(
                                color: payneGrey, fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()));
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  color: prussianBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )
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
