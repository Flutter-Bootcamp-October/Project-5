part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SigninEvent extends AuthEvent {
  final String? email;
  final String? password;

  SigninEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;

  RegisterEvent(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password});
}

class VerificattionEvent extends AuthEvent {
  final String? otp;
  final String? email;
  final String? type;

  VerificattionEvent({
    required this.otp,
    required this.email,
    required this.type,
  });
}
