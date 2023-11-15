import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'package:flutter_project5_api/models/auth.dart';
//import 'package:flutter_project5_api/models/errorr.dart';
import 'package:flutter_project5_api/screens/verification_screen.dart';
import 'package:flutter_project5_api/servers_api/auth/registration_api.dart';
import 'package:flutter_project5_api/widgets/custom_button.dart';
import 'package:flutter_project5_api/widgets/textfelides.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> registerUser(BuildContext context) async {
    try {
      final response = await registration(
        body: {
          'name': nameController.text,
          'phone': phoneController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

   
      print('Registration successful!');
      print('User email: ${response.data?.email}');

     
      if (response.codeState == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationScreen(
              type: 'registration',
              email: emailController.text,
            ),
          ),
        );
      } else {
        
        print('Unexpected status code: ${response.codeState}');
      }
    } catch (e) {
      // Registration failed
      print('Registration failed. Error: $e');

      String errorMessage = 'Registration failed';

      if (e is FormatException) {
        errorMessage = e.message;
      } else if (e is http.Response) {
      
        if (e.statusCode == 400) {
          errorMessage = 'Bad request. Check your input fields.';
        } else {
          errorMessage = 'An error occurred. Please try again later.';
        }
      }

     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.7),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Registration',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 26, 8, 90),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: nameController,
                hint: 'Enter Your Name',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: phoneController,
                hint: 'Enter Your Number',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailController,
                hint: 'Enter Your Email',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: passwordController,
                hint: 'Enter Password',
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              CustomButton(
                onPressed: () => registerUser(context),
                text: 'Registration',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
