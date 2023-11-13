import 'dart:convert';
import 'package:cv_app/main.dart';
import 'package:cv_app/models/about_model.dart';
import 'package:http/http.dart' as http;

Future<About> showAbout() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/about");
  final response = await http.get(url, headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  About aboutObj = About.fromJson(jsonDecode(response.body)['data']);
  return aboutObj;
}
