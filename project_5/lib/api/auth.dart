import 'package:http/http.dart' as http;
import 'package:project_5/api/api_user.dart';

class Auth extends ApiUser {
  final String _registration = '/auth/registration';
  final String _verification = '/auth/verification';
  final String _login = '/auth/login';
  final String _restPassword = '/auth/rest_password';

  Future<http.Response> postRegistration(body) async {
    try {
      final http.Response response = await postMethod(
        body: body,
        endpoint: _registration,
      );
      return response;
    } catch (error) {
      print('Error during Registration: $error');
      throw error;
    }
  }

  Future<http.Response> postVerification(body) async {
    try {
      final http.Response response = await postMethod(
        body: body,
        endpoint: _verification,
      );
      return response;
    } catch (error) {
      print('Error during Verification: $error');
      throw error;
    }
  }

  Future<http.Response> postLogin(body) async {
    try {
      final http.Response response = await postMethod(
        body: body,
        endpoint: _login,
      );
      return response;
    } catch (error) {
      print('Error during login: $error');
      throw error;
    }
  }

  postResetPassWord(body) async {
    try {
      final http.Response response = await postMethod(
        body: body,
        endpoint: _restPassword,
      );
      return response;
    } catch (error) {
      print('Error during Reset Password: $error');
      throw error;
    }
  }
}
