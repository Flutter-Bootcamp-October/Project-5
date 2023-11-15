import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cv_app/model/about_data.dart';
import 'package:cv_app/model/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Put {
  Future<AboutData> putAbout(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://bacend-fshi.onrender.com/user/edit/about");
    final response = await http.put(url,
        body: jsonEncode(body),
        headers: {"authorization": prefs.getString("token")!});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return AboutData.fromJson(json.decode(response.body));
    } else {
      final error = ErrorModel.fromJson(json.decode(response.body));
      throw FormatException(error.msg.toString());
    }
  }
}
