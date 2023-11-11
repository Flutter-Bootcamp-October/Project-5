import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resume_app/models/error_model.dart';
import 'package:resume_app/models/project_model.dart';

class ProjectServ {
  final String _api = "bacend-fshi.onrender.com";
  final String _projects = '/user/projects';
  final String _add = '/user/add/project';
  final String _delete = '/user/delete/project';

  getProjects({required String token}) async {
    var url = Uri.https(_api, _projects);
    var response = await http.get(url, headers: {"authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> temp = json.decode(response.body)["data"];
      return List.from(temp).map((e) => Project.fromJson(e)).toList();
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }

  addProject({required String token, required Project project}) async {
    var url = Uri.https(_api, _add);
    var response = await http.post(url,
        headers: {"authorization": token}, body: json.encode(project.toJson()));
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

  deleteProject({required String token, required String projectID}) async {
    var url = Uri.https(_api, _delete);
    var response = await http.delete(url,
        body: json.encode({"id_project": projectID}),
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
