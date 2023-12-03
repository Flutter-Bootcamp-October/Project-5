// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_5/api_methods/const_network.dart';
import 'package:project_5/main.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/models/education_model.dart';
import 'package:project_5/models/error_model.dart';
import 'package:project_5/models/project_model.dart';
import 'package:project_5/models/skill_model.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/models/user_model.dart';
import 'package:project_5/utils/loading_screen.dart';
import 'package:http/http.dart' as https;

class UserNetworkingMethods extends ConsentNetworking {
  //------------------About


  Future<About?>? getAboutMethod({required BuildContext context}) async {
    var url = Uri.https(urlApi, getAbout);

    var response = await https
        .get(url, headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return About.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 401) {
      pref?.clear();
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  //------------------Skills
  Future<SkillModel?>? getSkillsMethod({required BuildContext context}) async {
    var url = Uri.https(urlApi, getSkills);

    var response = await https
        .get(url, headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return SkillModel.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 401) {
      pref?.clear();
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  //------------------Educaton
  Future<EducationModel?>? getEducationMethod(
      {required BuildContext context}) async {
    var url = Uri.https(urlApi, getEducation);

    var response = await https
        .get(url, headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return EducationModel.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 401) {
      pref?.clear();
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  //------------------Social
  Future<SocialModel?>? getSocialMethod({required BuildContext context}) async {
    var url = Uri.https(urlApi, getSocialMedia);

    var response = await https
        .get(url, headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return SocialModel.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 401) {
      pref?.clear();
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  //------------------Project
  Future<ProjectModel?>? getProjectMethod(
      {required BuildContext context}) async {
    var url = Uri.https(urlApi, getProjects);

    var response = await https
        .get(url, headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return ProjectModel.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 401) {
      pref?.clear();
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  //------------------Users
  Future<UsersModel?>? getUsersMethod({required BuildContext context}) async {
    var url = Uri.https(urlApi, getAllUsers);

    var response = await https
        .get(url, headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return UsersModel.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 401) {
      pref?.clear();
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }
}
