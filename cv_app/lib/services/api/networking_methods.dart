import 'dart:convert';
import 'package:cv_app/models/about/about_model.dart';
import 'package:cv_app/models/authentiction/authentiction_model.dart';
import 'package:cv_app/models/delete_account/delete_account_model.dart';
import 'package:cv_app/models/education/education_model.dart';
import 'package:cv_app/models/error_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/otp/otp_msg_model.dart';
import 'package:cv_app/models/projects/project_model.dart';
import 'package:cv_app/models/skill/skill_model.dart';
import 'package:cv_app/models/social_media/social_media_model.dart';
import 'package:http/http.dart' as http;

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

  getUploadMethod() async {
    var url = Uri.https(_urlApi, _getUpload);
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response;
  }

  Future<EducationModel> getEducationMethod() async {
    var url = Uri.https(_urlApi, _getEducation);
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return EducationModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<EducationModel> deleteEducationMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _deleteEducation);
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

  Future<SocialMediaModel> getSocialMediaMethod() async {
    var url = Uri.https(_urlApi, _getSocialMedia);
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return SocialMediaModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<SocialMediaModel> addSocialMediaMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _addSocialMedia);
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

  Future<ProjectsModel> getProjectsMethod() async {
    var url = Uri.https(_urlApi, _getProjects);
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return ProjectsModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<ProjectsModel> addProjectMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _addProject);
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

  Future<DeleteAccountModel> deleteAccountMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _deleteAccount);
    var response = await http.delete(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return DeleteAccountModel.fromJson(json.decode(response.body));
    } else {
      final error = AuthentictionModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<AboutModel> updateAboutMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _updateAbute);
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
    var response = await http.post(url,
        body: json.encode(body),
        headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return AuthentictionModel.fromJson(json.decode(response.body));
    } else {
      final error = AuthentictionModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<AboutModel> getAboutMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _getabute);
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return AboutModel.fromJson(json.decode(response.body));
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

  Future<SkillsModel> getSkillsMethod() async {
    var url = Uri.https(_urlApi, _getSkills);
    var response = await http
        .get(url, headers: {"authorization": prefs.getString('token')!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return SkillsModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }

  Future<SkillsModel> removeSkillsMethod({required Map body}) async {
    var url = Uri.https(_urlApi, _deleteSkills);
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
