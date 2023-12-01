import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pcv/main.dart';
import 'package:pcv/model/education_model.dart';

final educationNetwork = EducationNetwork();

class EducationNetwork {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _education = '/user/education';
  final String _addEducation = '/user/add/education';
  final String _deleteEducation = '/user/delete/education';
  Future<List<EducationModel>?> educationMethod() async {
    var url = Uri.https(_apiUrl, _education);
    List<EducationModel> eduacation = [];
    try {
      var response = await http
          .get(url, headers: {"Authorization": prefs!.getString("token")!});
      if (response.statusCode == 200) {
        final data = EducationModel.fromJson(jsonDecode(response.body));
        eduacation.add(data);
        return eduacation;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  addEducationMethod({required Map body}) async {
    var url = Uri.https(_apiUrl, _addEducation);
    var response = await http.post(url,
        headers: {"Authorization": prefs!.getString("token")!},
        body: jsonEncode(body));
    return response;
  }

  deleteEducationMethod({required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteEducation);
    var response = await http.delete(url,
        headers: {"Authorization": prefs!.getString("token")!},
        body: jsonEncode(body));
    return response;
  }
}
