import 'dart:convert';
import 'package:http/http.dart' as http;
final educationNetwork = EducationNetwork();
class EducationNetwork {
    final String _apiUrl = 'bacend-fshi.onrender.com';
    final String _education = '/user/education';
  final String _addEducation = '/user/add/education';
  final String _deleteEducation = '/user/delete/education';
   educationMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _education);
    var response = await http.get(url, headers: {"Authorization": token});
    return response;
  }

  addEducationMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _addEducation);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }

  deleteEducationMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteEducation);
    var response = await http.delete(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }
  
}