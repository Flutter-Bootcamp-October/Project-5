import 'dart:convert';
import 'package:http/http.dart' as http;

final projectNet = NetProject();

class NetProject {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _project = '/user/projects';
  final String _addProject = '/user/add/project';
  final String _deleteProject = '/user/delete/project';
  projectMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _project);
    try {
      var response = await http.get(url, headers: {"Authorization": token});
      return response;
    } catch (e) {}
  }

  addProjectMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _addProject);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }

  deleteProjectMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteProject);
    var response = await http.delete(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }
}
