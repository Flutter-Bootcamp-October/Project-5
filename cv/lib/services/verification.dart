import 'dart:convert';
import 'package:cv/main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response?> verificationPost(
    String otp, String email, String type) async {
  try {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");
    final data = {
      "otp": otp.trim(),
      "email": email.trim(),
      "type": type.trim(),
    };
    print(data);
    final response = await http.post(url,
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      prefs?.setString("token", jsonDecode(response.body)["data"]['token']);
      return response;
    } else {
      print(response);
      throw FormatException("data not found ");
    }
  } catch (e) {
    print(e);
    prefs?.clear();
    throw FormatException(e.toString());
  }
}
