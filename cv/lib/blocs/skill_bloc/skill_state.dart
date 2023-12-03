part of 'skill_bloc.dart';

abstract class SkillState {}

final class SkillInitial extends SkillState {}

final class ErrorState extends SkillState {
  final String massege;

  ErrorState(this.massege);
}

final class SkillSuccessState extends SkillState {}
