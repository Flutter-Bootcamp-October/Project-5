import 'dart:convert';

import 'package:cvapp/screens/home_screen.dart';
import 'package:cvapp/utils/api_endpoints.dart';
import 'package:cvapp/wedgets/costom_divider.dart';
import 'package:cvapp/wedgets/welcome_wedget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

bool isvaild = false;

class SginInScreen extends StatefulWidget {
  const SginInScreen({super.key});

  @override
  State<SginInScreen> createState() => _SginInScreenState();
}

class _SginInScreenState extends State<SginInScreen> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emaiilcontroller = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> verifyOtp() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.login);

      Map body = {
        'password': passwordcontroller.text,
        'email': emaiilcontroller.text,
      };

      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        isvaild = true;
        final json = jsonDecode(response.body);
        var token = json['data']['token'];
        print(token);
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', token);
        print("suscess");
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff8C5CB3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          WelcomeWidget("Login to CV app"),
          SizedBox(
            height: 20,
          ),
          CustomDivider(),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Username or Email"),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: TextField(
                  controller: emaiilcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Password"),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await verifyOtp();
                  if (isvaild == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    showAboutDialog(
                        context: context,
                        children: [Text("please enter valid data")]);
                  }
                },
                child: Container(
                  width: 180,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences? prefs = await _prefs;

                    print(prefs?.get('token'));
                  },
                  child: Text("print token")),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 300,
                      height: 200,
                      child: Image.asset(
                        "lib\\assets\\imges\\img2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
