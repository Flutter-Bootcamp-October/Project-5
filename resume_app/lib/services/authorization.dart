import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resume_app/models/error_model.dart';

class Authorization {
  final String _api = "bacend-fshi.onrender.com";
  final String _registration = '/auth/registration';
  final String _login = '/auth/login';
  final String _verification = '/auth/verification';
  // final String _resetPassword = '/auth/rest_password';

  registrerUser({required Map body}) async {
    var url = Uri.https(_api, _registration);
    var response = await http.post(url, body: json.encode(body));
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body)["msg"];
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }

  loginUser({required Map body}) async {
    var url = Uri.https(_api, _login);
    var response = await http.post(url, body: json.encode(body));
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body)["msg"];
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }

  verifiyUserLogin({required Map body, required String token}) async {
    var url = Uri.https(_api, _verification);
    var response = await http
        .post(url, body: json.encode(body), headers: {'Authorization': token});
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body)["data"]["token"];
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }

  verifiyRegistration({required Map body}) async {
    var url = Uri.https(_api, _verification);
    var response = await http.post(url, body: json.encode(body));
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body)["data"]["token"];
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }
}
