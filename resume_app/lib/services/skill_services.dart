import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resume_app/models/error_model.dart';
import 'package:resume_app/models/skill_model.dart';

class SkillServ {
  final String _api = "bacend-fshi.onrender.com";
  final String _get = '/user/skills';
  final String _add = '/user/add/skills';
  final String _delete = '/user/delete/skills';

  getSkills({required String token}) async {
    var url = Uri.https(_api, _get);
    var response = await http.get(url, headers: {"authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      List<Skill> temp = (json.decode(response.body)["data"] as List)
          .map((item) => Skill.fromJson(item))
          .toList();
      return temp;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }

  addSkill({required String token, required Skill skill}) async {
    var url = Uri.https(_api, _add);
    var response = await http.post(url,
        headers: {"authorization": token}, body: json.encode(skill.toJson()));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body)["msg"];
    } else {
      if (response.body.runtimeType == String) {
        final error =
            ErrorModel(msg: response.body, codeState: response.statusCode);
        throw FormatException(error.msg);
      } else {
        final error = ErrorModel.fromJson(json.decode(response.body));
        throw FormatException(error.msg);
      }
    }
  }

  deleteSkill({required String token, required String skillID}) async {
    var url = Uri.https(_api, _delete);
    var response = await http.delete(url,
        body: json.encode({"id_project": skillID}),
        headers: {"authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body)["msg"];
    } else {
      if (response.body.runtimeType == String) {
        final error =
            ErrorModel(msg: response.body, codeState: response.statusCode);
        throw FormatException(error.msg);
      } else {
        final error = ErrorModel.fromJson(json.decode(response.body));
        throw FormatException(error.msg);
      }
    }
  }
}
