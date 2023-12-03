import 'dart:convert';

import 'package:project_5/api_methods/const_network.dart';
import 'package:project_5/models/auth_model.dart';
import 'package:http/http.dart' as https;
import 'package:project_5/models/error_model.dart';
import 'package:project_5/models/verification_model.dart';

class AuthMethodNetworking extends ConsentNetworking {
  // ------ registration
  Future<Auth> createAccount({required Map<String, dynamic> body}) async {
    var url = Uri.https(urlApi, registration);
    var response = await https.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      final convertResponse = Auth.fromJson(json.decode(response.body));
      return convertResponse;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  // ------ login
  Future<Auth> loginMethod({required Map<String, dynamic> body}) async {
    var url = Uri.https(urlApi, login);
    var response = await https.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      final convertResponse = Auth.fromJson(json.decode(response.body));
      return convertResponse;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  // ------ verification
  Future<Verification> verificationMethod(
      {required Map<String, dynamic> body}) async {
    var url = Uri.https(urlApi, verification);
    var response = await https.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      final convertResponse = Verification.fromJson(json.decode(response.body));
      return convertResponse;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }
}
