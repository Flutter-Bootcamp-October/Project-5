import 'dart:developer';
import 'package:cv_app/main.dart';
import 'package:http/http.dart' as http;

showAbout() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/about");
  final response = await http.get(url, headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  log(response.body);
  return response;
}
