// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/extension/ext_string.dart';
import 'package:pcv/screens/auth/register_screen.dart';
import 'package:pcv/screens/auth/rest_screen.dart';
import 'package:pcv/screens/auth/verification_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:pcv/widgets/text_rich_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool displayPass=false;
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
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
                    Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/1.5,bottom: 20),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFieldWidget(
                    keyForm: _emailKey,
                    validator: (val){
                      if(val!.isEmpty){
                        return "enter the email";
                      }
                      if(!val.isValidEmail){
                        return "Email must be contain @ And .com";
                      }
                      return null;
                    },
                    text: 'Email',
                    obscure: false,
                    controller: emailController,
                  ),
                  TextFieldWidget(
                    displayPass:displayPass ,
                    keyForm: _passwordKey,
                    text: 'Password',
                    obscure: true,
                    controller: passwordController,
                    validator: (val) {
                      if(!val!.isValidPassword){
                        return "must be contain Uppercase, lowercase and (!@#*~)";
                      }
                      return null;
                    },
                    onTap: (){
                      displayPass=!displayPass;
                      setState(() {

                      });
                    },
                  ),
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
                        style: TextStyle(color: Color(0xffFF6700)),
                      )),
                  ButtonWidget(
                      onPressed: ()
    async {
     List<bool> isValidation = [];
     isValidation.add(validation(keyForm: _emailKey));
      isValidation.add(validation(keyForm: _passwordKey));
     if (!isValidation.contains(false)){
         try {
          final Response resp = await network.loginMethod({
            "password": passwordController.text,
            "email": emailController.text,
          });
          if (resp.statusCode == 200) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerificationScreen(
                    type: 'login',
                    email: emailController.text,
                  ),
                ));
          } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    (await jsonDecode(resp.body))["msg"]
                        .toString())));
         }
         } catch (e) {
           ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(e.toString())));
        }
     }
                      },
                      text: 'Sign In'),
                  const TextRich(view: RegisterScreen(), text1: 'Don\'t have an account?', text2: ' Register')
                ],
              ))),
    );
  }

  validation({required GlobalKey<FormState> keyForm}) {
    if (!keyForm.currentState!.validate()) {
      return false;
    }
    return true;
  }
}
