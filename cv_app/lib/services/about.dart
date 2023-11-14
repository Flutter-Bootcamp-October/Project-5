import 'dart:convert';
import 'package:cv_app/main.dart';
import 'package:cv_app/models/about_model.dart';
import 'package:http/http.dart' as http;

uploadeImg() {}

Future<About> showAbout() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/about");
  final response = await http.get(url, headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  About aboutObj = About.fromJson(jsonDecode(response.body)['data']);
  return aboutObj;
}

Future editAbout(
    {required String name,
    required String titlePosition,
    required String phone,
    required String location,
    required String birthday,
    required String about}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/edit/about");
  final body = {
    "name": name,
    "title_position": titlePosition,
    "phone": phone,
    "location": location,
    "birthday": birthday,
    "about": about
  };
  final response = await http.put(url,
      body: jsonEncode(body),
      headers: {"authorization": prefs.getString("token").toString()});
  return jsonDecode(response.body);
}

deleteAccount() {}
