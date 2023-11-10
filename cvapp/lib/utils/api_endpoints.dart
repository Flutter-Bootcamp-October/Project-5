class ApiEndpoints {
  static final String baseUrl = "https://bacend-fshi.onrender.com/";
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final registerEmail = "auth/registration";
  final String loginEmail = "auth/verification";
}
