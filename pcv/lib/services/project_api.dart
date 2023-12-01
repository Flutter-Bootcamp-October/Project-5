import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pcv/main.dart';
import 'package:pcv/model/project_model.dart';

final projectNet = NetProject();

class NetProject {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _project = '/user/projects';
  final String _addProject = '/user/add/project';
  final String _deleteProject = '/user/delete/project';
  Future<List<ProjectModel>?> projectMethod() async {
    var url = Uri.https(_apiUrl, _project);
    List<ProjectModel> project = [];
    try {
      var response = await http
          .get(url, headers: {"Authorization": prefs!.getString("token")!});
       if (response.statusCode == 200) {
        final data = ProjectModel.fromJson(jsonDecode(response.body));
        project.add(data);
        return project;
      }
    } catch (e) {return null;}
    return null;
  }

  addProjectMethod({required Map body}) async {
    var url = Uri.https(_apiUrl, _addProject);
    var response = await http.post(url,
        headers: {"Authorization": prefs!.getString("token")!},
        body: jsonEncode(body));
    return response;
  }

  deleteProjectMethod({required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteProject);
    var response = await http.delete(url,
        headers: {"Authorization": prefs!.getString('token')!},
        body: jsonEncode(body));
    return response;
  }
}
