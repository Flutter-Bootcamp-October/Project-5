part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class ErrorState extends AuthState {
  final String message;

  ErrorState(this.message);
}

class DisplayState extends AuthState {
  final bool display;

  DisplayState({required this.display});
}

final class LoginSuccessState extends AuthState {}
