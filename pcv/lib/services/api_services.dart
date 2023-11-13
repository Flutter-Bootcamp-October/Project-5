import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Network {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _login = '/auth/login';
  final String _register = '/auth/registration';
  final String _verification = '/auth/verification';
  final String _rest = '/auth/rest_password';
  final String _about = '/user/about';
  final String _editAbout = '/user/edit/about';
  final String _upload = '/user/upload';
  final String _project = '/user/projects';
  final String _addProject = '/user/add/project';
  final String _deleteProject = '/user/delete/project';
  final String _skill = '/user/skills';
  final String _addSkill = '/user/add/skills';
  final String _deleteSkill = '/user/delete/skills';
  final String _social = '/user/social_media';
  final String _addSocial = '/user/add/social_media';
  final String _deleteSocial = '/user/delete/social_media';
  final String _education = '/user/education';
  final String _addEducation = '/user/add/education';
  final String _deleteEducation = '/user/delete/education';
  loginMethod(Map body) async {
    var url = Uri.https(_apiUrl, _login);
    var response = await http.post(url, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  registerMethod(Map body) async {
    var url = Uri.https(_apiUrl, _register);
    var response = await http.post(url, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  verificationMethod(Map body) async {
    var url = Uri.https(_apiUrl, _verification);
    var response = await http.post(url, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  restMethod(Map body) async {
    var url = Uri.https(_apiUrl, _rest);
    var response = await http.post(url, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  aboutMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _about);
    var response = await http.get(url, headers: {"Authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  aboutUploadMethod({required String token, required File image}) async {
    var url = Uri.https(_apiUrl, _upload);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: await image.readAsBytes());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  editAboutMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _editAbout);
    var response = await http.put(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  deleteAccountMethod({
    required String token,
  }) async {
    var url = Uri.https(_apiUrl, _editAbout);
    var response = await http.delete(
      url,
      headers: {"Authorization": token},
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  projectMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _project);
    var response = await http.get(url, headers: {"Authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  addProjectMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _addProject);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  deleteProjectMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteProject);
    var response = await http.delete(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  SkillMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _skill);
    var response = await http.get(url, headers: {"Authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  addSkillMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _addSkill);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  deleteSkillMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteSkill);
    var response = await http.delete(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  socialMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _social);
    var response = await http.get(url, headers: {"Authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  addsocialMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _addSocial);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  deletesocialMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteSocial);
    var response = await http.delete(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  educationMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _education);
    var response = await http.get(url, headers: {"Authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  addEducationMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _addEducation);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  deleteEducationMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteEducation);
    var response = await http.delete(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
}
