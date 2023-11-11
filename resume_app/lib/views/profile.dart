import 'package:flutter/material.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/about_model.dart';
import 'package:resume_app/services/about_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    testMethod();
    return const Scaffold();
  }

  void testMethod() async {
    About x = await AboutServ().getAbout(token: getToken());
    print(x.toJson().toString());
    print("______________LOOK HERE_________________");
    x.birthday = "9/30/1997";
    print(x.toJson().toString());
    try {
      await AboutServ().editAbout(token: getToken(), userAbout: x);
    } on FormatException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
    // About z = await AboutServ().getAbout(token: getToken());
    // print(z.toJson().toString());
    // getToken();
    // print("______________LOOK HERE_________________");
    // await AboutServ().deleteAccount(token: getToken());
    // prefs.clear();
  }

  String getToken() {
    print("in profile get token ${prefs.getString("token")}");
    return prefs.getString("token") ?? "";
  }
}
