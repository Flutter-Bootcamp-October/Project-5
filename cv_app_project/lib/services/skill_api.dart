import 'dart:convert';
import 'package:cv_app_project/global.dart';
import 'package:cv_app_project/models/skill_model.dart';
import 'package:http/http.dart' as http;

Future<Skill> getskill() async {
  final url = Uri.parse('https://bacend-fshi.onrender.com/user/skills');
  final response = await http.get(url, headers: {'authorization': token});
  final decodedResponse = jsonDecode(response.body);
  final object = Skill.fromJson(decodedResponse);
  return object;
}
