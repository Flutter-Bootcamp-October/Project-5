import 'dart:convert';
import 'dart:io';

import 'package:cvapp/models/skills_model.dart';
import 'package:cvapp/screens/add_project_screen.dart';
import 'package:cvapp/screens/education_screen.dart';
import 'package:cvapp/screens/register_screen.dart';
import 'package:cvapp/screens/skills_screen.dart';
import 'package:cvapp/screens/social_screen.dart';
import 'package:cvapp/screens/welocme_screen.dart';
import 'package:cvapp/utils/api_endpoints.dart';
import 'package:cvapp/wedgets/add_data.dart';
import 'package:cvapp/wedgets/profile_image.dart';
import 'package:cvapp/wedgets/sginup_wedget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
String? token;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? selectedimage;

  Future pushproject({required String token}) async {
    try {
      var url = Uri.parse("https://bacend-fshi.onrender.com/user/add/project");
      var response = await http.post(url, headers: {"authorization": token});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map body = {
        'projectname': "my",
        'description': "sssss",
        'state': "completed",
      };

      if (response.statusCode == 200) {
        return SkillsModel.fromJson(json.decode(response.body));
      } else {
        // Handle different responses
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to push project.')));
      }
    } catch (e) {
      // Handle the exception
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  Future imageupload({required String token}) async {
    try {
      var url = Uri.parse("https://bacend-fshi.onrender.com/user/upload");
      var response = await http.post(url, headers: {"authorization": token});
      final body = await selectedimage?.readAsBytes();

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return SkillsModel.fromJson(json.decode(response.body));
      } else {
        // Handle different responses
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
      backgroundColor: Color(0xff8C5CB3),
      body: SingleChildScrollView(
        child: Column(
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
                  onPressed: () {
                    _pickImageFromGallery();
                    setState(() {});
                  },
                  child: Text("chane image"),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Column(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjectScreen()));
                    },
                    child: Adddata(
                        img: "lib\\assets\\imges\\img4.png",
                        dataname: "projects",
                        datanumbers: "0")),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SkillsScreen()));
                  },
                  child: Adddata(
                      img: "lib\\assets\\imges\\img5.png",
                      dataname: "Skills",
                      datanumbers: "0"),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EducationScreen()));
                  },
                  child: Adddata(
                      img: "lib\\assets\\imges\\img6.png",
                      dataname: "education ",
                      datanumbers: "0"),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SocialScreen()));
                  },
                  child: Adddata(
                      img: "lib\\assets\\imges\\img4.png",
                      dataname: "social ",
                      datanumbers: "0"),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  await pushproject(token: token.toString());
                },
                child: Text("push"))
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedimage != null) {
      setState(() {
        selectedimage = File(returnedimage.path);

        imageupload(token: token.toString());
      });
    }
  }
}
