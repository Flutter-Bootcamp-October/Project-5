import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_5/main.dart';
import 'package:project_5/models/education_model.dart';
import 'package:project_5/models/error_model.dart';

Future getEducationData() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/education");

  final response = await http.get(url, headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  });

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return EducationModel.fromJson(json.decode(response.body));
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

Future<String> addEducation({
  required String level,
  required String specialization,
  required String college,
  required String university,
  required String gradDate,
}) async {
  final data = {
    "graduation_date": gradDate,
    "university": university,
    "college": college,
    "specialization": specialization,
    "level": level,
  };
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/education");

  final response = await http.post(url, body: jsonEncode(data), headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  });
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return response.body;
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

Future deleteEducation({required educationId}) async {
  final url =
      Uri.parse("https://bacend-fshi.onrender.com/user/delete/education");
  final data = {"id_education": educationId};
  final response = await http.delete(url,
      headers: {
        "content-Type": "application/json",
        "authorization": pref.getToken()
      },
      body: jsonEncode(data));
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return "Account Deleted";
  } else {
    return ErrorModel.fromJson(json.decode(response.body));
  }
}
