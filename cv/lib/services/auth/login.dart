import 'dart:convert';

import 'package:http/http.dart';

Future<Response> login(Map body) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
  final response = await post(url, body: jsonEncode(body));
  print(response.body);
  return response;
}
