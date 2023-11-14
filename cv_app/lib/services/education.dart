import 'dart:convert';

import 'package:cv_app/main.dart';
import 'package:cv_app/models/education.dart';
import 'package:http/http.dart' as http;

Future<List<Education>> showEducation() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/education");
  final response = await http.get(url, headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  List<Education> educationObj = [];
  for (var project in jsonDecode(response.body)['data']) {
    educationObj.add(Education.fromJson(project));
  }
  return educationObj;
}
