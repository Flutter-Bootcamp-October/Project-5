part of 'social_bloc.dart';

abstract class SocialState {}

final class SocialInitial extends SocialState {}

final class GetSocialState extends SocialState {
  final List<SocialModel> social;
  GetSocialState({required this.social});
}
class ChangeState extends SocialState {
  final String state;

  ChangeState({required this.state});
}
class ErrorSocialState extends SocialState {
  final String msg;

  ErrorSocialState({required this.msg});
}
