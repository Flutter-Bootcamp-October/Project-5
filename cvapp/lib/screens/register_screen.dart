import 'dart:convert';
import 'package:cvapp/screens/vervcation_screen.dart';
import 'package:cvapp/utils/api_endpoints.dart';
import 'package:cvapp/wedgets/sginup_wedget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

bool isvalid = false;
String errormassage = "";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // TextEditingControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  // GlobalKey for FormState
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.registerEmail);

      Map body = {
        "name": nameController.text,
        "phone": phoneController.text,
        "password": passwordController.text,
        "email": emailController.text
      };

      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print("suscess");
        isvalid = true;
        print(response.body);
      }
    } catch (e) {
      errormassage = e.toString();
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff8C5CB3),
      body: Column(
        children: <Widget>[
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                SinUpWedget(
                    Controller: nameController,
                    labelText: "   Enter your name"),
                SizedBox(height: 20),
                SinUpWedget(
                    Controller: phoneController,
                    labelText: "  Enter your phone"),
                SizedBox(height: 20),
                SinUpWedget(
                    Controller: emailController,
                    labelText: "  Enter your email"),
                SizedBox(height: 20),
                SinUpWedget(
                    Controller: passwordController,
                    labelText: "  Enter your password"),
                SizedBox(height: 20),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _register();
              if (isvalid == true) {
                _register();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerificationScreen()));
              } else {
                showAboutDialog(
                    context: context,
                    children: [Text("please enter valid data")]);
              }
            },
            child: Text('Register'),
          ),
          InkWell(
            onTap: () {
              if (isvalid == true) {
                _register();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerificationScreen()));
              } else {
                showAboutDialog(
                    context: context, children: [Text(errormassage)]);
              }
            },
            child: Container(
              width: 180,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
