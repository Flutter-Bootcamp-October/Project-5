// ignore_for_file: empty_catches, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pcv/main.dart';
import 'package:pcv/model/about_model.dart';
import 'package:pcv/model/user_model.dart';

final netAbout = AboutNet();

class AboutNet {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _about = '/user/about';
  final String _editAbout = '/user/edit/about';
  final String _upload = '/user/upload';
  final String _delete = '/user/delete_account';
  final String _getUser = '/user/get_users';

  Future<AboutModel?> aboutMethod() async {
    var url = Uri.https(_apiUrl, _about);
    try {
      AboutModel about;
      var response = await http.get(url,
          headers: {"Authorization": prefs!.getString("token") ?? ""});
      if (kDebugMode) {
        print(prefs!.getString("token"));
      }
      if (response.statusCode == 200) {
        about = AboutModel.fromJson(jsonDecode(response.body));
        return about;
      } else if (response.statusCode == 401) {
        prefs?.clear();
        return null;
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

  deleteAccountMethod() async {
    var url = Uri.https(_apiUrl, _delete);
    var response = await http.delete(
      url,
      headers: {"Authorization": prefs!.getString("token")!},
    );
    return response;
  }

  Future<UserModel?> getUserMethod() async {
    var url = Uri.https(_apiUrl, _getUser);
    try {
      var response = await http
          .get(url, headers: {"Authorization": prefs!.getString("token")!});
      return UserModel.fromJson(jsonDecode(response.body));
    } catch (error) {}
    return null;
  }
}
