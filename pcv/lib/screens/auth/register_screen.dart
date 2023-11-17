
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/extension/ext_string.dart';
import 'package:pcv/screens/auth/sign_in_screen.dart';
import 'package:pcv/screens/auth/verification_screen.dart';
import 'package:pcv/services/auth_api.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:pcv/widgets/text_rich_widget.dart';
final network = Network();
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final  _emailKey= GlobalKey<FormState>();
  final  _passwordKey= GlobalKey<FormState>();
  final  _phoneKey= GlobalKey<FormState>();
  final  _nameKey= GlobalKey<FormState>();
  bool displayPass=true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
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
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffff6700)),
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    keyForm: _nameKey,
                    text: 'Username',
                    obscure: false,
                    controller: usernameController,validator: (val) {
                    if(val!.isEmpty){
                      return "Please enter your username";
                    }
                    return null;
                  },
                  ),
                  TextFieldWidget(
                    keyForm: _phoneKey,
                    text: 'Phone',
                    obscure: false,
                    controller: phoneController,
                    validator: (val) {
                      if(!val!.isValidPhone){
                        return "must be start with 05 and contain 10 digital";
                      }
                      return null;
                    },
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
                  ButtonWidget(
                    onPressed: () async {
                      List<bool> isValidation = [];
                      isValidation.add(validation(keyForm: _emailKey));
                      isValidation.add(validation(keyForm: _passwordKey));
                      isValidation.add(validation(keyForm: _phoneKey));
                      isValidation.add(validation(keyForm: _nameKey));
                      if (!isValidation.contains(false)) {
                        try {
                          final Response resp = await network.registerMethod({
                            "name": usernameController.text,
                            "phone": phoneController.text,
                            "password": passwordController.text,
                            "email": emailController.text
                          });

                          if (resp.statusCode == 200) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerificationScreen(
                                    type: 'registration',
                                    email: emailController.text,
                                  ),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text((await jsonDecode(resp.body))["msg"]
                                    .toString())));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      }
                    },
                    text: 'Register',
                  ),const TextRich(view: SignInScreen(), text1: 'Register Already?', text2: ' Sign In')
                ],
              ),
            ),
          ),
        ));
  }
  validation({required GlobalKey<FormState> keyForm}) {
    if (!keyForm.currentState!.validate()) {
      return false;
    }
    return true;
  }
}
