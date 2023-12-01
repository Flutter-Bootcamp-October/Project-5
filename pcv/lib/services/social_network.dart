import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pcv/main.dart';
import 'package:pcv/model/social_model.dart';

final socialNetwork = SocialNetwork();

class SocialNetwork {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _social = '/user/social_media';
  final String _addSocial = '/user/add/social_media';
  final String _deleteSocial = '/user/delete/social_media';
  Future<List<SocialModel>?> socialMethod() async {
    var url = Uri.https(_apiUrl, _social);
    List<SocialModel> social = [];
    try {
      var response = await http
          .get(url, headers: {"Authorization": prefs!.getString("token")!});
      if (response.statusCode == 200) {
        final data = SocialModel.fromJson(jsonDecode(response.body));
        social.add(data);
        return social;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  addsocialMethod({required Map body}) async {
    var url = Uri.https(_apiUrl, _addSocial);
    var response = await http.post(url,
        headers: {"Authorization": prefs!.getString("token")!}, body: jsonEncode(body));
    return response;
  }

  deletesocialMethod({ required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteSocial);
    var response = await http.delete(url,
        headers: {"Authorization": prefs!.getString("token")!}, body: jsonEncode(body));
    return response;
  }
}
