import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiUser {
  final String _urlApi = "bacend-fshi.onrender.com";

  Future<http.Response> postMethod({
    required Map<String, dynamic> body,
    required String endpoint,
    String? token,
  }) async {
    var url = Uri.https(_urlApi, endpoint);
    var headers = token != null ? {'Authorization': 'Bearer $token'} : null;
    var response = await http.post(
      url,
      body: json.encode(body),
      headers: headers,
    );
    print('POST Response status: ${response.statusCode}');
    print('POST Response body: ${response.body}');
    return response;
  }

  Future<http.Response> getMethod({
    required String endpoint,
    required String token,
  }) async {
    var url = Uri.https(_urlApi, endpoint);
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print('GET Response status: ${response.statusCode}');
    print('GET Response body: ${response.body}');

    return response;
  }

  Future<http.Response> putMethod({
    required Map<String, dynamic> body,
    required String endpoint,
    required String token,
  }) async {
    var url = Uri.https(_urlApi, endpoint);
    var response = await http.put(
      url,
      body: json.encode(body),
      headers: {'Authorization': 'Bearer $token'},
    );
    print('PUT Response status: ${response.statusCode}');
    print('PUT Response body: ${response.body}');

    return response;
  }

  Future<http.Response> deleteMethod({
    Map<String, dynamic>? body,
    required String endpoint,
    required String token,
  }) async {
    var url = Uri.https(_urlApi, endpoint);
    var response = await http.delete(
      body: body,
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print('DELETE Response status: ${response.statusCode}');
    print('DELETE Response body: ${response.body}');

    return response;
  }
}
