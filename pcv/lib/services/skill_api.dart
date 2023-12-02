import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pcv/main.dart';
import 'package:pcv/model/skill_model.dart';

final netSkill = SkillNet();

class SkillNet {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _skill = '/user/skills';
  final String _addSkill = '/user/add/skills';
  final String _deleteSkill = '/user/delete/skills';
  Future<List<SkillModel>?> skillMethod() async {
    var url = Uri.https(_apiUrl, _skill);
    try {
      List<SkillModel> skill = [];
      var response = await http
          .get(url, headers: {"Authorization": prefs!.getString("token")!});
      if (kDebugMode) {
        print(jsonDecode(response.body)["data"]);
      }
      if (response.statusCode == 200) {
        final data = SkillModel.fromJson(jsonDecode(response.body));
        skill.add(data);
        return skill;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  addSkillMethod({required Map body}) async {
    var url = Uri.https(_apiUrl, _addSkill);
    var response = await http.post(url,
        headers: {"Authorization": prefs!.getString("token")!},
        body: jsonEncode(body));
    return response;
  }

  deleteSkillMethod({required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteSkill);
    var response = await http.delete(url,
        headers: {"Authorization": prefs!.getString("token")!},
        body: jsonEncode(body));
    return response;
  }
}
