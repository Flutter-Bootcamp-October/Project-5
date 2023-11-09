import 'package:flutter/material.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
                    'Register',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFieldWidget(
                  text: 'Username',
                  obscure: false,
                  controller: usernameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFieldWidget(
                  text: 'Phone',
                  obscure: false,
                  controller: phoneController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFieldWidget(
                  text: 'Email',
                  obscure: false,
                  controller: emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFieldWidget(
                  text: 'Password',
                  obscure: true,
                  controller: passwordController,
                ),
              ),
             
              ButtonWidget(
                onPressed: () {},
                text: 'Register',
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      const TextSpan(text: 'Already Register?'),
                      TextSpan(
                          onExit: (event) => Container(),
                          text: ' Log In',
                          style: const TextStyle(color: Color(0xff7052ff)))
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
