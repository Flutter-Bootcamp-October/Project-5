import 'dart:convert';
import 'dart:io';

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

  void _addItem(String projectnameController, String descriptionController,
      String stateController) {
    if (projectnameController.isNotEmpty && descriptionController.isNotEmpty) {
      setState(() {
        items.add(Item(
            projectname: projectnameController,
            description: descriptionController,
            state: stateController));
      });
    }
  }

  // void dispose() {
  //   // Dispose controllers when the widget is disposed
  //   projectnameController.dispose();
  //   descriptionController.dispose();
  //   stateController.dispose();
  //   super.dispose();
  // }

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

  @override
  void initState() {
    super.initState();
    _loadToken();
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
          SizedBox(height: 20),
          SizedBox(
            width: 100,
            height: 100,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Text(items[index].projectname);
              },
            ),
          ),
        ],
      ),
    );
  }
}
