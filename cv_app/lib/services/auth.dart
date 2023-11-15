import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

Future<Response?> registration(Map body) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");
  final response = await https.post(
    url,
    body: jsonEncode(body),
  );
  print(response.body);
  return response;
}

// Future<Response?> otp(Map body) async {
//   final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");
//   final response = await https.post(
//     url,
//     body: jsonEncode(body),
//   );
//   print(response.body);
//   return response;
// }

Future<Response?> login(Map body) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
  final response = await https.post(
    url,
    body: jsonEncode(body),
  );
  print(response.body);
  return response;
}

// Future<Response?> display() async {
//   // SharedPreferences prefs = await SharedPreferences.getInstance();
//   final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
//   final response = await https.get(
//     url,
//   );
//   print(response.body);
//   return response;
// }
