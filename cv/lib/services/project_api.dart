import 'dart:convert';
import 'package:cv/modules/project_module.dart';
import 'package:cv/services/shared_preference.dart';
import 'package:http/http.dart' as http;

/*
- get 
- post
- delete 
*/

Future<ProjectModel> getAllProjectData() async {
  ProjectModel projectObjectList;
  // 1 convert api url to uri
  final apiUrl = Uri.parse("https://bacend-fshi.onrender.com/user/projects");
  // 2 send request to api
  final response = await http
      .get(apiUrl, headers: {"authorization": await SharedPrefs().getToken()});
  print(response.body.runtimeType);
  // 3 convert from string to json( json = map)
  Map responseMap = json.decode(response.body);
  projectObjectList =
      ProjectModel.fromJson(responseMap as Map<String, dynamic>);
  print(projectObjectList.data!);
  // 4 convert to list of object
  return projectObjectList;
}

Future sendProjectData(String name, String description, String state) async {
  try {
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/project");
    final data = {
      "name": name,
      "description": description,
      "state": state,
    };
    final response = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
      "authorization": await SharedPrefs().getToken()
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw const FormatException("data not found ");
    }
  } catch (e) {
    throw const FormatException("there is error with body");
  }
}



