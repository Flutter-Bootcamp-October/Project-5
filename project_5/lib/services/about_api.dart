import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:project_5/main.dart';
import 'package:project_5/models/error_model.dart';
import '../models/about_model.dart';

Future getAboutApi() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/about");

  final response = await http.get(url, headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  });

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return AboutModel.fromJson(json.decode(response.body));
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

Future uploadAboutImageApi({required File image}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/upload");

  final response = await http.post(url,
      headers: {
        "content-Type": "application/json",
        "authorization": pref.getToken()
      },
      body: await image.readAsBytes());
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return AboutModel.fromJson(json.decode(response.body));
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

//TODO: test [putDataAboutApi] and implement
Future putDataAboutApi(
    {required String name,
    required String titlePosition,
    required String phone,
    required String location,
    required String birthday,
    required String about}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/edit/about");

  final response = await http.put(url, headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  }, body: {
    "name": name,
    "title_position": titlePosition,
    "phone": phone,
    "location": location,
    "birthday": birthday,
    "about": about,
  });
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return AboutModel.fromJson(json.decode(response.body));
  } else if (response.statusCode >= 400) {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  } else {
    final err = ErrorModel.fromJson(json.decode(response.body));
    return err.msg;
  }
}

Future deleteAccount() async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/delete_account");
  final response = await http.delete(url, headers: {
    "content-Type": "application/json",
    "authorization": pref.getToken()
  });
  print(response.body);
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return "Account Deleted";
  } else {
    return ErrorModel.fromJson(json.decode(response.body));
  }
}
