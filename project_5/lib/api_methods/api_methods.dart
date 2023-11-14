import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:project_5/models/about_model.dart';
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/models/error_model.dart';
import 'package:project_5/models/skill_model.dart';
import 'package:project_5/models/verification_model.dart';
import 'package:project_5/screens/auth/login_screen.dart';

class ApiMethods {
  //
  Future<Auth> createAccount({required Map body}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/registration");
    final response = await https.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return Auth.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  Future<Verification> emailVerification({required Map body}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");
    final response = await https.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return Verification.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

// edit on login method
  Future<Auth> login({required Map body}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
    final response = await https.post(url,
        body: json.encode(body),
        headers: {"authorization": pref!.getString('token') ?? ""});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    //get token

    if (response.statusCode == 200 || response.statusCode < 300) {
      return Auth.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  Future<Auth> resetPassword({required Map body}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/auth/login");
    final response = await https.post(url, body: json.encode(body));
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return Auth.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  Future<About> uploadImage({required Map body, required String token}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/upload");
    final response = await https
        .post(url, body: json.encode(body), headers: {"authorization": token});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return About.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  Future getAbout({required String token}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/about");
    final response = await https.get(url, headers: {"authorization": token});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return About.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  // Future<About> editAbout({required String token, required Map body}) async {
  //   final url = Uri.parse("https://bacend-fshi.onrender.com/user/edit/about");
  //   final response =
  //       await https.put(url, body: {}, headers: {"authorization": token});
  //   print("Response body: ${response.body}");
  //   print("Response status: ${response.statusCode}");

  //   if (response.statusCode == 200 || response.statusCode < 300) {
  //     return About.fromJson(json.decode(response.body));
  //   } else {
  //     final error = ErrorModel.fromJson(json.decode(response.body));
  //     throw FormatException(error.msg!);
  //   }
  // }

  deleteAccount({required String token, required String aboutId}) async {
    final url =
        Uri.parse("https://bacend-fshi.onrender.com/user/delete_account");
    final response = await https.delete(url,
        body: json.encode({"id": aboutId}), headers: {"authorization": token});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    return response;
  }

  Future<SkillModel> getSkill({required String token}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/skills");
    final response = await https.get(url, headers: {"authorization": token});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return SkillModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  Future<SkillModel> addSkill(
      {required String token, required Map body}) async {
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/skills");
    final response =
        await https.post(url, body: body, headers: {"authorization": token});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode < 300) {
      return SkillModel.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg!);
    }
  }

  removeSkill({required String token, required String idSkill}) async {
    final url =
        Uri.parse("https://bacend-fshi.onrender.com/user/delete/skills");
    final response = await https.delete(url,
        body: json.encode({"id_skill": idSkill}),
        headers: {"authorization": token});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    return response;
  }
}
