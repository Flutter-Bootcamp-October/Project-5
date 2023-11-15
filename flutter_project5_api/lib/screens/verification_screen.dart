//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project5_api/screens/navbar_screen.dart';
//import 'package:flutter_project5_api/screens/home.dart';
//import 'package:flutter_project5_api/screens/registration_screen.dart';
import 'package:flutter_project5_api/screens/welcome_screen.dart';
import 'package:flutter_project5_api/servers_api/auth/verification_api.dart';
import 'package:flutter_project5_api/widgets/custom_button.dart';
import 'package:flutter_project5_api/widgets/textfelides.dart';
//import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key, required this.type, required this.email})
      : super(key: key);

  final String type;
  final String email;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otpController = TextEditingController();

  Future<void> verifyOTP(BuildContext context) async {
    try {
      final response = await verification(
        body: {
          'otp': otpController.text,
          'email': widget.email,
          'type': widget.type,
        },
      );

      print('Verification successful!');
      print('User email: ${response.data?.email}');

      if (widget.type == "registration") {
        final String token = response.data?.token ?? '';
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        print(token);
        await prefs.setString('token', token);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppNavigationBar (),
          ),
        );
      } else if (widget.type == "login" && response.codeState == 200) {
        // Assuming you have a WelcomeScreen for login success
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppNavigationBar(),
          ),
        );
      } else {
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Verification failed. Invalid type or status code.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Verification failed. Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: otpController,
                hint: 'OTP',
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: CustomButton(
                  onPressed: () => verifyOTP(context),
                  text: 'Send',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
