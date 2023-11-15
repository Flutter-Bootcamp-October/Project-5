import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_5/api/about.dart';
import 'dart:convert';

import 'package:project_5/widgets/login_field.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController controllername = TextEditingController();
  TextEditingController controllertitle_position = TextEditingController();
  TextEditingController controllerphone = TextEditingController();
  TextEditingController controllerlocation = TextEditingController();
  TextEditingController controllerabout = TextEditingController();
  TextEditingController controllerbirthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Form Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoginField(controller: controllername, hintText: 'Name'),
                SizedBox(height: 16.0),
                LoginField(
                    controller: controllertitle_position,
                    hintText: 'Title_position'),
                SizedBox(height: 16.0),
                LoginField(controller: controllerphone, hintText: 'Phone'),
                SizedBox(height: 16.0),
                LoginField(
                    controller: controllerlocation, hintText: 'Location'),
                SizedBox(height: 16.0),
                LoginField(controller: controllerabout, hintText: 'About'),
                SizedBox(height: 16.0),
                LoginField(
                    controller: controllerbirthday, hintText: 'Birthday'),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final http.Response res = await About().putEditAbout({
                        "name": controllername.text,
                        "title_position": controllertitle_position.text,
                        "phone": controllerphone.text,
                        "location": controllerlocation.text,
                        "about": controllerabout.text,
                        "birthday": controllerbirthday.text,
                      });

                      if (res.statusCode == 200) {
                        print("Update successful");
                        // Pass the result back to the ProfilePage
                        Navigator.pop(context, true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              (await json.decode(res.body))["msg"].toString(),
                            ),
                          ),
                        );
                      }
                    } catch (error) {
                      // Handle other errors during login
                      print('error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'An error occurred during login. Please try again.'),
                        ),
                      );
                    }
                  },
                  child: Text('Update Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
