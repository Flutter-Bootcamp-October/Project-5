part of 'education_bloc.dart';

abstract class EducationState {}

final class EducationInitial extends EducationState {}
class GetEducationState extends EducationState {
  final List<EducationModel> education;
  GetEducationState({required this.education});
}
class ChangeStateEducaion extends EducationState {
  final String state;
  ChangeStateEducaion({required this.state});
}
