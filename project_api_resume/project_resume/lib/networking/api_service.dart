import 'dart:convert';

import 'package:http/http.dart' as http;

Future sendDataRegistration({required Map body}) async {
  final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/auth/registration');
  final response = await http.post(apiUrl, body: jsonEncode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;
}

Future verificationMethod({required Map body})async{
 final apiUrl =
      Uri.parse('https://bacend-fshi.onrender.com/auth/verification');
      final response = await http.post(apiUrl, body: jsonEncode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;

}

Future sendDataLogin({required Map body})async{
      final apiUrl =Uri.parse('https://bacend-fshi.onrender.com/auth/login');
  final response = await http.post(apiUrl, body: jsonEncode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response;

}


