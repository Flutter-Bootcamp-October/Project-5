// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable

import 'dart:convert';
import 'package:cv_application_api/model/error_model.dart';
import 'package:cv_application_api/model/user_info_model.dart';
import 'package:cv_application_api/pages/check_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<UserInfo?> getUserInfo({required BuildContext context}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token")!;

  final url = Uri.parse('https://bacend-fshi.onrender.com/user/about');
  final response =
      await http.get(url, headers: {'Authorization': 'Bearer $token'});
  print(prefs.getString("token"));

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return UserInfo.fromJson(json.decode(response.body));
  } else if (response.statusCode == 401) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CheckAuthScreen()),
        (route) => false);
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw Exception(error.msg.toString());
  }
}

Future<UserInfo?> updateUserInfo(Map body,
    {required BuildContext context}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token")!;

  final url = Uri.parse('https://bacend-fshi.onrender.com/user/edit/about');
  final response = await http.put(url,
      body: jsonEncode(body),
      headers: <String, String>{'Authorization': token});
  // log(prefs.getString("token").toString());

  // log('Response status: ${response.statusCode}');
  // log('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return UserInfo.fromJson(json.decode(response.body));
  } else if (response.statusCode == 401) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CheckAuthScreen()),
        (route) => false);
  } else if (response.statusCode == 401) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CheckAuthScreen()),
        (route) => false);
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw Exception(error.msg.toString());
  }
}

Future<UserInfo?> deleteUserInfo(Map body,
    {required BuildContext context}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token")!;

  final url = Uri.parse('https://bacend-fshi.onrender.com/user/delete_account');
  final response = await http.delete(url,
      body: jsonEncode(body),
      headers: <String, String>{'Authorization': token});
  // log(prefs.getString("token").toString());

  // log('Response status: ${response.statusCode}');
  // log('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return UserInfo.fromJson(json.decode(response.body));
  } else if (response.statusCode == 401) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CheckAuthScreen()),
        (route) => false);
  } else if (response.statusCode == 401) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CheckAuthScreen()),
        (route) => false);
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw Exception(error.msg.toString());
  }
}
