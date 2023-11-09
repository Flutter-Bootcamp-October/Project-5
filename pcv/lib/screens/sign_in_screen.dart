import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/rest_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const TextFieldWidget(
                    text: 'Email',
                    obscure: false,
                    controller: null,
                  ),
                  const TextFieldWidget(
                      text: 'Password', obscure: true, controller: null),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RestScreen(),
                            ));
                      },
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(color: Color(0xff7052ff)),
                      )),
                  ButtonWidget(onPressed: () {}, text: 'Sign In'),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          const TextSpan(text: 'Don\'t have an account?'),
                          TextSpan(
                              text: ' Register',
                              style: const TextStyle(color: Color(0xff7052ff)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    )))
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
