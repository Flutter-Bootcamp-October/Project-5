part of 'signup_bloc.dart';

abstract class SignupEvent {}

final class SignUpEvent extends SignupEvent {
  final String name;
  final String email;
  final String password;
  final String phone;

  SignUpEvent(this.name, this.email, this.password, this.phone);
}
