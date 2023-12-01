part of 'signin_bloc.dart';

abstract class SigninState {}

final class SigninInitial extends SigninState {}

final class ErrorState extends SigninState {
  final String massege;

  ErrorState(this.massege);
}

final class SignInState extends SigninState {}
