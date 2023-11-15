import 'dart:convert';

import 'package:flutter_project5_api/models/errorr.dart';
import 'package:flutter_project5_api/models/project.dart';
import 'package:http/http.dart' as http;

Future<Project> deleteprojects({required String token, required Map body}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/delete/project");
  final response = await http.delete(url,
      headers: {"Authorization": token},body: jsonEncode(body));

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Project.fromJson(json.decode(response.body));
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}

