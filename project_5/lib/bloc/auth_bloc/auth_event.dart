part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email, password;
  AuthLoginEvent({required this.email, required this.password});
}

class AuthRegisterEvent extends AuthEvent {
  final String email, password, userName, phone, confirmPassword;
  AuthRegisterEvent({
    required this.email,
    required this.password,
    required this.userName,
    required this.phone,
    required this.confirmPassword,
  });
}

class OTPEvent extends AuthEvent {
  final String otpCode, email, type;
  OTPEvent({required this.otpCode, required this.email, required this.type});
}
