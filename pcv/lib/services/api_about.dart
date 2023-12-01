// ignore_for_file: empty_catches, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pcv/main.dart';
import 'package:pcv/model/about_model.dart';
import 'package:pcv/views/auth/sign_in_screen.dart';

final netAbout = AboutNet();
class AboutNet {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _about = '/user/about';
  final String _editAbout = '/user/edit/about';
  final String _upload = '/user/upload';
  final String _delete = '/user/delete_account';
  final String _getUser = '/user/get_users';

  Future<AboutModel?> aboutMethod({required BuildContext context}) async {
    var url = Uri.https(_apiUrl, _about);
    try {
      var response = await http.get(url,
          headers: {"Authorization": prefs!.getString("token") ?? ""});
      if (response.statusCode == 200) {
        return AboutModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        prefs?.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
            (route) => false);
      }
    } catch (e) {}

    return null;
  }

  aboutUploadMethod({required File image}) async {
    var url = Uri.https(_apiUrl, _upload);
    var response = await http.post(url,
        headers: {"Authorization": prefs!.getString("token") ?? ""},
        body: await image.readAsBytes());
    return response;
  }

  editAboutMethod({required Map body}) async {
    var url = Uri.https(_apiUrl, _editAbout);
    var response = await http.put(url,
        headers: {"Authorization": prefs!.getString("token")!},
        body: jsonEncode(body));
    return response;
  }

  deleteAccountMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _delete);
    var response = await http.delete(
      url,
      headers: {"Authorization": prefs!.getString("token")!},
    );
    return response;
  }

  Future<AboutModel?> getUserMethod({required BuildContext context}) async {
    var url = Uri.https(_apiUrl, _getUser);
    var response = await http
        .get(url, headers: {"Authorization": prefs!.getString("token")!});
    return AboutModel.fromJson(jsonDecode(response.body));
  }
}
