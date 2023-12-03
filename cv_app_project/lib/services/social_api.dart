import 'dart:convert';
import 'package:cv_app_project/global.dart';
import 'package:cv_app_project/models/social_model.dart';
import 'package:http/http.dart' as http;

Future<Social> getSocial() async {
  final url = Uri.parse('https://bacend-fshi.onrender.com/user/social_media');
  final response = await http.get(url, headers: {'authorization': token});
  final decodedResponse = jsonDecode(response.body);
  final object = Social.fromJson(decodedResponse);
  return object;
}
