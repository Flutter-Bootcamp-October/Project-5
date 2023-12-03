import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_5/api_methods/const_network.dart';
import 'package:project_5/main.dart';
import 'package:project_5/models/about_model.dart';
import 'package:http/http.dart' as https;
import 'package:project_5/models/education_model.dart';
import 'package:project_5/models/error_model.dart';
import 'package:project_5/models/project_model.dart';
import 'package:project_5/models/skill_model.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/utils/loading_screen.dart';

class PostUserMethodNetworking extends ConsentNetworking {
  // about
  Future<About?> addAboutMethod(
      {required Map body, required BuildContext context}) async {
    final url = Uri.https(urlApi, editAbout);

    final response = await https.post(url,
        body: json.encode(body),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return About.fromJson(json.decode(response.body));
    } else {
      if (response.statusCode == 401) {
        pref?.clear();
        return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoadingScreen()),
            (route) => false);
      }
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  uploadImageMethod({required File image}) async {
    var url = Uri.https(urlApi, upload);
    List<int> imageBytes = await image.readAsBytes();
    var response = await https.post(url,
        body: imageBytes,
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    return response;
  }

// skill
  Future<SkillModel?> addSkillMethod(
      {required Map body, required BuildContext context}) async {
    final url = Uri.https(urlApi, addSkills);

    final response = await https.post(url,
        body: json.encode(body),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return SkillModel.fromJson(json.decode(response.body));
    } else {
      if (response.statusCode == 401) {
        pref?.clear();
        return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoadingScreen()),
            (route) => false);
      }
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }
  // education

  Future<EducationModel?> addEducationMethod(
      {required Map body, required BuildContext context}) async {
    final url = Uri.https(urlApi, addEducation);

    final response = await https.post(url,
        body: json.encode(body),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return EducationModel.fromJson(json.decode(response.body));
    } else {
      if (response.statusCode == 401) {
        pref?.clear();
        return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoadingScreen()),
            (route) => false);
      }
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  //social
  Future<SocialModel?> addSocialMethod(
      {required Map body, required BuildContext context}) async {
    final url = Uri.https(urlApi, addSocialMedia);

    final response = await https.post(url,
        body: json.encode(body),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return SocialModel.fromJson(json.decode(response.body));
    } else {
      if (response.statusCode == 401) {
        pref?.clear();
        return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoadingScreen()),
            (route) => false);
      }
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  //project
  Future<ProjectModel?> addProjectMethod(
      {required Map body, required BuildContext context}) async {
    final url = Uri.https(urlApi, addProject);

    final response = await https.post(url,
        body: json.encode(body),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return ProjectModel.fromJson(json.decode(response.body));
    } else {
      if (response.statusCode == 401) {
        pref?.clear();
        return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoadingScreen()),
            (route) => false);
      }
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }
}
