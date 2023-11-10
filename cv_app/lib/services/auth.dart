import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> registration(
    String name, String phone, String email, String password) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");
  Map body = {
    "name": name,
    "phone": phone,
    "email": email,
    "password": password
  };
  final response = await http.post(url, body: jsonEncode(body));
  return response;
}

Future<http.Response> login(String email, String password) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
  Map body = {"email": email, "password": password};
  final response = await http.post(url, body: jsonEncode(body));
  return response;
}

Future<http.Response> verification(int otp, String email, String type) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
  Map body = {"otp": otp, "email": email, "type": type};
  final response = await http.post(url, body: jsonEncode(body));
  return response;
}

Future<http.Response> restPassword(String email) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
  Map body = {"email": email};
  final response = await http.post(url, body: jsonEncode(body));
  return response;
}
