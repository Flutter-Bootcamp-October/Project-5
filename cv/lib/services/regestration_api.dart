import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

/*
registrationPost({required Map body}) async {
  try {
    var url = Uri.https("https://bacend-fshi.onrender.com/auth/registration");
    var response = await http.post(url,
        body: json.encode(body), headers: {'Content-Type': 'application/json'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response;
  } catch (e) {
    print(e);
  }
}
*/

Future<Response?> registrationPost(
    String name, String phone, String password, String email) async {
  try {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");
    final data = {
      "name": name,
      "phone": phone,
      "password": password,
      "email": email
    };

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
