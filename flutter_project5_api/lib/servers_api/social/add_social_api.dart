import 'dart:convert';

import 'package:flutter_project5_api/models/errorr.dart';

import 'package:flutter_project5_api/models/social.dart';
import 'package:flutter_project5_api/models/social2.dart';
import 'package:http/http.dart' as http;

Future<SocialMediaModel> addsocialmedia({required String token,required Map body}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/social_media");
  final response = await http.post(url,
      headers: {"Authorization": token});

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return SocialMediaModel.fromJson(json.decode(response.body));
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}
