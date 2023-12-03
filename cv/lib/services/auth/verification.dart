import 'dart:convert';

import 'package:http/http.dart';

Future<Response> verification(Map body) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");
  final response = await post(url, body: jsonEncode(body));
  print(response.body);
  return response;
}
