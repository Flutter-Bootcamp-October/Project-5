import 'package:flutter/material.dart';
import 'package:pcv/screens/verification_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({super.key});

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  TextEditingController emailController = TextEditingController();
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
                  TextFieldWidget(
                    text: 'Email',
                    obscure: false,
                    controller: emailController,
                  ),
                  ButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationScreen(
                                type: 'rest',
                                email: emailController.text,
                              ),
                            ));
                      },
                      text: 'Rest'),
                ],
              ))),
    );
  }
}
