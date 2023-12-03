import 'dart:convert';
import 'package:cv_application_api/model/error_model.dart';
import 'package:cv_application_api/model/user_model.dart';
import 'package:http/http.dart' as http;

Future<User> createAccount(Map body, {required}) async {
  final url = Uri.parse('https://bacend-fshi.onrender.com/auth/registration');
  final response = await http.post(url, body: jsonEncode(body));

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw Exception(error.msg.toString());
  }
}
