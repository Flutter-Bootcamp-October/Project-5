part of 'social_bloc.dart';

abstract class SocialState {}

final class SocialInitial extends SocialState {}

final class ErrorState extends SocialState {
  final String massege;

  ErrorState(this.massege);
}

final class SocialSuccessState extends SocialState {}
