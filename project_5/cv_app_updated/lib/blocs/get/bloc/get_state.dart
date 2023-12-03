part of 'get_bloc.dart';

abstract class GetState {}

class GetInitialState extends GetState {}

class GetAboutState extends GetState {
  final About? about;

  GetAboutState({required this.about});
}

class GetSkillState extends GetState {
  final SkillModel? skill;

  GetSkillState({required this.skill});
}

class GetProjectState extends GetState {
  final ProjectModel? project;

  GetProjectState({required this.project});
}

class GetEducationState extends GetState {
  final EducationModel? education;

  GetEducationState({required this.education});
}

class GetSocialState extends GetState {
  final SocialModel? social;

  GetSocialState({required this.social});
}

class GetUsersState extends GetState {
  final UsersModel? users;

  GetUsersState({required this.users});
}

class GetLoadState extends GetState {}

class GetErrorState extends GetState {
  final String message;

  GetErrorState({required this.message});
}
