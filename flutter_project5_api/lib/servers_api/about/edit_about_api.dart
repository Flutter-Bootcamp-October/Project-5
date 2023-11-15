import 'dart:convert';
import 'package:flutter_project5_api/models/about.dart';
import 'package:flutter_project5_api/models/errorr.dart';
import 'package:http/http.dart' as http;




Future<About> editAbout({required String token,required Map body}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/edit/about");
  final response = await http.put(url,headers: {"Authorization": token}, body: json.encode(body));

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return About.fromJson(json.decode(response.body));
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}

