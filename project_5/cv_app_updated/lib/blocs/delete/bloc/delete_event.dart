part of 'delete_bloc.dart';

abstract class DeleteEvent {
  final String id;

  DeleteEvent({required this.id});
}

class DeleteUserEvent extends DeleteEvent {
  DeleteUserEvent({required super.id});
}

class DeleteSkillEvent extends DeleteEvent {
  DeleteSkillEvent({required super.id});
}

class DeleteProjectEvent extends DeleteEvent {
  DeleteProjectEvent({required super.id});
}

class DeleteEducationEvent extends DeleteEvent {
  DeleteEducationEvent({required super.id});
}

class DeleteSocialEvent extends DeleteEvent {
  DeleteSocialEvent({required super.id});
}
