import 'package:flutter/material.dart';

import 'package:flutter_project5_api/servers_api/auth/login_api.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter_project5_api/screens/verification_screen.dart';
import 'package:flutter_project5_api/widgets/custom_button.dart';
import 'package:flutter_project5_api/widgets/textfelides.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    try {
      // Check if email and password fields are not empty
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
       
        final loginResponse = await login(
          body: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );

       
        if (loginResponse.codeState == 200) {
          // Login successful, navigate to the VerificationScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationScreen(
                type: 'login',
                email: emailController.text,
              ),
            ),
          );
          return;
        }
      }

      // If login is not successful or email/password are empty, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Please check your credentials.'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.7),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Login',
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
                onPressed: () => loginUser(context),
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
