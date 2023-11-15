import 'dart:convert';
import 'package:cv_app_project/global.dart';
import 'package:cv_app_project/models/community_model.dart';

import 'package:http/http.dart' as http;

Future<CommuityModel> getCommuity() async {
  final url = Uri.parse('https://bacend-fshi.onrender.com/user/get_users');
  final response = await http.get(url, headers: {'authorization': token});
  final decodedResponse = jsonDecode(response.body);
  final object = CommuityModel.fromJson(decodedResponse);
  return object;
}
