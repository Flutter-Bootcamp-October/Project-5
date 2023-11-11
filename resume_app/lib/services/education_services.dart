import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resume_app/models/error_model.dart';
import 'package:resume_app/models/education_model.dart';

class EducationServ {
  final String _api = "bacend-fshi.onrender.com";
  final String _get = '/user/education';
  final String _add = '/user/add/education';
  final String _delete = '/user/delete/education';

  getEducation({required String token}) async {
    var url = Uri.https(_api, _get);
    var response = await http.get(url, headers: {"authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      List<Education> temp = (json.decode(response.body)["data"] as List)
          .map((item) => Education.fromJson(item))
          .toList();
      return temp;
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }

  addEducation({required String token, required Education edu}) async {
    var url = Uri.https(_api, _add);
    var response = await http.post(url,
        headers: {"authorization": token}, body: json.encode(edu.toJson()));
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

  deleteEducation({required String token, required String educationID}) async {
    var url = Uri.https(_api, _delete);
    var response = await http.delete(url,
        body: json.encode({"id_project": educationID}),
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
