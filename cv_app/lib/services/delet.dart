import 'dart:convert';

import 'package:cv_app/model/about_data.dart';
import 'package:cv_app/model/education_data.dart';
import 'package:cv_app/model/error_model.dart';
import 'package:cv_app/model/model.dart';
import 'package:cv_app/model/project_data.dart';
import 'package:cv_app/model/project_model.dart';
import 'package:cv_app/model/skills_data.dart';
import 'package:cv_app/model/skills_model.dart';
import 'package:cv_app/model/social_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Delete {
  Future<SkillsData> removeSkillsMethod({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url =
        Uri.parse("https://bacend-fshi.onrender.com/user/delete/skills");
    final response = await http.delete(url,
        body: jsonDecode(id),
        headers: {"authorization": prefs.getString("token")!});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return SkillsData.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }
}
