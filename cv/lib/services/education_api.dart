import 'dart:convert';
import 'package:cv/services/shared_preference.dart';
import 'package:cv/modules/community_module.dart';
import 'package:http/http.dart' as http;

/*
- get 
- post
- delete 
*/

Future<Education> getAllEducationData() async {
  Education educationObjectList;
  // 1 convert api url to uri
  final apiUrl = Uri.parse("https://bacend-fshi.onrender.com/user/education");
  // 2 send request to api
  final response = await http
      .get(apiUrl, headers: {"authorization": await SharedPrefs().getToken()});
  print(response.body.runtimeType);
  // 3 convert from string to json( json = map)
  Map responseMap = jsonDecode(response.body);
  educationObjectList = Education.fromJson(responseMap as Map<String, dynamic>);

  // 4 convert to list of object
  return educationObjectList;
}

Future sendEducationData(String graduation_date, String university,
    String college, String specialization, String level) async {
  try {
    final url =
        Uri.parse("https://bacend-fshi.onrender.com/user/add/education");
    final data = {
      "graduation_date": graduation_date,
      "university": university,
      "college": college,
      "specialization": specialization,
      "level": level
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
