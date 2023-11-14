import 'dart:convert';
import 'package:cv_app/main.dart';
import 'package:cv_app/models/social.dart';
import 'package:http/http.dart' as http;

Future<List<Social>> showSocial() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/social_media");
  final response = await http.get(url, headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  List<Social> socialObj = [];
  for (var skill in jsonDecode(response.body)['data']) {
    socialObj.add(Social.fromJson(skill));
  }
  return socialObj;
}
