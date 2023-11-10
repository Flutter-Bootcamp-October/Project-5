import 'dart:convert';

import 'package:http/http.dart';

Future<Response> cearteAccount(Map body) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");
  final response = await post(url, body: jsonEncode(body));
  print(response.body);
  return response;
}
