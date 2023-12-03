import 'dart:convert';
import 'package:http/http.dart' as http;

Future createAccount(
    String name, String phone, String email, String pass) async {
  final url = Uri.parse('https://bacend-fshi.onrender.com/auth/registration');
  final response = await http.post(
    url,
    headers: {},
    body: jsonEncode(
      {
        "name": name,
        "phone": phone,
        "email": email,
        "password": pass,
      },
    ),
  );
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return '1';
  } else {
    return '0';
  }
}
