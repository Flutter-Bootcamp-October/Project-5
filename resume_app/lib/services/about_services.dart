import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:resume_app/models/about_model.dart';
import 'package:resume_app/models/error_model.dart';

class AboutServ {
  final String _api = "bacend-fshi.onrender.com";
  final String _image = '/user/upload';
  final String _about = '/user/about';
  final String _edit = '/user/edit/about';
  final String _delete = '/user/delete_account';

  getAbout({required String token}) async {
    var url = Uri.https(_api, _about);
    var response = await http.get(url, headers: {"authorization": token});
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return About.fromJson(json.decode(response.body)["data"]);
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }

  uploadImage({required String token, required File image}) async {
    var url = Uri.https(_api, _image);
    var response = await http.post(url,
        headers: {"authorization": token}, body: image.readAsBytesSync());
    if (response.statusCode == 200) {
      return json.decode(response.body)["data"];
    } else {
      final error =
          ErrorModel(msg: response.body, codeState: response.statusCode);
      throw FormatException(error.msg);
    }
  }

  //return String
  editAbout({required String token, required About aboutObject}) async {
    var url = Uri.https(_api, _edit);
    var response = await http.put(url,
        body: json.encode(aboutObject.toJson()),
        headers: {"Authorization": token});
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

  deleteAccount({required String token}) async {
    var url = Uri.https(_api, _delete);
    var response = await http.delete(url, headers: {"authorization": token});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body)["msg"];
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg);
    }
  }
}
