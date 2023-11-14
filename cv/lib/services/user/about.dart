// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cv/models/user.dart';
import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User?> aboutAPI(BuildContext context) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/about");
    final response =
        await get(url, headers: {"authorization": prefs.getString("token")!});
    print("%%%%%%%%%%%");
    print(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      User user = User.fromJson(jsonDecode(response.body)["data"]);
      print(user.image);
      return user;
    } else if (jsonDecode(response.body)["msg"] ==
        "Token is expired or invalid") {
      prefs.remove("token");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SigninScreen(),
          ),
          (route) => false);
      return null;
    } else {
      return null;
    }
  } catch (error) {
    print("Error: $error");
    return null;
  }
}
