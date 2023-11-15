 import 'dart:convert';
import 'package:flutter_project5_api/models/errorr.dart';
import 'package:flutter_project5_api/models/users.dart';
import 'package:http/http.dart' as http;

getAllUsers({required String token}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/get_users");
  final response = await http.get(url,headers: {"Authorization": token});

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

 if (response.statusCode >= 200 && response.statusCode < 300) {
    return Users.fromJson(json.decode(response.body));
  } else {
    return ErrorModel.fromJson(json.decode(response.body));
  }
}


