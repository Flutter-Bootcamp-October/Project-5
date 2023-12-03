part of 'skills_cubit.dart';

abstract class SkillsState {}

class SkillsInitial extends SkillsState {}

class SkillsAddState extends SkillsState {}

class SkillsDeleteState extends SkillsState {}

class SkillsGetDataState extends SkillsState {
  final SkillsModel skillsModel;
  SkillsGetDataState({required this.skillsModel});
}

class SkillsErrorState extends SkillsState {
  final String errMsg;
  SkillsErrorState({required this.errMsg});
}
