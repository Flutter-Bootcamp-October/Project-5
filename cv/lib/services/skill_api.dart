import 'dart:convert';
import 'package:cv/modules/skill_module.dart';
import 'package:cv/services/shared_preference.dart';
import 'package:http/http.dart' as http;

/*
- post
- get 
- delete 
*/

Future<Skill> getAllSkillData() async {
  Skill SkillObjectList;
  // 1 convert api url to uri
  final apiUrl = Uri.parse("https://bacend-fshi.onrender.com/user/skills");
  // 2 send request to api
  final response = await http
      .get(apiUrl, headers: {"authorization": await SharedPrefs().getToken()});
  print(response.body.runtimeType);
  // 3 convert from string to json( json = map)
  Map responseMap = jsonDecode(response.body);
  SkillObjectList = Skill.fromJson(responseMap as Map<String, dynamic>);

  // 4 convert to list of object
  return SkillObjectList;
}

Future sendSkillData(String skill) async {
  try {
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/add/skills");
    final data = {
      "skill": skill,
    };
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
