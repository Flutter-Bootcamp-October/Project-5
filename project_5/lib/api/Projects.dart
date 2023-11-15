import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_5/api/api_user.dart';
import 'package:project_5/model/Token.dart';
import 'package:project_5/model/user_model.dart';

class Projects extends ApiUser {
  final String _getproject = '/user/projects';
  final String _addProject = '/user/add/project';
  final String _deleteProject = '/user/delete/project';

  Future<UserData> getProject() async {
    try {
      String token = await Token().getUserToken();
      final http.Response response = await getMethod(
        endpoint: _getproject,
        token: token,
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final UserData userData = UserData.fromJson(jsonResponse['data']);
        return userData;
      } else {
        throw Exception('Failed to load user information');
      }
    } catch (error) {
      print('Error during user information retrieval: $error');
      throw error;
    }
  }

  Future<http.Response> postProject(body) async {
    try {
      String token = await Token().getUserToken();

      final http.Response response = await postMethod(
        body: body,
        endpoint: _addProject,
        token: token,
      );
      return response;
    } catch (error) {
      print('Error during Registration: $error');
      throw error;
    }
  }

  Future<http.Response> deleteProject(body) async {
    try {
      String? token = await Token().getUserToken();
      final http.Response response = await deleteMethod(
        endpoint: _deleteProject,
        token: token,
        body: body,
      );
      return response;
    } catch (error) {
      print('Error during account deletion: $error');
      throw error;
    }
  }
}
