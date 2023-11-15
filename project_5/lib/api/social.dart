import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_5/api/api_user.dart';
import 'package:project_5/model/Token.dart';
import 'package:project_5/model/user_model.dart';

class Social extends ApiUser {
  final String _getSocial = '/user/social_media';
  final String _postSocial = '/user/add/social_media';
  final String _deleteSocial = '/user/delete/social_media';

  Future<UserData> getSocial() async {
    try {
      String token = await Token().getUserToken();
      final http.Response response = await getMethod(
        endpoint: _getSocial,
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

  Future<http.Response> postSocial(body) async {
    try {
      String token = await Token().getUserToken();

      final http.Response response = await postMethod(
        body: body,
        endpoint: _postSocial,
        token: token,
      );
      return response;
    } catch (error) {
      print('Error during Registration: $error');
      throw error;
    }
  }

  Future<http.Response> deleteSocial(body) async {
    try {
      String? token = await Token().getUserToken();
      final http.Response response = await deleteMethod(
        endpoint: _deleteSocial,
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
