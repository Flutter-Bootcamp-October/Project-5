import 'dart:convert';
import 'package:cv_app_project/global.dart';
import 'package:cv_app_project/models/project_model.dart';
import 'package:http/http.dart' as http;

Future<Project> getProject() async {
  final url = Uri.parse('https://bacend-fshi.onrender.com/user/projects');
  final response = await http.get(url, headers: {'authorization': token});
  final decodedResponse = jsonDecode(response.body);
  final object = Project.fromJson(decodedResponse);
  return object;
}
