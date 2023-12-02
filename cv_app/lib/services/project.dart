import 'dart:convert';

import 'package:cv_app/main.dart';
import 'package:cv_app/models/project.dart';
import 'package:http/http.dart' as http;

Future<List<Project>> showProjects() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/projects");
  final response = await http.get(url, headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  List<Project> projectObj = [];
  for (var project in jsonDecode(response.body)['data']) {
    projectObj.add(Project.fromJson(project));
  }
  return projectObj;
}

addProject({
  required String name,
  required String description,
  required String state,
}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/project");
  final body = {
    "name": name,
    "description": description,
    "state": state,
  };
  final response = await http.post(url,
      body: jsonEncode(body),
      headers: {"authorization": prefs.getString("token").toString()});
  return jsonDecode(response.body);
}

deleteProject(String id) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/delete/project");
  final body = {"id_project": id};
  final response = await http.delete(url, body: jsonEncode(body), headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  return response;
}
