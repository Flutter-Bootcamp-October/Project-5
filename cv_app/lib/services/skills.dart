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

addSkill({
  required String skill,
}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/skills");
  final body = {
    "skill": skill,
  };
  final response = await http.post(url,
      body: jsonEncode(body),
      headers: {"authorization": prefs.getString("token").toString()});
  return jsonDecode(response.body);
}

deleteSkill(String id) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/delete/skills");
  final body = {"id_skill": id};
  final response = await http.delete(url, body: jsonEncode(body), headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  return response;
}
