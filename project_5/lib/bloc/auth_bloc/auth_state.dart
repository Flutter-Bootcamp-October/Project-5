part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String errorMsg;
  AuthLoginErrorState({required this.errorMsg});
}

class AuthRegisterErrorState extends AuthState {
  final String errorMsg;
  AuthRegisterErrorState({required this.errorMsg});
}

class AuthLoginSuccessState extends AuthState {
  final String email, type;
  AuthLoginSuccessState({required this.email, required this.type});
}

class AuthRegisterSuccessState extends AuthState {
  final String email, type;

  AuthRegisterSuccessState({required this.email, required this.type});
}

class LoadingState extends AuthState {
  final bool isLoading;
  LoadingState({required this.isLoading});
}

class OTPState extends AuthState {}

class AuthOTPErrorState extends AuthState {
  final String errorMsg;
  AuthOTPErrorState({required this.errorMsg});
}

class AuthOTPSuccessState extends AuthState {}
