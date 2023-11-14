import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:project_5/api/api_user.dart';
import 'package:project_5/model/user_model.dart';

class About extends ApiUser {
  final String _uploadImg = '/user/about';
  final String _userAbout = '/user/about';
  final String _userEditAbout = '/user/edit/about';
  final String _deleteAccount = '/user/delete_account';

  Future<http.Response> postUploadImg() async {
    try {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        throw Exception('No image selected');
      }
      var request = http.MultipartRequest('POST', Uri.parse(_uploadImg));
      request.files.add(await http.MultipartFile.fromPath('file', image.path));
      String? token = await getUserToken();
      request.headers['Authorization'] = 'Bearer $token';
      final http.StreamedResponse streamedResponse = await request.send();
      final http.Response response =
          await http.Response.fromStream(streamedResponse);
      return response;
    } catch (error) {
      print('Error during image upload: $error');
      throw error;
    }
  }

  Future<UserData> getUserAbout() async {
    try {
      String token = await getUserToken();
      final http.Response response = await getMethod(
        endpoint: _userAbout,
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

  Future<http.Response> putEditAbout(Map<String, dynamic> body) async {
    try {
      String? token = await getUserToken();
      final http.Response response = await putMethod(
        body: body,
        endpoint: _userEditAbout,
        token: token,
      );
      return response;
    } catch (error) {
      print('Error during user information edit: $error');
      throw error;
    }
  }

  Future<http.Response> deleteAccount() async {
    try {
      String? token = await getUserToken();
      final http.Response response =
          await deleteMethod(endpoint: _deleteAccount, token: token);
      return response;
    } catch (error) {
      print('Error during account deletion: $error');
      throw error;
    }
  }
}
