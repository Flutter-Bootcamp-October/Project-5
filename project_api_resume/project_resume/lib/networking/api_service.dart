import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_resume/model/about_model.dart';
import 'package:project_resume/model/education_model.dart';
import 'package:project_resume/model/error_model.dart';
import 'package:project_resume/model/project_model.dart';
import 'package:project_resume/model/skill_model.dart';
import 'package:project_resume/model/social_model.dart';
import 'package:project_resume/shared_preferences/shared_preferences.dart';

Future sendDataRegistration({required Map body}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/auth/registration');
  final response = await http.post(apiUrl, body: jsonEncode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future verificationMethod({required Map body}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/auth/verification');
  final response = await http.post(apiUrl, body: jsonEncode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  final decodeRes = jsonDecode(response.body);
  return decodeRes;
}

Future sendDataRest({required String email}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/auth/rest_password');
  final Map<String, String> requestBody = {
    'email': email,
  };
  final response = await http.post(apiUrl, body: jsonEncode(requestBody));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future sendDataLogin({required Map body}) async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/auth/login');
  final response = await http.post(apiUrl, body: jsonEncode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future userUploadImage({required File userImge}) async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/upload');
  String? token = await getToken();
  List<int> bytes = await userImge.readAsBytes();
  final response = await http.post(
    apiUrl,
    body: jsonEncode(bytes),
    headers: {"authorization": token ?? ''},
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future<About> userAbout() async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/about');
  String? token = await getToken();
  final response = await http.get(
    apiUrl,
    headers: {"authorization": token ?? ''},
  );

  if (response.statusCode == 200) {
    return About.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 400) {
    print("We Couldn't found a user information using the sent token");
    return About();
  } else {
    final error = ErrorModel.fromJson(jsonDecode(response.body));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return About();
  }
}

Future userEditAbout({required Map body}) async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/edit/about');
  String? token = await getToken();
  final response = await http.put(
    apiUrl,
    body: jsonEncode(body),
    headers: {"authorization": token ?? ''},
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future userDeleteAccount({required String idUser}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/user/delete_account');
  String? token = await getToken();
  final response = await http.delete(apiUrl,
      body: jsonEncode({'userID': idUser}),
      headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future addProject({required Map body}) async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/add/project');
  String? token = await getToken();

  final response = await http.post(
    apiUrl,
    body: jsonEncode(body),
    headers: {"authorization": token ?? ''},
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future<Project> getProject() async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/projects');
  String? token = await getToken();
  final response =
      await http.get(apiUrl, headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Project.fromJson(jsonDecode(response.body));
  } else {
    final error = ErrorModel.fromJson(jsonDecode(response.body));
    throw FormatException(error.msg);
  }
}

Future deleteProject({required String idProject}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/user/delete/project');
  String? token = await getToken();
  final response = await http.delete(apiUrl,
      body: jsonEncode({'id_project': idProject}),
      headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future addSkill({required String skillData}) async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/add/skills');
  String? token = await getToken();
  final response = await http.post(apiUrl,
      body: jsonEncode(skillData), headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  final decodeRes = jsonDecode(response.body);
  return decodeRes;
}

Future getSkill() async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/skills');
  String? token = await getToken();
  final response =
      await http.get(apiUrl, headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Skill.fromJson(jsonDecode(response.body));
  } else {
    final error = ErrorModel.fromJson(jsonDecode(response.body));
    throw FormatException(error.msg);
  }
}

Future deleteSkill({required String idSkill}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/user/delete/skills');
  String? token = await getToken();
  final response = await http.delete(apiUrl,
      body: jsonEncode({'id_skill': idSkill}),
      headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future addSocial({required Map body}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/user/add/social_media');
  String? token = await getToken();
  final response = await http.post(apiUrl,
      body: jsonEncode(body), headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future getSocial() async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/user/social_media');
  String? token = await getToken();
  final response =
      await http.get(apiUrl, headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Social.fromJson(jsonDecode(response.body));
  } else {
    final error = ErrorModel.fromJson(jsonDecode(response.body));
    throw FormatException(error.msg);
  }
}

Future deleteSocial({required String idSocial}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/user/delete/social_media');
  String? token = await getToken();
  final response = await http.delete(apiUrl,
      body: jsonEncode({'id_skill': idSocial}),
      headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future addEducation({required Map body}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/user/add/education');
  String? token = await getToken();
  final response = await http.post(apiUrl,
      body: jsonEncode(body), headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future getEducation() async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/education');
  String? token = await getToken();
  final response =
      await http.get(apiUrl, headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Education.fromJson(jsonDecode(response.body));
  } else {
    final error = ErrorModel.fromJson(jsonDecode(response.body));
    throw FormatException(error.msg);
  }
}

Future deleteEducation({required String idEducation}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/user/delete/education');
  String? token = await getToken();
  final response = await http.delete(apiUrl,
      body: jsonEncode({'id_education': idEducation}),
      headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future getUsers() async {
  final apiUrl = Uri.parse('https://bacend-fshi.onrender.com/user/get_users');
  String? token = await getToken();
  final response =
      await http.get(apiUrl, headers: {"authorization": token ?? ''});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Education.fromJson(jsonDecode(response.body));
  } else {
    final error = ErrorModel.fromJson(jsonDecode(response.body));
    throw FormatException(error.msg);
  }
}
