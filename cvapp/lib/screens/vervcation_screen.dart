import 'dart:convert';

import 'package:cvapp/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController emaiilcontroller = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> verifyOtp() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.loginEmail);

      Map body = {
        'otp': otpcontroller.text,
        'email': emaiilcontroller.text,
        'type': 'registration',
      };

      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
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
      body: Column(
        children: [
          Text("enter otp"),
          TextFormField(
            controller: otpcontroller,
            decoration: InputDecoration(labelText: 'otp'),
            validator: (value) {
              // Add your validation logic here
            },
          ),
          Text("email"),
          TextFormField(
            controller: emaiilcontroller,
            decoration: InputDecoration(labelText: 'email'),
            validator: (value) {
              // Add your validation logic here
            },
          ),
          ElevatedButton(
            onPressed: () {
              verifyOtp();
            },
            child: const Text('Submit'),
          ),
          ElevatedButton(
              onPressed: () async {
                final SharedPreferences? prefs = await _prefs;

                print(prefs?.get('token'));
              },
              child: Text("print token"))
        ],
      ),
    );
  }
}
