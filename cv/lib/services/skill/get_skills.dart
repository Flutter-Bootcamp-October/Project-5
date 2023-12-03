// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cv/models/skill.dart';
import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Skill>> getSkills(BuildContext context) async {
  List<Skill> skillsList = [];

  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/skills");
    final response =
        await get(url, headers: {"authorization": prefs.getString("token")!});
    print(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final responseDecode = jsonDecode(response.body)["data"];
      for (var element in responseDecode) {
        skillsList.add(Skill.fromJson(element));
      }
      return skillsList;
    } else if (jsonDecode(response.body)["msg"] ==
        "Token is expired or invalid") {
      prefs.remove("token");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SigninScreen(),
          ),
          (route) => false);
      return skillsList;
    } else {
      return skillsList;
    }
  } catch (error) {
    print("Error: $error");
    return skillsList;
  }
}
