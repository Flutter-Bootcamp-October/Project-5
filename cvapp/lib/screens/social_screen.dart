import 'dart:convert';
import 'dart:io';

import 'package:cvapp/models/skills_model.dart';
import 'package:cvapp/models/social_model.dart';
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

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
    List<SocialMediaModel> socialMediaList = [];

  bool isvalid = false;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController socialcontroller = TextEditingController();

  Future pushproject({required String token}) async {
    try {
      Map body = {
        "username": usernamecontroller.text,
        "social": socialcontroller.text,
      };
      var url = Uri.parse(
          "https://bacend-fshi.onrender.com/user/add/social_media");
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

Future<void> _fetchSocialMediaData({required String token}) async {
    var url = Uri.parse("https://bacend-fshi.onrender.com/user/social_media");
    try {
      var response = await http.get(url, headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body)['data'] as List;
        setState(() {
          socialMediaList = jsonData.map((e) => SocialMediaModel.fromJson(e)).toList();
        });
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

Future<void> removeSocialMedia(int id) async {
    var url = Uri.parse("https://bacend-fshi.onrender.com/user/delete/social_media");
    try {
      var response = await http.delete(url,
          headers: {"Authorization": "Bearer $token"},
          body: json.encode({"id_social": id}));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Social media deleted successfully')));
        _fetchSocialMediaData(token: '$token'); // Refresh the list after deletion
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete social media.')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
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
              Controller: usernamecontroller,
              labelText: "  Enter your username"),
          SizedBox(height: 20),
          SinUpWedget(
              Controller: socialcontroller, labelText: "  Enter your social"),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                await pushproject(token: token.toString());
                await _fetchSocialMediaData(token: token.toString());
                print(token);
                setState(() {});
              },
              child: Text("push")),
          SizedBox(height: 20),
          SizedBox(
            width: 200,height: 200,
            child: ListView.builder(
              itemCount: socialMediaList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(16),
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username: ${socialMediaList[index].id}\nSocial: ${socialMediaList[index].social}',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => removeSocialMedia(socialMediaList[index].id!),
                        child: Text('Delete', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        
      
    
        ],
      ),
    );
  }
}
        
      
    

