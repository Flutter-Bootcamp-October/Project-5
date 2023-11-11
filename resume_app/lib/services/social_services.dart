import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resume_app/models/error_model.dart';
import 'package:resume_app/models/social_model.dart';

class SocialServ {
  final String _api = "bacend-fshi.onrender.com";
  final String _get = '/user/social_media';
  final String _add = '/user/add/social_media';
  final String _delete = '/user/delete/social_media';

  getSocials({required String token}) async {
    var url = Uri.https(_api, _get);
    var response = await http.get(url, headers: {"authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      List<Social> temp = (json.decode(response.body)["data"] as List)
          .map((item) => Social.fromJson(item))
          .toList();
      return temp;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }

  addSocials({required String token, required Social account}) async {
    var url = Uri.https(_api, _add);
    var response = await http.post(url,
        headers: {"authorization": token}, body: json.encode(account.toJson()));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body)["msg"];
    } else {
      if (response.body.runtimeType == String) {
        final error =
            ErrorModel(msg: response.body, codeState: response.statusCode);
        throw FormatException(error.msg);
      } else {
        final error = ErrorModel.fromJson(json.decode(response.body));
        throw FormatException(error.msg);
      }
    }
  }

  deleteSocial({required String token, required String socialID}) async {
    var url = Uri.https(_api, _delete);
    var response = await http.delete(url,
        body: json.encode({"id_project": socialID}),
        headers: {"authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body)["msg"];
    } else {
      if (response.body.runtimeType == String) {
        final error =
            ErrorModel(msg: response.body, codeState: response.statusCode);
        throw FormatException(error.msg);
      } else {
        final error = ErrorModel.fromJson(json.decode(response.body));
        throw FormatException(error.msg);
      }
    }
  }
}
