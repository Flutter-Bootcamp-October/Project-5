import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future registration(
    String name, String phone, String email, String password) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");
  Map body = {
    "name": name,
    "phone": phone,
    "email": email,
    "password": password
  };
  final response = await http.post(url, body: jsonEncode(body));

  return jsonDecode(response.body);
}

Future login(String email, String password) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
  Map body = {"email": email, "password": password};
  final response = await http.post(url, body: jsonEncode(body));
  return jsonDecode(response.body);
}

Future verification(String otp, String email, String type) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");
  Map body = {"otp": otp, "email": email, "type": type};
  final response = await http.post(url, body: jsonEncode(body));
  log(response.body.toString());
  return jsonDecode(response.body);
}

// Future<http.Response> restPassword(String email) async {
//   final url = Uri.parse("https://bacend-fshi.onrender.com/auth/rest_password");
//   Map body = {"email": email};
//   final response = await http.post(url, body: jsonEncode(body));
//   return jsonDecode(response.body);
// }
