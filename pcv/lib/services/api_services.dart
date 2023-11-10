import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _login = '/auth/login';
  final String _register = '/auth/registration';
  final String _verification = '/auth/verification';
  final String _rest = '/auth/rest_password';
  final String _about = '/user/about';

  loginMethod(Map body) async {
    var url = Uri.https(_apiUrl, _login);
    var response = await http.post(url, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  registerMethod(Map body) async {
    var url = Uri.https(_apiUrl, _register);
    var response = await http.post(url, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  verificationMethod(Map body) async {
    var url = Uri.https(_apiUrl, _verification);
    var response = await http.post(url, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  restMethod(Map body) async {
    var url = Uri.https(_apiUrl, _rest);
    var response = await http.post(url, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  aboutMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _about);
    var response = await http.get(url, headers: {"Authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
}
