import 'dart:convert';
import 'package:cv_app/model/error_model.dart';
import 'package:http/http.dart' as http;
import 'package:cv_app/model/otp.dart';

Future<Verified> otp(Map body) async {
  final url = Uri.parse("https://bacend-fshi.onrender.com/auth/verification");
  final response = await http.post(
    url,
    body: jsonEncode(body),
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Verified.fromJson(json.decode(response.body));
  } else {
    final error = ErrorModel.fromJson(json.decode(response.body));
    throw FormatException(error.msg);
  }
}
