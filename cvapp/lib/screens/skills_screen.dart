import 'dart:convert';
import 'dart:io';

import 'package:cvapp/get_models/get_skills.dart';
import 'package:cvapp/models/skills_model.dart';
import 'package:cvapp/screens/register_screen.dart';
import 'package:cvapp/utils/api_endpoints.dart';
import 'package:cvapp/wedgets/profile_image.dart';
import 'package:cvapp/wedgets/sginup_wedget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Skill> skillLsit = [];

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
String? token;

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class Item {
  String projectname;
  String description;
  String state;

  Item(
      {required this.projectname,
      required this.description,
      required this.state});
}

class _SkillsScreenState extends State<SkillsScreen> {
  File? selectedimage;
  List<Item> items = [];
  bool isvalid = false;
  TextEditingController skillcontroller = TextEditingController();

  Future pushproject({required String token}) async {
    try {
      Map body = {
        "skill": skillcontroller.text,
      };
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.addskills);
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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  Future fetchSkills({required String token}) async {
    var url = Uri.parse("https://bacend-fshi.onrender.com/user/skills");

    var response = await http.get(url, headers: {"authorization": token});
    print(response.body);

    if (response.statusCode == 200) {
      print("success");

      var c = Skill.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load skills');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadToken();
    fetchSkills(
            token:
                "eyJhbGciOiJIUzI1NiIsImtpZCI6Ikc4c2lRbVB5dGw3Vzc2K00iLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjk5ODc2NDEwLCJpYXQiOjE2OTk4NTg0MTAsImlzcyI6Imh0dHBzOi8vbXpranV5cnZ3eHVsc3d3cmlvcm0uc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6ImUwOWUxOTk1LTgzNDYtNDdjNC1hOGExLWNjYWUwNDM1M2VhMSIsImVtYWlsIjoieGF4ZW05OTQ5OUBtYWlubWlsZS5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2OTk4NTg0MTB9XSwic2Vzc2lvbl9pZCI6IjIyMGMzMGI4LWM4YzAtNDQxMy1hZWMyLTRlNTUzZmI2ZDc5NSJ9.FcnDT2kDwjS76tDD5PBdtovSK_1sWwnCGCnUHUtQmkU")
        .then((skills) {
      setState(() {
        // Now 'skills' is a List<Skill> populated with your data
        for (var skill in skills) {
          print(
              'Skill: ${skill.skill}, ID: ${skill.id}, User ID: ${skill.userId}');
        }
      });
    });
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
      backgroundColor: Color(0xff8C5CB3),
      body: Column(
        children: [
          SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
          Divider(
            thickness: 1,
          ),
          SinUpWedget(
              Controller: skillcontroller, labelText: "  Enter your skill"),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                await pushproject(token: token.toString());
                print(token);
                setState(() {});
              },
              child: Text("push")),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                await fetchSkills(token: token.toString());
                print(token);
                setState(() {});
              },
              child: Text("get")),
        ],
      ),
    );
  }
}
