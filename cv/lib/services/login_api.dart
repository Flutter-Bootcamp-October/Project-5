import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response?> loginPost(String password, String email) async {
  try {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
    final data = {"password": password, "email": email};

    final response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print('Response body: ${response.body}');
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      return response;
    } else {
      throw FormatException("data not found ");
    }
  } catch (e) {
    throw FormatException("there is error with body");
  }
}
