import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_5/main.dart';
import 'package:project_5/models/error_model.dart';
import 'package:project_5/models/users_model.dart';

Future getUsers() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/get_users");
  final response = await http.get(url, headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  });
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return UsersModel.fromJson(json.decode(response.body));
  } else {
    return ErrorModel.fromJson(json.decode(response.body));
  }
}
