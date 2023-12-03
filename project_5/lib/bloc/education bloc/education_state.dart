part of 'education_cubit.dart';

abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationGetDataState extends EducationState {
  final EducationModel educationModel;
  EducationGetDataState({required this.educationModel});
}

class EducationAddState extends EducationState {}

class EducationDeleteState extends EducationState {}

class EducationErrorState extends EducationState {
  final String errMsg;
  EducationErrorState({required this.errMsg});
}
