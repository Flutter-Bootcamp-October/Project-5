import 'dart:convert';
import 'dart:io';
import 'package:cv_app/models/about/about_model.dart';
import 'package:cv_app/models/all_users/all_users_model.dart';
import 'package:cv_app/models/authentiction/authentiction_model.dart';
import 'package:cv_app/models/delete_account/delete_account_model.dart';
import 'package:cv_app/models/education/education_model.dart';
import 'package:cv_app/models/error_model.dart';
import 'package:cv_app/models/otp/otp_msg_model.dart';
import 'package:cv_app/models/projects/project_model.dart';
import 'package:cv_app/models/skill/skill_model.dart';
import 'package:cv_app/models/social_media_model.dart';
import 'package:cv_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConsentNetworking {
  final String _urlApi = "bacend-fshi.onrender.com";
  final String _login = '/auth/login';
  final String _verification = '/auth/verification';
  final String _getSkills = '/user/skills';
  final String _deleteSkills = '/user/delete/skills';
  final String _addSkills = '/user/add/skills';
  final String _rest = '/auth/rest_password';
  final String _registration = '/auth/registration';
  final String _getabute = '/user/about';
  final String _updateAbute = '/user/edit/about';
  final String _deleteAccount = '/user/delete_account';
  final String _addProject = '/user/add/project';
  final String _getProjects = 'user/projects';
  final String _deleteProject = '/user/delete/project';
  final String _addSocialMedia = '/user/add/social_media';
  final String _getSocialMedia = '/user/social_media';
  final String _deleteSocialMedia = '/user/delete/social_media';
  final String _addEducation = '/user/add/education';
  final String _getEducation = '/user/education';
  final String _deleteEducation = '/user/delete/education';
  final String _getUpload = '/user/upload';
  final String _getUsers = '/user/get_users';

  addUploadMethod(File image) async {
    var url = Uri.https(_urlApi, _getUpload);
    final prefs = await SharedPreferences.getInstance();
    List<int> bytes = await image.readAsBytes();
    var response = await http.post(url,
        body: bytes, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  Future<AllUsersModel?>? getAllUsersMethod(
      {required BuildContext context}) async {
    print("start get");
    var url = Uri.https(_urlApi, _getUsers);
    print(url);
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print(response.body);
      return AllUsersModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      prefs.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<EducationModel?>? getEducationMethod(
      {required BuildContext context}) async {
    print("start get");
    var url = Uri.https(_urlApi, _getEducation);
    print(url);
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print(response.body);
      return EducationModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      prefs.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<EducationModel> deleteEducationMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _deleteEducation);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.delete(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return EducationModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<EducationModel> addEducationMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _addEducation);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.post(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return EducationModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<SocialMediaModel> deleteSocialMediaMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _deleteSocialMedia);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.delete(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return SocialMediaModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<SocialMediaModel?>? getSocialMediaMethod(
      {required BuildContext context}) async {
    var url = Uri.https(_urlApi, _getSocialMedia);
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return SocialMediaModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      prefs.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<SocialMediaModel> addSocialMediaMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _addSocialMedia);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.post(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return SocialMediaModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<SkillsModel> addSkillsMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _addSkills);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.post(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return SkillsModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<ProjectsModel> deleteProjecttMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _deleteProject);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.delete(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return ProjectsModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<ProjectsModel?>? getProjectsMethod(
      {required BuildContext context}) async {
    var url = Uri.https(_urlApi, _getProjects);
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return ProjectsModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      prefs.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<ProjectsModel> addProjectMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _addProject);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.post(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return ProjectsModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<DeleteAccountModel> deleteAccountMethod() async {
    var url = Uri.https(_urlApi, _deleteAccount);
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .delete(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    prefs.remove('token');

    if (response.statusCode == 200) {
      return DeleteAccountModel.fromJson(json.decode(response.body));
    } else {
      final error = AuthentictionModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<AboutModel> updateAboutMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _updateAbute);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.put(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return AboutModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<AuthentictionModel> loginMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _login);
    var response = await http.post(
      url,
      body: json.encode(body),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return AuthentictionModel.fromJson(json.decode(response.body));
    } else {
      final error = AuthentictionModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<AboutModel?>? getAboutMethod({required BuildContext context}) async {
    var url = Uri.https(_urlApi, _getabute);
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return AboutModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      prefs.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<AuthentictionModel> registrationMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _registration);
    var response = await http.post(url, body: json.encode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return AuthentictionModel.fromJson(json.decode(response.body));
    } else {
      final error = AuthentictionModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<OTPModel> verificationMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _verification);
    var response = await http.post(url, body: json.encode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return OTPModel.fromJson(json.decode(response.body));
    } else {
      final error = AuthentictionModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<SkillsModel?>? getSkillsMethod({required BuildContext context}) async {
    var url = Uri.https(_urlApi, _getSkills);
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return SkillsModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      prefs.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<SkillsModel> removeSkillsMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _deleteSkills);
    final prefs = await SharedPreferences.getInstance();
    var response = await http.delete(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return SkillsModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<AuthentictionModel> resetPasswordMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _rest);
    var response = await http.post(url, body: json.encode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return AuthentictionModel.fromJson(json.decode(response.body));
    } else {
      final error = AuthentictionModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }
}
