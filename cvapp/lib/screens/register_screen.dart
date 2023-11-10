import 'dart:convert';
import 'package:cvapp/screens/vervcation_screen.dart';
import 'package:cvapp/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 200),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                // Add your validation logic here
              },
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              validator: (value) {
                // Add your validation logic here
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                // Add your validation logic here
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                // Add your validation logic here
              },
            ),
            ElevatedButton(
              onPressed: () {
                _register();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerificationScreen()));
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
