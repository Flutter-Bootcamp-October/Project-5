import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

final netAbout = AboutNet();

class AboutNet {
  final String _apiUrl = 'bacend-fshi.onrender.com';

  final String _about = '/user/about';
  final String _editAbout = '/user/edit/about';
  final String _upload = '/user/upload';
  final String _delete = '/user/delete_account';

  final String _getUser = '/user/get_users';

  aboutMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _about);
    var response = await http.get(url, headers: {"Authorization": token});
    return response;
  }

  aboutUploadMethod({required String token, required File image}) async {
    var url = Uri.https(_apiUrl, _upload);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: await image.readAsBytes());
    return response;
  }

  editAboutMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _editAbout);
    var response = await http.put(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }

  deleteAccountMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _delete);
    var response = await http
        .delete(url, headers: {"Authorization": token},);
    return response;
  }

  getUserMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _getUser);
    var response = await http.get(url, headers: {"Authorization": token});
    return response;
  }
}
