part of 'skill_bloc.dart';

abstract class SkillState {}

final class SkillInitial extends SkillState {}
final class GetSkillState extends SkillState{
  final List<SkillModel> data;

  GetSkillState({required this.data});
}
