import 'dart:convert';
import 'package:cv_app/main.dart';
import 'package:cv_app/models/users_model.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> showUsers() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/get_users");
  final response = await http.get(url, headers: {
    "authorization": "Bearer ${prefs.getString("token").toString()}"
  });
  List<Users> usersList = [];
  for (var user in jsonDecode(response.body)['data']) {
    usersList.add(Users.fromJson(user));
  }
  return usersList;
}
