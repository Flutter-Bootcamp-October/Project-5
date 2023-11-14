import 'dart:convert';
import 'package:cv_app/main.dart';
import 'package:cv_app/models/skills.dart';
import 'package:http/http.dart' as http;

Future<List<Skill>> showSkills() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/skills");
  final response = await http.get(url, headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  List<Skill> skillObj = [];
  for (var skill in jsonDecode(response.body)['data']) {
    skillObj.add(Skill.fromJson(skill));
  }
  return skillObj;
}
