import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/models/error_model.dart';

class ApiMethods {
  Future<Auth> createAccount({required Map body}) async {
    final url = Uri.parse("http://bacend-fshi.onrender.com/auth/registration");
    final response = await http.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200) {
      return Auth.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }
}
