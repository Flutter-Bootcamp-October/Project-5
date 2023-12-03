import 'dart:convert';

import 'package:project_5/api_methods/const_network.dart';
import 'package:project_5/main.dart';
import 'package:http/http.dart' as https;

class UserDeleteMethods extends ConsentNetworking {
  //------------About

  deleteAccount({required String aboutId}) async {
    var url = Uri.https(urlApi, deleteAbout);
    var response = await https.delete(url,
        body: json.encode({"id": aboutId}),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    return response;
  }
  //------------Skill

  removeSkill({required String idSkill}) async {
    var url = Uri.https(urlApi, deleteSkills);

    var response = await https.delete(url,
        body: json.encode({"id_skill": idSkill}),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    return response;
  }
//-----------Project

  removeProject({required String idProject}) async {
    var url = Uri.https(urlApi, deleteProject);

    var response = await https.delete(url,
        body: json.encode({"id_project": idProject}),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    return response;
  }

  //------------Education
  removeEducation({required String idEducation}) async {
    var url = Uri.https(urlApi, deleteEducation);
    var response = await https.delete(url,
        body: json.encode({"id_education": idEducation}),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");

    return response;
  }
  //--------------Social

  removeSocial({required String idAccount}) async {
    var url = Uri.https(urlApi, deleteSocialMedia);

    var response = await https.delete(url,
        body: json.encode({"id_social": idAccount}),
        headers: {"authorization": pref!.getString("token")!});
    print("Response body: ${response.body}");
    print("Response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("Social account removed successfully");
    } else {
      print("Error removing social account");
    }
    return response;
  }
}
