part of 'social_bloc.dart';

abstract class SocialEvent {}

class AddSocialEvent extends SocialEvent {
  final String userName;
  final String social;

  AddSocialEvent({required this.userName, required this.social});

}

class DeleteSocialEvent extends SocialEvent {
  final int id;

  DeleteSocialEvent({required this.id});
}

class ChangeStateSocialEvent extends SocialEvent {
  final String state;

  ChangeStateSocialEvent({required this.state});
}
