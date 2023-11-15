import 'dart:convert';
import 'package:http/http.dart' as http;

final socialNetwork = SocialNetwork();

class SocialNetwork {
  final String _apiUrl = 'bacend-fshi.onrender.com';
  final String _social = '/user/social_media';
  final String _addSocial = '/user/add/social_media';
  final String _deleteSocial = '/user/delete/social_media';
  socialMethod({required String token}) async {
    var url = Uri.https(_apiUrl, _social);
    try{
    var response = await http.get(url, headers: {"Authorization": token});
    return response;
    }catch(e){}
  }

  addsocialMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _addSocial);
    var response = await http.post(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }

  deletesocialMethod({required String token, required Map body}) async {
    var url = Uri.https(_apiUrl, _deleteSocial);
    var response = await http.delete(url,
        headers: {"Authorization": token}, body: jsonEncode(body));
    return response;
  }
}
