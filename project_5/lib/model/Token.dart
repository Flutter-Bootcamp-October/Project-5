import 'package:shared_preferences/shared_preferences.dart';

class Token {
  Future<String> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken') ?? '';
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userToken');
  }
}
