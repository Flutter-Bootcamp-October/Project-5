import 'dart:convert';
import 'dart:math';
import 'package:cvapp/screens/login_screen.dart';
import 'package:cvapp/screens/vervcation_screen.dart';
import 'package:cvapp/utils/api_endpoints.dart';
import 'package:cvapp/wedgets/costom_divider.dart';
import 'package:cvapp/wedgets/imge_sinup.dart';
import 'package:cvapp/wedgets/sginup_wedget.dart';
import 'package:cvapp/wedgets/welcome_wedget.dart';
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
          SizedBox(height: 40),
          WelcomeWidget("Login to CV app"),
          SizedBox(
            height: 20,
          ),
          CustomDivider(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: 390,
                height: 284,
              ),
              Positioned(bottom: -10, child: Costomimage()),
              Positioned(top: 30, left: 170, child: RegisterWedget(context)),
              Positioned(
                  top: 100,
                  left: 170,
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  top: 120,
                  left: 280,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SginInScreen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Container RegisterWedget(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.black),
      child: TextButton(
        onPressed: () async {
          await _register();
          if (isvalid == true) {
            _register();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VerificationScreen()));
          } else {
            showAboutDialog(
                context: context, children: [Text("please enter valid data")]);
          }
        },
        child: Text(
          'Create Account',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}














//  InkWell(
//             onTap: () {
//               if (isvalid == true) {
//                 _register();
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => VerificationScreen()));
//               } else {
//                 showAboutDialog(
//                     context: context, children: [Text(errormassage)]);
//               }
//             },
//             child: Container(
//               width: 180,
//               height: 55,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20), color: Colors.black),
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Text(
//                   "Create Account",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),