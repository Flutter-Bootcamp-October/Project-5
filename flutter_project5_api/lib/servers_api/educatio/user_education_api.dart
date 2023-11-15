import 'dart:convert';

import 'package:flutter_project5_api/models/errorr.dart';

import 'package:flutter_project5_api/models/education.dart';
import 'package:http/http.dart' as http;

Future<Education> educatiion({required String token}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/education");
  final response = await http.get(url,
      headers: {"Authorization": token});

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Education.fromJson(json.decode(response.body));
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}
