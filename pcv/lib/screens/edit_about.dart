import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/model/edit_about.dart';
import 'package:pcv/screens/home_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAboutScreen extends StatefulWidget {
  const EditAboutScreen({super.key});

  @override
  State<EditAboutScreen> createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends State<EditAboutScreen> {
  Map about = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadingAbout();
  }

  _loadingAbout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.aboutMethod(token: token!);
    if (res.statusCode == 200) {
      about = (await jsonDecode(res.body))["data"];
      print(about);
      setState(() {});
      // print(about);
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController titPoController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    usernameController.text = about["name"].toString();
    titPoController.text = about["title_position"].toString();
    locationController.text = about["location"].toString();
    phoneController.text = about["phone"].toString();
    aboutController.text = about["about"].toString();
    birthdayController.text = about["birthday"].toString();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextFieldWidget(
                text: 'name',
                obscure: false,
                controller: usernameController,
              ),
              TextFieldWidget(
                text: 'title Position',
                obscure: false,
                controller: titPoController,
              ),
              TextFieldWidget(
                text: 'Phone',
                obscure: false,
                controller: phoneController,
              ),
              TextFieldWidget(
                text: 'location',
                obscure: false,
                controller: locationController,
              ),
              TextFieldWidget(
                text: 'about',
                obscure: false,
                controller: aboutController,
              ),
              TextFieldWidget(
                text: 'birthday',
                obscure: false,
                controller: birthdayController,
              ),
              ButtonWidget(
                onPressed: () async {
                  try {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final token = prefs.getString('token');
                    final Response resp =
                        await network.editAboutMethod(token: token!, body: {
                      "name": usernameController.text,
                      "phone": phoneController.text,
                      "title_position": titPoController.text,
                      "location": locationController.text,
                      "about": aboutController.text,
                      "birthday": birthdayController.text
                    });

                    if (resp.statusCode == 200) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text((await jsonDecode(resp.body))["msg"]
                              .toString())));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                text: 'Register',
              ),
            ],
          ),
        ));
  }
}
