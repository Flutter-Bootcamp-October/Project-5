import 'dart:convert';
import 'package:cv_app_project/models/project_model.dart';
import 'package:http/http.dart' as http;

String token =
    'eyJhbGciOiJIUzI1NiIsImtpZCI6Ikc4c2lRbVB5dGw3Vzc2K00iLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzAwMDEyODM4LCJpYXQiOjE2OTk5OTQ4MzgsImlzcyI6Imh0dHBzOi8vbXpranV5cnZ3eHVsc3d3cmlvcm0uc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6IjNkZWI0NjFiLWZjYTgtNDUxZC04YjhjLTY1YTZlZDFhODQ3YyIsImVtYWlsIjoiZ2VtbG96ZXJkdUBndWZ1bS5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2OTk5OTQ4Mzh9XSwic2Vzc2lvbl9pZCI6Ijc0N2JiODY2LTVkNjctNGQ4MS05MTE4LWM5MWJiNzU5N2VhNiJ9.5D_xXNaSM8vIgmqgUzBtvo1uk5EW--rcr-WGD2j0URk';
Future<Project> getProject() async {
  final url = Uri.parse('https://bacend-fshi.onrender.com/user/projects');
  final response = await http.get(url, headers: {'authorization': token});
  final decodedResponse = jsonDecode(response.body);
  final object = Project.fromJson(decodedResponse);
  return object;
}
