part of 'skill_bloc.dart';

abstract class SkillEvent {}

class AddSkill extends SkillEvent {
  final String skill;

  AddSkill({required this.skill});
}

class DeleteSkill extends SkillEvent {
  final int id;

  DeleteSkill({required this.id});
}
