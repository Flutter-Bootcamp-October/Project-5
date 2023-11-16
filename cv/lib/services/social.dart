import 'dart:convert';
import 'package:cv/modules/social.dart';
import 'package:cv/services/shared_preference.dart';
import 'package:http/http.dart' as http;

/*
- post
- get 
- delete 
*/

Future<Social> getAllSocialData() async {
  Social sociallObjectList;
  // 1 convert api url to uri
  final apiUrl =
      Uri.parse("https://bacend-fshi.onrender.com/user/social_media");
  // 2 send request to api
  final response = await http
      .get(apiUrl, headers: {"authorization": await SharedPrefs().getToken()});
  print(response.body.runtimeType);
  // 3 convert from string to json( json = map)
  Map responseMap = jsonDecode(response.body);
  sociallObjectList = Social.fromJson(responseMap as Map<String, dynamic>);
  // 4 convert to list of object
  return sociallObjectList;
}

Future sendSocialData(String username, String social) async {
  try {
    final url =
        Uri.parse("https://bacend-fshi.onrender.com/user/add/social_media");
    final data = {"username": username, "social": social};
    final response = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
      "authorization": await SharedPrefs().getToken()
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw FormatException("data not found ");
    }
  } catch (e) {
    throw FormatException("there is error with body");
  }
}
