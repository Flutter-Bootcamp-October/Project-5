import 'dart:convert';
import 'package:cv/modules/about_module.dart';
import 'package:cv/services/shared_preference.dart';
import 'package:http/http.dart' as http;

/*
- put
- get 
- delete 
*/

Future<AboutModel> getAllAboutData() async {
  AboutModel aboutObjectList;
  // 1 convert api url to uri
  final apiUrl = Uri.parse("https://bacend-fshi.onrender.com/user/about");
  // 2 send request to api
  final response = await http
      .get(apiUrl, headers: {"authorization": await SharedPrefs().getToken()});
  print(response.body.runtimeType);
  // 3 convert from string to json( json = map)
  Map responseMap = json.decode(response.body);
  aboutObjectList = AboutModel.fromJson(responseMap as Map<String, dynamic>);
  // 4 convert to list of object
  print("------${aboutObjectList.data.id}");
  return aboutObjectList;
}
