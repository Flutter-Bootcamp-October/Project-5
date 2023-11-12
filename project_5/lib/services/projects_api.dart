import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_5/main.dart';
import 'package:project_5/models/error_model.dart';
import 'package:project_5/models/projects_model.dart';

//TODO: TEST THESE
Future getAboutApi() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/projects");

  final response = await http.get(url, headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  });

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return ProjectsModel.fromJson(json.decode(response.body));
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

Future<String> addProjects({
  required String name,
  required String description,
  required String state,
}) async {
  final data = {"name": name, "description": description, "state": state};
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/skills");

  final response = await http.post(url, body: jsonEncode(data), headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  });

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return response.body;
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

Future deleteProject({required projectId}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/delete/project");
  final response = await http.delete(url, headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  }, body: {
    "id_project": projectId
  });
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return "Account Deleted";
  } else {
    return ErrorModel.fromJson(json.decode(response.body));
  }
}
