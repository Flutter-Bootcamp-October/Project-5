import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_5/api/api_user.dart';
import 'package:project_5/model/Token.dart';
import 'package:project_5/model/user_model.dart';

class Skills extends ApiUser {
  final String _getSkills = '/user/skills';
  final String _postSkills = '/user/add/skills';
  final String _deleteSkills = '/user/delete/skills';

  Future<UserData> getSkills() async {
    try {
      String token = await Token().getUserToken();
      final http.Response response = await getMethod(
        endpoint: _getSkills,
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

  Future<http.Response> postSkills(body) async {
    try {
      String token = await Token().getUserToken();

      final http.Response response = await postMethod(
        body: body,
        endpoint: _postSkills,
        token: token,
      );
      return response;
    } catch (error) {
      print('Error during Registration: $error');
      throw error;
    }
  }

  Future<http.Response> deleteSkills(body) async {
    try {
      String? token = await Token().getUserToken();
      final http.Response response = await deleteMethod(
        endpoint: _deleteSkills,
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
