import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    return token;
  }
}
