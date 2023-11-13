import 'dart:convert';
import 'dart:io';

import 'package:cvapp/global.dart';
import 'package:cvapp/models/skills_model.dart';
import 'package:cvapp/screens/register_screen.dart';
import 'package:cvapp/utils/api_endpoints.dart';
import 'package:cvapp/wedgets/profile_image.dart';
import 'package:cvapp/wedgets/sginup_wedget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
String? token;

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  File? selectedimage;
  bool isvalid = false;
  TextEditingController graduation_dateController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  Future pushproject({required String token}) async {
    try {
      Map body = {
        "graduation_date": graduation_dateController.text,
        "university": universityController.text,
        "college": collegeController.text,
        "specialization": specializationController.text,
        "level": levelController.text,
      };
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.addeducation);
      var response = await http.post(url,
          headers: {"authorization": token}, body: json.encode(body));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        SkillsModel.fromJson(json.decode(response.body));
        isvalid = true;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Success!')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to push project.')));
      }
    } catch (e) {
      // Handle the exception
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  @override
  void initState() {
    super.initState();
    _loadToken(); // Call an async method to load the token
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff8C5CB3),
      body: Column(
        children: [
          SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedimage != null)
                ProfileImage(selectedimage: selectedimage),
              SizedBox(
                height: 20,
              ),
              Text("welcome conan"),
              TextButton(
                onPressed: pickImageFromGallery,
                child: Text("chane image"),
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          SinUpWedget(
              Controller: graduation_dateController,
              labelText: " Enter your graduation_date"),
          SizedBox(height: 20),
          SinUpWedget(
              Controller: universityController,
              labelText: "  Enter your university"),
          SizedBox(height: 20),
          SinUpWedget(
              Controller: collegeController, labelText: " Enter your college"),
          SizedBox(height: 20),
          SinUpWedget(
              Controller: specializationController,
              labelText: " Enter your specialization"),
          SizedBox(height: 20),
          SinUpWedget(
              Controller: levelController, labelText: " Enter your level"),
          ElevatedButton(
              onPressed: () async {
                await pushproject(token: token.toString());
                print(token);
                setState(() {});
              },
              child: Text("push")),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
