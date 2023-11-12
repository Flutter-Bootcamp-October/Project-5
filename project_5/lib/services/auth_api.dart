import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_5/main.dart';
import 'package:project_5/models/error_model.dart';

// await pref.setToken(token);
Future registerApi(
    {required String name,
    required String phone,
    required String email,
    required String password}) async {
  final data = {
    "name": name,
    "phone": phone,
    "email": email,
    "password": password
  };

  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");

  final response = await http.post(url,
      body: jsonEncode(data), headers: {"content-Type": "application/json"});

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return "Ok";
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

Future<String> loginApi(
    {required String email, required String password}) async {
  final data = {
    "email": email,
    "password": password,
  };
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");

  final response = await http.post(url,
      body: jsonEncode(data), headers: {"content-Type": "application/json"});

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return "Ok";
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

void resetPasswordApi({required String email}) async {
  final data = {
    "email": email,
  };
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/rest_password");

  final response = await http.post(url,
      body: jsonEncode(data), headers: {"content-Type": "application/json"});
}

Future verificationApi(
    {required String otp, required String email, required String type}) async {
  //login or registration rest
  final data = {
    "otp": otp, // 412958
    "email": email,
    "type": type
  };

  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");

  final response = await http.post(url,
      body: jsonEncode(data), headers: {"content-Type": "application/json"});

  if (response.statusCode >= 200 && response.statusCode < 300) {
    pref.setToken(json.decode(response.body)["data"]["token"]);
    return "Ok";
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}
