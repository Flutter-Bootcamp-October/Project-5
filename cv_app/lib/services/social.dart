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

addSocial({required String username, required String social}) async {
  final url =
      Uri.parse("https://bacend-fshi.onrender.com/user/add/social_media");
  final body = {"username": username, "social": social};
  final response = await http.post(url,
      body: jsonEncode(body),
      headers: {"authorization": prefs.getString("token").toString()});
  return jsonDecode(response.body);
}

deleteSocial(String id) async {
  final url =
      Uri.parse("https://bacend-fshi.onrender.com/user/delete/social_media");
  final body = {"id_social": id};
  final response = await http.delete(url, body: jsonEncode(body), headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  return response;
}
