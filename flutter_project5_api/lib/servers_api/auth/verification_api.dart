import 'dart:convert';
import 'package:flutter_project5_api/models/auth.dart';
import 'package:flutter_project5_api/models/errorr.dart';
import 'package:http/http.dart' as http;

Future<Auth> verification({required Map body}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");
  final response = await http.post(url, body: json.encode(body));

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Auth.fromJson(json.decode(response.body));
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}
