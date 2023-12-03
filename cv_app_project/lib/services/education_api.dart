import 'dart:convert';
import 'package:cv_app_project/global.dart';
import 'package:cv_app_project/models/education_model.dart';
import 'package:http/http.dart' as http;

Future<Education> getEducation() async {
  final url = Uri.parse('https://bacend-fshi.onrender.com/user/education');
  final response = await http.get(url, headers: {'authorization': token});
  final decodedResponse = jsonDecode(response.body);
  final object = Education.fromJson(decodedResponse);
  return object;
}
