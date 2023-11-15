import 'dart:convert';
import 'dart:io';
import 'package:flutter_project5_api/models/about.dart';

import 'package:flutter_project5_api/models/errorr.dart';
import 'package:http/http.dart' as http;

/*Future<About> uploadimage({required String token,required File image}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/upload");
  final response = await http.post(url,headers: {"Authorization": token},body: await image.readAsBytes());

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return About.fromJson(json.decode(response.body));
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}*/

/*Future<About> uploadimage({required String token, required File image}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/upload");
  final response = await http.post(
    url,
    headers: {"Authorization": token},
    body: await image.readAsBytes(),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseBody = json.decode(response.body);
    final dynamic imageData = responseBody['data']['image'];

    if (imageData != null && imageData is String) {
      // Image data is not null and is a String
      final about = About.fromJson(responseBody);
      about.data?.image = imageData;
      return about;
    } else {
      // Image data is null or not a String
      return About.fromJson(responseBody)..data?.image = null;
    }
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}*/
/*Future<About> uploadimage({required String token, required File image}) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/user/upload");
  final response = await http.post(
    url,
    headers: {"Authorization": token},
    body: await image.readAsBytes(),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseBody = json.decode(response.body);

    // Use null-aware operator to handle null values
    final dynamic imageData = responseBody['data']['image'];
    final String imageValue = imageData ?? '';

    // Update the 'image' property in the About class
    return About.fromJson(responseBody)..data?.image = imageValue;
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}*/
Future<About> uploadimage({required String token, required File image}) async {
  final double maxSizeInMB = 0.5;

  // Check file size
  if (image.lengthSync() > maxSizeInMB * 1024 * 1024) {
    throw FormatException('File should be less than ${maxSizeInMB} MB');
  }

  final url = Uri.parse("https://bacend-fshi.onrender.com/user/upload");
  final response = await http.post(
    url,
    headers: {"Authorization": token},
    body: await image.readAsBytes(),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseBody = json.decode(response.body);

    // Use null-aware operator to handle null values
    final dynamic imageData = responseBody['data']['image'];
    final String imageValue = imageData ?? '';

    // Update the 'image' property in the About class
    return About.fromJson(responseBody)..data?.image = imageValue;
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}
