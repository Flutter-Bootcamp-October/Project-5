import 'dart:convert';

import 'package:cv_app/model/education_model.dart';
import 'package:cv_app/model/skills_model.dart';
import 'package:cv_app/model/social.dart';
import 'package:http/http.dart' as http;
import 'package:cv_app/model/error_model.dart';
import 'package:cv_app/model/project_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostAdd {
  //--------------------------------------------
  Future<ProjectModel> addProject(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/project");
    final response = await http.post(url,
        body: jsonEncode(body),
        headers: {"authorization": prefs.getString("token")!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return ProjectModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  //---------------------------------------------
  Future<EducationModel> addEducation(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url =
        Uri.parse("https://bacend-fshi.onrender.com/user/add/education");
    final response = await http.post(url,
        body: jsonEncode(body),
        headers: {"authorization": prefs.getString("token")!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return EducationModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

//--------------------------------------------
  Future<SocialModel> addSocial(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url =
        Uri.parse("https://bacend-fshi.onrender.com/user/add/social_media");
    final response = await http.post(url,
        body: jsonEncode(body),
        headers: {"authorization": prefs.getString("token")!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return SocialModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  //--------------------------------------------
  Future<SkillsModel> addSkills(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/skills");
    final response = await http.post(url,
        body: jsonEncode(body),
        headers: {"authorization": prefs.getString("token")!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return SkillsModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  //--------------------------------------------
  Future<Response> addImage(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/upload");
    final response = await http.post(url,
        body: jsonEncode(body),
        headers: {"authorization": prefs.getString("token")!});

    print(response.body);
    return response;
  }
}
