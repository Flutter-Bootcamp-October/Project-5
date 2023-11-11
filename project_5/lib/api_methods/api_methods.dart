import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/models/error_model.dart';
import 'package:project_5/models/verification_model.dart';

class ApiMethods {
  Future<Auth> createAccount({required Map body}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");
    final response = await https.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return Auth.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  Future<Verification> emailVerification({required Map body}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");
    final response = await https.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return Verification.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }
}
