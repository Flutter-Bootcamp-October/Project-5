import 'dart:convert';
import 'package:http/http.dart' as http;

final netSkill = SkillNet();

class SkillNet {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _skill = '/user/skills';
  final String _addSkill = '/user/add/skills';
  final String _deleteSkill = '/user/delete/skills';
  skillMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _skill);
    try {
      var response = await http.get(url, headers: {"Authorization": token});
      return response;
    } catch (e) {}
  }

  addSkillMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _addSkill);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }

  deleteSkillMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteSkill);
    var response = await http.delete(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }
}
