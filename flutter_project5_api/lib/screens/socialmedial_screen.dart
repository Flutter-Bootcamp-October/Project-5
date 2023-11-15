import 'package:flutter/material.dart';
import 'package:flutter_project5_api/models/about.dart';
import 'package:flutter_project5_api/models/social.dart';
import 'package:flutter_project5_api/models/social2.dart';
import 'package:flutter_project5_api/servers_api/social/add_social_api.dart';
import 'package:flutter_project5_api/servers_api/social/del_sociak_api.dart';

import 'package:flutter_project5_api/widgets/textfelides.dart'; 
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  _SocialMediaScreenState createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  final List<SocialMedia> socialMediaList = [];

  TextEditingController usernameController = TextEditingController();
  TextEditingController socialController = TextEditingController();

  void _addSocialMedia() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Social Media',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                hint: 'Username',
                controller: usernameController,
              ),
              SizedBox(height: 10.0),
              CustomTextField(
                hint: 'Social Media',
                controller: socialController,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  await _saveSocialMediaAPI();
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveSocialMedia([response]) {
    final username = usernameController.text;
    final social = socialController.text;

    if (username.isNotEmpty && social.isNotEmpty) {
      setState(() {
        socialMediaList.add(SocialMedia(
          username: username,
          social: social,
        ));
      });

      usernameController.clear();
      socialController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Social Media',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: _addSocialMedia,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 26, 8, 90),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: socialMediaList
                      .asMap()
                      .map(
                        (index, socialMedia) => MapEntry(
                          index,
                          Card(
                            margin: EdgeInsets.only(bottom: 16.0),
                            child: ListTile(
                              title: Text('Username: ${socialMedia.username}'),
                              subtitle:
                                  Text('Social Media: ${socialMedia.social}'),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _deleteSocialMedia(index),
                              ),
                            ),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteSocialMedia(int index) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await deletesocialmedia(
        token: token!,
        body: {'id_social': socialMediaList[index].id},
      );

      if (response.codeState == 200) {
        _removeSocialMedia(index);
      } else {
        print("Failed to delete social media. Error: ${response.msg}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void _removeSocialMedia(int index) {
    setState(() {
      socialMediaList.removeAt(index);
    });
  }

  Future<void> _saveSocialMediaAPI() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await addsocialmedia(
        token: token!,
        body: {
          'username': usernameController.text,
          'social': socialController.text,
        },
      );

      if (response.codeState == 200) {
        _saveSocialMedia(response);
        usernameController.clear();
        socialController.clear();
      } else {
        print("Failed to add social media. Error: ${response.msg}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
