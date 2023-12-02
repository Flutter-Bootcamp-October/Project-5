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

addEducation({
  required String graduationDate,
  required String university,
  required String college,
  required String specialization,
  required String level,
}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/education");
  final body = {
    "graduation_date": graduationDate,
    "university": university,
    "college": college,
    "specialization": specialization,
    "level": level
  };
  final response = await http.post(url,
      body: jsonEncode(body),
      headers: {"authorization": prefs.getString("token").toString()});
  return jsonDecode(response.body);
}

deleteEducation(String id) async {
  final url =
      Uri.parse("https://bacend-fshi.onrender.com/user/delete/education");
  final body = {"id_education": id};
  final response = await http.delete(url, body: jsonEncode(body), headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  return response;
}
