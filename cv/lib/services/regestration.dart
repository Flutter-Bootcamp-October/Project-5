import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendPostData(
    String name, String phone, String password, String email) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");
  final data = {
    "name": name,
    "phone": phone,
    "password": password,
    "email": email
  };

  final response = await http.post(url,
      body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
  print(response.statusCode);
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return "OK";
  } else {
    return "Filed";
  }
}
