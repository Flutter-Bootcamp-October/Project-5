part of 'signup_bloc.dart';

abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class ErrorState extends SignupState {
  final String massege;

  ErrorState(this.massege);
}

final class SignUpState extends SignupState {}
