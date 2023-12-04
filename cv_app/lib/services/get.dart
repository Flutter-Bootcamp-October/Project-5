import 'dart:convert';

import 'package:cv_app/model/about_data.dart';
import 'package:cv_app/model/education_data.dart';
import 'package:cv_app/model/error_model.dart';
import 'package:cv_app/model/model.dart';
import 'package:cv_app/model/project_data.dart';
import 'package:cv_app/model/project_model.dart';
import 'package:cv_app/model/skills_data.dart';
import 'package:cv_app/model/skills_model.dart';
import 'package:cv_app/model/social_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Get {
  // ====================project===================
  Future<List<ProjectData>> getProject() async {
    List<ProjectData> projectsList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/projects");
    final response = await http
        .get(url, headers: {"authorization": prefs.getString("token")!});
    final jsonResponse = jsonDecode(response.body)["data"];

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      for (var element in jsonResponse) {
        projectsList.add(ProjectData.fromJson(element));
      }
      return projectsList;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  // ====================Education===================
  Future<List<EducationData>> getEducation() async {
    List<EducationData> educationList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/education");
    final response = await http
        .get(url, headers: {"authorization": prefs.getString("token")!});
    final jsonResponse = jsonDecode(response.body)["data"];

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      for (var element in jsonResponse) {
        educationList.add(EducationData.fromJson(element));
      }
      return educationList;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  // ====================Social===================
  Future<List<SocialData>> getSocial() async {
    List<SocialData> socialList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/social_media");
    final response = await http
        .get(url, headers: {"authorization": prefs.getString("token")!});
    final jsonResponse = jsonDecode(response.body)["data"];

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      for (var element in jsonResponse) {
        socialList.add(SocialData.fromJson(element));
      }
      return socialList;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  // ====================Skills===================
  Future<List<SkillsData>> getSkills() async {
    List<SkillsData> skillsList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/skills");
    final response = await http
        .get(url, headers: {"authorization": prefs.getString("token")!});
    final jsonResponse = jsonDecode(response.body)["data"];

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      for (var element in jsonResponse) {
        skillsList.add(SkillsData.fromJson(element));
      }
      return skillsList;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  // ===========================About===========================
  Future<List<AboutData>> getAbout() async {
    List<AboutData> aboutList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/about");
    final response = await http
        .get(url, headers: {"authorization": prefs.getString("token")!});
    final jsonResponse = jsonDecode(response.body)["data"];

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      for (var element in jsonResponse) {
        aboutList.add(AboutData.fromJson(element));
      }
      return aboutList;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<List<Allusers>> getusers() async {
    List<Allusers> usersList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/get_users");
    final response = await http
        .get(url, headers: {"authorization": prefs.getString("token")!});
    final jsonResponse = jsonDecode(response.body)["data"];

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      for (var element in jsonResponse) {
        usersList.add(Allusers.fromJson(element));
      }
      return usersList;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }
}
