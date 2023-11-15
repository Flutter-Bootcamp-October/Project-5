import 'dart:convert';
import 'package:cv/services/shared_preference.dart';
import 'package:cv/modules/community_module.dart';
import 'package:http/http.dart' as http;

/*
- get 
*/

Future<Community> getAllCommunityData() async {
  Community communityObjectList;
  // 1 convert api url to uri
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/get_users");
  // 2 send request to api
  final response = await http
      .get(url, headers: {"authorization": await SharedPrefs().getToken()});
  print(response.body.runtimeType);
  // 3 convert from string to json( json = map)
  Map responseMap = jsonDecode(response.body);
  communityObjectList = Community.fromJson(responseMap as Map<String, dynamic>);

  // 4 convert to list of object
  return communityObjectList;
}
