part of 'delete_bloc.dart';

abstract class DeleteEvent {}

final class DeleteProjectEvent extends DeleteEvent {
  final int idProject;
  final BuildContext context;
  DeleteProjectEvent(this.idProject, this.context);
}

final class DeleteSkillEvent extends DeleteEvent {
  final int idSkill;
  final BuildContext context;
  DeleteSkillEvent(this.idSkill, this.context);
}

final class DeleteSocialEvent extends DeleteEvent {
  final int idSocial;
  final BuildContext context;
  DeleteSocialEvent(this.idSocial, this.context);
}

final class DeleteEducationEvent extends DeleteEvent {
  final int idEducation;
  final BuildContext context;
  DeleteEducationEvent(this.idEducation, this.context);
}
