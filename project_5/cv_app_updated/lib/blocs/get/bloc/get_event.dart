part of 'get_bloc.dart';

abstract class GetEvent {
  final BuildContext context;

  GetEvent({required this.context});

}

class GetAboutEvent extends GetEvent {
  GetAboutEvent({required super.context});
}

class GetEducationEvent extends GetEvent {
  GetEducationEvent({required super.context});

}

class GetProjectEvent extends GetEvent {
  GetProjectEvent({required super.context});
}

class GetSkillEvent extends GetEvent {
  GetSkillEvent({required super.context});
}

class GetSocialEvent extends GetEvent {
  GetSocialEvent({required super.context});
  
}

class GetUsersEvent extends GetEvent {
  GetUsersEvent({required super.context});
}

// class GetErrorEvent extends GetEvent {}
